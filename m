Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE9CE7FCAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:11:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBAFBhNN001480
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 10 Dec 2019 07:11:43 -0800
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Dec 2019 07:11:36 -0800
To: Ross Burton <ross.burton@intel.com>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <20191210030833.122689-1-hongxu.jia@windriver.com>
	<1c18bf98-17c2-dde6-bf9a-263742a2e465@intel.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <08dcb74a-f073-e2ba-e95d-dbb84c128ca8@windriver.com>
Date: Tue, 10 Dec 2019 23:11:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1c18bf98-17c2-dde6-bf9a-263742a2e465@intel.com>
Subject: Re: [PATCH] libpam: drop yylex to static force
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
X-List-Received-Date: Tue, 10 Dec 2019 15:11:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 12/10/19 6:58 PM, Ross Burton wrote:
>> +diff --git a/modules/pam_console/sed-static 
>> b/modules/pam_console/sed-static
>> +index b9a6fa2..c7a850e 100644
>> +--- a/modules/pam_console/sed-static
>> ++++ b/modules/pam_console/sed-static
>
> do_patch fails with:
>
> can't find file to patch at input line 40
>
> I guess your WRL layers are patching pam-console in?
>
Yes, you are right, sorry for the nosiy

//Hongxu

> Ross



