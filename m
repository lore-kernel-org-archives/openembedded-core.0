Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABF2E6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:59:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6xLAk013031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Mar 2016 23:59:21 -0700 (PDT)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:59:20 -0700
To: Praveenreddy Padamati <praveenreddy.p@hcl.com>
References: <09856974BCEE6F48AB378E52E4CAA73C226DA890@CHN-HCLT-MBS02.HCLT.CORP.HCL.IN>
	<56E239E0.7010003@windriver.com>
	<09856974BCEE6F48AB378E52E4CAA73C226DBD49@CHN-HCLT-MBS02.HCLT.CORP.HCL.IN>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56E66146.9040908@windriver.com>
Date: Mon, 14 Mar 2016 14:59:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <09856974BCEE6F48AB378E52E4CAA73C226DBD49@CHN-HCLT-MBS02.HCLT.CORP.HCL.IN>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake-devel] Hi
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
X-List-Received-Date: Mon, 14 Mar 2016 06:59:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Do you have a recipe for zetakey ? Something like zetakey_foo.bb ?
If don't you need write one and add it to a layer firstly. Here is
a QuickStart:

http://www.yoctoproject.org/docs/2.0.1/yocto-project-qs/yocto-project-qs.html

And this email should go into oe-core mailing list (See the CC).

// Robert

On 03/11/2016 09:05 PM, Praveenreddy Padamati wrote:
> Hi,
>
> I tried IMAGE_INSTALL_append = " zetakey". But it is failed. Below is the Log
>
> HCL-Desktop:~/fsl-release-bsp/build$ bitbake core-image-sato
> Parsing recipes: 100% |###############################################################################################| Time: 00:01:26
> Parsing of 1747 .bb files complete (0 cached, 1747 parsed). 2189 targets, 84 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'zetakey' (but /home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-sato/images/core-image-sato.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'zetakey' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['zetakey']
> ERROR: Required build target 'core-image-sato' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-sato', 'zetakey']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
>
> Thanks
> Praveen Reddy P
> 9989642189
> ________________________________________
> From: Robert Yang [liezhi.yang@windriver.com]
> Sent: Friday, March 11, 2016 8:52 AM
> To: Praveenreddy Padamati; 'bitbake-devel@lists.openembedded.org'
> Subject: Re: [bitbake-devel] Hi
>
> On 03/10/2016 03:10 PM, Praveenreddy Padamati wrote:
>> Hi all,
>>
>> I need to add zetakey browser to the yocto core-image-sato. Can you provide any
>> data how to add this browse to the build.
>
> Add this to local.conf:
>
> IMAGE_INSTALL_append = " zetakey"
>
> Note, there is a space " " which is a must, then:
>
> $ bitbake core-image-sato
>
>>
>> *Thanks and Regards,*
>>
>> *Praveen Reddy P**
>> **HCL Technologies Ltd*| Lead Engineer | Alstom ODC| ERS-SS-SCS-Embedded
>> Platform Lab
>>
>> P*hone:* +914443935173 | *Mobile:* +919989642159 | *E-mail:*
>> _praveenreddy.p@hcl.com <mailto:praveenreddy.p@hcl.com>_
>>
>> *Company address:*HCL Technologies Ltd ,73-74, South Phase,Ambattur Industrial
>> Estate (AMB-5), Chennai - 600 058,India
>> *Switchboard:*__+91-44-4393-5000  Web*Site:* www.hclt.com <http://www.hclt.com/>
>>
>>
>>
>> ::DISCLAIMER::
>> ----------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> The contents of this e-mail and any attachment(s) are confidential and intended
>> for the named recipient(s) only.
>> E-mail transmission is not guaranteed to be secure or error-free as information
>> could be intercepted, corrupted,
>> lost, destroyed, arrive late or incomplete, or may contain viruses in
>> transmission. The e mail and its contents
>> (with or without referred errors) shall therefore not attach any liability on
>> the originator or HCL or its affiliates.
>> Views or opinions, if any, presented in this email are solely those of the
>> author and may not necessarily reflect the
>> views or opinions of HCL or its affiliates. Any form of reproduction,
>> dissemination, copying, disclosure, modification,
>> distribution and / or publication of this message without the prior written
>> consent of authorized representative of
>> HCL is strictly prohibited. If you have received this email in error please
>> delete it and notify the sender immediately.
>> Before opening any email and/or attachments, please check them for viruses and
>> other defects.
>>
>> ----------------------------------------------------------------------------------------------------------------------------------------------------
>>
>>
>>
>

