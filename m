Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 4961 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Feb 2016 15:49:21 UTC
Received: from mx12-05.smtp.antispamcloud.com (mx12-05.smtp.antispamcloud.com
	[46.165.232.175])
	by mail.openembedded.org (Postfix) with ESMTP id CBCDF73180
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:49:21 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aQbuc-0006sN-Rp for openembedded-core@lists.openembedded.org;
	Tue, 02 Feb 2016 15:26:40 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 2 Feb 2016 15:26:33 +0100
To: <openembedded-core@lists.openembedded.org>
References: <56B0AE88.3090103@siemens.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56B0BC99.5050405@topic.nl>
Date: Tue, 2 Feb 2016 15:26:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56B0AE88.3090103@siemens.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtWU2yOX8PQJGjCrFTzGoLEG6qRPWZXLLVCm/J3adcaGPunKX0jnzniLZphn
	b6ZcZewccBIk1Sag4dKiqCrF8eZZT/hdFFgBT9ea6XfhiStFUv0vp5jSjOOm60a9gEPheCAX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDmT8QCc9ZpOAxSvIJNEAP1O4I2wVTs
	obDkZgzKyHvXxNy0HPTmuB9/GAQDSlCp43waKXvNWrRcSD72jROfhu6vZJ0Q4x+0GOxZvoENDONK
	wZkjGlUCvU6ZAmJB8zrNH9BlxMWrrEY4M+w4AQhbqSGAGfxNlhQyZmS3TgLw2A6IYlwvyVyNd0zt
	xHpovTZEu2ZhcIWmrxicQkxvc9w0CTELrSOIPpeqwlm2NDGXIJ2x7JRglvLLWVUnqdg6gt3vmJi/
	EuhRQ6HZH7TD+UzWkF8W12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
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
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Tue, 02 Feb 2016 15:49:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFYou'd have to check the GCC documentation to be sure, but I suspec=
t that all=20
of "-fexpensive-optimizations -fomit-frame-pointer -frename-registers" are=
=20
already in effect at -O2 optimization level, so they're redundant.


On 02-02-16 14:26, Pascal Bach wrote:
> Hi everybody
>
> I noticed an inconsistency in oe-core regarding the variable: FULL_OPTIMI=
ZATION
>
> In bitbake.conf the variable is defined as follows:
>
>      FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>
> But if I look into the documentation.conf it tells me the following:
>
>      FULL_OPTIMIZATION[doc]=3D "The options to pass in TARGET_CFLAGS and =
CFLAGS when compiling an optimized system. This variable defaults to '-fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -O2'."
>
> I'm not sure if the documentation is wrong or if the default set in bitba=
ke.conf is incorrect.
> Maybe somebody can shed some light on this.
>
> Regards
> Pascal
>



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

Visit us at: Embedded World 2016 Germany, Hall 1, stand number 220.
Click here to schedule an appointment with us at Embedded World, free ticke=
t included

http://topicembeddedproducts.com/schedule-an-appointment/



