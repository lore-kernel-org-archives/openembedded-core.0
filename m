Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA48609AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:39:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5I8dkrx004645
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 01:39:46 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 18 Jun 2013 01:39:45 -0700
Message-ID: <51C01CCF.5030702@windriver.com>
Date: Tue, 18 Jun 2013 16:39:43 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1371539741.git.rongqing.li@windriver.com>
	<b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
	<CAJTo0LYbxL2ONThRs8FCrT-Yfyp0n6Zdji02-Oa+ShCqfz2gSg@mail.gmail.com>
In-Reply-To: <CAJTo0LYbxL2ONThRs8FCrT-Yfyp0n6Zdji02-Oa+ShCqfz2gSg@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 08:39:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/18/2013 04:24 PM, Burton, Ross wrote:
> On Tuesday, 18 June 2013, wrote:
>
>> -           ${libdir} ${sbindir} ${datadir} \
>> +           ${libdir} /usr/lib/locale ${sbindir} ${datadir} \
>
>
> What Phil said, but also please don't hard-code paths - the rest of the
> variable uses ${libdir} for a reason.
>

${libdir}/locale can be /usr/lib/locale, or /usr/lib64/locale,

but localedef only thinks /usr/lib/locale as its default
outputpath(man localedef), can not /usr/lib64/locale, or
other.


-Roy

> Ross
>

-- 
Best Reagrds,
Roy | RongQing Li

