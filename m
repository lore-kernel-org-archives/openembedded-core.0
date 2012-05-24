Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfzY-0008Pg-61
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:54:46 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga09.intel.com with ESMTP/TLS/RC4-MD5; 24 May 2012 14:44:01 -0700
Received: by dano14 with SMTP id o14so306547dan.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 14:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=pZ0akxdwhcig0kYX816lkNpXR3kBqoq8SzdyJN6NrCo=;
	b=Yz4JcSiaKIvFEa489Hm9gBSXmjTYxAry38qLkDEDNnPobsCGpCSgnhjqg9Yd9qAdAW
	R4vVlGgWlh132yvYWgmEJvFaR+gSMI+NHn5Uu7GtAeDfz69ydF8a/bcadDRKr1+fPOZ6
	fQojam9ZwOl6JnKWKCkNu4aQI61wHnYMIhcGjMsKtMf3AfJIufS6sgJTKJfJl4/iK/SP
	Gkl2tuZBAUcRfTU+nzJkPSJqubyYAYUZyRbUtvx0uztClVroU5TF+Lx6l1wH8BV/EPDL
	9x/F++O0Vg3Pz6wbFQmEBBSzmS+JiDj6aSDJ9BoYEk5gDztX577sAh14549RZ+XqRHua
	l+dQ==
Received: by 10.68.200.9 with SMTP id jo9mr24907147pbc.122.1337895841149;
	Thu, 24 May 2012 14:44:01 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id jv6sm6675600pbc.40.2012.05.24.14.43.58
	(version=SSLv3 cipher=OTHER); Thu, 24 May 2012 14:44:00 -0700 (PDT)
Message-ID: <4FBEAB97.6010209@intel.com>
Date: Thu, 24 May 2012 14:43:51 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQn1ufyA4hN8/7IffjDFT7ypw2rgcesBOw0q8XP+cG9Bg8mzC9qWknxTshnVx18m6jZW9V9B
Subject: Re: [PATCH 00/32] denzil pull request
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
X-List-Received-Date: Thu, 24 May 2012 21:54:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 02:38 PM, Scott Garman wrote:
> Hello,
>
> This is the first pull request for the oe-core denzil branch, based on
> a set of commits I've been testing from my sgarman/denzil-next branch.
>
> These commits have passed an array of build and runtime tests,
> including the following nightly build:

I should qualify this by mentioning that the branch that received the 
testing was my poky-based branch, which does have additional commits.

> http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462
>
> a non-gplv3 build:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/70
>
> and a tiny build:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/47
>
> Please give this pull request a few days to receive feedback and ACKs
> from the community.
>
> Thanks,
>
> Scott


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


