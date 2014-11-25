Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id DC46D722EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 19:56:05 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hl2so5635856igb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 11:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RaO35BBo81VLLkdC58rFciS7UYTEzQDMe3HBFGd74eM=;
	b=J2ovdz3fUi7IUW5C+FiQqqlrekHDjxuNoYJHPSwY9nNUOkcRAVXOCFumO+cEMYcR1w
	7MA/9LN4PtaL9Ud30Y6jltqkVqVxowAOiIPiYqXRVYMGf+TYIrsVxeMgv63TpyCot3jw
	jg4K4WIRfu9OjDliQvcs9+DDDWyTj3queAL8zjXEpHX2kPUNVyeghqPn8qgOtms8m+0T
	jVtRb46Sy/ypmdbQpWmcuFjVNdG7AgLtoZeDJwp9NQ5XbtXX0gpVXEZaph942IkEnPIA
	TBAKbOyFaysETFO0IFx7zYgZJI7/5s5VV/uJEZBu9DAWdw2PB+fL027/X0KNWOuCiWKT
	kGXQ==
X-Gm-Message-State: ALoCoQmxLXCfI7DzxOfBQoxMyAlYPIWXaOblJFRDgCY/MiHPKoNd89KaMyPmBVC1eKxnHNBny1A2
X-Received: by 10.43.76.67 with SMTP id zd3mr31940107icb.42.1416945365239;
	Tue, 25 Nov 2014 11:56:05 -0800 (PST)
Received: from [192.168.141.122] (dsl-69-172-74-189.acanac.net.
	[69.172.74.189])
	by mx.google.com with ESMTPSA id zy11sm1494592igc.4.2014.11.25.11.55.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Nov 2014 11:56:04 -0800 (PST)
Message-ID: <5474DEDE.4000005@linaro.org>
Date: Tue, 25 Nov 2014 14:56:14 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 25 Nov 2014 19:56:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Wow, this is exciting!

Just thinking out loud here... is there a way to way to have the
devshell come up without having applied any patches but with the patches
already queued in, say, a quilt series?

It seems to happen often enough to me that: a recipe has 10 local
patches which applied fine yesterday but now patch 7 is failing because
the upstream developers changed something. I would be nice to be able to
devshell to the point where patch 6 has been applied and patch 7 is
waiting to go on. Then I could apply the patch myself to figure out why
it's failing. Or just having all the patches ready to apply (in a quilt
series, as mentioned above) would be great too.

