Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCEB60236
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 10:18:11 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id f79-v6so1797220oib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BtstBjKBCsupUE07knjXEB2xp5EU5AnltFI/zdTPAj4=;
	b=YO4VyvokE6IUE6SzNWZB3KeS3ASbg/xQZATRVYFfuFFOB6SGObuIceXiDfD7m3aJXp
	vhC1EGI6JO9yTxe/W/U666mJlngAJPOmTqsRfVIY7Eys4Qvki1iCEuCunMuAfEh9VI+Z
	yJ0WL7i1wRjWCrpbmGsdV5Ti9hIDBr9BsGNF23b8oZKsfoRplAoYxoXQj0tEOUTWjux7
	CMcAMyYZRA+Ni/hBdO+IfHh9t9EhWIkM4w4eFMCTWbDCjTRMlqhBDmpNS3STHM35pReI
	W0wvEJCKNepiP3RIuZgatNhIBO663AQAoAYF9IgICwKPaB2vy04s/s0+p7M0Ywyvd9NT
	7Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BtstBjKBCsupUE07knjXEB2xp5EU5AnltFI/zdTPAj4=;
	b=c84EJMH20ZhQtz9pDCzKiWCoOZ5OVGg3A6c7IN3FsCyH2TJFEVqaI2BqwcDLrk/4xi
	bGrHIVNLAZzVC5yT7GT2yVE1s5bAwZNh7aSqeh7WtzhSPVDb0T7WXkru7bTldKYc6iyo
	8DnFlbXOXKbLJEBteEfg6oJGTQBf2gr/poth0srgSI9A8AFCSoFoDUxZSSZaZaZazNKP
	eZo9LOn42+ZHgcB1evF5xapNWCT8mbWim9nAIp2wzlH89QrgKg7ok3QWv6DGPuRclhll
	dkaqHHk5Y008Xvwojp9J4dpVWEfz9vyaGeOdw2cvu0hDJcv7lbFLyOpFcbYaNEyZkzbr
	KyBg==
X-Gm-Message-State: APt69E2DaeHGWeCUevkqLGmTdJJZicA1PV0bVc6lM9guP86ySF1wiNCh
	i7+uSk4K/XdoneQMr8ahhGO8+X+SMQsCXNlDEbKCGw==
X-Google-Smtp-Source: ADUXVKL0A1LuP8dPeszzkrhuL0vBloi0z3UiBkQUXW9K5H2/ImV8MYI/IJr3TtUextOa7LS8KRHdZeSjZN+AEa8YTIs=
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr4265482oig.102.1528885091178; 
	Wed, 13 Jun 2018 03:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 03:17:50
	-0700 (PDT)
In-Reply-To: <108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-6-git-send-email-akuster@mvista.com>
	<CAJTo0LbV4mAKK1drQ-LcgsrL8JC_MmYrqhYmM1QPGhJRSx+cPw@mail.gmail.com>
	<62741663-6b5c-c4d3-6376-2e5ffe8e197c@gmail.com>
	<108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2018 11:17:50 +0100
Message-ID: <CAJTo0LaPJpw3ggxcS+Ev18bTVg7ZGxHKJxNE2PLT-vxgPLeOsQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
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
X-List-Received-Date: Wed, 13 Jun 2018 10:18:11 -0000
Content-Type: text/plain; charset="UTF-8"

On 1 June 2018 at 16:15, akuster808 <akuster808@gmail.com> wrote:
>>> - xf86-video-intel (was DRI1 removed or disabled in 1.20?)
> DRI 1 is still there.
>
>>> - xf86-input-mouse
> sent fixed for xf86-inout-mount
>
>>> - xf86-video-omapfb
>> hmm, will double check

Tried it again last night:

omapfb: http://errors.yoctoproject.org/Errors/Details/179606/
intel: http://errors.yoctoproject.org/Errors/Details/179607/

Ross

