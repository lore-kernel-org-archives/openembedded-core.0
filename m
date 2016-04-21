Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D289C70101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 07:22:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3L7MI0Y018899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 00:22:18 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 00:22:17 -0700
To: oe-core <openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57187FA8.5050804@windriver.com>
Date: Thu, 21 Apr 2016 15:22:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: About PV = "0.0+git${SRCPV}"
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
X-List-Received-Date: Thu, 21 Apr 2016 07:22:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


There are several recipes in oe-core which has:
PV = "0.0+git${SRCPV}"

These recipes don't have a release version, so we use "0.0+git${SRCPV}",
but the package manager such as opkg/rpm/smart may not upgrade them
correctly when the recipes is upgraded since we can't make sure that
SRCPV_new > SRCPV_old.

How about we use date for these recipes which doesn't have a release
version? For example, if we integrate them to oe-core today, then
PV = "20160421". And when we upgrade them in the future, we can change
the PV to that day. We can change all the current version 0.0 target
recipes to today, and add a sanity check for version 0.0.

-- 
Thanks

Robert

