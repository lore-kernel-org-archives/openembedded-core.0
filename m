Return-Path: <prvs=06865ee9b6=mike.looijmans@topicproducts.com>
X-Greylist: delayed 11210 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 May 2018 16:51:25 UTC
Received: from mx36-out25.antispamcloud.com (mx36-out25.antispamcloud.com
	[209.126.121.73])
	by mail.openembedded.org (Postfix) with ESMTP id 7204871AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 16:51:25 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx19.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1fNIRr-0006xl-Oi for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2018 15:44:36 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 15:44:26 +0200
To: <openembedded-core@lists.openembedded.org>
References: <20180517191536.12283-1-fabio.berton@ossystems.com.br>
	<CAJ86T=XbsORQD062SHnacc6kk9+cvfpJGdnpe8m_70V8P1McxA@mail.gmail.com>
	<CAAPZna3aoEwRF-YDB1E1SNEMDouf+mmJW=Y2EBApGVLwCQjJ2Q@mail.gmail.com>
	<CAJTo0LYuxunVTMqQLmHoAUzTpZavXTHk=ASRMahzEYmYLWabxQ@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <9b21a161-49c9-01f0-9e28-a23822548966@topic.nl>
Date: Mon, 28 May 2018 15:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYuxunVTMqQLmHoAUzTpZavXTHk=ASRMahzEYmYLWabxQ@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-AntiSpamCloud-Domain: topic.nl
X-AntiSpamCloud-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-AntiSpamCloud-Outgoing-Class: ham
X-AntiSpamCloud-Outgoing-Evidence: SB/global_tokens (0.00396587353944)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5pc66InIi0KfUtnozJbZUsp602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
	q3u0UDjvOxznj/1iaw5TjLSMy5CpQtFmraJGWVbN0zdCh+St1How4o1YeYC8LHFWCIFgyeyJQefH
	zJ6mVE7ewsipSVIfs4ZkcKbkYWKvqwdSdDom6Whj4JjiDSrbcmJ1QXhuh4fWdusIlCgsJ+wd19Jr
	MlGHeJyZ3JKVmi72ocgY5kMQSjs7AS5g9nL+yeFiOR30+l159X3F2AuNuamkoUiKgQQWvzglYYyi
	NZr+/4JfE7i26Y6ctPZUPzYlTOTdwc0UsK6fWIrhylS5qWRAI3z2YWviHNUM5PgtoxLiSpsrL6hV
	WLdEFdlTez4Ep6JVGftOsEfid+kwN34980yjfCV4sX61Zxc4sdk5qjpwYvOXccJR9d21dbYb9IXf
	YGRpVS/0hA4MwgqHdFImokbHb1Y8JYX3OHQYH6QrpfZiTMRk4xXw0fBcBtqB8i92FTFM6tZFBrQi
	hdYLAvKC1zHldj/T9Lzwwpkgr/U0flMcy2Vi/IcBgY4aV9RsXK5hbay6GIP6nWYE/itJwT/XfkxH
	9xPaNyUif07BRZ5bjdmflDvnzDfy4SeNZ96dHaC7UHChXOkxWc9etuCyR8XKe+rDPcCSk+CCmxPC
	TliiVh8R8l8ny+KlNs+OFz5yHpXN8jtyJtgatPn1xY3C/K+1g0mVrzhXrq0GuANyNYPrQUr9AfnI
	Fu1aDxIghYyNNOlL9xYyf3Hx8dKOR/d+eUKxrGf4z5a9/iqa0/ekvz2MVWmkmrS0d7S6eeQSIbtf
	63VNbf0lrvssY+k7AMxwmqEEUcRPmZVLGiTKnsgaG73pC/ogJ1E81ivd5h/ZqScLJvOWBji47XTN
	MLxNCuG2fop4bXUG3rFQ05n2/EwgfZUMtf2KgeH5AUzRMQwAZRWsGw8ac2InzcAP/gmxwHIurxo/
	E5JUsK35tEEueVyZOSBLIzj9eRoIMYad5NG3HM3WDmaI4FA1v9kem7Jpwg==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH] systemd: Add util-linux-umount to RDEPENDS
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
X-List-Received-Date: Mon, 28 May 2018 16:51:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFDefinitely, once the RDEPENDS is there, people will forget about i=
t and it=20
will still be there long after we've forgotten why it was put there...

On 18-05-18 15:20, Burton, Ross wrote:
> Fixing busybox is a better solution. yes.
>=20
> Ross
>=20
> On 18 May 2018 at 13:24, Fabio Berton <fabio.berton@ossystems.com.br> wro=
te:
>> Yes, I tested this patch seems to work.
>>
>> But bug report has:
>>
>> "Yeah, this appears to be a limitation of busybox, and needs to be fixed=
 in
>> busybox. We focus on util-linux proper, which has supported this option
>> since generations"
>>
>> So, I add umount from util-linux because systemd focus on util-linux and
>> systemd recipe already has util-linux-mount.
>>
>> If add patch to busybox is a better solution I can do this and send to l=
ist.
>>
>> Fabio
>>
>> On Thu, May 17, 2018 at 4:53 PM, Andre McCurdy <armccurdy@gmail.com> wro=
te:
>>>
>>> On Thu, May 17, 2018 at 12:15 PM, Fabio Berton
>>> <fabio.berton@ossystems.com.br> wrote:
>>>> Images with systemd fails on reboot with error:
>>>>
>>>>     [FAILED] Failed unmounting Temporary Directory (/tmp).
>>>>
>>>> This happens because busybox umount command doesn't has -c
>>>> option. Add util-linux-umount that has this option to fix
>>>> this issue.
>>>>
>>>> See details: https://github.com/systemd/systemd/issues/7786
>>>
>>> That bug report mentions a fix to busybox. Since the fix is available
>>> in upstream busybox, maybe better to just backport the patch to our
>>> version of buysbox:
>>>
>>>
>>> https://git.busybox.net/busybox/commit/?id=3D426134128112738c97a665170b=
21153ef0764b7d
>>>
>>>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>>> ---
>>>>   meta/recipes-core/systemd/systemd_237.bb | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd_237.bb
>>>> b/meta/recipes-core/systemd/systemd_237.bb
>>>> index b7c2113255f..3b0f4580d49 100644
>>>> --- a/meta/recipes-core/systemd/systemd_237.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_237.bb
>>>> @@ -478,7 +478,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
>>>>
>>>>   FILES_${PN}-dev +=3D "${base_libdir}/security/*.la
>>>> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>>>
>>>> -RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D ${EXTENDPKG=
V})
>>>> util-linux-agetty"
>>>> +RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount util-linux-umount ude=
v (=3D
>>>> ${EXTENDPKGV}) util-linux-agetty"
>>>>   RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>>>>   RDEPENDS_${PN} +=3D "volatile-binds update-rc.d"
>>>>
>>>> --
>>>> 2.14.2
>>>>
>>>> --
>>>>=20

Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail



_______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


