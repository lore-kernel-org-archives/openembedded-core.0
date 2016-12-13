Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3DC71E47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:21:11 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id j10so17241774wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vPRQMu5s8eQ/BNyN9ued0vN32C9nsgF8EK4Hayk1ZLY=;
	b=DbElNsCpl7iIJ2TdZG4pR683PGG7Qu5JKIy6cbjunqVEjSobnykLKN3z36plMdwFoc
	hok0m7/MCDcK7uzEdah81XgSWdQfwxQiaG2IWja4mE5eGifIMSI/jMkRW/QYY4On7ctp
	2Lf/Y5B1fE4tUK/W85i2D1n4uHXhh7a40XsAYBiUBX/PRb2I7ByuM2BTinkcqj+2oP2E
	H0JcpedRl3oAYCP1sFCwe60r4P2hQa89RFMCIDks3BYm/UY3KP4FHPYHThqNxGH51d/Q
	DDJCEXPavk2z2Qcw7jP0CctgVCJBOGz9cR+J3iiuXcEVx0SJpD9DAyX4JDQiXEWDq0Ol
	Nezw==
X-Gm-Message-State: AKaTC03QHqwuz+MyIqVWPo4q0mV6T4X7sIODepB3a3C2jiO9YD0TEnZfi9QvUZuWU+BzRA==
X-Received: by 10.194.105.228 with SMTP id gp4mr65681470wjb.208.1481646072635; 
	Tue, 13 Dec 2016 08:21:12 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k11sm3297248wmb.18.2016.12.13.08.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Dec 2016 08:21:11 -0800 (PST)
Message-ID: <1481646065.27847.2.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 16:21:05 +0000
In-Reply-To: <CAJTo0LaChfpCDnbs8hAHLzCHS3wb3Wbu3Ak99YPDDvUZjDGGRg@mail.gmail.com>
References: <20161212154016.1076-1-git@andred.net>
	<CAJTo0LaChfpCDnbs8hAHLzCHS3wb3Wbu3Ak99YPDDvUZjDGGRg@mail.gmail.com>
X-Mailer: Evolution 3.22.2-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: allow libiproute to handle table ids larger than 255
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
X-List-Received-Date: Tue, 13 Dec 2016 16:21:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Ross,

On Tue, 2016-12-13 at 08:40 +0000, Burton, Ross wrote:
> On 12 December 2016 at 15:40, André Draszik <git@andred.net> wrote:
> 
> > ++              printf("table %s ", rtnl_rttable_n2a(tid));
> > 
> 
> Sorry but this doesn't build here:
> 
> > networking/libiproute/lib.a(iproute.o): In function `print_route':
> > 
> 
> /usr/src/debug/busybox/1.24.1-r0/busybox-
> 1.24.1/networking/libiproute/iproute.c:294:
> undefined reference to `rtnl_rttable_n2a'
> 
> Ross

Should be fixed in v2.


Cheers,
Andre'


