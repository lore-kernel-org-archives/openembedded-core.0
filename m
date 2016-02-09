Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A2C8673173
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 22:22:45 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id xg9so2081696igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4Mjr8W8bOq9sDg60PYVyUIUcBD3zrXpSzTLUqTFeT8k=;
	b=Me9OIW1J3p4lrvERBXmCmZnXUnjkkZ5PXh+W4JogSpgUT1viISiP5xjejTN6XFyMK6
	9hUUhRJVr40QBb7hb5pdhx3RMz+3ulwFnkpcvnuBvD16/BYtkt9XAK29C38TfRe8bhFW
	/jVHwEeiev9UW1p2vOPa5E8s1Xs81Vywj609ZATXU1leHmaNcto3x31F8zpmMtxki2Eb
	W3OK70DhKnuK2S0Is+ROIy5/oEXbeYZirBTsyOl0ZWATps6L7LmsTyX2PSCabH6E55X/
	64MgJAf0qiTvFR5PsUhjhb2ffvFs/8ICkA78uC24+tmGrCsxtxEPYJDbw6orEVN/Uhff
	L8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4Mjr8W8bOq9sDg60PYVyUIUcBD3zrXpSzTLUqTFeT8k=;
	b=QbfLXkQcWvu5WBECPVjKNFnUvkjYVBGtBuravbSiU9efVSeP+NJNEx7+9jJIt3j2mQ
	nMWBLLd9pMn+aAEysAUVCTNUp+BJs9zqf4+KnJj9BBHSbuvUzFLlAABOigQa5I6J2SiO
	XV/EJAcGm1gq+tHoYBGhyDQAafhXLNur7fs43rqPNRvU6VgbhI1Z4f8DzqRc80etOmE6
	ZdC+Jf3GSzmaPwrIWPaee3/e7BBaGc1h4AgVsD1zylhHUxJN7aJmxQ1Pd3dJt8dXuGZV
	voj4gp2ZmAGvOruhBLuQY3kmbRO8SaSyC7MQ2ej6t3phLa4sJja8aZm7iR2PKFn10vrw
	xHfg==
X-Gm-Message-State: AG10YOTLKNz90OZ8vLU5ikLl63Pvdojvmn9UfSoYtIKHXhB/lsO6C+HEM+7I19K2horwpAHe9RbjSGgIgMpu04es
X-Received: by 10.50.160.7 with SMTP id xg7mr6377742igb.64.1455056566420; Tue,
	09 Feb 2016 14:22:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 14:22:26 -0800 (PST)
In-Reply-To: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
References: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 22:22:26 +0000
Message-ID: <CAJTo0LbszEFGBN5RNkb8y50nRRekZQkQ13Cedc+GCUzpL1ACbQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mdadm: update to version 3.4
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
X-List-Received-Date: Tue, 09 Feb 2016 22:22:46 -0000
Content-Type: multipart/alternative; boundary=001a11339de8c53fdd052b5dc1fe

--001a11339de8c53fdd052b5dc1fe
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 17:48, Maxin B. John <maxin.john@intel.com> wrote:

> 3.3.4 -> 3.4
>

poky builds fail with ptest enabled:

| restripe.c: In function 'test_stripes':
| restripe.c:845:4: error: ignoring return value of 'read', declared with
attribute warn_unused_result [-Werror=unused-result]
|     read(source[i], stripes[i], chunk_size);
|     ^
| cc1: all warnings being treated as errors
| Makefile:214: recipe for target 'test_stripe' failed

Ross

--001a11339de8c53fdd052b5dc1fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 17:48, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":1hj" class=3D"" style=3D"ov=
erflow:hidden">3.3.4 -&gt; 3.4<br></div></blockquote></div><br>poky builds =
fail with ptest enabled:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_extra">| restripe.c: In function &#3=
9;test_stripes&#39;:</div><div class=3D"gmail_extra">| restripe.c:845:4: er=
ror: ignoring return value of &#39;read&#39;, declared with attribute warn_=
unused_result [-Werror=3Dunused-result]</div><div class=3D"gmail_extra">| =
=C2=A0 =C2=A0 read(source[i], stripes[i], chunk_size);</div><div class=3D"g=
mail_extra">| =C2=A0 =C2=A0 ^</div><div class=3D"gmail_extra">| cc1: all wa=
rnings being treated as errors</div><div class=3D"gmail_extra">| Makefile:2=
14: recipe for target &#39;test_stripe&#39; failed</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11339de8c53fdd052b5dc1fe--
