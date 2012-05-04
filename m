Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SQN8W-0005Gy-A3
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 20:21:48 +0200
Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 May 2012 11:11:47 -0700
Received: by dadv2 with SMTP id v2so4395047dad.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 11:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=8RdbgM9JHDlfGplU3GkbJeKTG/ydbIV4b1J5Jzz7esE=;
	b=Y72eZyBJUMvqoMMhQx2EWTnx0JZlLLijH/WJBMySQ6PFcAuVsVwufFtsWlXNCvIb9j
	09V66IX17cf8In7HNwvh2pDwapQrLLc6Aj6jb7VZIraeZ85IQ7/PVO6Ms3xlWJi/PAlk
	WbfZ66C08OwJM8F/jOz39hpECcemkWGJqL/KV3a7fJDjb9yiqEZDJl5cGIup2BtTdxiu
	o3ZDfr6qTCzI0H1X75Zgp13PqQyNWPFF/LS+QHZGwq9RXilna8zsaADZf3DkxrLCqmbm
	oA3VphITnCnT0bOI+4xLugYctFiv0KYMu6lg/Pj9bVVbP0yvD9B6UTgMXmaRBhIZ5dc9
	QSFg==
Received: by 10.68.238.69 with SMTP id vi5mr3408232pbc.90.1336155107431;
	Fri, 04 May 2012 11:11:47 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id qt3sm9275793pbb.52.2012.05.04.11.11.45
	(version=SSLv3 cipher=OTHER); Fri, 04 May 2012 11:11:46 -0700 (PDT)
Message-ID: <4FA41BE7.9010208@intel.com>
Date: Fri, 04 May 2012 11:11:51 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335944480.git.edwin.zhai@intel.com>
	<1555a6151b58fb142606f7e6cda23f0c95ac0c87.1335944480.git.edwin.zhai@intel.com>
In-Reply-To: <1555a6151b58fb142606f7e6cda23f0c95ac0c87.1335944480.git.edwin.zhai@intel.com>
X-Gm-Message-State: ALoCoQnnPQXqM390NlbCp0cmTrQQs9EUbFS1M/mtGWn35e4wrIiegL/rkA3zODyRIR/HVtguXNXX
Subject: Re: [poky] [PATCH 1/1] pango: Fix modules load failure in multilib environment
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
X-List-Received-Date: Fri, 04 May 2012 18:21:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 12:43 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Multi-libs of Pango need different modules, thus different config files and
> utils. This patch separate config file and utils into different directory to
> avoid conflict.
>
> [YOCTO #2356] got fixed.
>
> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>

This wasn't poky-specific, so I am replying to the oe-core ML.

Merged to denzil-next, thanks!

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


