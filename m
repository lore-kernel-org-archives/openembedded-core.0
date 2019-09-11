Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
	[209.85.221.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0E48B7E996
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 15:27:44 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id 70so3535029vkz.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hahraUxSPW55dD8BDYpbdMkRIcW+48KmKIDNVt6Zkgw=;
	b=D5jgUbaTr1YAFkA2pyp31fm9Tx+wsmGFNMulk9Hg4vzHNmMWhuc/kuDY8R8NWC1ivD
	F0byrF/XJ2ZMglye0SN0aTvEkqX04f9nzRRLhexTfdhDGJm5LP0kZgcIyukcUkJ1T50E
	ieTRNej3bFciyES7K8jcCcWMu91Ht4y6Bx76ujxPjFO3g3t5bWj8HzWC+/rYM5twJoex
	y1cqVtpbdDoJWxKX4edcqoCXZeICM7Db1UIYcFesujDdfqwAQRiWrx+jAjPy5NFogerF
	+hoE9b9+znyUfawsujCajHy320ChQNWflGiG0Jff/EXZehn43ptWMFmZpon4amdHsoN1
	8X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hahraUxSPW55dD8BDYpbdMkRIcW+48KmKIDNVt6Zkgw=;
	b=U/FGP3l/kOxRg9qNadGsvJJTYT1L6876YlMbYQ3vNeyJE2xA/2VCKUu+joFAzCqKNA
	F2i6705DEi1E7zV9TcxzNqZpKMioxpLNaAJk2MO2sbcLVyMirmFebBRVChruRoG2liY6
	Y+T9EBofqhRcdZ1t3W2tkdCwllQLrKXVs9rqBWmC2IQlHeoCIGhTILMgl/EGq8Z0iiEu
	CKBryRkZUT39smja8lYe+0fWI9voRnsHkvqBiKHa8Uwr0qt1JIpjkM+bbsEFcI+dLHO5
	xNBBS8FBQSyhb0tZ1ugdJC5rpVovIiqaepyeUPSKYj9siOq7d5CUQPHbI8lDwouFppxO
	GFyQ==
X-Gm-Message-State: APjAAAWkH51eoNtJ4yKG57dvX8Va0QCPzYu7LjCNbsnNzOb1Ql2xp+Jf
	wg/VvptOZBNyIildorFzbQkuCO/UI7rn9nUtBq4=
X-Google-Smtp-Source: APXvYqyRT2IfJ7Mc9pVIH7QUY3AQURLuNhE/Qi4VSjpGcnXp0YyJ8pC639F7/vlhCvgkYLU+qcA9CwgsrJ78ZjGQyXU=
X-Received: by 2002:ac5:c5ba:: with SMTP id f26mr340208vkl.32.1568215665108;
	Wed, 11 Sep 2019 08:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
	<268869ab-aa03-cf7c-c75d-9aa8dd7fd5ab@intel.com>
In-Reply-To: <268869ab-aa03-cf7c-c75d-9aa8dd7fd5ab@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2019 17:27:34 +0200
Message-ID: <CANNYZj_DyE_oxXjk+NeK4je72gYF0pG-_MbxVMv8ck37Qcp2bw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 15:27:45 -0000
Content-Type: multipart/alternative; boundary="000000000000a66935059248a90b"

--000000000000a66935059248a90b
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Sep 2019 at 14:35, Ross Burton <ross.burton@intel.com> wrote:

>
> See I knew that but had blocked it out because it's so horrible.
>
> One day we need to sit down with upstream Python and figure out how to
> handle cross-compilation properly.
>
> I finally managed to make my own builds fail (had to turn off Python in
> libxml2) and beat at it to build without a target Python.  Fabio: can
> you try building Mesa with these two patches:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=5f3559d8bb61212e0f9a6543f2dce2bdf77c48b5
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=4f8995aaa2ec557a0603ddc664d929317b0c0b6e
>

I have to say, the latter patch is rather ugly. It would be better to split
python3native class into two: python3native (just for running scripts, does
not depend on target python3), and python3target (for actually obtaining
information about the target configuration, does need target python3).
Until then, I'd just pull in target python, for simplicity's sake (also
there's one or two recipes where the same meson problem happens).

Alex

--000000000000a66935059248a90b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 11 Sep 2019 at 14:35, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
See I knew that but had blocked it out because it&#39;s so horrible.<br>
<br>
One day we need to sit down with upstream Python and figure out how to <br>
handle cross-compilation properly.<br>
<br>
I finally managed to make my own builds fail (had to turn off Python in <br=
>
libxml2) and beat at it to build without a target Python.=C2=A0 Fabio: can =
<br>
you try building Mesa with these two patches:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dro=
ss/mut&amp;id=3D5f3559d8bb61212e0f9a6543f2dce2bdf77c48b5" rel=3D"noreferrer=
" target=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commi=
t/?h=3Dross/mut&amp;id=3D5f3559d8bb61212e0f9a6543f2dce2bdf77c48b5</a><br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dro=
ss/mut&amp;id=3D4f8995aaa2ec557a0603ddc664d929317b0c0b6e" rel=3D"noreferrer=
" target=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commi=
t/?h=3Dross/mut&amp;id=3D4f8995aaa2ec557a0603ddc664d929317b0c0b6e</a><br></=
blockquote><div><br></div><div>I have to say, the latter patch is rather ug=
ly. It would be better to split python3native class into two: python3native=
 (just for running scripts, does not depend on target python3), and python3=
target (for actually obtaining information about the target configuration, =
does need target python3). Until then, I&#39;d just pull in target python, =
for simplicity&#39;s sake (also there&#39;s one or two recipes where the sa=
me meson problem happens).</div><div><br></div><div>Alex<br></div></div></d=
iv>

--000000000000a66935059248a90b--
