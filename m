Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QYTed-0000aS-0x
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 03:51:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5K1mMQZ022252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2011 18:48:22 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 19 Jun 2011 18:48:21 -0700
Message-ID: <4DFEA6E4.6060108@windriver.com>
Date: Mon, 20 Jun 2011 09:48:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
	<9A9B307C-87E6-445D-9432-739EBF04090F@dominion.thruhere.net>
In-Reply-To: <9A9B307C-87E6-445D-9432-739EBF04090F@dominion.thruhere.net>
Subject: Re: [PATCH 0/6 V3] Share gcc work directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2011 01:51:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/18/2011 08:50 PM, Koen Kooi wrote:
>
> Op 18 jun 2011, om 14:41 heeft Robert Yang het volgende geschreven:
>
>> Changes of V3:
>>
>> 1) Use --with-headers to replace the:
>>
>>    sed -i 's:^\([ ]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\": ...
>>
>> 2) Fix the build of gcc-cross-canadian
>>
>> 3) Fix gcc-crosssdk which make the source incompatible during its
>>    building.
>>
>> 4) Test "bitbake meta-toolchain", and also do run test for the
>>    pokysdk(unpack the toolchain to /opt, setup the env by sourcing
>>    environment-setup-armv5te-poky-linux-gnueabi, and build some pkgs
>>    out of poky, then use command file to check the binary file type.
>>
>> 5) Make sure that no gcc build would make the source incompatible,
>>    except gcc-cross_csl-arm-2008q1.bb, but I think this is fine, its
>>    BINV = "4.2.3", not 4.5.1 or 4.6.0.
>
>
> How does this interact with rm_work?
>

The rm_work does not delete anything in work-shared, I think this is fine,
otherwise the source can not be shared.

// Robert

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


