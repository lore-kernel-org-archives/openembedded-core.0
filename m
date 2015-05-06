Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-out9.antispamcloud.com (mx12-out9.antispamcloud.com
	[46.165.232.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5336AC3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 12:19:53 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1YpyIl-0007qe-Ol; Wed, 06 May 2015 14:19:53 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 6 May 2015 14:20:27 +0200
Message-ID: <554A06E2.5000209@topic.nl>
Date: Wed, 6 May 2015 14:19:46 +0200
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
	TXrvPthW7evo9kz3ZxxzWOeUk3oRWNlFfdqIJpPksO0sjyzwlddi78hxAm5YeVucw6yDrTm4ixWS
	YWIo3iDqxvNn8MbZthuT4+4kCRJrTVMx94nWehl3nu5T69iXWSkq1I5au9rb1RTd+tiBnRNHtuL9
	OgWfw6nIoDr0sXUZ7YZoZ/GZ+rGD/6nZmOk2cVWGlu5QCx1n9GVTW/nW9eNoe80Npm9ie1EE4yqQ
	1EI/t9VtuH+6oaqVacn61CQ/Ue9T33jTf6hz97WtUuwtFHN49xvqVUOJHP0P7/2hK3mNSshpZeN0
	9AgIZKoMflnGoIJfIRts3DLpwyKIfeLPAW77HB1WFnJfkvmDabwMIaBQcfGfp7qACvNfk0jfurgA
	7uQmurDZBp4+4WVp3Bi2AxwW1Vk8PM99mdySlZou9qHIGOZDEEo7Owyml24JV/6L2aTlbKTCu0+m
	7xlmBpwM8IMvSgRXEoM2YvGXmh7MzEsNWW1Oluoymw3a/FwOUc6StMtCV3AnZ0bMnGw93Ke7jfGo
	coiXh3BDMS+4ayUpOtEhdxekWDmK9g==
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
X-List-Received-Date: Wed, 06 May 2015 12:19:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06-05-15 12:35, Burton, Ross wrote:
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

I tried the command "bitbake -S printdiff virtual/kernel" instead, which ga=
ve=20
the following output:


The differences between the current build and any cached tasks start at the=
=20
following tasks:
/home/mike/projects/zynq-platform/meta-zynq/recipes-kernel/linux-zynq/linux=
-topic.bb,=20
do_rm_work_all
NOTE: Reparsing files to collect dependency data
Writing locked sigs to /home/mike/projects/zynq-platform/build/locked-sigs.=
inc

Task linux-topic:do_rm_work_all couldn't be used from the cache because:
   We need hash ab23ed87f933003f95ca7bab4d70c1dc, closest matching task was=
=20
99f675e6d7f7eed1bb5c3f2391e8a581
   Hash for dependent task readlinereadline_6.3.bb.do_rm_work:virtual:nativ=
e=20
changed from cc2e3667e52d154d8c9db7cb06ba2515 to de357460cfaed520424e5d7762=
713df0
   Unable to find matching sigdata for=20
virtual:native:/home/mike/projects/zynq-platform/oe-core/meta/recipes-core/=
readline/readline_6.3.bb.do_rm_work=20
with hashes cc2e3667e52d154d8c9db7cb06ba2515 or de357460cfaed520424e5d77627=
13df0



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






