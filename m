Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 040506FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 15:43:31 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id k74so51040892qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 08:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VPnuSdme4fOI7FXnfBW+ixgS9FOVX2EWEd0qhU7IcnM=;
	b=WC2QaEiY8hsYFKs7e0VST/NxFkRvVzV5xr7F3w974AyqBTysbE5bABlm8Um0UcIjIr
	mO0qfmo7hvxkEkrqvwkerESLaiifmf5NY19byIG9JVTshC6iL9hXd7EOesmUG5j9ebH+
	r7Zx2iw4G4pzLwRJLR6KnLm3ESylrP+sHgc5eqyZrljYYZvkhe/STGn28RtWovQ4j8oW
	adbKe/4NLiLmx/xECA8WT1rqYh5wtgrHnBI2Kwj7HtYSTsbqcpJdXsH2/38U6MWI/N+Y
	bRZ6rVBISyafoYY53BN/FKWw1FzfUTMcYa2qidAqdHlxTfSTbtpb1hYQVq+mGk7WONBP
	rw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VPnuSdme4fOI7FXnfBW+ixgS9FOVX2EWEd0qhU7IcnM=;
	b=sOHiZdrLYKH8dQoOjPMKl9I/DxYu0cnpCkT0YYBVFltBstqgF/fc5ctIzA7APzLz41
	KB+1HOqPOUjHddlmEnN7L6Oa9/oFvwjwHul/V3M0IeiP2hsIPNo7vcwDlrpYnemMsi5h
	27q9ShL95l0/1ft5b7Fd6/UuaBQJ5c/xDNZiNLJfQ/z8g64berhmBeVNL4YNg988Q0ga
	1JnvKhZKhDamK63he2hBdrF5rGS9Q+ucxhmYAh0yvbA1sWt3n8Sf8cqTFTYROCJpNPqi
	PiOJ3ejlrLh/c7hmcVsu2HtNuEcO/RywNx+DPtpW09WYja465j9CrtmEAHSLLLbqxl8y
	aK2Q==
X-Gm-Message-State: AODbwcB5Y4bewMcZPe09OL6zEnTXc2SY5x3EM+M1bp/xsGVvzMe+8+RS
	SIiosHyKGDgMwx3vLRmYW5q9Fg0uk8RT
X-Received: by 10.55.111.71 with SMTP id k68mr4223542qkc.26.1494603812975;
	Fri, 12 May 2017 08:43:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Fri, 12 May 2017 08:43:12 -0700 (PDT)
In-Reply-To: <afd0b202d639dec70b5d9099736aa216f58e38c2.1494425038.git.alexander.kanavin@linux.intel.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<afd0b202d639dec70b5d9099736aa216f58e38c2.1494425038.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 May 2017 16:43:12 +0100
Message-ID: <CAJTo0Lbk3v06x8wNbXdjrJePi6jT6wp-98XQdnR-of83BfSfrw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 05/10] bind: update to 9.10.5
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
X-List-Received-Date: Fri, 12 May 2017 15:43:32 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c2d85a4a23054f5591f3"

--94eb2c05c2d85a4a23054f5591f3
Content-Type: text/plain; charset="UTF-8"

On 10 May 2017 at 15:13, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb
> 3f"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab
> 43"
>

No explanation for this change.

Ross

--94eb2c05c2d85a4a23054f5591f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 May 2017 at 15:13, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1l2" class=3D"a3s aXjCH m15bf2b5f89748c58">-LIC_FILES_CHKSUM =
=3D &quot;file://COPYRIGHT;md5=3D<wbr>0a95f52a0ab6c5f52dedc9a45e7abb<wbr>3f=
&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D<wbr>dba46507446198119bc=
de32a4feaab<wbr>43&quot;<br></div></blockquote></div><br>No explanation for=
 this change.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--94eb2c05c2d85a4a23054f5591f3--
