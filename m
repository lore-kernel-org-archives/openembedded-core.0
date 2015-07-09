Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 13ED0607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:10:18 +0000 (UTC)
Received: by qkei195 with SMTP id i195so187751172qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 08:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mOxXzjZIvsK65zchm4jQzyoUsBJvQ3pRR8s6e/IINz4=;
	b=MNk7M/PHQiyuP5wS3kJt+NE6nzMbpJoWnGta+8e7Y3jrlfn2ekoODhm+Et73+62Aat
	2T8EEYlLpyLrHBbe0uZiXtdS+T1Rmf4pKfEfWo9KCfeLmpXvnXN4rvKDpONFHYoCQqGz
	ZgF3/GBo5CHsd8+d2pdKv3v/H7n1yZ1c/GiNZr4iZnKLRw577bbRItVZBVENUx9+XpEn
	T4lkwLa/QAdEx/6bJVT6WGxULcMs3hssmd0S6j+IxyG5rQjrmLfs6GQf0VjMiBdmlKNm
	dqrju7wUZKYClDDMhE2LUB/L2PyEkllbNA1HphGZ7drvnyM0EA9KDZDqMBgV0T666MDu
	cpQA==
X-Gm-Message-State: ALoCoQkLrLk0d/Gh3t5/MD55hcIzFAceXmFG5egRdROJQKTU6eMrARO5rsyI/cHX1X7rMl0niBpz
X-Received: by 10.55.15.129 with SMTP id 1mr25112241qkp.29.1436454618760; Thu,
	09 Jul 2015 08:10:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 08:09:59 -0700 (PDT)
In-Reply-To: <20150709143248.GC2446@jama>
References: <cover.1436452048.git.cristian.iorga@intel.com>
	<ffb48ef3e2d7e9eb1e0adcff1226dd77b9b10553.1436452048.git.cristian.iorga@intel.com>
	<20150709143248.GC2446@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 16:09:59 +0100
Message-ID: <CAJTo0LYjQBPh1qBRvrasYTyknaVG+hKbxmS8kcFpRjrgrjgxKw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libical: upgrade to 1.0.1
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
X-List-Received-Date: Thu, 09 Jul 2015 15:10:20 -0000
Content-Type: multipart/alternative; boundary=001a1146f100498fec051a72a773

--001a1146f100498fec051a72a773
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 15:32, Martin Jansa <martin.jansa@gmail.com> wrote:

> aren't github archives regenerated from time to time with different
> checksums?
>

Yes.  I keep on meaning to write a QA test for this. :)

Cristi - if this is the best libical has as a tarball release then we
should do a proper git clone.  Amazingly, the download button on their
website links to a tarball of master which is borderline reckless.

Ross

--001a1146f100498fec051a72a773
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 15:32, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4m5" class=3D"=
a3s" style=3D"overflow:hidden">aren&#39;t github archives regenerated from =
time to time with different<br>
checksums?<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Yes.=C2=A0 I keep =
on meaning to write a QA test for this. :)</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Cristi - if this is the best libical h=
as as a tarball release then we should do a proper git clone.=C2=A0 Amazing=
ly, the download button on their website links to a tarball of master which=
 is borderline reckless.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a1146f100498fec051a72a773--
