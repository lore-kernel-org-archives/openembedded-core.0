Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Sgh2S-0002hg-G9
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 20:51:00 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 18 Jun 2012 11:40:16 -0700
Received: by pbbro8 with SMTP id ro8so8424021pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 11:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=UBI97JMPouhSno2z83dBRSzgvkzSII5VsxHd93LIBy8=;
	b=olNp2fM15oS2IzCR7MFIc5qzFiuIMJ5iV9jYx5xUM1anFCFUA6G0KX8mbjZqZ177lE
	2wSuhoabf7ci3EX6dC8vj8UC1od3YwH5PRiFFbg7unMZL7S0vN6/aIhgFnVp63GvMF+D
	tXnrlz5T8dbTTSuY1ZD+V/joxBhmf4zKivwz7CxKDGLmVmqqs+L8ZNV/bIMx9zCtbXxt
	KQDExf3pmnImK/cqV+lEv2OPrywTS+tFawNmyHz/gof2J13rX1ye45KAzbiTR6T8ycII
	g74UXgN4HpYd4FPdhFKTATq2/vVuEs17QjTfiRtwBZOiryNJzqi8aPc3zGxNgiqTfuO+
	ychA==
Received: by 10.68.226.226 with SMTP id rv2mr54812658pbc.101.1340044815949;
	Mon, 18 Jun 2012 11:40:15 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id hc7sm24726591pbc.54.2012.06.18.11.40.13
	(version=SSLv3 cipher=OTHER); Mon, 18 Jun 2012 11:40:14 -0700 (PDT)
Message-ID: <4FDF7609.4010303@intel.com>
Date: Mon, 18 Jun 2012 11:40:09 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1339932526.git.anders@chargestorm.se>
In-Reply-To: <cover.1339932526.git.anders@chargestorm.se>
X-Gm-Message-State: ALoCoQlb01WLVZIKLBRzaSblKn2g6NiLgE4fT9FRq41Y7Y0G5XttBOcpROVodh8d7KDKmEKqLC9s
Subject: Re: [oe-core, for-denzil][PATCH 0/1] qt4-embedded: Reference QT_ARCH correctly in QT_CONFIG_FLAGS
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
X-List-Received-Date: Mon, 18 Jun 2012 18:51:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2012 04:31 AM, Anders Darander wrote:
> This single patch serie should be applied to master and denzil.

This is on my radar. I'm about to submit a denzil pull request now, but 
this won't be included in it until my next pull request.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


