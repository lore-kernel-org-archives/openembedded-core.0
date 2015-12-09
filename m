Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3EF6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 06:19:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB96JDEf012375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 8 Dec 2015 22:19:13 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 22:19:12 -0800
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <CAJ86T=Xg9mE5MCKL-w=6O+LUZAv5e-iOeTX9Rgto4LVhS+Xoww@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5667C7DF.9090903@windriver.com>
Date: Wed, 9 Dec 2015 14:19:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xg9mE5MCKL-w=6O+LUZAv5e-iOeTX9Rgto4LVhS+Xoww@mail.gmail.com>
Subject: Re: jethro backports
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
X-List-Received-Date: Wed, 09 Dec 2015 06:19:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/09/2015 12:36 PM, Andre McCurdy wrote:
> Hi Robert,
>
> Could you please consider backporting the following fixes to jethro:

Got it, thanks.

// Robert

>
>    c075d6e directfb.inc: force bfd linker for armv7a
>    c725328 prelink: Fix various prelink issues on IA32, ARM, and MIPS.
>    70c55aa gcc: Update default Power GCC settings to use secure-plt
>    12c86bd glibc: Fix ld.so / prelink interface for
> ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA
>    cb8f842 cairo: fix license for cairo-script-interpreter
>
> Thanks
>

