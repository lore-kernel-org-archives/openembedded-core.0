Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id B089178205
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:48:05 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id p189so17568658lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=4t/xH3gu0MJmpxu6CyLrBrvmDCPB4Mx6fWbsNI1KtGo=;
	b=kL02WkPwE9yShF4WuKxthAiyC9OGsixojRM1p1iGX5lrxitFYKwG55b+rxSzA269mL
	xwmsQe81WWpsSQedG4RaFanfstYz9KEjvK8Awab1R4sxW4c62BuquTfdFTDvkmafsWFp
	N/1MJP9BCizHDOwXO1xNzZYNYReiw9tavf0w5bmlJFPpyP8WhuUaKKqZxVs5QZgvG1Zm
	oCbrVrdRiQO4uj5gsApvJ8NPzeHIpM2jI3zLfMZZLTOy2PW+wU9OM4/PvB8RLmSI+WYF
	rXxR5i0cdhdkKXkgNRnDvwwzkgl1t4GGp+9UEU9S0GPbczkhxqSG27vv6wUFVHvtR8qa
	kSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=4t/xH3gu0MJmpxu6CyLrBrvmDCPB4Mx6fWbsNI1KtGo=;
	b=g52eX8cuQa85XjdlJTLof5hcWpJaluia4peOXjZDfv+HBt4RJ5GDgGHI3Gg2aACUQW
	TxN8+AlCsr+pK8wwDSwbZDcImo+ddF/hQk6+ssrdXW9yDZDN71BMwkpiwya7KKMRx8KO
	M4V9eUSv+1vzN2AFcSt0psFp7z+261eDQLJuB9oTodGIf774cAtGHHeu/xDiZdhGe/pS
	Ufy4ka9fWraR5z9C1k0YVtHyoixWw4mdJho2Y5mpRouH09WV9YkiwAdDUKcuIQn4n7rG
	tUU/NMpO0+IA8TmubOH/zlgtjXt26ipHyzPMB48vQWnKI5g+SqMCNC86/ztaPAgAkaSq
	GKnQ==
X-Gm-Message-State: AODbwcA09l/m3bPGIqT+q7qfjmqVNKqJZoU0FSrOLXCmkj7BfM3W7c/9
	kOlHscYFOzpsHoHXpIgPZg==
X-Received: by 10.25.35.81 with SMTP id j78mr4156440lfj.27.1496926086128;
	Thu, 08 Jun 2017 05:48:06 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	u125sm1008449lff.35.2017.06.08.05.48.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Jun 2017 05:48:05 -0700 (PDT)
Date: Thu, 8 Jun 2017 14:48:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20170608124803.a3g4wsh4jutuwkin@ad.chargestorm.se>
Mail-Followup-To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1496208185-25064-1-git-send-email-B40290@freescale.com>
	<1496208185-25064-2-git-send-email-B40290@freescale.com>
	<DB5PR0401MB1848C9E9F46D0EF94651E4A384CA0@DB5PR0401MB1848.eurprd04.prod.outlook.com>
	<DB5PR0401MB1848324A568C76F387DD179784CB0@DB5PR0401MB1848.eurprd04.prod.outlook.com>
	<DB5PR0401MB18483AC47747903C98EDC46484C90@DB5PR0401MB1848.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB5PR0401MB18483AC47747903C98EDC46484C90@DB5PR0401MB1848.eurprd04.prod.outlook.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Subject: Re: [PATCH V2 2/3] kernel-fitimage: set replacementtype to vmlinux
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
X-List-Received-Date: Thu, 08 Jun 2017 12:48:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,


* C.R. Guo <chunrong.guo@nxp.com> [170608 11:44]:
> Can you apply these patches?

No, I can't.


> -----Original Message-----
> From: C.R. Guo [mailto:chunrong.guo@nxp.com] 
> Sent: Tuesday, June 06, 2017 4:05 PM

Besides, wait a little longer for feedback / merging, before you start
to send reminders. Everyone has lots of other things to do.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

