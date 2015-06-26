Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 102EE75662
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 17:00:18 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so58197038qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 10:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=atMkLrmj1oE1SuXHtwfXlGpoi7cKTm/jBuPo5wX1Ivc=;
	b=GYt+RSnYv3lMZ+g1FVqkYj2aICMkIau3axgLcg2meH44I4LeW5+mUa0TH20keuurf4
	5ULX62LvvXSMQeZFD0WtRmi914qx/7Lw0IcMzg4rx8dlvyC3tDwYqpc1v8DqhUmJBnMn
	A3ZgkN1nvFU6KTDlQ40GQVsME3oifMGSFdN1ZnpsB+Wple33EawCPH53U/hsL4D8eNng
	fSjud7A57LTVI0+xQTI08Uj62MgIIbc8SUAY/z3lWUAWjrhHJVqdgxtYJGqCNLo5HtWh
	cFJqvrIyRLrmGYgrc5KSc90psEOoK8zUOFH5q+64jB4muQrdMTD8sww8GKoxcZZ04Jbf
	rW8g==
X-Gm-Message-State: ALoCoQkLxh9ohFxNqPyrY/CkD/44063EMTVqZTjEooyeZ/FdCNgvZ+OTeG5kjIP9XAB7LUbe0w6T
X-Received: by 10.140.88.5 with SMTP id s5mr3577444qgd.59.1435338019366; Fri,
	26 Jun 2015 10:00:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 09:59:59 -0700 (PDT)
In-Reply-To: <AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
	<5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
	<CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
	<AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 17:59:59 +0100
Message-ID: <CAJTo0LYMx1XcXf3TkPpTz3a_pn-z3VOaPG-YheKyJJwOeF_eEw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Fri, 26 Jun 2015 17:00:24 -0000
Content-Type: multipart/alternative; boundary=001a11c11874c6fe2d05196eacd8

--001a11c11874c6fe2d05196eacd8
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 16:19, Khem Raj <raj.khem@gmail.com> wrote:

> From a system integrators point of view, I agree with your sentiments.
> From a developers point of view not so much. We already have many recipes
> already fetching from git and more and more switching to use it see qt5
> lately, there are perfectly fine tarballs released for QT5 too, just
> because its simpler to developer and integrate packages.
>

But oe-core is a system for integrating software...  If you're doing lots
of work against weston, then a bbappend to change the SRC_URI to a git
repository isn't exactly hard work.

Tarballs give us much smaller downloads, the security of checksums, and the
general assurance that you're building what the maintainer expects you to
build.

Ross

--001a11c11874c6fe2d05196eacd8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 26 June 2015 at 16:19, Khem =
Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div>From a system integrators point of v=
iew, I agree with your sentiments. From a developers point of view not so m=
uch. We already have many recipes already fetching from git and more and mo=
re switching to use it see qt5 lately, there are perfectly fine tarballs re=
leased for QT5 too, just because its simpler to developer and integrate pac=
kages.</div><div></div></blockquote></div><br>But oe-core is a system for i=
ntegrating software...=C2=A0 If you&#39;re doing lots of work against westo=
n, then a bbappend to change the SRC_URI to a git repository isn&#39;t exac=
tly hard work.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Tarballs give us much smaller downloads, the security of checksums=
, and the general assurance that you&#39;re building what the maintainer ex=
pects you to build.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a11c11874c6fe2d05196eacd8--
