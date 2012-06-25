Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SjBVo-0005vg-MC
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 17:47:36 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga09.intel.com with ESMTP/TLS/RC4-MD5; 25 Jun 2012 08:36:44 -0700
Received: by dano14 with SMTP id o14so5366455dan.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 08:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Lt8pSMD5/sgGmF+/S8QKtJeAx5Qd0v/QUvyoZ31SRAc=;
	b=m5UOZYzdL6buwp1n8PUq2DuFt7L6Hqfw9kvKYUVZcxN6gv7aqva95bZd6FbiC9fh0E
	fHwf342e4t6l5M8LtoGZzjfB2BjDtO1bLnORemxW0J+SWcV7Ko36hLixx4T6jhujrKt3
	+vSVwzULNsB9Qikn7uxXHQouTcOzcvrPQncVQP4+xyJQURwS7vexSc8iL5r3P2tGSxRF
	IsOfCIrYJrd7SC70xNEk0KEGiBtmRP9PSjmIH+lyvva+qFGh8M9lLbQNRJ6ANuVFpoa5
	O9D0opPFzNOQ0Avx+NILW4FHmBzvE0EwV3Aev4U4qS2z9fdA7W4WPr/CFcDoMC9RV9vr
	Nh4g==
Received: by 10.68.200.98 with SMTP id jr2mr41432218pbc.81.1340638603849;
	Mon, 25 Jun 2012 08:36:43 -0700 (PDT)
Received: from [10.1.10.192] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id wf7sm8834405pbc.34.2012.06.25.08.36.41
	(version=SSLv3 cipher=OTHER); Mon, 25 Jun 2012 08:36:42 -0700 (PDT)
Message-ID: <4FE88588.2040703@intel.com>
Date: Mon, 25 Jun 2012 08:36:40 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1340385690.git.scott.a.garman@intel.com>
	<014ba0776261691704af5c05b4a6bac66590adf6.1340385690.git.scott.a.garman@intel.com>
	<4FE54C99.4040602@linux.intel.com>
In-Reply-To: <4FE54C99.4040602@linux.intel.com>
X-Gm-Message-State: ALoCoQnV9mJolj5PbntZ/5tYQUH39wFNVM/fq5VkXBcTdNZkUZ4JYIp6TJ9yvRhPVPCzi20y45eQ
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gzip: upgrade to 1.5
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
X-List-Received-Date: Mon, 25 Jun 2012 15:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 09:56 PM, Saul Wold wrote:
> On 06/22/2012 10:25 AM, Scott Garman wrote:
>> LIC_FILES_CHKSUM updated due to trivial copyright date change.
>>
>> Use new update-alternatives syntax.
>>
>
> I think you also need an update to PREFERRED_VERSION for gzip-native in
> tcmode-default.inc, not sure why I missed this earlier.

Ah, I missed that. I've pushed an additional commit to my pull request 
branch to address this:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=sgarman/recipe-upgrades-oe&id=c42d223d572eb25f3296452a64461985df20ddcf

The reason I missed it was for "trivial" recipe upgrades like this I was 
bitbake'ing the individual recipes themselves for each architecture, not 
full images. I'll try to include at least one image when doing build 
tests in the future, although something like sato is what ends up making 
these build tests take forever.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




