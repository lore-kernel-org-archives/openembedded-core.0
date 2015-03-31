Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id E00EB736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:31:21 +0000 (UTC)
Received: by qcrf4 with SMTP id f4so14391836qcr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tVNW/ha/v/FJIxY1RrjcJqDnkonWb6SAyHZoqB+PZwg=;
	b=hdiglyO80p/WYOkBRmMjakN6TlfpUD8/ylqDXzhs8J0UmEcl79cK+IIFss+fEimocm
	nhO5jxKnM+5D/8lSJMFnkJvI//I2z1nAniCaLZaoK6aaqGeaUB48vClTWqr5TLP/e/RE
	4u1/iVFft8nvBeImq9PvakiRrTaifFHtAsHYNmyLr9o2x5SEkEJK5DiaHmRG1vAWf0p3
	8dr6Mf4UrhKSbDQiNkH2x8GBDLv7+eOJ0c+ueTrSAYL08mPfXS8eKCrPn8TO9gjvQ9tR
	ODJfCVk/9af6itMuaJPPXQ5T3pbP4EfhmrNOYUuHcSvTY/aJk3VONGO+BehqcHlIX8r5
	SzmA==
X-Gm-Message-State: ALoCoQnfgcQa7pGs3aBwTlkA9xDw4wiC4MN7NmBU/WnY7ncHz90DXlD9I+Xd3Gy3QwPxAKQwemzy
X-Received: by 10.140.217.16 with SMTP id n16mr11177017qhb.82.1427841082450;
	Tue, 31 Mar 2015 15:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 15:31:02 -0700 (PDT)
In-Reply-To: <1ec089080f95b9042d782b5e5ecc6628877acd02.1427832505.git.elizabeth.flanagan@intel.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
	<1ec089080f95b9042d782b5e5ecc6628877acd02.1427832505.git.elizabeth.flanagan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 23:31:02 +0100
Message-ID: <CAJTo0LZChMApmPzMEA-J+u8izy06O7fMJrU+3JaAN+ZbnSCv4w@mail.gmail.com>
To: Beth Flanagan <elizabeth.flanagan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] distrodata.bbclass/distro_check.py: Support buildtools PN mapping
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
X-List-Received-Date: Tue, 31 Mar 2015 22:31:22 -0000
Content-Type: multipart/alternative; boundary=001a1139976c83fb3405129d288a

--001a1139976c83fb3405129d288a
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 21:11, Beth Flanagan <elizabeth.flanagan@intel.com>
wrote:

> We need to be able to map buildtools- to the original PN.
>

What packages are prefixed buildtools-?  I can only see a
buildtools-tarball and nativesdk-buildtools-perl-dummy, neither of which
can be considered to have a "real PN" of tarball or perl really.

Ross

--001a1139976c83fb3405129d288a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2015 at 21:11, Beth Flanagan <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:elizabeth.flanagan@intel.com" target=3D"_blank">elizabeth.flanagan@in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:1nm" class=3D"a3s" style=3D"overflow:hidden">We need to be able to map bui=
ldtools- to the original PN.<br></div></blockquote></div><br>What packages =
are prefixed buildtools-?=C2=A0 I can only see a buildtools-tarball and nat=
ivesdk-buildtools-perl-dummy, neither of which can be considered to have a =
&quot;real PN&quot; of tarball or perl really.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139976c83fb3405129d288a--
