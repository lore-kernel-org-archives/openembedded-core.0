Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15019790D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 07:38:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G7cP7I024222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 00:38:25 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 16 Aug 2018 00:38:23 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180816073647.31708-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <11d3b512-4363-569e-bd52-c1df48953a19@windriver.com>
Date: Thu, 16 Aug 2018 15:41:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180816073647.31708-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [PATCH v4 0/2] runtime selftest: limit kernel hw bp arches
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
X-List-Received-Date: Thu, 16 Aug 2018 07:38:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this.

--Hongzhi


On 2018年08月16日 15:36, Hongzhi.Song wrote:
> v4:
>      modify commit, test cases with kvm, test qemuarm64
> v3:
>      specify arch for the case of hw breakpoint
> v2:
>      test_trace_events_sample of ksample.py
>
>
> Hongzhi.Song (2):
>    runtime selftest: test_trace_events_sample of ksample.py
>    runtime selftest: limit kernel hw bp arches
>
>   meta/lib/oeqa/runtime/cases/ksample.py | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>


