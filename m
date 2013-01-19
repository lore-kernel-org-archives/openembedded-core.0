Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TwQVJ-00076P-BY
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 05:58:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0J4gcP6000793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Jan 2013 20:42:38 -0800 (PST)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 18 Jan 2013 20:42:37 -0800
Message-ID: <50FA243D.8000502@windriver.com>
Date: Sat, 19 Jan 2013 12:42:37 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1358477598.git.rongqing.li@windriver.com>
	<f55fd0b28b693f4a7c0a761c4630e0375b4a526b.1358477598.git.rongqing.li@windriver.com>
	<20130118082454.GB3091@jama>
In-Reply-To: <20130118082454.GB3091@jama>
Cc: openembedded-core@lists.openembedded.org, joe.macdonald@windriver.com
Subject: Re: [PATCH 2/2] default-distrovars: add tcp-wrappers to default DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 04:58:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/18/2013 04:24 PM, Martin Jansa wrote:
> On Fri, Jan 18, 2013 at 10:56:23AM +0800, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> tcp-wrappers DISTRO_FEATURES only is used in xinetd currently, but other
>> packages maybe need it to enable tcp-wrapper support, like vsftpd.
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   meta/conf/distro/include/default-distrovars.inc |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
>> index 9002fd6..9126825 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -19,7 +19,8 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
>>   					libc-posix-wchar-io"
>>   DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
>>   DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
>> -DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
>> +DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 tcp-wrappers \
>> +			${DISTRO_FEATURES_LIBC}"
>
> DISTRO_FEATURES_BACKFILL maybe?
>

Ok, if no one objects this, I will move it to  DISTRO_FEATURES_BACKFILL

Thanks

-Roy

>>
>>   IMAGE_FEATURES ?= ""
>>
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

-- 
Best Reagrds,
Roy | RongQing Li


