Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1CDE6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:18:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C1ICwQ012448
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Jan 2016 17:18:12 -0800
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 11 Jan 2016 17:18:11 -0800
Message-ID: <5694545C.1050802@windriver.com>
Date: Tue, 12 Jan 2016 09:18:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
	<2523177d0da5233c60da6a6aa99f74631a9277b7.1452491844.git.Qi.Chen@windriver.com>
	<79D0CE6B-7A5E-4D08-BA90-06C6155E25D0@gmail.com>
In-Reply-To: <79D0CE6B-7A5E-4D08-BA90-06C6155E25D0@gmail.com>
X-Originating-IP: [128.224.162.246]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] curl: upgrade to 7.46
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
X-List-Received-Date: Tue, 12 Jan 2016 01:18:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2016 02:20 AM, Khem Raj wrote:
>> On Jan 10, 2016, at 9:58 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>> meta/recipes-support/curl/{curl_7.45.0.bb => curl_7.46.0.bb} | 6 ++++--
>> 1 file changed, 4 insertions(+), 2 deletions(-)
>> rename meta/recipes-support/curl/{curl_7.45.0.bb => curl_7.46.0.bb} (92%)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.45.0.bb b/meta/recipes-support/curl/curl_7.46.0.bb
>> similarity index 92%
>> rename from meta/recipes-support/curl/curl_7.45.0.bb
>> rename to meta/recipes-support/curl/curl_7.46.0.bb
>> index a7ed778..8b109ba 100644
>> --- a/meta/recipes-support/curl/curl_7.45.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.46.0.bb
>> @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>> #
>> SRC_URI += " file://configure_ac.patch"
>>
>> -SRC_URI[md5sum] = "62c1a352b28558f25ba6209214beadc8"
>> -SRC_URI[sha256sum] = "65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
>> +SRC_URI[md5sum] = "9979f989a2a9930d10f1b3deeabc2148"
>> +SRC_URI[sha256sum] = "b7d726cdd8ed4b6db0fa1b474a3c59ebbbe4dcd4c61ac5e7ade0e0270d3195ad"
>>
>> inherit autotools pkgconfig binconfig multilib_header
>>
>> @@ -55,4 +55,6 @@ PACKAGES =+ "lib${BPN}"
>> FILES_lib${BPN} = "${libdir}/lib*.so.*"
>> RRECOMMENDS_lib${BPN} += "ca-certificates"
>>
>> +FILES_${PN}-dev += "${datadir}/zsh”
> what files are in ${datadir}/zsh ?

Hi Khem,

There's only one file in this directory. See below.

chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ cat 
tmp/work/armv5e-poky-linux-gnueabi/curl/7.46.0-r0/packages-split/curl-dev/usr/share/zsh/site-functions/_curl 

#compdef curl

# curl zsh completion

local curcontext="$curcontext" state state_descr line
typeset -A opt_args

local rc=1

_arguments -C -S \

   '*:URL:_urls' && rc=0

return rc

Best Regards,
Chen Qi

>> +
>> BBCLASSEXTEND = "native nativesdk"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


