Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6BE2703B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 01:47:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s681ll1L022171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jul 2014 18:47:47 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 7 Jul 2014 18:47:46 -0700
Message-ID: <53BB4DC1.9040202@windriver.com>
Date: Tue, 8 Jul 2014 09:47:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1404465351.git.liezhi.yang@windriver.com>	
	<28a4822de67dfb01eddd7cc9f10bd820411e1425.1404465351.git.liezhi.yang@windriver.com>
	<1404776235.1458.51.camel@ted>
In-Reply-To: <1404776235.1458.51.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass/buildtools-tarball: cleanup the RDEPENDS
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
X-List-Received-Date: Tue, 08 Jul 2014 01:47:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2014 07:37 AM, Richard Purdie wrote:
> On Fri, 2014-07-04 at 02:16 -0700, Robert Yang wrote:
>> The "RDEPENDS =" should be replaced by RDEPENDS_${PN}, the similar to
>> RRECOMMENDS
>
> Why?
>
> PACKAGES = "" for these recipes so there is no ${PN} package to add
> these dependencies too?

Ah, right, we should not set this if no PACKAGES.

>
> I suspect this is from your image class modifications but did you test
> without those modifications?

Yes, it is from the image class modifications. I tested it separately,
the bitbake core-image-minimal buildtools-tarball were the same w/o
these changes, I don't know why it works after your explanations, I
tried to print the self.rdepends_pkg from cache.py after patched:

self.rdepends_pkg: {'core-image-minimal': ['packagegroup-core-boot', 
'run-postinsts', 'run-postinsts']}

maybe that's why it works.

Anyway, we should drop this since PACKAGES = "".

// Robert

>
> Cheers,
>
> Richard
>
>
>

