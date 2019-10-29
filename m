Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD4E7FBA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:52:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9T9qgDt004455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 02:52:42 -0700
Received: from [128.224.158.194] (128.224.158.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 29 Oct 2019 02:52:41 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1569304805-85150-1-git-send-email-changqing.li@windriver.com>
	<98ff244f-3fbb-ae80-788a-11b894eb18c7@windriver.com>
	<19bed5c6-e500-d419-e8fa-8b1cf1d95068@intel.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <5eb018b7-eff5-80d8-f74d-d5055719d9b0@windriver.com>
Date: Tue, 29 Oct 2019 17:52:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <19bed5c6-e500-d419-e8fa-8b1cf1d95068@intel.com>
X-Originating-IP: [128.224.158.194]
Subject: Re: [PATCH V2] mdadm: fix do_package failed when changed local.conf but not cleaned
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
X-List-Received-Date: Tue, 29 Oct 2019 09:52:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10/29/19 6:05 AM, Ross Burton wrote:
> On 08/10/2019 04:16, Changqing Li wrote:
>> Ping
>
> My previous comment still stands:
>
> Can't you just pass BINDIR=${base_sbindir} MANDIR=${docdir}/man 
> UDEVDIR=${nonarch_base_libdir}/udev etc, instead of patching the 
> makefile?
>
> Ross
>
Oh,  I missed your last comments.  Thanks for remind.     I have send a 
V3 for this.

