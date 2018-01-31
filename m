Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC8A378866
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 08:25:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0V8PxRC002244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jan 2018 00:25:59 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 00:25:53 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<ec85ad1d59af3b628e885b63624f611affbfeb5e.1517383469.git.hongxu.jia@windriver.com>
	<b9238af1-23a0-4e71-3188-c0be9f92e9f9@linux.intel.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <b96c9baf-4817-52a5-bb22-ba10f4e553f9@windriver.com>
Date: Wed, 31 Jan 2018 16:29:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <b9238af1-23a0-4e71-3188-c0be9f92e9f9@linux.intel.com>
Subject: Re: [PATCH 2/7] pigz: 2.3.4 -> 2.4
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
X-List-Received-Date: Wed, 31 Jan 2018 08:25:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年01月31日 16:14, Alexander Kanavin wrote:
> On 01/31/2018 09:48 AM, Hongxu Jia wrote:
>> -LIC_FILES_CHKSUM = 
>> "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
>> +LIC_FILES_CHKSUM = 
>> "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
>
> Please explain what changed here?
>

No change, only version bump up

https://github.com/madler/pigz/commit/fe822cb435622c43f491013da77b127e9fe851a9

commit fe822cb435622c43f491013da77b127e9fe851a9
Author: Mark Adler <zlib@madler.net>
Date:   Tue Dec 26 20:53:01 2017 -0800

     pigz version 2.4

diff --git a/pigz.c b/pigz.c
index 04b5431..bbbfd2c 100644
--- a/pigz.c
+++ b/pigz.c
@@ -1,6 +1,6 @@
  /* pigz.c -- parallel implementation of gzip
   * Copyright (C) 2007-2017 Mark Adler
- * Version 2.3.5  xx Dec 2017  Mark Adler
+ * Version 2.4  26 Dec 2017  Mark Adler


//Hongxu

> Alex



