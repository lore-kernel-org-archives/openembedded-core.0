Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89176771B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:31:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w84JV7wp009267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 12:31:08 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 12:31:06 -0700
To: Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180830155702.21700-1-andrej.valek@siemens.com>
	<d3d2454e-72d5-bf4d-351a-7ed1efe1a7f4@siemens.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fe5d1e09-7923-61e7-9bab-6238de83de8e@windriver.com>
Date: Tue, 4 Sep 2018 15:31:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d3d2454e-72d5-bf4d-351a-7ed1efe1a7f4@siemens.com>
X-Originating-IP: [172.25.44.4]
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH] busybox: update to 1.29.2
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
X-List-Received-Date: Tue, 04 Sep 2018 19:31:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

We really want to get this change merged this week so
that it's part of the 2.6-M3 content that will be well tested.

On 08/31/2018 03:42 AM, Andrej Valek wrote:
> I had some network problems.
> 
> This patch could be ignored, because, it's same as
> http://lists.openembedded.org/pipermail/openembedded-core/2018-August/155059.html


That patch dropped the:

    Openpgp: preference=signencrypt
    Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual;
    keydata=
         xsBNBFkSzTcBCADSJTRk7Y...bIFUmc7ck3KeuUGKy
         ifrpWD6/7YPXbixv4sAlFl...zmMdr0BPLMsL96nBO
...

but it's still base64 encoded:
    Content-Type: text/plain; charset="utf-8"
    Content-Transfer-Encoding: base64

whereas other patches to the list use:
    Content-Type: text/plain; charset="us-ascii"
    Content-Transfer-Encoding: 7bit


Can you fix that and/or send a pull request:
 
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Committing_your_patch


Thanks,
-- 
# Randy MacLeod
# Wind River Linux

