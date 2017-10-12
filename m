Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 051DE77BC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 00:39:42 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 103so1120161uas.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 17:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ufm3h1GnG+rMOr0hf2gJpKyiEnzLkzM/2gDT/9UzIvA=;
	b=hpFV2odSn3FN0VTZrXy0k9yz1G1Un9YYNavI0cwDvUFTKHyKRJzrAAhD8JIyJUUIaR
	Wsdf6CXuM/uoYC5zc4LcXTDGtk/dM7xc7Z1Da7jfkdOnwRbelefk0a2l+8NP7D31lOId
	OIkun54dnDQ9D8WbQHwjIYtiFsjux88VRQEAMJHGPb1HWYLzPUTYsEkrGyjmzDW7nkxz
	EvpS1n87UvkDvh+nXW0UseUPmRM/FcnZIR5/lJqDAWe5uMZ5uQEAmqF5FuGPQweHfEcz
	Zdmbzf7f/KaBZeoGHCzaPKAL/j5a7VKZlOWjrwQm0YBAhhMUXTmcN2d/OxPaSOQRQxdG
	OLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ufm3h1GnG+rMOr0hf2gJpKyiEnzLkzM/2gDT/9UzIvA=;
	b=DNyXTRGrrpobooHCSNTtrsBtfXiOlvsESl2d2IO5kkmRAH1eo4t6fRvg9ACOMca/8m
	TXWejZFEaltJNoYZrGrYlchgb7OYtyE/UqY1rqieLQ03UAHMzESKpThQ0E/xAeB80PZf
	kqjC7IdMnYlgp91sou/E67rIsH7STISZnV46iP7S77XXB4gcKgIhQctJC7CnWBJhr9i6
	bU9TehVPi1SQdbCrU/ZFeQRd7c8lQzJIdLiLoKYWgjsWabDIeZF0/XlmzO8AQqDycLWb
	eygU/9LPssZOku+AsNWZgi7PTdx9IaXWYzRUq9PGx9DJmN2m+VFWgJ8I9/pyfoMdH56K
	fivQ==
X-Gm-Message-State: AMCzsaV2TLHXZQBOaC87akXjQ40IRopwIhPy/I8E4OXPIYqaCHAJSVX/
	r/Rtm+6YzgHxD3QkCiVFeQZFDaqGEKGQ03KZZ7I=
X-Google-Smtp-Source: AOwi7QA7274+l0pFrVuHIhxeN3CfSTLnHyal8fbAGsV6UZ7U9MuFiDfcRcT7cH9nAEZG39PSdcPWIKH8FAISz75amKk=
X-Received: by 10.176.16.221 with SMTP id x29mr719357uab.44.1507768783908;
	Wed, 11 Oct 2017 17:39:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.135.205 with HTTP; Wed, 11 Oct 2017 17:39:13 -0700 (PDT)
In-Reply-To: <a9aab24e-629c-3126-048e-e96fb5081ea4@windriver.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<64c82ed6adc9a0d3b36122ac793ef1792151f916.1507735448.git.alexander.kanavin@linux.intel.com>
	<a9aab24e-629c-3126-048e-e96fb5081ea4@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2017 17:39:13 -0700
Message-ID: <CAMKF1sruXJtsqPOTPtOZ_ijs7dSVxmPu638AGKOi3X1e+kN1Cg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 49/50] maintainers.inc: add Mark Hatle for libmnl
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
X-List-Received-Date: Thu, 12 Oct 2017 00:39:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 11, 2017 at 9:10 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 10/11/17 10:34 AM, Alexander Kanavin wrote:
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index cc857e0a01e..3f1d86422fb 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -358,6 +358,7 @@ RECIPE_MAINTAINER_pn-libinput = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
>>  RECIPE_MAINTAINER_pn-libjson = "Alexander Kanavin <alexander.kanavin@intel.com>"
>>  RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alexander.kanavin@intel.com>"
>>  RECIPE_MAINTAINER_pn-libmatchbox = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
>> +RECIPE_MAINTAINER_pn-libmnl = "Mark Hatle <mark.hatle@windriver.com>"
>>  RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
>>  RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
>>  RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
>>
>
> NAK.  I am not maintaining libmnl.

No problem. Add it to my list.

>
> --Mark
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

