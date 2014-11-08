Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 660CC65CA0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 00:34:47 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so3491422qcy.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 16:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fhdEplPjbFBiNGEkH6djQ/eXmKdfhJYTFa5fXWlMgAk=;
	b=UdJ9O7xJHcqE0ahTGlENLPCZwKMCYhXFKTbbdKw8TqMrkH73BU1OMCVo6tTSjQC7DI
	lIxGe+WBQ8yNVmvSCiqt5kA49hcAaiVDII0WwEQ+LEAcTLSY77MsIj2b1U/N47tC7b2C
	DTQIjW2GUhHw/vV059HiSNOnYhvirGgp5f9VjK139e4Zzi7tSA73uD6kt+rp055sq9xD
	0bQEO7+m/hA4QnQvGf+xNCn1gzvcBd8R9JN+z0WbW9Ba1OgzmQ1OSKKpDHkR3+5cLENU
	ShxV4Xg3ZKk8fvDJ3zX/9sN1Rqa5+mKM8E4wn8mFv6ZcUQ1dFq3v7Mplsx/PfANzzABA
	i/7g==
X-Gm-Message-State: ALoCoQnPsEdhpoQRjFy9YHe31NICGCcUSbTax9qKzU8QAt5H+8ddzJsQJD47lNP1cCsQ0+NfJIsk
X-Received: by 10.140.94.246 with SMTP id g109mr21222752qge.77.1415406887944; 
	Fri, 07 Nov 2014 16:34:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 16:34:27 -0800 (PST)
In-Reply-To: <cover.1415260194.git.Chong.Lu@windriver.com>
References: <cover.1415260194.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 8 Nov 2014 00:34:27 +0000
Message-ID: <CAJTo0LZKsp1UvRNVMiFobDo92okUwDdjUCMj84Sx2xTjHBvNsw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] nss: CVE-2014-1568
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
X-List-Received-Date: Sat, 08 Nov 2014 00:34:50 -0000
Content-Type: multipart/alternative; boundary=001a113a81d6c5464105074e181c

--001a113a81d6c5464105074e181c
Content-Type: text/plain; charset=UTF-8

Hi Chong,

On 6 November 2014 07:50, Chong Lu <Chong.Lu@windriver.com> wrote:

> The following changes since commit
> 0add8abc12b850e38a6ec7dcf2856fab2c0107b6:
>
>   buildtools-tarball: package all of Python (2014-11-05 23:30:49 +0000)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib chonglu/nss
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nss
>
> Chong Lu (1):
>   nss: CVE-2014-1568
>

Sorry, but we've just merged Saul's upgrade of NSS to 3.17 so this doesn't
apply, and as we're unfrozen now an upgrade to the fixed 3.17.1 seems like
the sensible way forwards.  Could you do this upgrade?

Ross

--001a113a81d6c5464105074e181c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chong,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 6 November 2014 07:50, Chong Lu <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The following ch=
anges since commit 0add8abc12b850e38a6ec7dcf2856fab2c0107b6:<br>
<br>
=C2=A0 buildtools-tarball: package all of Python (2014-11-05 23:30:49 +0000=
)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" target=3D"_b=
lank">git.pokylinux.org/poky-contrib</a> chonglu/nss<br>
=C2=A0 <a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dc=
honglu/nss" target=3D"_blank">http://git.pokylinux.org/cgit.cgi/poky-contri=
b/log/?h=3Dchonglu/nss</a><br>
<br>
Chong Lu (1):<br>
=C2=A0 nss: CVE-2014-1568<br></blockquote><div><br></div><div>Sorry, but we=
&#39;ve just merged Saul&#39;s upgrade of NSS to 3.17 so this doesn&#39;t a=
pply, and as we&#39;re unfrozen now an upgrade to the fixed 3.17.1 seems li=
ke the sensible way forwards.=C2=A0 Could you do this upgrade?</div><div><b=
r></div><div>Ross</div></div></div></div>

--001a113a81d6c5464105074e181c--
