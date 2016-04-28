Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6601B6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 15:58:38 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d62so81299538iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xl4kz2ckxdqi8NjJDZZytpbPTUmyatHYr9ngH20pgYA=;
	b=IEqreedH80DXaAbs+fQXlxKPQy1uezdhKtZ3Mbj2cR0r3kNLPWu3PKJwStNpjYCKEl
	1YbEnLTDk6mrR6y+7PnIaLP6GCDZ+NIYQHVaxRuSLlbXpr8dfOMFnYDeivN+/lt1vxhJ
	TLCj24gSJAcZbhc1gMpBeKDIBBQT2o8KGRRmdvx3n9s8qMCx1MOqyK5Fm+cm8jswhotZ
	uleTlVwuvVZ53NFwSX0EwlNVj3nmWe3BCtklROI6oHe6nsk8gR7wwNdzuZmvpcGAiqxK
	UIkrJz60/zTKwz35qfA7m0mnQseKiK1KYZwNc1+MS6qCZqNtCixKLo1whUNZLuiMtP+M
	ZYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xl4kz2ckxdqi8NjJDZZytpbPTUmyatHYr9ngH20pgYA=;
	b=C7wE2zr3xmML+EzJ3kk7HndMwe6RR/qpPSzZ9/Nu259FixkoediL6YU1Sq6bvBpXYt
	8ukiRV/pOp1PPjM/nKoTTm5fjjGpYKjBG2xke/1u5C2+fXLh5Udfp0XXX8x0GWXFSr15
	alIp2jRPKmhvB8/dFkqKgyhFKKHFwGVUVliFERva8nhfc2OsDN9Te/yEgdYYMYWSOhUE
	csiyAVoSVHibJ7VjIOsP/74dxCUx9Cv+m8UqEDrdwXV7Zl62CioU15rL2HtaT64NO2JA
	Qn8xZgPvVZQj/4fbKYacpQ31YeUWCITuv2amCXqWC7LamBe095wC67aGpMx316crtoEa
	m2/Q==
X-Gm-Message-State: AOPr4FVpDVTHVLFpGNWr/r1hTn1O1AmYPQcTOdQSH7CwxBiTRCTv19Hkm9tVQnjpjR8MpPBPckK+ooXUcrBIHu8k
X-Received: by 10.107.57.9 with SMTP id g9mr12515323ioa.89.1461859118780; Thu,
	28 Apr 2016 08:58:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.140 with HTTP; Thu, 28 Apr 2016 08:57:59 -0700 (PDT)
In-Reply-To: <f9ed8be8f57f410b8900cfed94902161@XBOX02.axis.com>
References: <1461847758-6323-1-git-send-email-elizabeth.flanagan@intel.com>
	<f9ed8be8f57f410b8900cfed94902161@XBOX02.axis.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 28 Apr 2016 16:57:59 +0100
Message-ID: <CAPhnLPDnMnPQV5YQwbXbaTpJTW_3ngUT1LAWfJe=dQnvJb_cBQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] common-licenses: Refresh to current SPDX license list
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
X-List-Received-Date: Thu, 28 Apr 2016 15:58:39 -0000
Content-Type: text/plain; charset=UTF-8

On 28 April 2016 at 16:27, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Elizabeth Flanagan
>> Sent: den 28 april 2016 14:49
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] common-licenses: Refresh to current SPDX
>> license list
>>
>> This commit pulls the SPDX license list and license text from
>> http://git.spdx.org/license-list.git and reworks it slightly
>> (remove .txt extention and remove GPL+ licenses).
>>
>> Eventually we should probably consider using the actual repository
>> without edits.
>>
>> It adds quite a number of new licenses and formats the license
>> text we have so that it matches what is currently in the SPDX
>> tree.
>>
>> This patch also adds these licenses to SRC_DISTRIBUTE_LICENSES in
>> conf/licenses.conf
>>
>> I've avoided adding these to the SPDX mapping variable as most of
>> that was only needed for backwards compatibility.
>>
>> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>> ---
>>  meta/conf/licenses.conf                            | 101 ++-
>>  meta/files/common-licenses/AAL                     |  66 +-
>
> [cut]
>
>> diff --git a/meta/files/common-licenses/AAL b/meta/files/common-
>> licenses/AAL
>> index 5484226..95c25cd 100644
>> --- a/meta/files/common-licenses/AAL
>> +++ b/meta/files/common-licenses/AAL
>> @@ -1,51 +1,23 @@
>> +Attribution Assurance License
>>
>> -Attribution Assurance License
>> -Copyright (c) 2002 by AUTHOR
>> -PROFESSIONAL IDENTIFICATION * URL
>> -"PROMOTIONAL SLOGAN FOR AUTHOR`S PROFESSIONAL PRACTICE"
>> +Copyright (c) <<var;name=copyright;original=2002 by AUTHOR PROFESSIONAL IDENTIFICATION * URL "PROMOTIONAL SLOGAN FOR AUTHOR'S PROFESSIONAL PRACTICE";match=.+>>
>
> The license texts as taken directly from the SPDX repository do
> not seem suitable for inclusion in an image as they are full of
> conditional <<...>> tags as per above. You probably need to post-
> process the files and replace all tags with something suitable...
>

Agreed. Let me look at that and I'll repost.

-b

> //Peter
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

