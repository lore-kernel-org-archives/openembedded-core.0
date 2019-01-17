Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 998676BA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:55:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0H9t2xW018334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 01:55:02 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 17 Jan 2019 01:55:02 -0800
To: <openembedded-core@lists.openembedded.org>
References: <CAJTo0LZbjMKrjDO-NgFkhv3FHPfoDxhXFCuBpiFnj8O+iAYpaw@mail.gmail.com>
	<1547718744-239476-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7ab96411-0fc5-13bb-5df9-d07f0c2c1da7@windriver.com>
Date: Thu, 17 Jan 2019 17:55:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1547718744-239476-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH V2] populate_sdk_base: provide options to set sdk type
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
X-List-Received-Date: Thu, 17 Jan 2019 09:55:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this cover letter,  send two times by accident.

On 1/17/19 5:52 PM, changqing.li@windriver.com wrote:
> change in V2:
> 1. add overrides to provide options for sdk type
> 2. move zip part into oe-core for more flexible
>     who want to use type zip, only need to set
>    SDK_ARCHIVE_TYPE to override the default tar.xz
>
>
> Changqing Li (1):
>    populate_sdk_base: provide options to set sdk type
>
>   meta/classes/populate_sdk_base.bbclass | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
>
-- 
BRs

Sandy(Li Changqing)


