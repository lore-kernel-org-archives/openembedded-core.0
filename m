Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B57A06006E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 09:31:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA59Udq9011721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Nov 2018 01:30:49 -0800
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 5 Nov 2018 01:30:00 -0800
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYq4aJAp8cUFbmGDer3t9cswKoeVZ3FYgWjUxC19LKA2Q@mail.gmail.com>
	<a17b1fae-4e22-35eb-3602-3a3725fd60e4@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BE00D5F.2050209@windriver.com>
Date: Mon, 5 Nov 2018 17:29:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <a17b1fae-4e22-35eb-3602-3a3725fd60e4@windriver.com>
X-Originating-IP: [128.224.162.215]
Subject: Re: [PATCH 0/2] python: add tk support
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
X-List-Received-Date: Mon, 05 Nov 2018 09:31:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年10月30日 12:52, Randy MacLeod wrote:
> On 10/29/18 8:51 AM, Burton, Ross wrote:
>> Terrified to ask, but why?
>> On Thu, 25 Oct 2018 at 09:39, <mingli.yu@windriver.com> wrote:
>>>
>>> 1, move tk recipe from meta-oe
>>> 2, enable tk to add tk support
>
> Well, tcl and tk do go together and Khem's comment from 2013
> suggested that it might be pulled into oe-core some day.
>
> I think what started us down this path is a FACE [1] compliance test.
> If there's resistance to moving the package to oe-core, can we
> enable python-tk even if tk stayed in meta-oe, Grace?
> Also, this should be done using using PACKAGECONFIG?
> Finally, what about python3-tk ?

Will send out v2 to use PACKAGECONFIG for tk and add tk support for 
python3 altogether.

Thanks,

>
> ../Randy
>
> [1] https://en.wikipedia.org/wiki/Future_Airborne_Capability_Environment
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

