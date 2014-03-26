Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13C8B6F378
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 05:05:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q55mhQ029303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Mar 2014 22:05:48 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 22:05:47 -0700
Message-ID: <5332602A.3050008@windriver.com>
Date: Wed, 26 Mar 2014 13:05:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>	<a856ac4a0c03a5374e8e2f3567a213f09f33c10b.1394948105.git.raj.khem@gmail.com>	<53322B15.3000807@windriver.com>
	<CAMKF1sqtuqieAvjD+OAePAeC5D-OP31sRvubvGxAnWj4QYx+jw@mail.gmail.com>
	<53324AA1.6050207@windriver.com>
	<87B6FDC2-D8B6-42FF-973C-58350A818179@gmail.com>
In-Reply-To: <87B6FDC2-D8B6-42FF-973C-58350A818179@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
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
X-List-Received-Date: Wed, 26 Mar 2014 05:05:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit



On 03/26/2014 11:47 AM, Khem Raj wrote:
>
> On Mar 25, 2014, at 8:33 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>> Thanks for the quick response, it is glibc-2.5-118.el5_10.2.
>
> That says it then %ms was added in 2.7 onwards. One thing you could try is
> convert the configvars to be target applicable only e.g.
>
> CACHED_CONFIGUREVARS_append_class-target = " scanf_cv_alloc_modifier=ms”
>

I'm sorry, I wrongly thought that the error was caused by your patch, but
it didn't,  I didn't notice util-linux has been upgraded recently, so it
didn't work, I have to figure out the root cause.

// Robert

> that should be an ok fix.
> -Khem
>

