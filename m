Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id A20EC760F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 12:55:39 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZjRmC-0000ex-QS; Tue, 06 Oct 2015 14:55:35 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 6 Oct 2015 14:54:27 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <56124413.7020901@topic.nl>
	<1444040307.5118.13.camel@linuxfoundation.org>
	<561263C5.2050606@topic.nl>
	<1444051353.5118.20.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5613C4B4.9000908@topic.nl>
Date: Tue, 6 Oct 2015 14:55:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1444051353.5118.20.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0mvayrARxQsaVhW6R5/2thqbscANip7ZwTyX91RPNepXTxYO9+h4+Kgr/VqvR5kS1nT
	JCAz68Bp5Nzs1GLNXgZmraJGWVbN0zdCh+St1How76M88A/FMgbf0S+ThhoMitkj8yvQGyRT2EBh
	ndiab5jvtWM5d+RkRXA/IaA9U5ieOL5B7EIi8EL8ZOo9XHaXRLONAqPmb5ARLth8Pl7+00wYyBDs
	CGVQWjIY1+wA/g3TOcE5pDPR2nxU6DRRSGtNFtezYqxGMqsKjARq8PBC4qg7sLBrShfGp4EU0fbo
	qhhOIvH2lPPHVNWXnkQ7ilsl/36m+UeFXprlCOm3BAEbJtAcDD/sssj+FwWEyCWpBXdJ6Vkh5Qbj
	nuYeddfovBvutRuK7R6H57ct58uzcYYv7W/KknLmkljuMMLsWJ3maWWze/Ls0fU8FArYrRMJBumI
	Njn9+eCHJ3AcQe7onCBsCZOJ+cv73CChOPjKA0/DVd83+ELfnXyprHiD0GLOK2LqWxX85/pGRMZi
	MCNSygwAMg8WArZ9cfx8JEUvIQRTnKBcCtLX8J42f9dl5Wct40Eou5FVgpT1b21uZVckGp0ccOZC
	RSZMN8y/+1WP1E8Mrbp/GKpoeQlcxlC8WilnINez4DvJjvC82Pa/1OgFKCyVRnxuK13W89C6y2hL
	dJzdo1/6c0Jn5QFm5L3+9JoiLT95+g==
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
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why my do_compile depends on $MACHINE
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
X-List-Received-Date: Tue, 06 Oct 2015 12:55:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05-10-15 15:22, Richard Purdie wrote:
> On Mon, 2015-10-05 at 13:49 +0200, Mike Looijmans wrote:
>> =EF=BB=BFOn 05-10-15 12:18, Richard Purdie wrote:
>>> On Mon, 2015-10-05 at 11:34 +0200, Mike Looijmans wrote:
...
>> For the bigger picture:
>>
>> If I have a recipe that says:
>>
>> X =3D "x"
>>
>> And I refactor it a bit to read:
>>
>> Y =3D "x"
>> X =3D "${Y}"
>>
>> What is the logic behind having to rebuild the package now? Why does the
>> 'source' of the contents matter to the hash? It won't generate different
>> output, regardless whether X is 'calculated' or just 'constant'.
>>
>> In particular, I've noticed this happening when switching between AUTORE=
V and
>> a fixed revision in a recipe.
>
> This is simply just the way the system is designed. It checksums the
> intermediate steps as well as the endpoints. I guess in the above
> example the system might do "export Y" for example.

In that case, "Y" would end up in the package's sstate hash, and hence it=20
would rebuild when Y changes.

I have a workaround now, multiple workarounds actually, but I'm trying to=20
understand why the system would be designed this way. Currently I'm tempted=
 to=20
splatter X[vardepvalue]=3D"${X}" all over the place just to get rid of this=
=20
annoying behaviour.

> There are alternative ways to do things but its simply not the way
> things were implemented. If you do need to collapse the dependency
> chain, you can use vardepvalue which was added for that reason. There
> are only a small number of places you really need to do that.

Lets make things more concrete. My distro.conf now reads:

FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"

Say I want to build packages with varying optimization levels. I consider=20
myself pretty smart, so in this distro.conf file, I change that line to:

OPT_LEVEL ?=3D "-O2"
FULL_OPTIMIZATION =3D "${OPT_LEVEL} -pipe ${DEBUG_FLAGS}"

So now I can replace the optimization level of some packages by simply=20
changing the OPT_LEVEL variable.

Nice, but this will trigger a rebuild of ALL packages, event though the bui=
ld=20
flags did not change at all!

I can't think of any reason why this would be desirable. Why is it designed=
=20
this way?



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






