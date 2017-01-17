Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id BA22C62134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 12:16:20 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id v23so153285254qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 04:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hkTc4sSxyBtplTJAm8so/Xkz3iebiODHbXMtjFYvWic=;
	b=HTEiU9xYTwhaD2fl0Qb8JDBjhhUmk0O82UZWv3Facc8THfPcwRYCYTHtyTnxH3XXqF
	x7tIeim/qxMYUQXh6SwxRC6ZxYNHc8kJVWbHtZkRHSknpcQmu8+FYKcgiyMwYr6IFzUt
	pyZjkHmF0n/+riySflaSljK9iywg+ao+0VwnxGOPLsM/YVWneeZdyxafmMstp0t3+y1a
	DleYSpsX4kLAHOQXbldRwm7o1AKYtTvesXu89wbuiZnGiNYQOZx1Hh0jSXxt2DcVRGbP
	kUJ9vlvRUb4csIcU7hzk8nxaTnyEY/JMNQ1mZAIkFKqM1WYcnBwZS5nSdSXPCE/ztN/g
	W4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hkTc4sSxyBtplTJAm8so/Xkz3iebiODHbXMtjFYvWic=;
	b=E1JUEvf+aICH4oynAtSH9kKj8JEK41toPgA0H74OOV1dBlHaT8X4eIclO2WqrqYjlh
	YMM+ZvxIKFQYjhfg0L0Zdey/NCPajAbM4UMF5ggDkwEiJ0TG8n413/kGgNrE0DasCceJ
	sOHh2jbk6sqtAi1iKWpGHZlOMhlmcwtqUn414OjI9JCsgszZbezymH68IFd5aAgkg9jL
	4HjlbsJoKvRBXl4c598Q62/04iJOgh4OhAfmrkLOQ9msX3iBYFzpkW8k1MwnSEpdhLwi
	c0HseIYKiG8vdprwSwJo2vozILSiNbDc297apG6zZlZDsNSmx6pI7/fJTw6HVvwM45zr
	FFAw==
X-Gm-Message-State: AIkVDXLUj8dIAiZ2pa9Lzq2J7VpFUw9IOhueAhMjiFYd7FMfS6A2VKqoMbJ3FlzugedgbwYSDpbewt7iwtrXinuh
X-Received: by 10.237.62.232 with SMTP id o37mr32195791qtf.188.1484655380418; 
	Tue, 17 Jan 2017 04:16:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 04:15:59 -0800 (PST)
In-Reply-To: <8bce3503-07a2-d37f-0f3f-e71524058ef0@linux.intel.com>
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
	<587CF82F.9090207@linux.intel.com>
	<CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
	<587D3E59.30206@linux.intel.com>
	<8bce3503-07a2-d37f-0f3f-e71524058ef0@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jan 2017 12:15:59 +0000
Message-ID: <CAJTo0LYn5kaTYtJ35Kj7KwXLOKNt1X=3Cp1kQnDua0GCNp7ODQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Tue, 17 Jan 2017 12:16:28 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e9065fe05464944eb

--001a11406f0e9065fe05464944eb
Content-Type: text/plain; charset=UTF-8

On 17 January 2017 at 12:04, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> If this isn't fixed in reasonable time, we should probably disable qemu
> usermode on ppc - unfortunate, but that's the deal with using it for
> anything.
>

I consider that a backup position, stalling the upgrade to see if upstream
can fix it is preferable.

Ross

--001a11406f0e9065fe05464944eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2017 at 12:04, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":1a0" class=3D"a3s aXjCH m159ac5103204a810">If this isn&#39=
;t fixed in reasonable time, we should probably disable qemu usermode on pp=
c - unfortunate, but that&#39;s the deal with using it for anything.<br></d=
iv></blockquote></div><br></div><div class=3D"gmail_extra">I consider that =
a backup position, stalling the upgrade to see if upstream can fix it is pr=
eferable.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a11406f0e9065fe05464944eb--
