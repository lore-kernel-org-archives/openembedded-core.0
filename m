Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAiiZ-0005Ib-Sc
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:15:18 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so666801veb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=FhPZHCm6OM/k1HL+GHrGxYbftUURjYbKnUil60urnm0=;
	b=P3jqtwmjpUaT7WQnppCfxxfpEgwcCzZ/WHu41nOZbPHpDRwvKLHAQQ7MNAiVCYU0Pe
	l0mfepChnSVmW3g/rCdohd0IUY8lXRqOlOhQ2PLBBPyWIzbwLLpTv6nuWQG3LxxQAkM+
	6CNR4dgICxiOQT8Ty7ouxdewfoU5/JCl1UjG6lepI433sLZvy0TC7ima92IsiFn0XPZm
	7lduw5BIR+kxAUdCKCTzhZpldlnjPgv5d4mict1chGqPVpaZTkT/up9sbKHeEoEMaICi
	TUU2LCCrXPi9uGZQwQwOvcI8rXLgpFIbGljELRRFvwREpH9W6Nvm8GocvL5Ou+b5or7E
	poiA==
X-Received: by 10.220.149.198 with SMTP id u6mr951878vcv.52.1361977110895;
	Wed, 27 Feb 2013 06:58:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 06:58:10 -0800 (PST)
In-Reply-To: <1361976102.1809.5.camel@rrMBP>
References: <cover.1361974597.git.ross.burton@intel.com>
	<6eb9f87bd871b294ec0bef6744bd71a651ff8d10.1361974597.git.ross.burton@intel.com>
	<1361976102.1809.5.camel@rrMBP>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 14:58:10 +0000
Message-ID: <CAJTo0Lam-zSe5ZcNZSvyFdQxSLM9kGRBePjCOUOnR+PttAbNVQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlw1qxFbUiVT7M5CfP+mzki+Kv68YSD6hdfhIaML9F+6aiLhuDTlikc55QCZ4cRsk/ZUX4r
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] systemd: make xz support (compressed journal) optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 15:15:22 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2013 14:41, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Your commit fails to mention that you are changing the default to off,
> it is on now.

That's true.  I'm actually dithering on this now, and will probably
flip it back to enabled by default but still an option for people who
want to prune dependencies.

Ross


