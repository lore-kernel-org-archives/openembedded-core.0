Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id AB6BE781A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 22:47:27 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id u12so19316334qth.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k5j6VCDKWav2pSnA6zc5OOYhY6UcgxasvQsRb6PNlzk=;
	b=rp3jdmWqrTR8sSU7vpI6UtBqKcHZQMdbFXYx4qjGGy17LjxIxeVP/CiqT3H/9Cl7VW
	T0MwkuV0adXGpvu2Bu4VhZbcs3g/91lle4L8JGbPrLL/GVO9wndWPG5p+trg/ijLEiF+
	iW1JjnOVMVMA33snnDP2XkLotHNYYURSxyDciPianljxCiQBMBSLYnKW869UNs4gHTHt
	qLCCPyxuJ5lV/pun8FiTd9mnMIdFJn6OQiRR9l3gXQeVka3iKfFDnmtgBm8145Xi61uU
	LVHjobOQKOSLFEZXklPbQ/ATP+gpNhodCtUtgnpus9KQoGW+1jD8KuZimS4AbcsEd3Sa
	FjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k5j6VCDKWav2pSnA6zc5OOYhY6UcgxasvQsRb6PNlzk=;
	b=GFqvc0qf7MqSU/jDCKXl5HZxdYKGoAszTtphTCM8Gr4zMDfU9lkiO2R6diXSCeHB3M
	nuyjIyA7F/IXslnqb8xv0qlVvQb8Hl0j7nkxOkou4jtm2J9z3eEy/Q+kK3ET77a8OWC0
	LWO/iFkU1gihcG28Evo/X5s3tUA7tlC5eCWsId+49T3QA3vOC7tCTR8RmE5eA1qEsqXr
	djgGcMKiYYGmizaxVJ7qymVK6gWct4RrYW1nyMvcZ/oFFN7m3EQ+i4E0d8rF3k4y6i26
	VMiV4RfcMA4utml091yX1LtR9igPK8Bx9w1WbIOu78vVV9HqVI1DtOiQfupl+fid+Xbs
	tUnw==
X-Gm-Message-State: AKS2vOxkNH0MY0zBIlZYL9pYmXuZVRXN8sdgooHS5YsCI3jkm4AnIHOR
	SyMUHpcawcJePiJkIutAN+1mYfzhKU63
X-Received: by 10.237.52.33 with SMTP id w30mr2853110qtd.139.1497480448272;
	Wed, 14 Jun 2017 15:47:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 14 Jun 2017 15:47:07 -0700 (PDT)
In-Reply-To: <cd2b720104f722dc81bf356e30df08c21f0e1dd9.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
	<cd2b720104f722dc81bf356e30df08c21f0e1dd9.1497453168.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Jun 2017 23:47:07 +0100
Message-ID: <CAJTo0LZd6whxWZnKGDD5dSsfCjj-+apjw=coaMnb_HEjmSX8kA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] gcc-sanitizer: Fix build with glibc 2.26
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
X-List-Received-Date: Wed, 14 Jun 2017 22:47:27 -0000
Content-Type: multipart/alternative; boundary="001a114dc03e2d87470551f35641"

--001a114dc03e2d87470551f35641
Content-Type: text/plain; charset="UTF-8"

On 14 June 2017 at 16:23, Khem Raj <raj.khem@gmail.com> wrote:

> sigaltstack is no more exposed by glibc see (bug 21517)
> therefore adjust to use stack_t instead
>
> Use res_state typedef instead of referring to __res_state struct
>

Doesn't work against master:

| In file included from
../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:23:0:
|
../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h:24:8:
error: using typedef-name 'stack_t' after 'struct'
|  struct stack_t;
|         ^~~~~~~
| In file included from
/data/poky-tmp/master/work/corei7-64-poky-linux/gcc-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/signal.h:322:0,
|                  from
../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:17:
|
/data/poky-tmp/master/work/corei7-64-poky-linux/gcc-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/bits/sigstack.h:42:5:
note: 'stack_t' has a previous declaration here
|    } stack_t;
|      ^~~~~~~

Ross

--001a114dc03e2d87470551f35641
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 June 2017 at 16:23, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204=
,204);padding-left:1ex"><div id=3D"gmail-:1t9" class=3D"gmail-a3s gmail-aXj=
CH gmail-m15ca734d780f075f">sigaltstack is no more exposed by glibc see (bu=
g 21517)<br>
therefore adjust to use stack_t instead<br>
<br>
Use res_state typedef instead of referring to __res_state struct<br></div><=
/blockquote></div><br>Doesn&#39;t work against master:</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra"=
>| In file included from ../../../../../../../../../work-shared/gcc-7.1.0-r=
0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:23:0:<=
/div><div class=3D"gmail_extra">| ../../../../../../../../../work-shared/gc=
c-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h:24:8: =
error: using typedef-name &#39;stack_t&#39; after &#39;struct&#39;</div><di=
v class=3D"gmail_extra">| =C2=A0struct stack_t;</div><div class=3D"gmail_ex=
tra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~</div><div class=3D"gmail_extra">=
| In file included from /data/poky-tmp/master/work/corei7-64-poky-linux/gcc=
-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/signal.h:322:0,</div><div c=
lass=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from ../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.=
0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:17:</div><div cl=
ass=3D"gmail_extra">| /data/poky-tmp/master/work/corei7-64-poky-linux/gcc-s=
anitizers/7.1.0-r0/recipe-sysroot/usr/include/bits/sigstack.h:42:5: note: &=
#39;stack_t&#39; has a previous declaration here</div><div class=3D"gmail_e=
xtra">| =C2=A0 =C2=A0} stack_t;</div><div class=3D"gmail_extra">| =C2=A0 =
=C2=A0 =C2=A0^~~~~~~</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div>

--001a114dc03e2d87470551f35641--
