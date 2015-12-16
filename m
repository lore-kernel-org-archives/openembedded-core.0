Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-09.smtp.antispamcloud.com (mx12-09.smtp.antispamcloud.com
	[46.165.232.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8196A7317E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 13:26:08 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1a9C5i-0005ke-2y for openembedded-core@lists.openembedded.org;
	Wed, 16 Dec 2015 14:26:07 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 16 Dec 2015 14:24:24 +0100
To: <openembedded-core@lists.openembedded.org>
References: <5671310A.1000000@topic.nl>
	<1450269344.13505.113.camel@linuxfoundation.org>
	<567164AF.1040405@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56716669.6040503@topic.nl>
Date: Wed, 16 Dec 2015 14:26:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <567164AF.1040405@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrwcVd/ineQ0gXq1SSG0JOKtam85qWbcVy1XP6
	vX923Ic8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
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
Subject: Re: How to move a recipe to another directory without invalidating its sstate-cache?
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
X-List-Received-Date: Wed, 16 Dec 2015 13:26:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 16-12-15 14:18, Mike Looijmans wrote:
> On 16-12-15 13:35, Richard Purdie wrote:
>> On Wed, 2015-12-16 at 10:38 +0100, Mike Looijmans wrote:
>>> =EF=BB=BFI renamed "recipes-some/foo/bar.bb" to "recipes-some/buzz/bar.=
bb"
>>>
>>> Rebuilding bar and its dependencies will take about 16 hours. So I
>>> don't want
>>> to trigger a rebuild.
>>>
>>> running "bitbake -S printdiff bar" only reveils this:
>>
>> I'm not sure I trust the output of -S printdiff, there are some cases
>> it doesn't seem to "guess" right. I wish I or someone one could fix but
>> but we can do its work manually. Can you try something like:
>>
>> set TMPDIR =3D "x"
>> bitbake -S bar
>> rename the recipe
>> set TMPDIR =3D "y"
>> bitbake -S bar
>
> Found out I need an extra "none" in here:
> bitbake -S none bar
>
>>
>> then
>>
>> "ls tmp-x/stamps/xxxx/bar"
>> "ls tmp-y/stamps/xxxx/bar"
>>
>> and see which tasks change signature. Then run:
>>
>> "bitbake-diffsigs <sig A> <sig B>"
>>
>> and see if that makes more sense?
>
> That gave the same output. Everything after "runtaskdeps" is bogus becaus=
e its
> value changes from [blahblah, foobar] into [buzbar, blahblah] and now dif=
fsig
> seems to attempt to match the "blahblah" signatures against those of "buz=
bar".
>
> Which sort of hints that if my new name starts with an "f" the reordering
> won't happen, so I'm gonna try renaming to "fbuz" now,,,
>

Indeed.... If I rename the directory without affecting the sort order of th=
at=20
array, in this situation, "fbuz" instead of "buz",  the signatures will mat=
ch=20
again, and it won't rebuild.

Looks like the problem is the way the "runtaskdeps" are sorted.

If a recipe depends on another recipe say "X", moving the recipe to a=20
directory which sorts to the other side of "X" will trigger a rebuild at so=
me=20
stage.


M.


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






