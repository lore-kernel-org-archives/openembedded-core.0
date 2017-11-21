Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7298C78255
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:00:09 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id m11so6819226iti.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JPylBQ5pNlycMIdekKHLyTEhuKb1rz6il6wZaUMPerE=;
	b=tTbVl66gb4/8l54BbVYwE+icr3tJHCbJdj3HO03PZS9MHODeJEgvW1dbSi3v0cZQ7R
	5u3ZJA08G5Fw745CI7M42e2GKh/hJnhMva/FYNRaRDVkbqsRRV97aQmRHrPT+o4kkpbx
	NEJCBJoVqsL4XLC9Hw1QwuXLv2WY1cxcTsWXNPrT7AWGah8pwV2WTzTbPzb56DaO1yY+
	qTUWowW6ZzwluLaS/Khwc1Eri4zYXM8kh2AHmndGNaHNICXgIvQj0VkyxMKMPYa7yLhY
	hzmYC1P4SzLxdqc4e9z1YaOPXPDpUcpPwxRhLXixL4dk79tVXS8qc5PbLK581Vp+ayP1
	pNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JPylBQ5pNlycMIdekKHLyTEhuKb1rz6il6wZaUMPerE=;
	b=a6qkn+xJAeAKTH5gRX+YzHBJ1dblWQAz2n5u3hlUhyFJmAcEWgJfKS46doUvqehumT
	R7FQY/l6TgEXx2XRp98zpkYmRwpbdeI2nrcBIB+3xPJkPRdTnzR2QnMCmz7ctRXGfBh6
	wbMTCBDH7Suh1Z7WfmMLpGmxTEn40Eupwtag1DtSla5RqvVtt20MAtmviCG/MIF2d9Mp
	iLrUVqelcTmERpdtPDHdjx2m+KVOo0sJrFsQrdWObCGicIPQixTspHqKnCS71QglT9GP
	TZhyYlFd5H/Dkbs6S52IotDSOnqxa2c0BQJE9IhaU0qiPoPA3apV1XuvG+RQpqfNHG1j
	WP6w==
X-Gm-Message-State: AJaThX5lgAbZ6/VC6jwZtlOo1rq4DTxTx6Oq4wM0Y/To9PJ1eSefhtza
	hosz4KXFbmYz7zahkAMqkA/ApQHIO5DTS98Uq7Yevw==
X-Google-Smtp-Source: AGs4zMYA5r86c27BFju2CFdGXhbJv90hBs4XvjWHwd4TKNOQlR2qK5AX4gtL2jVM+xQ6LZjwzodtzqQreYe2Dd/RGUo=
X-Received: by 10.36.147.198 with SMTP id y189mr1365590itd.6.1511262010355;
	Tue, 21 Nov 2017 03:00:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 02:59:49 -0800 (PST)
In-Reply-To: <1510847767-2966-2-git-send-email-maxin.john@intel.com>
References: <1510847767-2966-1-git-send-email-maxin.john@intel.com>
	<1510847767-2966-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 10:59:49 +0000
Message-ID: <CAJTo0LYyqm8ycgT5z+J6zku6xJmLj73O_i5mVd7PyzSze6p=ww@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] image.bbclass: improve reproducibility
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
X-List-Received-Date: Tue, 21 Nov 2017 11:00:09 -0000
Content-Type: multipart/alternative; boundary="94eb2c089e144a49bb055e7c1b98"

--94eb2c089e144a49bb055e7c1b98
Content-Type: text/plain; charset="UTF-8"

I think this is to blame for a slew of failures on the autobuilder:

http://errors.yoctoproject.org/Errors/Latest/?filter=57ddf212e64207edfbd813d32ca3a15f6c1c8211&type=commit

Such as:

NOTE: FAIL [0.616s]: test_df (df.DfTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/runtime/cases/df.py",
line 13, in test_df
    self.assertTrue(int(output)>5120, msg=msg)
AssertionError: False is not true : Not enough space on image. Current size
is 0

Ross

On 16 November 2017 at 15:56, Maxin B. John <maxin.john@intel.com> wrote:
>
> Improve reproducibility of builds by adding --apparent-size to du -ks in
> get_rootfs_size
>
> [YOCTO #12235]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 0d14250..a24a561 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -524,7 +524,7 @@ def get_rootfs_size(d):
>      initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES') or ''
>      initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
>
> -    output = subprocess.check_output(['du', '-ks',
> +    output = subprocess.check_output(['du', '--apparent-size', '-ks',
>                                        d.getVar('IMAGE_ROOTFS')])
>      size_kb = int(output.split()[0])
>      base_size = size_kb * overhead_factor
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c089e144a49bb055e7c1b98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think this is to blame for a slew of failures on the aut=
obuilder:<br><br><a href=3D"http://errors.yoctoproject.org/Errors/Latest/?f=
ilter=3D57ddf212e64207edfbd813d32ca3a15f6c1c8211&amp;type=3Dcommit">http://=
errors.yoctoproject.org/Errors/Latest/?filter=3D57ddf212e64207edfbd813d32ca=
3a15f6c1c8211&amp;type=3Dcommit</a><br><br>Such as:<div><br>NOTE: FAIL [0.6=
16s]: test_df (df.DfTest)<br>NOTE: ----------------------------------------=
------------------------------<br>NOTE: Traceback (most recent call last):<=
br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly=
-mips-lsb/build/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 32, in=
 wrapped_f<br>=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=C2=A0 File &qu=
ot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/me=
ta/lib/oeqa/core/decorator/__init__.py&quot;, line 32, in wrapped_f<br>=C2=
=A0 =C2=A0 return func(*args, **kwargs)<br>=C2=A0 File &quot;/home/pokybuil=
d/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/runti=
me/cases/df.py&quot;, line 13, in test_df<br>=C2=A0 =C2=A0 self.assertTrue(=
int(output)&gt;5120, msg=3Dmsg)<br>AssertionError: False is not true : Not =
enough space on image. Current size is 0<br><br>Ross</div><div><br>On 16 No=
vember 2017 at 15:56, Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.=
com">maxin.john@intel.com</a>&gt; wrote:<br>&gt;<br>&gt; Improve reproducib=
ility of builds by adding --apparent-size to du -ks in<br>&gt; get_rootfs_s=
ize<br>&gt;<br>&gt; [YOCTO #12235]<br>&gt;<br>&gt; Signed-off-by: Maxin B. =
John &lt;<a href=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&g=
t;<br>&gt; ---<br>&gt; =C2=A0meta/classes/image.bbclass | 2 +-<br>&gt; =C2=
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git=
 a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>&gt; index 0d=
14250..a24a561 100644<br>&gt; --- a/meta/classes/image.bbclass<br>&gt; +++ =
b/meta/classes/image.bbclass<br>&gt; @@ -524,7 +524,7 @@ def get_rootfs_siz=
e(d):<br>&gt; =C2=A0 =C2=A0 =C2=A0initramfs_fstypes =3D d.getVar(&#39;INITR=
AMFS_FSTYPES&#39;) or &#39;&#39;<br>&gt; =C2=A0 =C2=A0 =C2=A0initramfs_maxs=
ize =3D d.getVar(&#39;INITRAMFS_MAXSIZE&#39;)<br>&gt;<br>&gt; - =C2=A0 =C2=
=A0output =3D subprocess.check_output([&#39;du&#39;, &#39;-ks&#39;,<br>&gt;=
 + =C2=A0 =C2=A0output =3D subprocess.check_output([&#39;du&#39;, &#39;--ap=
parent-size&#39;, &#39;-ks&#39;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;IMAGE_ROOTFS&#39;)])<br>&gt; =
=C2=A0 =C2=A0 =C2=A0size_kb =3D int(output.split()[0])<br>&gt; =C2=A0 =C2=
=A0 =C2=A0base_size =3D size_kb * overhead_factor<br>&gt; --<br>&gt; 2.4.0<=
br>&gt;<br>&gt; --<br>&gt; _______________________________________________<=
br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a=
><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></div>

--94eb2c089e144a49bb055e7c1b98--
