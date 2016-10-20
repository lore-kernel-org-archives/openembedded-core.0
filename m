Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id D7178719E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 15:16:23 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id q7so58722478qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sW36IVrWgMS0ELBcBLIbyb5EMKpiFufLdiEbOyBa7Uw=;
	b=OtXG4e9wKOJoUaGXnUMKppaOG1txV7LrKqPwozQ8u8k1XMpgjPont2sQMCmoFds5vu
	xyFs05gAAn0OnDVZIAtm8Uj4KGfgUQ7JS4e5dq9rdDdErXWUU1xr353eEgQdcxAF6p02
	GJ3CMMSgCSsv/5u5TnqaLUAVwIarIcNgs+5k8we7+2SxTMLZROdnVc3yR2zLKQYSrkN/
	ZI7h4keEbTEkrPMZwJ+273pjmDUkGiklp0RCXHLQ/+4U3/I1ZyzDjj/OGvuiHZc8ZCQT
	2uFZFgnBMjFHanri4D3u0PbalZt6+PrtNMSXeFf/ymPpy6EhmM3a2Rapjyd8WEF4znQq
	WvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sW36IVrWgMS0ELBcBLIbyb5EMKpiFufLdiEbOyBa7Uw=;
	b=E3OLhtkU/4WzJWqq+XNnmoRflcukZ+0bFa9h7OR9fKounl2lOCAy1jrOol/YEcwg3o
	8AHZWjrXFct3LQc/mNCm4vhyuhjp/qnmWdAt2aAXrlI1QRTHNDLsNqQyyIt1imCAbCnz
	IvtEbnT60m4JdhpBt4b+Rrn6xzS+UoEJBlxKNhEKxjKmyGzt0SPy+nPLvvppxOLZrvAJ
	L579qkRQyq1zsKkturYoiPQ1ESoBWMdgFNDu7WgDU4gDP+ImCvJBo0vAOt42QnxG5Afu
	Bh38DKwJmZQBkUsJhyQCmOsx67UrXUIdHHeRjkTTd9MIqIUG4xxigf4Eo5pysma221BR
	hyfg==
X-Gm-Message-State: ABUngvenA/vFiweO6aRVB7Y9RmFgIhEjbGrNhj4Zvk4DOMQLvA8whO3IFuxFESKU1UVz8xzJUjxDbHJjfgUeFOaL
X-Received: by 10.200.40.91 with SMTP id 27mr1118686qtr.135.1476976584797;
	Thu, 20 Oct 2016 08:16:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 08:16:04 -0700 (PDT)
In-Reply-To: <20161020133514.3403-1-marex@denx.de>
References: <20161020133514.3403-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 16:16:04 +0100
Message-ID: <CAJTo0LZNhqMugeFMDNPi_SYZV++F0UE-eA=FuUKv9W2308XPCQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Thu, 20 Oct 2016 15:16:24 -0000
Content-Type: multipart/alternative; boundary=001a11415868adea9c053f4d68de

--001a11415868adea9c053f4d68de
Content-Type: text/plain; charset=UTF-8

On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de> wrote:

> Upgrade U-Boot to the latest version.
>

I hope nobody objects but I squashed these for clarity.

Ross

--001a11415868adea9c053f4d68de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2016 at 14:35, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":7fu" class=3D"a3s aXjCH m157e=
25d232cd49c4">Upgrade U-Boot to the latest version.<br></div></blockquote><=
/div><br>I hope nobody objects but I squashed these for clarity.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11415868adea9c053f4d68de--
