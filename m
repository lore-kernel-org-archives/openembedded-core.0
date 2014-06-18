Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27C7A6FE01
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 09:45:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5I9isXG005188; Wed, 18 Jun 2014 10:44:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JB0rE3ALKPL9; Wed, 18 Jun 2014 10:44:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5I9in6E005170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 18 Jun 2014 10:44:50 +0100
Message-ID: <1403084683.2104.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nitin.a.kamble@intel.com
Date: Wed, 18 Jun 2014 10:44:43 +0100
In-Reply-To: <d85fc19225f111f9fbb686f58f8bb7814ba683af.1403071319.git.nitin.a.kamble@intel.com>
References: <cover.1403071319.git.nitin.a.kamble@intel.com>
	<d85fc19225f111f9fbb686f58f8bb7814ba683af.1403071319.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel-module-split.bbclass: fix a typo in var name
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
X-List-Received-Date: Wed, 18 Jun 2014 09:45:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-17 at 23:04 -0700, nitin.a.kamble@intel.com wrote:
> Exception: AttributeError: 'NoneType' object has no attribute 'split'
> 
> ERROR: Function failed: split_kernel_module_packages
> 
> Fixes bug:
> [Yocto #6461]

I've merged a slightly different version of this fix.

Cheers,

Richard


