Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 7468 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 08:28:40 UTC
Received: from mx6-14.smtp.antispamcloud.com (mx6-14.smtp.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id 282546FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 08:28:40 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1a9Ryw-0001sD-8u; Thu, 17 Dec 2015 07:24:12 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 17 Dec 2015 07:22:27 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <5671310A.1000000@topic.nl>
	<1450269344.13505.113.camel@linuxfoundation.org>
	<567164AF.1040405@topic.nl>
	<1450272836.13505.124.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56725504.8030704@topic.nl>
Date: Thu, 17 Dec 2015 07:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450272836.13505.124.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0mvayrARxQsaVhW6R5/2thqbscANip7ZwTyX91RPNepXTxYO9+h4+Kgr/VqvR5kS1nT
	JCAz68Bp5Nzs1GLNXgZmraJGWVbN0zdCh+St1How76M88A/FMgbf0S+ThhoMitkj8yvQGyRT2EBh
	ndiab5jvtWM5d+RkRXA/IaA9U5iejlboZBe6eYVTIAvBXItZRQkVZItxBHm7Ka/rIptFCf0YyBDs
	CGVQWjIY1+wA/g3TOcE5pDPR2nxU6DRRSGtNFtezYqxGMqsKjARq8PBC4qg7sLBrShfGp4EU0fbo
	qhhOIvH2lPPHVNWXnkQ7ilsl/36m+UeFXprlCOm3BAEbJtAcDD/sssj+FwWEyCWpBXdJ6Vkh5Qbj
	nuYeddfovBvutRuK7R6H57ct58uzcYYv7W/KknLmkljuMMLsWJ3maWWze/Ls0fU8FArYrRMJBumI
	Njn9+eCHJ3AcQe7onCBsCZOJ+cv73CChOPjKA0/DVd83+ELfnXyprHiD0GLOK2LqWxX85/pGRMZi
	MCNSygwAMg8WArZ9cfx8JEUvIQRTnKBcOAOubz+SEHcSBTM4j91TeTXUjLjYWQt1/5xnQymMoPtz
	HDeqqFz43py4SDhdaHkWcCH4Qi+O2Q8nN7beePg9XwrQaVKrqzAIoxpbUfRi1NzLbJnl5XsXMIep
	vRJ+N1Z0io/i75gmwcW7nLDlw5j1yg==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJXhXyDRoOQM5J3kcUr0HrMvJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
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
X-List-Received-Date: Thu, 17 Dec 2015 08:28:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 16-12-15 14:33, Richard Purdie wrote:
> On Wed, 2015-12-16 at 14:18 +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 16-12-15 13:35, Richard Purdie wrote:
>>> On Wed, 2015-12-16 at 10:38 +0100, Mike Looijmans wrote:
>>>> =EF=BB=BFI renamed "recipes-some/foo/bar.bb" to "recipes
>>>> -some/buzz/bar.bb"
>>>>
>>>> Rebuilding bar and its dependencies will take about 16 hours. So
>>>> I
>>>> don't want
>>>> to trigger a rebuild.
>>>>
>>>> running "bitbake -S printdiff bar" only reveils this:
>>>
>>> I'm not sure I trust the output of -S printdiff, there are some
>>> cases
>>> it doesn't seem to "guess" right. I wish I or someone one could fix
>>> but
>>> but we can do its work manually. Can you try something like:
>>>
>>> set TMPDIR =3D "x"
>>> bitbake -S bar
>>> rename the recipe
>>> set TMPDIR =3D "y"
>>> bitbake -S bar
>>
>> Found out I need an extra "none" in here:
>> bitbake -S none bar
>
> Sorry, yes.
>
>>> then
>>>
>>> "ls tmp-x/stamps/xxxx/bar"
>>> "ls tmp-y/stamps/xxxx/bar"
>>>
>>> and see which tasks change signature. Then run:
>>>
>>> "bitbake-diffsigs <sig A> <sig B>"
>>>
>>> and see if that makes more sense?
>>
>> That gave the same output. Everything after "runtaskdeps" is bogus
>> because its
>> value changes from [blahblah, foobar] into [buzbar, blahblah] and now
>> diffsig
>> seems to attempt to match the "blahblah" signatures against those of
>> "buzbar".
>>
>> Which sort of hints that if my new name starts with an "f" the
>> reordering
>> won't happen, so I'm gonna try renaming to "fbuz" now,,,
>
> I still suspect this might be the way the tool displays the data rather
> than the real problem as there is some fuzziness in the data that code
> has to work with. Bitbake just knows there are dependencies on hashes
> X, Y, Z and it has to try and guess how to match them up. The paths are
> included to help reduce fuzz but are only used by the analysis code,
> not the checksum creation.

No, if the sort order doesn't change, the checksum remains the same as well=
.

So if i rename "foo" to "far" it will not rebuild the package (using plain=
=20
bitbake without -S switches), but if I rename "foo" to "buz" it will rebuil=
d=20
because there's a dependent package that sorts before "far" but after "buz"=
.


> Did the hashes themselves change or just the paths? I'm wondering if
> the order that bitbake adds the checksums to the main checksum may have
> some bearing on this...
>
> Being able to see some real data would also help. Does this reproduce
> with a public recipe I can see the real data for?

There should be quite a few recipes in OE-core that might match this patter=
n:

Recipe X must depend on recipe Y. The directory of Y sorts before that of X=
.=20
Renaming the directory of X to something that sorts before that of Y should=
=20
trigger the problem.

I'll see if I can locate an existing one.

M


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






