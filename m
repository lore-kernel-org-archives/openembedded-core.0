Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5436F6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 22:27:02 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id y8so2469444igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 14:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sm3hNmuRWvxL6xzgOvHgs2bt/AuRsCs+1+P2I1Xhwrk=;
	b=AciSVgGMdNeG/0+yGL874V2cItpDWCMIxTDUQGQViyT54eDt2oe/H2oCG6qxGgGvtL
	ePsvKdtycaqq+A0eDQEEhd1HpZlTf1iKTbHeoy4DnX9UDVvqzI9DWzA4PQ47dt/Z/3kh
	RvV7FvTfVoncwGwWoYc9wUzacd70b75LO0Vmf/Iw5eMmiGEUqQATIanUO75Zr58CN+B0
	guNeFlNrD9KAxdkiYOFT4sUPmLgTgSrYAnJGa2Hjz0VZPeuQBHcizBOtzmvFtVbFLBQm
	zlKJDzCrir2sbqF/XhbRgYFm/8YnYsvKPFgwAmcmX872ftCnR7GIOODPdNcSpKzXOiVq
	Zp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sm3hNmuRWvxL6xzgOvHgs2bt/AuRsCs+1+P2I1Xhwrk=;
	b=R+EoxFG/U8DUTRCXMCKp0IKokk8alCsOgakepLa1HOZGUI7PNszB/JHHmM3F9I/spz
	FGSTU2nWUpDlx7e7si7HLi9OXKJMpwdFg2loaC4cCDfDSKAwPjVTKh8Yv6545jlHC2cA
	D0lKowMFhLe6rCms9b+ef8Yb3dUiT14StN7e8m9vQVa1c4HKKZz/g2epV+aEj/gy0R8O
	nHPNUJCwAJiKUMz+zmwbKuscW9AT0lM3xEpsr33y+F0Gp+FwD688ex6Fkqt7BiemB91q
	bpRALqzhFtrffGjlQtEPjZfdTu34qD9uzKwZvPteMf8UL9IyT2Fb9V7U6kTHGatR9ksZ
	EO1A==
X-Gm-Message-State: AG10YOQzkX3/64584Bvsx/ByfFqLUVjeDFCrUzBTvzthVTG6RLiP9PaUJXppkPBXxr8bGe1e4teixRPiVyJ5zO98
X-Received: by 10.50.126.8 with SMTP id mu8mr6473703igb.52.1455056823210; Tue,
	09 Feb 2016 14:27:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 14:26:43 -0800 (PST)
In-Reply-To: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 22:26:43 +0000
Message-ID: <CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Tue, 09 Feb 2016 22:27:03 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf139b89052b5dd180

--047d7b1635bf139b89052b5dd180
Content-Type: text/plain; charset=UTF-8

On 8 February 2016 at 14:59, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> * update SRC_URI and checksum.
> * add PACKAGECONFIG to offer choice of crypto implementation (for sha1
> functions)
> * use libcrypto by default. In upstream commit a24bdce4, support for
>   SHA-1 was copied from xserver repo, so let's use the same default for
>   --with-sha1 option that we use in xserver recipe in OE core.
>

Forgot to ask - what real hardware was this tested on, and was anything
like Piglit used to verify it is working properly?

Ross

--047d7b1635bf139b89052b5dd180
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2016 at 14:59, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2je" class=3D"a3s" style=3D"overflow:hidden">* update SRC_URI and chec=
ksum.<br>
* add PACKAGECONFIG to offer choice of crypto implementation (for sha1 func=
tions)<br>
* use libcrypto by default. In upstream commit a24bdce4, support for<br>
=C2=A0 SHA-1 was copied from xserver repo, so let&#39;s use the same defaul=
t for<br>
=C2=A0 --with-sha1 option that we use in xserver recipe in OE core.<br></di=
v></blockquote></div><br>Forgot to ask - what real hardware was this tested=
 on, and was anything like Piglit used to verify it is working properly?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--047d7b1635bf139b89052b5dd180--
