Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9F20-0002MJ-B3
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Mar 2012 13:16:16 +0100
Received: by wibhj13 with SMTP id hj13so2400143wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2012 05:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=qqQ4aNvgxKVJuOhsfSty7mA3AFaaBQ/s/0y7yITlrZg=;
	b=JqNd9Cz5wzoBYP4hlLl5tc07P5LaUWasGa+4H4yYQvl8xS2yjAY9Dhy4lhXHN//Ucv
	hCeATmPCE8JWjlkqv9WLxciAdWyNtShh8znfxeGPKuYDRJQ3MNr1I5MjmghEPA3PQJra
	2C69geXN8Ap98daMsglvIKCAep6DxAbaSyyHLyaS7FdD/l36A/kgTWtrYOQcQFd0x61H
	r4sc1G0p9LcvDjDNZG7cHBLg8ZEYjnaL7YK2y1Vd7TAjVYzEaW2qY1PfdUkEK4ejNq4B
	okwarrjaaCF8NuGe4B8gXKLDFvDB4D71rZodcX8ewsG2y/pRvVMnOYIXaUJIbNgPTC+Q
	G+ew==
Received: by 10.216.137.27 with SMTP id x27mr5199094wei.70.1332072446424;
	Sun, 18 Mar 2012 05:07:26 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm16162260wib.1.2012.03.18.05.07.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 05:07:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCE1B13@SHSMSX102.ccr.corp.intel.com>
Date: Sun, 18 Mar 2012 13:07:17 +0100
Message-Id: <2743E261-B779-4666-9370-B44D582E24BA@dominion.thruhere.net>
References: <cover.1332049148.git.dexuan.cui@intel.com>
	<401c27ba4e7f8b5bc0da084cd48d1738157c894b.1332049148.git.dexuan.cui@intel.com>
	<84AFADF8-9F03-46C2-80EE-F9CDEE8991CF@dominion.thruhere.net>
	<A25F549E4D43CD42B4C02DF47A1913230FCE1B13@SHSMSX102.ccr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQm9LFhOQgmQOcnFvHp75dOELvfdJPKvzUJUUbcBWKGJ369Fs0VNZh8JO74xBWtyTOQ+yaGL
Subject: Re: [PATCH 1/1] self-hosted-image: pre-populate the	builder user with poky source
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
X-List-Received-Date: Sun, 18 Mar 2012 12:16:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 mrt. 2012, om 10:52 heeft Cui, Dexuan het volgende geschreven:

> Koen Kooi wrote on 2012-03-18:
>> 
>> Op 18 mrt. 2012, om 06:41 heeft Dexuan Cui het volgende geschreven:
>> 
>>> [YOCTO #2065]
>> 
>> What does that mean?
> Sorry, I should have made it more clear. :-) 
> 
> It means bug 2065 is addressed by the patch:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2065

So add that and (part of) the bug description into the commit message


