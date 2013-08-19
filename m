Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6677761EE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 02:02:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7J22Eim015582
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Aug 2013 19:02:14 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 18 Aug 2013 19:02:12 -0700
Message-ID: <52117CA4.3050304@windriver.com>
Date: Mon, 19 Aug 2013 10:02:12 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1376647416.git.kai.kang@windriver.com>
	<b861e570e04aa288f05c344b161815b0dec8e788.1376647416.git.kai.kang@windriver.com>
	<1376650065.22952.118.camel@ted>
In-Reply-To: <1376650065.22952.118.camel@ted>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 1/1] qemu: update dependency of native package
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
X-List-Received-Date: Mon, 19 Aug 2013 02:02:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年08月16日 18:47, Richard Purdie wrote:
> On Fri, 2013-08-16 at 18:05 +0800, Kai Kang wrote:
>> [YOCTO #4973]
>>
>> It fails to start qemu with core-image-sato on Fedora 19. The error
>> message shows:
>>
>> Could not initialize SDL(No available video device) - exiting
>>
>> Add dependecy libxext-native to qemu-native to fix this error.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 97e9b7b..a96e00c 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "open source processor emulator"
>>   HOMEPAGE = "http://qemu.org"
>>   LICENSE = "GPLv2 & LGPLv2.1"
>>   DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
>> -DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
>> +DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native libxext-native"
>>   DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>>   RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
> This is one of the ugly dependencies we've tried to ignore.
>
> We basically assume if your build machine has graphics, you have the
> devel headers/libs there and qemu will autodetect and include graphics
> support. Equally, if your build machine doesn't, it just won't build
> graphics support. In general most people seem happy with this even if
> its imperfect.

If qemu has autodected the devel headers/libs and include graphics 
support, it should be able to boot a target with the graphics.
But it fails. I'll check it and find out the reason.

Thanks a lot.
Kai

>
> Adding libxext-native upsets this balance a little...
>
> Cheers,
>
> Richard
>
>
>
>


-- 
Regards,
Neil | Kai Kang


