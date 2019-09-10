Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
	[209.85.221.176])
	by mail.openembedded.org (Postfix) with ESMTP id E552A6D4B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 10:39:50 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 70so2525959vkz.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W+C2p8F9WUjtM46dFKRU1TmX7XVz9F0h+G/VlT/Kd7M=;
	b=lgywcKsp5tABfwpfOsYG3lp6/NihM092VEAblfi/gB4Q4PhrWzsykVeVk+lnCyx88s
	1VUSUJ84FN1NY34wyvfWs9+srfps6nh5o1Hxhq/OaE5ZayVjvsBxV7D32+8kO2gpgS95
	qg7LdY8tLAlG7reqTix4NuQJlEzoTTcgL5ebLSH6lBHXsdauH4xpimxsmWU+/JsnQ1SO
	CAh/sWhfHicEdokSRC425QtH44giwImXaSHRDC/MpjgIQiWfGzbp3+9hU32xQ4G7BcII
	j5iWt3Y1hRNrcemJ+on5cEPnBlCvS6hJEFjPU0egNGv/YPebSQzRN+UOmnzJOleVH4kM
	hC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W+C2p8F9WUjtM46dFKRU1TmX7XVz9F0h+G/VlT/Kd7M=;
	b=cL/F3O2yZH/mGfwKV8qEHioS/oapmurePtKBS6JE1cA0P+l0VDgo6GhFkTm4SNnHVh
	tyRFhsCEQ4VAWf6z11kBxop4Y++WZ05lQpS6HVyLPh16fZHDFHQsYPAimAXhmq3DvbeQ
	TXp1SnMWMQBCrU63xbjveKPi1iKUM7I1SfkMDI/wXqpO3KoR4ZEhJ78TqXycMGYSR3u8
	cnan1/edZsWhqdHZFw3lk43ZJIJLOEmUTq77eu1YcLz+1z7Y2QDUqutjTDHhT5zIEkue
	2NmivDhnJ/UF0ujEo/FBEdRjfAHC3Hqg8qR+lVBC8aZUsAGJ9cBdLSnQo5rweZUcPnIf
	EcJw==
X-Gm-Message-State: APjAAAWAOfQB416PYBvsfMM72UEmji92pXHhgGp8WVCnL5uWJRCbDfeM
	6M507nTsyyyhquAIHj6vqQtHgYezU8sGfVgw1k3G4UXE
X-Google-Smtp-Source: APXvYqx+O/WZhY1rlK5gfcFSPug+caojBSAZUmUQMfD6vt+bmfKk38HDO19zZXIn/WAmLpx0KaBqajs1GEXR9lTO9yk=
X-Received: by 2002:ac5:c5ba:: with SMTP id f26mr13227704vkl.32.1568111991612; 
	Tue, 10 Sep 2019 03:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
In-Reply-To: <ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2019 12:39:40 +0200
Message-ID: <CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Sep 2019 10:39:51 -0000
Content-Type: multipart/alternative; boundary="0000000000003a6a79059230863c"

--0000000000003a6a79059230863c
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Sep 2019 at 11:50, Ross Burton <ross.burton@intel.com> wrote:

> On 09/09/2019 19:41, Alexander Kanavin wrote:
> > and find_installation() method of meson does not merely look for the
> > native python binary, it runs the binary with a meson-supplied python
> > script designed to obtain all sorts of information, including
> > target-specific things that we patch native python to report. If the
> > target python installation is not present in sysroot, the script will
> > fail, and meson will declare that 'there is no valid installation of
> > python on your system'.
>
> So the python3-native pokes around the target python3 to get the right
> values?
>

Yes, if STAGING_LIBDIR is set, via this patch:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch

(don't shoot the pianist, it was working like this pre-rewrite as well).

Alex

--0000000000003a6a79059230863c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 10 Sep 2019 at 11:50, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 09/09/2019 19:41, Alexander Kanavin wrote:<br>
&gt; and find_installation() method of meson does not merely look for the <=
br>
&gt; native python binary, it runs the binary with a meson-supplied python =
<br>
&gt; script designed to obtain all sorts of information, including <br>
&gt; target-specific things that we patch native python to report. If the <=
br>
&gt; target python installation is not present in sysroot, the script will =
<br>
&gt; fail, and meson will declare that &#39;there is no valid installation =
of <br>
&gt; python on your system&#39;.<br>
<br>
So the python3-native pokes around the target python3 to get the right <br>
values?<br></blockquote><div><br></div><div>Yes, if STAGING_LIBDIR is set, =
via this patch:</div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-appe=
nd-STAGING_LIBDIR-python-sys.patch">http://git.yoctoproject.org/cgit/cgit.c=
gi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-=
append-STAGING_LIBDIR-python-sys.patch</a></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">(don&#39;t shoot the pianist, it was w=
orking like this pre-rewrite as well).</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">Alex<br></div></div>

--0000000000003a6a79059230863c--
