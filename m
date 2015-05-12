Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-out9.antispamcloud.com (mx12-out9.antispamcloud.com
	[46.165.232.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1504A60138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 06:01:26 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Ys3Fo-0002Pi-LD; Tue, 12 May 2015 08:01:27 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 12 May 2015 08:01:56 +0200
Message-ID: <5551972F.9070202@topic.nl>
Date: Tue, 12 May 2015 08:01:19 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5549B621.4060008@topic.nl>
	<1430915731.8074.34.camel@linuxfoundation.org>
In-Reply-To: <1430915731.8074.34.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw4+d5E37wd7o1HkJDyf5UJgKnuyzaS/cmRpVwk4+qL2rtor9O5jjWZI633McN2M/OaKE
	rma3uEXAO4jADSyDF7M8tRBUyKkj4LOrBrqJwOZkxg+pZpvhM9qH6xdNjGVnXNkj8yvQGyRT2EBh
	ndiab5jvtWM5d+RkRXA/IaA9U5ieKhdJ9h6Z2H8vZzlsRoK1SsR+cJ9DoK2TlhGXXAhUZmUYyBDs
	CGVQWjIY1+wA/g3TOcE5pDPR2nxU6DRRSGtNFtezYqxGMqsKjARq8PBC4qg7sLBrShfGp4EU0fbo
	qhhOIvH2lPPHVNWXnkQ7ilsl/36m+UeFXprlCOm3BAEbJtAcDD/sssj+FwWEyCWpBXdJ6Vkh5Qbj
	nuYeddfovBvutRuK7R6H57ct58uzcYYv7W/KknLmkljuMMLsWJ3maWWze/Ls0fU8FArYrRMJBumI
	Njn9+eCHJ3AcQe7onCBsCZOJ+cv73CChOPjKA0/DVd83+ELfnXyprHiD0GLOK2LqWxX85/pGRMZi
	MCNSygwAMg8WArZ9cfx8JEUvIQRTnKBc2Zwg0bm8VTvqIC4OLBWXwZFVgpT1b21uZVckGp0ccOZC
	RSZMN8y/+1WP1E8Mrbp/+wcGxhyyfIg/dpIfDS4Nn/SB0+ztc6J+oAtruCe6B6DLbJnl5XsXMIep
	vRJ+N1Z0io/i75gmwcW7nLDlw5j1yg==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJZ49yz1MT0kfUl6zGjl7omzJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
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
Subject: Re: Changing external kernel module results in rebuild of whole kernel
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
X-List-Received-Date: Tue, 12 May 2015 06:01:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06-05-15 14:35, Richard Purdie wrote:
> On Wed, 2015-05-06 at 08:35 +0200, Mike Looijmans wrote:
>> =EF=BB=BFSomething in recent OE-core triggered a weird dependency "backf=
ire".
>>
>> If I change a recipe for a kernel module (a bb recipe that does "inherit
>> module") this will trigger a rebuild of the whole kernel.
>>
>> This turns the 5-second job of just updating a single module into a seve=
ral
>> minute workout for the build machine, and then causes boards to re-write=
 the
>> kernel into flash needlessly when upgrading.
>>
>> I now see this on all projects using OE-core master. I can't really pin =
what
>> caused it though. Anyone else seen this?
>
> I have a suspicion this may be as a result of the changed kernel build
> process in 1.8.
>
> The idea there is that the modules depend on the kernel source and
> rather than taring up and then extracting a large (GB) sized sstate
> object, we just extract the original kernel source.
>
> So is the kernel really rebuilding, or, is it just extracting source for
> the kernel to build against? I noticed rm_work in your other post and
> this may also be some bad interaction between rm_work and the kernel
> build process changes.

Any things I can try or provide on this?

As things are now, I'd much prefer the "taring up and then extracting a lar=
ge=20
(GB) sized sstate object" option, since that at least worked correctly.

Mike.


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






