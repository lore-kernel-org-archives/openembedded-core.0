Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5E1D72505
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 01:29:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBA1TRX0019274
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 9 Dec 2014 17:29:27 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 9 Dec 2014 17:29:26 -0800
Message-ID: <5487A1F5.3090607@windriver.com>
Date: Wed, 10 Dec 2014 09:29:25 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1418117801-9614-1-git-send-email-kai.kang@windriver.com>
	<CAJTo0Lbd2jieDY-4zGauqxQpvZnvMPsXcr=PP=Qy1YYAvmR7pg@mail.gmail.com>
In-Reply-To: <CAJTo0Lbd2jieDY-4zGauqxQpvZnvMPsXcr=PP=Qy1YYAvmR7pg@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.10.1
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
X-List-Received-Date: Wed, 10 Dec 2014 01:29:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月09日 20:43, Burton, Ross wrote:
> On 9 December 2014 at 09:36, Kai Kang <kai.kang@windriver.com> wrote:
>
>> Add dependency perl-module-file-glob for ptest subpackage.
>>
> A build here results in:
>
> WARNING: QA Issue: valgrind-ptest rdepends on boost-system, but it isn't a
> build dependency? [build-deps]
> WARNING: QA Issue: valgrind-ptest rdepends on boost-thread, but it isn't a
> build dependency? [build-deps]

Thanks. I  didn't meet it and will check it.

--Kai



>
> Ross
>


-- 
Regards,
Neil | Kai Kang


