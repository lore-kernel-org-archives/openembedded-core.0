Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F06E37FA1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:17:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9TJHHSR025806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 12:17:18 -0700
Received: from [128.224.22.117] (128.224.22.117) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 29 Oct 2019 12:17:17 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191029164221.104684-1-trevor.gamblin@windriver.com>
	<2b989167-be53-1279-1adf-a722fa04e01a@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <40bc078a-a86c-1a8d-c183-b45f11be503b@windriver.com>
Date: Tue, 29 Oct 2019 15:17:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2b989167-be53-1279-1adf-a722fa04e01a@intel.com>
Subject: Re: [PATCH v2] libgcrypt: upgrade 1.8.4 -> 1.8.5
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
X-List-Received-Date: Tue, 29 Oct 2019 19:17:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/29/19 1:38 PM, Ross Burton wrote:
> On 29/10/2019 16:42, Trevor Gamblin wrote:
>> + src/libgcrypt.pc.in | 33 +++++++++++++++++
>
> Surely the upstream .pc file is sufficient now so we just need to 
> patch the m4 file?
You're right - the old patch is actually just duplicating the file 
contents. I'll send a v3.
>
> Ross

