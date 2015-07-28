Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 235A7761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:20:29 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so72098618pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=v+/MFTgQ5OVbgZP9dEIPt8gC5dUPaFJVqAJwGt0tEW4=;
	b=RLtw1tkKQJ4HmJ/jBrmrQzdgu1pRUM7dw39GAgVLFxoW/d38H74Tk6B/45k6vP7wqj
	+CsGnZWkKiR0dyuZOQrpKNCwx9tuWRe89koWsAJc3x1b/olnplySLDB0MSAo9vRY3FjM
	OVTp3Tju+1uT013g/RGFSF+dbOfT+c+0Tzm+d4pH029ajqUsG97ixf7Pm0P6ECAJlniU
	xOpqoFyBx2iWP9dX8YEjydB6h7iOcyyc24B/nAPF0AmKqBgx2uo4khNfpAmylxCaolW3
	/PFROw+mEwFvNCFuOfnZl8ZCOGDIc5flA2pf4FEvfH99ccgS/jWlJG7KM4wqZSKvbkAq
	I8dw==
X-Gm-Message-State: ALoCoQkVq1yWYWSqlUGtZvfbM5G3/CRQ4jTUbWBxvM+SGFYVHWjGo5Hv/sfx71V6UsIP6Ck9JxIp
X-Received: by 10.70.42.134 with SMTP id o6mr80575661pdl.11.1438089629713;
	Tue, 28 Jul 2015 06:20:29 -0700 (PDT)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	bx13sm25290111pac.7.2015.07.28.06.20.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 06:20:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so69969496pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:20:27 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.101.9 with SMTP id fc9mr79895341pab.37.1438089627267;
	Tue, 28 Jul 2015 06:20:27 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Tue, 28 Jul 2015 06:20:27 -0700 (PDT)
In-Reply-To: <55B77F09.8090008@pseudoterminal.org>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
	<1438106291-14986-2-git-send-email-b54851@freescale.com>
	<55B77F09.8090008@pseudoterminal.org>
Date: Tue, 28 Jul 2015 10:20:27 -0300
Message-ID: <CAP9ODKr9xu+hUb9FCiBT5CMjWMrPADeBK6DOhmfXYAgL6p9JeA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky v3][PATCH 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Tue, 28 Jul 2015 13:20:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 10:09 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Change Upstream-Status to Accepted, since it is marked as fixed in bugzilla.

Backport and please add the version it has been included to ease upgrade.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

