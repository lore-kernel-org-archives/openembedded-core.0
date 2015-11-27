Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-05.smtp.antispamcloud.com (mx12-05.smtp.antispamcloud.com
	[46.165.232.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFAF6012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 13:54:49 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1a2JTz-00082g-TY for openembedded-core@lists.openembedded.org;
	Fri, 27 Nov 2015 14:54:49 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 27 Nov 2015 14:53:14 +0100
To: <openembedded-core@lists.openembedded.org>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
	<20151127111932.GC17303@jama>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5658609E.4000407@topic.nl>
Date: Fri, 27 Nov 2015 14:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151127111932.GC17303@jama>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrvdTWjiQ3X4ioEA7y2wj/0AiQsB33jwmBCDKd
	AL3GQ7I8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OTh+h+CzXS8eUe
	C5gEulNqQ4FWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5lokhecaVqDL9uaaBYOuxasEpt
	pbQqVsjuh0JlrWxsIcuBhkb6GDdB6OAsNDDRIxpg15xifUD173ICRv+qGaUPXf0=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: [RFC] Use libjpeg-turbo in place of libjpeg
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
X-List-Received-Date: Fri, 27 Nov 2015 13:54:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 27-11-15 12:19, Martin Jansa wrote:
> On Fri, Nov 27, 2015 at 09:13:22AM -0200, Otavio Salvador wrote:
>> On Fri, Nov 27, 2015 at 9:04 AM, Maxin B. John <maxin.john@intel.com> wr=
ote:
>>> This patch set provides libjpeg-turbo as a drop-in replacement for libj=
peg.
>>>
>>> libjpeg-turbo is a fork of the original libjpeg project.Most of the maj=
or Linux
>>> distros (Fedora, Debian, OpenSUSE) moved from libjpeg to libjpeg-turbo =
recently.
>>> lbjpeg-turbo provides better JPEG compression/decompression(at least 25=
% faster)
>>> while maintaining same API/ABI as libjpeg.
>>>
>>> Once we reach an agreement on this, based on the decision, we can move =
the
>>> libjpeg package to meta-oe for applications which may depend on API ver=
sion 9.
>>
>> I support this change, due:
>>
>>   - agreement with major Linux distros
>>   - performance improvement
>>
>> I also think moving libjpeg (API version 9) for meta-oe is fine as
>> well. I am not aware of any application which requires it, though.
>
> I'm not aware of any as well, so I would prefer to drop libjpeg
> completely.
>
> + less junk in meta-oe
> + people were confused about multiple jpeg providers before, now they
> would be again, but without good reason (as nobody knows about apps
> depending on libjpeg9).

Indeed, most (read: "I") have set the PREFERRED_SUPPLIER to "jpeg" just to =
get=20
rid of the warning message, and not really bothering to check what either m=
eant.

I'm in favor of dropping libjpeg completely, it's just confusing.

Moving it will lead to package dependency problems when upgrading from one =
to=20
the other.



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






