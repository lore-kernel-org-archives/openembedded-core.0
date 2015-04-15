Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 36B7873D47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 09:10:27 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YiJL2-0004OE-Pa from Dmitry_Eremin@mentor.com ;
	Wed, 15 Apr 2015 02:10:28 -0700
Received: from [137.202.140.150] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Wed, 15 Apr 2015 10:10:27 +0100
Message-ID: <552E2B02.8020105@mentor.com>
Date: Wed, 15 Apr 2015 12:10:26 +0300
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1428609535-15027-1-git-send-email-dmitry_eremin@mentor.com>
	<1428609535-15027-3-git-send-email-dmitry_eremin@mentor.com>
	<4A2072A0-6C21-4FE5-98D6-C9EEB1FA3924@gmail.com>
In-Reply-To: <4A2072A0-6C21-4FE5-98D6-C9EEB1FA3924@gmail.com>
X-Originating-IP: [137.202.0.76]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] security_flags.inc: add more exceptions
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
X-List-Received-Date: Wed, 15 Apr 2015 09:10:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2015 03:28 AM, Khem Raj wrote:
>
>> On Apr 9, 2015, at 12:58 PM, Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com> wrote:
>>
>> Add few more exceptions from other layers as noted during custom image
>> builds.
>>
>
> you can put it in respective layer.conf its seems a bit auxiliary to have it in OE-Core

Would it be better to fix the layer.conf or individual recipes?

>
>> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
>> ---
>> meta/conf/distro/include/security_flags.inc | 8 +++++++-
>> 1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
>> index 21e1a53..f977c8e 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -58,8 +58,10 @@ SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-libvirt = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-lttng-ust = "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-lvm2 = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"

[ skipped the rest]


-- 
With best wishes
Dmitry

