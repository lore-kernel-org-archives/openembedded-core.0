Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 41B7878044
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 19:17:28 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u12so106921203qth.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=05ycZ7xLUEYo9YpdNEQHAnNCmdjFh1YtlYZseJicue0=;
	b=dWsfkcEvOJjVYqsDmBAfYtut+ybkmMnjmecDLl3uMtTdB7PBvKdThYPo8qLodpM+Du
	GF3rnA+X7U6EpD4+urFeiE2JBWwyqO5w+x0aweXeLC8s+SyCsDtZruF3eTcJvf9JfTl+
	OwNoEwSM6/uQR66XG9WCUsM6ibd/EpOEGdBcp9ZKnfOIoUAUHY0KyHiwE63tdhM28D14
	fzUsbLaBMUXJY9rQAaNCiZn5YxmhhDIIq1NGkB/K3v900NMXjCrFrCr4Hpi05Y/WTCno
	JVodSuMbgTl2Eath1IzMl595t95LYf3w6JiSVGuMrQRJe8paFcy3hr5iZxJMr0QtFrbM
	ZoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=05ycZ7xLUEYo9YpdNEQHAnNCmdjFh1YtlYZseJicue0=;
	b=YgMuZgId/wBu/VdrrUHv3xoxDS/rID2pPBXoRBTIq3lDIjBIfkCjYrh0/DiYXrZ9ji
	Rbplebm+1oAOa5xFMqLD+hJU58ukIkrLi7dluMZxlyjcSW+vwna6ZvQGTAWdnzvt3Dt1
	IszZyuyIjl8mKfGuCqy59VBMBtVLTxmVadUcc1GJMEAOrP2bmyw2BkIDZi62Shn1+S6o
	cCuK+2ArpguErD8cOhdPRtqZg2Tml7woREYG/qNJ+p5FaBUoYWqoFiqytIyavKZJB2VZ
	6LhcIqPZeKXsIKN9kwj2MeJsJK+3WerNLUozDJxNemFQZByZAUaH5fDOVTdzOOG+ueVl
	b4Yg==
X-Gm-Message-State: AKS2vOxTi2a2/LZuODlS71mZqRxoFrwZOalSZr7WhneCpwC/fSrGNhVq
	PzUNmkR0YPEcud4Cy/SA0jiijMxrGmN9
X-Received: by 10.55.197.202 with SMTP id k71mr42793191qkl.54.1497208649541;
	Sun, 11 Jun 2017 12:17:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Sun, 11 Jun 2017 12:17:09 -0700 (PDT)
In-Reply-To: <20170611165839.26175-1-net147@gmail.com>
References: <20170611165839.26175-1-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 11 Jun 2017 20:17:09 +0100
Message-ID: <CAJTo0LaXFGX118Og439zY9vpv5J1R76DBhA_ttuhLeEp6EUE_g@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] bitbake.conf: Add whoami to HOSTTOOLS
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
X-List-Received-Date: Sun, 11 Jun 2017 19:17:32 -0000
Content-Type: multipart/alternative; boundary="001a1149a4beb5febb0551b40dc3"

--001a1149a4beb5febb0551b40dc3
Content-Type: text/plain; charset="UTF-8"

On 11 June 2017 at 17:58, Jonathan Liu <net147@gmail.com> wrote:

> The whoami command is used when building the Linux kernel in
> scripts/mkcompile_h to embed the build user that is visible
> in /proc/version.
>

Not if you have oe-core a5a14edb5573e33667b63b1e34cb4e19d075e8e8, in theory
at least.  Unless you have an entirely from-scratch recipe that doesn't use
kernel.bbclass, I guess.

Ross

--001a1149a4beb5febb0551b40dc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 June 2017 at 17:58, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204=
,204);padding-left:1ex"><div id=3D"gmail-:54l" class=3D"gmail-a3s gmail-aXj=
CH gmail-m15c98175758e5b4c">The whoami command is used when building the Li=
nux kernel in<br>
scripts/mkcompile_h to embed the build user that is visible<br>
in /proc/version.<br></div></blockquote></div><br>Not if you have oe-core=
=C2=A0a5a14edb5573e33667b63b1e34cb4e19d075e8e8, in theory at least.=C2=A0 U=
nless you have an entirely from-scratch recipe that doesn&#39;t use kernel.=
bbclass, I guess.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a1149a4beb5febb0551b40dc3--
