Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id D40BC7226F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 20:04:28 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so8362280qcx.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 12:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RQEZ8+pYytbvqKD/PWPW9UcDb1BRdkJyBdaAETBkYMc=;
	b=IZ1F5n+FuojxJ4rugn7R/DSh26Z9uVtE1DihyW6to5eTez0S5sGKlOLiJUJL07035T
	MTxq4RADWcTzbDBQaX9/l6zVooCWyGoNULx1FRKLsmyqkgMlKpzAoRURJdE1Z/mULnOW
	LzOs0i38VnM02tz5YMxQBNXv+a70SQX5aITGJPq748qsUd8DmZCIj4RoXBe3iRk0lngZ
	I/CDFaRb1B9V2Ns077Z+QFsbhV88Ty3PBK7tJPjxUR9r3ppNJuVKLdC5vqc2mJAJNTkl
	pZOR8+VtPwVAueijvj9c38gpuA/omqGvVcUJ3RBO8l0W1wWyOz4YN6ZqfGw54vuwkw4n
	lllg==
X-Gm-Message-State: ALoCoQma+2HeucCrEGRPNk6qa+CZns1cGGpQunOQpi3XdxMgz9vXrfpIdRyUhW0h4Cq81PEh7bcX
X-Received: by 10.224.25.146 with SMTP id z18mr81500336qab.17.1417464269053;
	Mon, 01 Dec 2014 12:04:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 1 Dec 2014 12:04:08 -0800 (PST)
In-Reply-To: <f939838557a84721bbcf7fe509ef4c8c@BL2FFO11FD013.protection.gbl>
References: <f939838557a84721bbcf7fe509ef4c8c@BL2FFO11FD013.protection.gbl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 20:04:08 +0000
Message-ID: <CAJTo0LYYYsYW=896OVap=vkUz=26LRyawXo_q6pbE+Gfvi+H+A@mail.gmail.com>
To: Ezra Savard <ezra.savard@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [recipes-kernel][PATCH v2] powertop: update version number from 2.6.1 to 2.7
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
X-List-Received-Date: Mon, 01 Dec 2014 20:04:32 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac03d3b7f05092d1e5d

--047d7bdc8ac03d3b7f05092d1e5d
Content-Type: text/plain; charset=UTF-8

Hi,

On 1 December 2014 at 18:16, Ezra Savard <ezra.savard@xilinx.com> wrote:

> diff --git a/meta/recipes-kernel/powertop/powertop_2.6.1.bb
> b/meta/recipes-kernel/powertop/powertop_2.7.bb
> similarity index 100%
>

The SRC_URI checksums haven't changed, so this will fail when fetching.

Ross

--047d7bdc8ac03d3b7f05092d1e5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1 D=
ecember 2014 at 18:16, Ezra Savard <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ezra.savard@xilinx.com" target=3D"_blank">ezra.savard@xilinx.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4xh" class=3D"a3s=
" style=3D"overflow:hidden">diff --git a/meta/recipes-kernel/powertop/<a hr=
ef=3D"http://powertop_2.6.1.bb" target=3D"_blank">powertop_2.6.1.bb</a> b/m=
eta/recipes-kernel/powertop/<a href=3D"http://powertop_2.7.bb" target=3D"_b=
lank">powertop_2.7.bb</a><br>
similarity index 100%<br></div></blockquote></div><br>The SRC_URI checksums=
 haven&#39;t changed, so this will fail when fetching.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc8ac03d3b7f05092d1e5d--
