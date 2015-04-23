Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 161346AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N8Eo7Q025668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 01:14:50 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 23 Apr 2015 01:14:49 -0700
Message-ID: <5538AA00.8060706@windriver.com>
Date: Thu, 23 Apr 2015 16:14:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.236]
Subject: update-alternatives setting problem in OE
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
X-List-Received-Date: Thu, 23 Apr 2015 08:14:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

In OE, we have three providers for update-alternatives, dpkg, opkg-utils 
and chkconfig.
We default to use the following setting in default-providers.inc.

PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"

The problem here is that *the above setting seems to be the only valid 
setting in OE*.
If we change the provider, things don't build.
If we change the VIRTUAL-RUNTIME_update-alternatives setting, runtime 
behaviours for 'update-alternatives' are not correct. Because there 
three different update-alternatives use different databases.

I'm sending out this email to see if anyone ever encounters the same 
problem.
I also checked the ref manual of Yocto, no related information or 
warnings there.

Best Regards,
Chen Qi

