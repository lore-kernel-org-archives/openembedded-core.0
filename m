Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 79DC17839F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:59:56 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id w1so21465074qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kXLYss617CVqLRlM3waF7i9np3I13+Xwh7ezMjQBuDI=;
	b=f2HPzV3kbuzzCF6D88FDRX/qB1KKebr7bQH9R4PPVXkwfFY6RDBExwVrtd0Ulk755f
	HQ1rIkNt7adDBvMCnuJOT1KTGbGewVhUaEXpHB4OhcbEhER0VJvHE5ZvMs78GOKYPI2I
	lzMZuWsxahEAC1fcQOoDPJTEt3p5yBDzlwP4KJrlqswMcxd5y3e+GnlUqnoHx0w7epdT
	ON5eYgT1p9RgOGXjlrO2yUx1bSK4B8duyJI3JWCDjwc+mRNSg39HSQcGJh3i/NPaqpSb
	Lhmix6fIsHUamf/lBNpPjK1aGEM9OnWDx9NKLO8cva+E+eK0x1n+LswnyHX4PdnzLjUL
	WuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kXLYss617CVqLRlM3waF7i9np3I13+Xwh7ezMjQBuDI=;
	b=POJHlBpTff+VHc2aHV79uuFNTNcGKsOX7jr5337NWM528fZaohS1/3CtyQZKF7YLnk
	0s9RdFyCthF6x5fIJ/eeeq12g3cFqMMKX2jEpKGsDiOI+UjuMzeqB9xB7jNUBnyOAh5H
	qG1oenrf1oehOoQkvJvcBPXQGN3UvnlVXTrwiVofOs2kINT0uFtU1j4UWWnIz3lWNqU+
	2WXWn/BTWEHzBGCRKvtrNpBkmI8NXZCsUmajuGQXOLzlsK0lCaAmZ6WCzAdk7Itiqq2s
	muHfu4IufE1mXBsptYUYSA2228BDxU/3mAyoMKZ9DQiY4XP5js271ch1WqWCP2nbqglk
	2pHQ==
X-Gm-Message-State: AKS2vOw8X8Z+nfbxUZGXFB17MlrExPQsJj/wxi+i47+HFwWGyKuJx8E6
	trw+kHADZdoHazw4Aj0nnyCKAuikOP17
X-Received: by 10.200.58.38 with SMTP id w35mr6376068qte.93.1497535198215;
	Thu, 15 Jun 2017 06:59:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 06:59:37 -0700 (PDT)
In-Reply-To: <c889d79e52d9a86ad4c7a5de5555aa4e49e0610d.1497534748.git.pkj@axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<c889d79e52d9a86ad4c7a5de5555aa4e49e0610d.1497534748.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 14:59:37 +0100
Message-ID: <CAJTo0LZY+R=kiwGO87T3_Z451Piwi7H2H5GK3K-hGLKfuniAUQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/11] git: Do not install git cvsserver and git svn
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
X-List-Received-Date: Thu, 15 Jun 2017 13:59:57 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10c8752420552001576"

--94eb2c0ca10c8752420552001576
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 14:53, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> These git commands require Perl modules that do not exist in OE-Core.
>

Is this a good reason to remove the binaries though?  What if someone added
the modules and wanted to use these binaries?

Ross

--94eb2c0ca10c8752420552001576
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 14:53, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4tl" class=3D"a3s aXjCH m15cac0908c0a2162">These git commands require =
Perl modules that do not exist in OE-Core.<br></div></blockquote></div><br>=
Is this a good reason to remove the binaries though?=C2=A0 What if someone =
added the modules and wanted to use these binaries?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0ca10c8752420552001576--
