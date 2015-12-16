Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-09.smtp.antispamcloud.com (mx12-09.smtp.antispamcloud.com
	[46.165.232.179])
	by mail.openembedded.org (Postfix) with ESMTP id B04C16FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 13:18:56 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1a9Bye-00064x-Af; Wed, 16 Dec 2015 14:18:55 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 16 Dec 2015 14:17:06 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <5671310A.1000000@topic.nl>
	<1450269344.13505.113.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <567164AF.1040405@topic.nl>
Date: Wed, 16 Dec 2015 14:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450269344.13505.113.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0mvayrARxQsaVhW6R5/2thqbscANip7ZwTyX91RPNepXTxYO9+h4+Kgr/VqvR5kS1nT
	JCAz68Bp5Nzs1GLNXgZmraJGWVbN0zdCh+St1How76M88A/FMgbf0S+ThhoMitkj8yvQGyRT2EBh
	ndiab5jvtWM5d+RkRXA/IaA9U5ielx2FmUlTS2jAksbNrnrx0nNF5S1qsUh8qPLQpdeie04YyBDs
	CGVQWjIY1+wA/g3TOcE5pDPR2nxU6DRRSGtNFtezYqxGMqsKjARq8PBC4qg7sLBrShfGp4EU0fbo
	qhhOIvH2lPPHVNWXnkQ7ilsl/36m+UeFXprlCOm3BAEbJtAcDD/sssj+FwWEyCWpBXdJ6Vkh5Qbj
	nuYeddfovBvutRuK7R6H57ct58uzcYYv7W/KknLmkljuMMLsWJ3maWWze/Ls0fU8FArYrRMJBumI
	Njn9+eCHJ3AcQe7onCBsCZOJ+cv73CChOPjKA0/DVd83+ELfnXyprHiD0GLOK2LqWxX85/pGRMZi
	MCNSygwAMg8WArZ9cfx8JEUvIQRTnKBc2Zwg0bm8VTvqIC4OLBWXwZFVgpT1b21uZVckGp0ccOZC
	RSZMN8y/+1WP1E8Mrbp/+wcGxhyyfIg/dpIfDS4Nn/SB0+ztc6J+oAtruCe6B6DLbJnl5XsXMIep
	vRJ+N1Z0io/i75gmwcW7nLDlw5j1yg==
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
X-List-Received-Date: Wed, 16 Dec 2015 13:18:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 16-12-15 13:35, Richard Purdie wrote:
> On Wed, 2015-12-16 at 10:38 +0100, Mike Looijmans wrote:
>> =EF=BB=BFI renamed "recipes-some/foo/bar.bb" to "recipes-some/buzz/bar.b=
b"
>>
>> Rebuilding bar and its dependencies will take about 16 hours. So I
>> don't want
>> to trigger a rebuild.
>>
>> running "bitbake -S printdiff bar" only reveils this:
>
> I'm not sure I trust the output of -S printdiff, there are some cases
> it doesn't seem to "guess" right. I wish I or someone one could fix but
> but we can do its work manually. Can you try something like:
>
> set TMPDIR =3D "x"
> bitbake -S bar
> rename the recipe
> set TMPDIR =3D "y"
> bitbake -S bar

Found out I need an extra "none" in here:
bitbake -S none bar

>
> then
>
> "ls tmp-x/stamps/xxxx/bar"
> "ls tmp-y/stamps/xxxx/bar"
>
> and see which tasks change signature. Then run:
>
> "bitbake-diffsigs <sig A> <sig B>"
>
> and see if that makes more sense?

That gave the same output. Everything after "runtaskdeps" is bogus because =
its=20
value changes from [blahblah, foobar] into [buzbar, blahblah] and now diffs=
ig=20
seems to attempt to match the "blahblah" signatures against those of "buzba=
r".

Which sort of hints that if my new name starts with an "f" the reordering=20
won't happen, so I'm gonna try renaming to "fbuz" now,,,




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






