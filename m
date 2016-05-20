Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 22971 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 May 2016 16:23:30 UTC
Received: from mx18-13.smtp.antispamcloud.com (mx18-13.smtp.antispamcloud.com
	[207.244.64.182])
	by mail.openembedded.org (Postfix) with ESMTP id 21C7D60017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 16:23:30 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1b3hEQ-0004wA-1x for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2016 12:00:37 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 May 2016 12:00:29 +0200
To: <openembedded-core@lists.openembedded.org>
References: <573C0726.3040402@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <573EE039.5090105@topic.nl>
Date: Fri, 20 May 2016 12:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <573C0726.3040402@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtWU2yOX8PQJGjCrFTzGoLEGPGJhHBOWqgEeWHQHvZlYrE8Jp/sy7UlBbu8M
	rhKAnTkccBIk1Sag4dKiqCrF8eZZT/hdFFgBT9ea6XfhiStFUv0vp5jSjOOm60a9gEPheCAX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDmT8QCc9ZpOAxSvIJNEAP1O4I2wVTs
	obDkZgzKyHvXxNy0HPTmuB9/GAQDSlCp43waKXvNWrRcSD72jROfhu6vZJ0Q4x+0GOxZvoENDONK
	wZkjGlUCvU6ZAmJB8zrNH9BlxMWrrEY4M+w4AQhbqSGAGfxNlhQyZmS3TgLw2A6IYgdC9se+MNHk
	jshBwgzJJethcIWmrxicQkxvc9w0CTELrSOIPpeqwlm2NDGXIJ2x7Opa2SkkYzcuWYWzkB2QTpUh
	sTbOm0n23gAH4LW5RBSd12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
Subject: Re: PRServer's problem
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
X-List-Received-Date: Fri, 20 May 2016 16:23:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFIn addition, the introduction of PR server also increased the load=
 on the=20
OpenPLi "feed" servers with a few terabytes per month. Luckily, bandwidth i=
s=20
cheap nowadays :)

On 18-05-16 08:09, Robert Yang wrote:
> The PRServer bumps PR according to do_package's task hash, that
> causes it bumps *all* packages' PR when recipes like pseudo-native
> and rpm-native is changed. It is a very bad user experience when we
> run "smart/opkg upgrade" on running target, for example, when we apply
> a CVE patch to pseudo-native or rpm-native, or do some slight changes
> in their do_compile, "smart/opkg upgrade" will download/install *all*
> the packages since all of the packages' PR are bumped.
>
> Here are some rough suggestions to fix this problem, and please feel
> free to give your suggestions.
> 1) Do not use do_package's task for bumping PR, the easiest way
>     is simulate manually bump PR -- only bump PR when the recipe
>     itself's checksum is changed.
>
> 2) Add a new task for PRServer, redefine its task hash for bumping
>     PR, for example, this task hash only considers RDEPENDS (no
>     DEPENDS), and drop any native dependencies.
>
> I prefer the first way, and an alternative way maybe add a var so that
> the user can configure it:
> PR_CHECKSUM =3D "${BB_TASKHASH}" (current way)
> Or
> PR_CHECKSUM =3D "<recipe checksum>"
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






