Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHnBG-0003mQ-Gh
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 04:21:10 +0200
Received: by wgbdr12 with SMTP id dr12so311225wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 19:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=p/0kgCaGygNaZa4IsrS8Flu3lvCqhnAtfQK4cm0XEeM=;
	b=OHlBjeoDvC1RFQQ54rq5GQbSys4W1efwRx8yNnjHefA9pEZQJXd0TCS98cTY+gzAVr
	RqyUDhvhabi8hG9sEr++UlLve+nf7ILaiz1hZowcvcx0Q6vV80Gv3668xQZEOSLDgf4y
	PtpDz4plGY1MF2pO9zMmQK0F9oVOSd10+YUEPM6xO70YIZdfkZrwMh4Dm59Z+XeiCNd/
	1kGwucxM2yVj+4g8Un++MDimUjiOziCt/3/DRF7wNRTpIgxT2ArQHQPDaWfiEiSQGrWw
	+JKVUNGgZmgZvQwnpEXbVJqt8vg7UjhdTnJGLWvBoxyR+pELQ0v1+BpgL+704FqzUl1l
	bHKA==
Received: by 10.180.78.40 with SMTP id y8mr2227482wiw.15.1334110312101;
	Tue, 10 Apr 2012 19:11:52 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm41606741wib.4.2012.04.10.19.11.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 19:11:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <ad12e7da22c3eb883b621adc78cea8e2c755739f.1334107957.git.sgw@linux.intel.com>
Date: Wed, 11 Apr 2012 04:11:50 +0200
Message-Id: <93AC0EA6-8807-4A56-B55A-E7CA0C67B09F@dominion.thruhere.net>
References: <cover.1334107957.git.sgw@linux.intel.com>
	<ad12e7da22c3eb883b621adc78cea8e2c755739f.1334107957.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmW7uPvX7VuSjbh41YvvxaEXABkD0/6cVGselS7MovzHNM+eQ2YXuzelbppspVIh3RsXCme
Subject: Re: [CONSOLIDATED PULL (for RC3) 5/5] tclibc-eglibc.inc: make locale packages dependency conditional
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
X-List-Received-Date: Wed, 11 Apr 2012 02:21:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 11 apr. 2012, om 03:33 heeft Saul Wold het volgende geschreven:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Only add locale package dependencies if the eglibc is configured
> with locale support.
>  This avoids dependencies issues for distros such as poky-tiny

That's a packaging change and hence needs a PR bump.


