Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id CE8AF601E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:31:24 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so10769949qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ulTGzdbrVclPn1M+d4vW0qJ86MEWsBEesFOspNdMB3g=;
	b=L3k5e0xsxvutdiqT4Fcb2xLuzTvOsOL8KM8K1wRDKNw2aK/z/eYbUE/I2oDahBq3nw
	JOaFyM3i+1krgEv/A3uP6QSgjpBAXw0I1ON5ypdJXB4Sip1pfvw/hL/dOriVncUB5bRt
	OfVPakRdhAZCI1dFNnLMCjjGE/TuW6vqMDLNTVm2AgJrOmf3qpVqlG/YDn8qpVgaqMkC
	9SqrAcua9ECQanW/Y/qCWGkGhgfmenWEyM5ImE5NYcOvdCZo53qA0Qmw36HFRCMOXF2E
	yLDW1M/v0duY6uo2d3Kdd4OKYYgRzDvYzHb/2ZVZm77WzNzhr1dXUOq6d/7jFr+WPvhH
	GCNw==
X-Gm-Message-State: ALoCoQlh0OmrwBtIfCSY8aHhaoSyHGwlhh3xpmwnPvgdkdL6snR/Cuwpd6VoQ62VRsEVAyMJP6jx
X-Received: by 10.55.43.130 with SMTP id r2mr50477585qkr.14.1432045885936;
	Tue, 19 May 2015 07:31:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:31:05 -0700 (PDT)
In-Reply-To: <1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:31:05 +0100
Message-ID: <CAJTo0LYgeSkvr+U1OZG70PvH-OXY9suxkK=7wHM4ecOY8jbKCQ@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Tue, 19 May 2015 14:31:28 -0000
Content-Type: multipart/alternative; boundary=001a1147afb0556b4a0516702a08

--001a1147afb0556b4a0516702a08
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> +# The resampler plugins create some symlinks, which have to be added to
> FILES
> +# manually, since do_split_packages() rejects symlinks. The symlinks also
> cause
> +# QA errors, but those errors are false positives, so we disable the QA
> checks.
>

Not true, there's an allow_symlink (default False) option to
do_split_packages, so this can be cleaned up.

Assuming that those symlinks are versioning (and so pointless for loadable
modules), a neater fix might be to patch in libtool -avoid-version.

Ross

--001a1147afb0556b4a0516702a08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 13:40, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:9in" class=3D"a3s" style=3D"overflow:hidden">+# The resampler plugins crea=
te some symlinks, which have to be added to FILES<br>
+# manually, since do_split_packages() rejects symlinks. The symlinks also =
cause<br>
+# QA errors, but those errors are false positives, so we disable the QA ch=
ecks.<br></div></blockquote></div><br>Not true, there&#39;s an allow_symlin=
k (default False) option to do_split_packages, so this can be cleaned up.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Assumin=
g that those symlinks are versioning (and so pointless for loadable modules=
), a neater fix might be to patch in libtool -avoid-version.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147afb0556b4a0516702a08--
