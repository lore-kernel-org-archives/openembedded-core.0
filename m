Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKWN2-0003aw-G4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:00:36 +0200
Received: by wibhj13 with SMTP id hj13so644002wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 07:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Q0+cdPxfBeO3D6UK9MWkKtWpNRPQh2Lq5cf0jgmgars=;
	b=Wsu+MWXwPIoUj4mSXLDYjUxHsUNhDrDbYBzQBH4yw1x6tdbHGW6st38UOxxEW2VlVe
	hfA7a/Y3YkWY+7KFk6obVbtNuIY4SSuqfkjZrcFK/5SDY4WbCapmG5GMle7pcaodR1Rw
	uuW4Ua+djYvpo+bsP7sHwh//3dlyN5Khfo4g6NhOU4cv2sBjy30pEzf5OjAzxOGh/Yh1
	+aqeo0QIi+Sqmmhl0yfg6PlSDE9qU/NHoIbR2cEhF5D3MZ3mHM1ipCWCKSQxNN/vG7nh
	hh1ZZmJju/BL6P9ZhF94hE5cPr1Js4Kfv9doY9+8fAcaFEtw3VB1Koylq60iPLTzKbbO
	z8CA==
Received: by 10.180.92.130 with SMTP id cm2mr7040217wib.4.1334760669050;
	Wed, 18 Apr 2012 07:51:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm56086730wib.9.2012.04.18.07.51.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 07:51:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334760467.24091.100.camel@ted>
Date: Wed, 18 Apr 2012 16:51:05 +0200
Message-Id: <B43C4C52-D1A2-45D8-9C28-8D8314B995D3@dominion.thruhere.net>
References: <1334760467.24091.100.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnmWoCdXRH2nnmREOHV7zy5hkT9tRpQSuqvZ5igJRElEJcOhbbPyRTqm2cm69/iC5g6jH5K
Subject: Re: Yocto Project 1.2 Release Status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 15:00:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 apr. 2012, om 16:47 heeft Richard Purdie het volgende geschreven:

> I thought I'd update everyone with the current 1.2 status.
> 
> I'm going to branch master for release at this point. We've fixed a lot
> of issues, I'm hoping the -rc4 build will be a good one. There are signs
> there are some more minor issues around and bugs do keep getting opened.
> These are still being investigated so we'll continue to let that happen.
> Once we have a QA report for -rc4, we'll be in a better position to make
> a call on how things are looking.
> 
> If people don't have 1.2 issues to work on, I'd like people to start
> looking at the bugs marked as 1.2.1. The reasoning here is simple, if we
> do have to go to a -rc5 and the fixes are good enough, they might make
> it into 1.2 (but no promises). We need to fix these issues in master and
> for any 1.2.1 release anyway. I'd prefer people not to start working on
> new features at this point but concentrate on improving the quality of
> the release and fixing bugs.

"The denzil is in the details" 


