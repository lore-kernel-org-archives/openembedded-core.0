Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC5F7198D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 07:22:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9U7MVXl024304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 30 Oct 2017 00:22:31 -0700
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 30 Oct 2017 00:22:23 -0700
To: OE-core <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <63a935be-505f-c2e9-8ccf-ea5079123098@windriver.com>
Date: Mon, 30 Oct 2017 15:21:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.155]
Subject: avahi 0.7 : should we need to package /run directory or delete it?
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
X-List-Received-Date: Mon, 30 Oct 2017 07:22:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ross

The new version of avahi 0.7 use /run directory to place some run-time 
variable data,

not /var/run, should we need to package it or delete it?

Thanks!

Dengke


