Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 025D365D00
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 09:12:18 +0000 (UTC)
Received: by igvg19 with SMTP id g19so31839216igv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 01:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uo0MiS1cz4ZCv88//M17YVjjjU0jNz8+WZzwsoHMHg4=;
	b=FC6tGttfl0f5Doivq2RnWsTo0xBzgHJSRxAF8G24gHf1ELmVDcjf/ITUiM6t9T64Zn
	Xsyl2E7lMaxzh6sX+5gvPj1qFt+UjY0sldLm6k5byvDS00Op7r9rmGJLHT3oGJ/m1RUb
	GHNw+56i/ZXyrNpyZdTYD9QqJsy9O9lLr1Gmurwj22ClDw2GCY+BjGwK5D6cCN2EkGtK
	u7z+BJbVigW6ykOQl7E83Gc+rqFrBqgJ3et4Yg6/npliO7UeXhIz4lO1l6d5bRphssrR
	j0eadnVUpC8wiSQugXXYMohQm6nVC6wnSot7kJdy+xZ6UvD6m6vBRhfUMYLEGTnrPzUU
	uLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uo0MiS1cz4ZCv88//M17YVjjjU0jNz8+WZzwsoHMHg4=;
	b=WQFG1bhJhesbWtFzPI3HCrE3cbjdLGpYP2Qtyfq+Y60St9NiBX4b3BLzAis+9tPw6R
	d8PMB9RHNjq1/0uDsn7K+b3DdtXA1joCR6FIIYROjcC8MOzUtQj07t7cU1s27TECbHMR
	AEfQiLN/quTR6dOOTlz095eITpJWr9yVV5CM3U1gRtjT7YJ2vVJmoJFvCqQDpFDTJkV6
	R0FbEeuJuaxczzynnx1nNBPvyjOWKQy7EyGuVabNeIVFOW6UiMpuMke0zMf8JjrdfUEB
	P4absp3SgGQX+iPD4vlJYCTS8E2zr8KIr0C5yQHD6qPsXgWse+O8zaPd7O01jTXTLx3P
	QH/Q==
X-Gm-Message-State: ALoCoQmyQRP/q9yb2Na0Nxt9jsucLEZzYE+OjlIFEjYAxK2zPpSxhhPGaEQA0fkF44RCqAjI8R/E
X-Received: by 10.50.155.33 with SMTP id vt1mr2927993igb.64.1449220338965;
	Fri, 04 Dec 2015 01:12:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 4 Dec 2015 01:11:59 -0800 (PST)
In-Reply-To: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Dec 2015 09:11:59 +0000
Message-ID: <CAJTo0LZjk_FQBhpm-K95rsO9k2ux-a7x+a4+uGL6GuFi2oj_pA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Fri, 04 Dec 2015 09:12:19 -0000
Content-Type: multipart/alternative; boundary=001a11343daa817b6805260ee7d8

--001a11343daa817b6805260ee7d8
Content-Type: text/plain; charset=UTF-8

Hi Maxin,

On 2 December 2015 at 07:56, Maxin B. John <maxin.john@intel.com> wrote:

> Moving libjpeg-turbo from meta-oe as a replacement for libjpeg
> package. libjpeg-turbo has same API/ABI as libjpeg. It is
> relatively faster in JPEG compression/decompression than libjpeg.
>

As jpeg-turbo has assembler bits it's getting all confused about x32:

| checking if we have SIMD optimisations for cpu type... yes (x86_64)
| checking for nasm... nasm
| checking for object file format of host system... ELF64
| checking for object file format specifier (NAFLAGS) ... -felf64 -DELF
-D__x86_64__
| checking whether the assembler (nasm -felf64 -DELF -D__x86_64__) works...
yes
| checking whether the linker accepts assembler output... no
| configure: error: configuration problem: maybe object file format
mismatch.

(https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/545)

Ross

--001a11343daa817b6805260ee7d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Maxin,</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On 2 December 2015 at 07:56, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":9nz" class=3D"" style=3D"ov=
erflow:hidden">Moving libjpeg-turbo from meta-oe as a replacement for libjp=
eg<br>
package. libjpeg-turbo has same API/ABI as libjpeg. It is<br>
relatively faster in <span class=3D"">JPEG</span> compression/decompression=
 than libjpeg.<br></div></blockquote></div><br>As jpeg-turbo has assembler =
bits it&#39;s getting all confused about x32:</div><div class=3D"gmail_extr=
a"><br></div>| checking if we have SIMD optimisations for cpu type... yes (=
x86_64)<div>| checking for nasm... nasm</div><div>| checking for object fil=
e format of host system... ELF64</div><div>| checking for object file forma=
t specifier (NAFLAGS) ... -felf64 -DELF -D__x86_64__</div><div>| checking w=
hether the assembler (nasm -felf64 -DELF -D__x86_64__) works... yes</div><d=
iv>| checking whether the linker accepts assembler output... no</div><div>|=
 configure: error: configuration problem: maybe object file format mismatch=
.</div><div><br></div><div>(<a href=3D"https://autobuilder.yoctoproject.org=
/main/builders/nightly-x32/builds/545">https://autobuilder.yoctoproject.org=
/main/builders/nightly-x32/builds/545</a>)</div><div><br></div><div>Ross</d=
iv></div>

--001a11343daa817b6805260ee7d8--
