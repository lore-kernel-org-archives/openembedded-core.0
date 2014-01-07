Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0487860166
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 02:08:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0728Bet008325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Jan 2014 18:08:12 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 6 Jan 2014 18:08:11 -0800
Message-ID: <52CB6189.1090600@windriver.com>
Date: Tue, 7 Jan 2014 10:08:09 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
	<4e72f16aff4f57ad0d71404c21727d78610b27d0.1388397582.git.liezhi.yang@windriver.com>
	<CAJTo0Lawha6evfdNjAkqX3djsbeo44+N3dT02znhFK_k=hWMpA@mail.gmail.com>
In-Reply-To: <CAJTo0Lawha6evfdNjAkqX3djsbeo44+N3dT02znhFK_k=hWMpA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] make: upgrade to 4.0
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
X-List-Received-Date: Tue, 07 Jan 2014 02:08:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/06/2014 09:43 PM, Burton, Ross wrote:
> On 30 December 2013 10:02, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Upgrade to 4.0, remove the following patches since they have been fixed
>> by the upgrade:
>>   - expand_MAKEFLAGS.patch
>>   - intermediate-target-bugfix.patch
>>   - make-savannah-bug30612-fix_white_space.patch
>>   - make-savannah-bug30612-handling_of_archives.patch
>
> Have you tried a build from scratch using make-native as make instead
> of host make?
>

No, I haven't, but sounds reasonable, I will try it.

// Robert

> Not that I'm concerned that in fixing the bugs there's new regressions...
>
> Ross
>
>

