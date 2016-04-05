Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 1563 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Apr 2016 06:37:30 UTC
Received: from mx18-13.smtp.antispamcloud.com (mx18-13.smtp.antispamcloud.com
	[207.244.64.182])
	by mail.openembedded.org (Postfix) with ESMTP id 45A3D62133
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 06:37:30 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1anKCr-0008QY-7J; Tue, 05 Apr 2016 08:11:25 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 5 Apr 2016 08:11:14 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy
	<armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
	<1459586928.7348.75.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57035702.5080101@topic.nl>
Date: Tue, 5 Apr 2016 08:11:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459586928.7348.75.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0mvayrARxQsaVhW6R5/2thqbscANip7ZwTyX91RPNepXTxYO9+h4+Kgr/VqvR5kS3Px
	Wi/qTuYSS82eGozojuMmxVQnuZQWsVlRBrZxlxA3N2542d/b7t9lHmDQ8yh7HaBeFoCpBTZf/vD+
	3CqUfp1OGUSwEeTZOqcIQrOnOb/i7uC0nKyQ4WRk1ASq3LEA9bahZ3yT0N1sCL/bdMvhajbFy1Z4
	Umm1/HOC+KUPSSTIPAlbDjazCbhs7qBpykynMiKLxe/jSv7J0ay+ZKRnZ1QgRN+MUQw/F94u72K1
	Vk+WySsGK8uKTQL/mP7ZoP922ygJZp+EGNF2ucOZkdt/1pk0dKFOE3BfZETw255uBppYkljXryrt
	+P8qvARxhOwUCVuDQEdKm65cTUbfWaDAny60lVw2sV/gZozkSDmyU05j0GfvDBaIXh8p/cSXZXPL
	ixtnh67vwc34ME4psYWcv54v/jvJWXl4bZSUf3oJrZnl5dnU3Bofyz743BOOAvzp0ZnckpWaLvah
	yBjmQxBKOzsUVWwArlQYMzGS1J7mlVN6n4eei8kcprcU9UCAt8uY6Uq66K6N15pi4KtuN7St+JBd
	c/8+FpxKAvAtd3FgAVpYzHkfATGQrLEsGz/Salrk+OidX4Ts4xdG+C13IyWeZaKdTmSHNtpP4Vu7
	zWKoyv+dJcqaANbLHasxeXJYXsXLua6pN1S5UDp5Ue1Z1WpPtRCh5tarCJ8BGubaGSYIZnVp
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJcFIkh7yuznlTeFPLSNUgKbJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: Staging machine specific kernel headers in sysroot
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
X-List-Received-Date: Tue, 05 Apr 2016 06:37:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 02-04-16 10:48, Richard Purdie wrote:
> On Fri, 2016-04-01 at 20:38 -0700, Andre McCurdy wrote:
>> Say I have a kernel driver with a user space API (simple struct and
>> ioctl definitions) defined in a header file which is part of my
>> machine specific kernel. The header file is not found in the upstream
>> kernel, so doesn't clash with anything in linux-libc-headers.
>>
>> Is it OK to use something like the following in my kernel recipe?
>>
>>    sysroot_stage_all_append () {
>>      install -d ${SYSROOT_DESTDIR}/${includedir}/linux
>>      install -m644 ${S}/include/linux/foo.h
>> ${SYSROOT_DESTDIR}/${includedir}/linux/
>>    }
>>
>> I've tested it and everything seems to work fine, but I'm wondering
>> if
>> bypassing do_install like that is going to cause problems somehow?
>
> You can probably just do it in do_install to be honest, then on target
> development would also work.

A simple method to get around the header being "kernel" related is to creat=
e a=20
second recipe referring the same repository as the module, but that just=20
installs the header. That turns it into a simple "library" dependency inste=
ad=20
of making things machine-specific.




Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






