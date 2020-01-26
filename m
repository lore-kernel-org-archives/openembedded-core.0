Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 56D5C7FF35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 23:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 485TXX0H0Nz3H;
	Mon, 27 Jan 2020 00:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1580081180;
	bh=AXnoa/Xdxwj1N2JyZkVB6RZ9MGJqw8clxrRSYsCjl40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfXN6JDsO4DNeP0p1OOSQl+2Lw1/Xwu7P3g5t6/BU3NiHGGxOTBVguyuTOvwABRh9
	c46U3c+xCzM4Z+4GmlGlEPkYPGJe8NxttOWWIDhOpv8rTfa42ir5Ts0X7hp+n1ARIM
	1QesT6AHercc2ThexI08VlmMFXAjOIKg5lPA8DDac2JtmtfSwV/5Dwm6mL7GDJs8FY
	TP06c7GIFBqLz3TbPZDDgQ1rVPIDy4XNbYjS3bbOEs6tVzUW9XCjUEuwvsGwDoVFHz
	V9w83DlPw4g/Lv+bDA6RdkKhMJ3y2tIQ8x0j38Gr2panPnyclfn5K1RzclH/ejHAUG
	3r438lGeka+9xxcwe4w/WE/PTNL3ZiHlxZuhJ8EvJX+9L4pH1+dDHvHrjvke0bZ7aQ
	aVbb2lzFI7DkaheKKpoiEnt6GV+rrwLFXOZSjtS0Baalv2TUazndUija2hbO8uh1Po
	WfBg1Cb1RKNQb4vvH0uC1esME7Siv6dR5tCqE3PeVDUI4iy71TKcHH6LYoEJgsg/OA
	RjxsNcMOd/tUF0Fdr9Ob/RbwxuDPMxUoBA3IPkrxrv+bl4EymbSSSVqJrcr3VuSJvh
	qi5JfY/OcXdMGWyoTsbECos2YtVm/WcilVS6H0Lkt+9JiOL9p++wS4senjNU3UWOG8
	YXENyipBEIi2JpUj+I0to43k=
Date: Mon, 27 Jan 2020 01:26:17 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200126232617.GD1635@localhost>
References: <cover.1580066507.git.raj.khem@gmail.com>
	<621053e890ff4f9a8bcfdea42b3cd523a5ba4181.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <621053e890ff4f9a8bcfdea42b3cd523a5ba4181.1580066507.git.raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/13] glibc: Drop fortify refactoring patch
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
X-List-Received-Date: Sun, 26 Jan 2020 23:26:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jan 26, 2020 at 11:27:44AM -0800, Khem Raj wrote:
> This helps clang to do a better job with fortify on but it is better
> suited for clang layer
>...

The patch is simply wrong.

Are you submitting a patch removing the workaround for it in gettext
or should I submit this?

cu
Adrian

