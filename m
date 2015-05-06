Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-out12.antispamcloud.com (mx6-out12.antispamcloud.com
	[95.211.2.203])
	by mail.openembedded.org (Postfix) with ESMTP id 546A173F4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:03:47 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1YpyC3-0000x4-Rs; Wed, 06 May 2015 14:12:58 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 6 May 2015 14:13:31 +0200
Message-ID: <554A0542.4040606@topic.nl>
Date: Wed, 6 May 2015 14:12:50 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <5549B621.4060008@topic.nl>
	<CAJTo0LZ1DgAk3Dmaq5Ted_7K-QWzM=nvsScgSMdUSQtFb9Bq3g@mail.gmail.com>
In-Reply-To: <CAJTo0LZ1DgAk3Dmaq5Ted_7K-QWzM=nvsScgSMdUSQtFb9Bq3g@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarwy3Yf5i+byKl6pUyknU7g+6rXMBzn0F1oDrD0qksn30/k3FHeKPAqRkkdvhE3/JZtuvP
	/eyb7dZ1gnp8kuB8vMeopzLgn8wssArbkgpMfcNE+xfnvoLYfV9PCJ+exVDbH2GGOiJg+8i225jm
	TXrvPtiPbfYZfVe9lyOiFVM9+axiru/B7si0qI3irBlHPUREtddi78hxAm5YeVucw6yDrTm4ixWS
	YWIo3iDqxvNn8MbZthuT4+4kCRJrTVMx94nWehl3nu5T69iXWSkq1I5au9rb1RTd+tiBnRNHtuL9
	OgWfw6nIoDr0sXUZ7YZoZ/GZ+rGD/6nZmOk2cVWGlu5QCx1n9GVTW/nW9eNoe80Npm9ie1EE4yqQ
	1EI/t9VtuH+6oaqVacn61CQ/Ue9T33jTf6hz97WtUuwtFHN49xvqVUOJHP0P7/2hK3mNSshpZeN0
	9AgIZKoMflnGoIJfIRts3DLpwyKIfeLPAW77HB1WFnJfkvmDabwMIaBQcfGfp7qACvNfk0jfurgA
	7uQmurDZBp4iwejqMrJzOReiOOuj8NH8IRFsicyJMEhQFtD8PLoinidBLpGJB9PkMIE5LxkXian5
	DiTPFKcI3WL9qDK1bCxu93CBYYrlJQ2RYdVX9Lwn6g3a/FwOUc6StMtCV3AnZ0bMnGw93Ke7jfGo
	coiXh3BDMS+4ayUpOtEhdxekWDmK9g==
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
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 May 2015 14:03:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFJust tried that. Change the SRCREV of the module, and ran
bitbake-whatchanged kernel-module-dyplo

Then it claims nothing changed:
$ bitbake-whatchanged kernel-module-dyplo
Figuring out the STAMPS_DIR ...
Generating the new stamps ... (need several minutes)

=3D=3D=3D Summary: (0 changed, 0 unchanged)
Newly added: 0
PV changed: 0
PR changed: 0
Dependencies changed: 0


But if I run bitbake -n kernel-module-dyplo, it really wants to rebuild the=
=20
kernel and module.

I'm merged oe-core master last monday, so it's pretty recent.


On 06-05-15 12:35, Burton, Ross wrote:
>
> On 6 May 2015 at 07:35, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     If I change a recipe for a kernel module (a bb recipe that does "inhe=
rit
>     module") this will trigger a rebuild of the whole kernel.
>
>
> You can start to debug this by using bitbake-whatchanged. Build the kerne=
l and
> modules, make a minor change to the module recipe, and then run
> "bitbake-whatchanged virtual/kernel" or some relevant target.
>
> Ross



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






