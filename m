Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8AFD77E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:02:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v51G2Btu010531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Jun 2017 09:02:11 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 09:02:11 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
	<12b1e915-31c9-3258-1013-46854abb78ae@windriver.com>
	<f960d84e-0372-07f1-22f9-0768f5792f8b@linux.intel.com>
	<CAMKF1spOiMc6rT4MBN5zx8LfqnpZAHVCGHWbarjy7YaS+rWLuA@mail.gmail.com>
	<29a09c94-56d0-e60a-9444-94d5df312673@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <112d8858-b873-965f-0a0a-342360aaff4f@windriver.com>
Date: Thu, 1 Jun 2017 11:02:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <29a09c94-56d0-e60a-9444-94d5df312673@linux.intel.com>
Subject: Re: AS_NEEDED and rpm4
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
X-List-Received-Date: Thu, 01 Jun 2017 16:02:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/1/17 10:41 AM, Alexander Kanavin wrote:
> On 06/01/2017 06:37 PM, Khem Raj wrote:
>> I don't use rpm so I won't be able to test it
> 
> You only need to issue 'bitbake rpm', no?

In the past rpm5 would build, but did not function properly w/ the standard
configuration.  So basic run-time testing is needed.

--Mark

> 
> Alex
> 


