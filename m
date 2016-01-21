Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 978BD731C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:58:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0LMwkaI022294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 14:58:46 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 14:58:45 -0800
To: <rongqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1453255296-6863-1-git-send-email-rongqing.li@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56A162A5.1000802@windriver.com>
Date: Thu, 21 Jan 2016 17:58:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453255296-6863-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCH] watchdog: enable systemd support
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
X-List-Received-Date: Thu, 21 Jan 2016 22:58:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-01-19 09:01 PM, rongqing.li@windriver.com wrote:
> 1. inherit systemd, and add two unit files which are from Fedora 23

Fine.
> 2. auto load soft dog kernel module

I haven't used a hardware watchdog for a while. Does softdog
abstract that away so that it's hidden by the BSP? If not,
can a user ditch the softdog for a hardware watchdog? Does that
over-ride process need to be documented?


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

