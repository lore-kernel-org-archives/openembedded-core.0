Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6409D61005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 09:31:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B9VEsu011290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Sep 2013 02:31:14 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 11 Sep 2013 02:31:13 -0700
Message-ID: <52303854.1020209@windriver.com>
Date: Wed, 11 Sep 2013 17:31:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1378736079.3484.117.camel@ted> <522ECB4B.2070209@windriver.com>
	<1378822091.3484.163.camel@ted>
In-Reply-To: <1378822091.3484.163.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Wed, 11 Sep 2013 09:31:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/2013 10:08 PM, Richard Purdie wrote:
> On Tue, 2013-09-10 at 15:33 +0800, Robert Yang wrote:
>> Thanks, Can we provide a replacement for the "bitbake PN-PV" since it is
>> useful, for example, can we support the PREFERRED_VERSION_${PN} in the env
>> in the future ? There is a similar bug:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4965
>
> If you set BB_PRESERVE_ENV=1 you can set PREFERRED_VERSION_xxx from the
> environment so this should already be possible?
>

It seems that the BB_PRESERVE_ENV=1 doesn't work, but we use the
BB_ENV_EXTRAWHITE, for example:

$ export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE PREFERRED_VERSION_make"
$ export PREFERRED_VERSION_make="3.81",

Then it works, maybe something is wrong with the BB_PRESERVE_ENV.

// Robert

> Cheers,
>
> Richard
>
>
>

