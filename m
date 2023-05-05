Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B7FC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:22:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.4680.1683314516241794165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lmIbrkzI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0AB7860007;
	Fri,  5 May 2023 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683314514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAKcx4lF1bhpXoa88LA1L20tT3W2YENB9ZNFbfPNcLo=;
	b=lmIbrkzIKLufVC1bmH685bHkmDf/sr91t8X6C/ZV0JGtHfLDivMtdy+2F7tfNg6wtrP5cG
	yUXfBxyzouErAjNjuhxR9mzWdx2Jf/nGR7HOO4B98CatqmOajSHP06VUcK1l97ATRWiSXm
	v2R5xSH9gewPUL5rBJlgfsikcjn3qlqefg61Y1gWq0iHfj3v49ZmW4Ycse4AatL2GenXgU
	UCKUOxiC13OIKsGca+M7WAHVVHXx9K3TK+j7/2seyjechyRoclxYa1avY0FTHdWfPoewVk
	nFez5sxNInayQUWngwk1oOyYdJfLdw2tdyxMhq9XVNxSV3jP0rhFRPDt2QgfKQ==
Message-ID: <3bb6883c-fe42-f670-497a-56805f06d296@bootlin.com>
Date: Fri, 5 May 2023 21:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Contributing, how it works?
Content-Language: en-US
To: Frederic Martinsons <frederic.martinsons@gmail.com>
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180974

Hi Frederic

On 05.05.23 at 19:17, Frederic Martinsons wrote:
> Hello list
>
> I'm wondering if there are documentations on how contribution are 
> managed for the project.
>
> I try to find some but didn't manage to. There are easily reachable 
> doc about how to contribute of course (how to make patches, fixe your 
> identity, send mail via git... etc) but I didn't find what I usually 
> find on other open source project (CONTRIBUTING.md file most of the 
> time) like
>   - what are the tests do should I run before submitting (I learnt by 
> practice about test image or bitbake selftest for example) ?
>   - is there a specific configuration that I should test before 
> submitting (poky is ok, or should I also test another distro)?
>   - does some commit writing rules exist ? (some projects want commits 
> to begin with a prefix, usually the software component that is 
> modified by the patch for example)
>  - what are the coding rules you should follow, if any? (having common 
> coding rules helps greatly the review of patches, pylint for python 
> code for example, and I saw there are some bitbake recipes linter from 
> meta-sca layer)
>
> Long story short, I really would like to know what are the different 
> steps a patch should go through before being merged into master (and 
> as a side question, what are the steps for a patch to be backported 
> into one of the LTS branch).
>
> I'm deeply sorry if all these questions are obvious to you and have 
> been already answered somewhere, in that case, please just give me the 
> link.
>
> I recently started to contribute to yocto / oe and I think it will 
> help me to make better contributions if I know more of how it works 
> "under the hood".


Thanks for starting this thread! We precisely have plans to consolidate 
docs on how to contribute.

See   https://www.openembedded.org/wiki/Document_Consolidation and 
https://wiki.yoctoproject.org/wiki/Maintainers_Manual for a list of 
documents we want to consolidate.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


