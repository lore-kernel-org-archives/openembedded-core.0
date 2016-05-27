Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 10696 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 May 2016 16:19:21 UTC
Received: from mx6-12.smtp.antispamcloud.com (mx6-12.smtp.antispamcloud.com
	[95.211.2.203])
	by mail.openembedded.org (Postfix) with ESMTP id 6626A76651
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 16:19:21 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1b6HhG-0008Qz-CL for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2016 15:21:05 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 May 2016 15:21:01 +0200
To: <openembedded-core@lists.openembedded.org>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
	<9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
	<51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <574849BD.1080304@topic.nl>
Date: Fri, 27 May 2016 15:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtWU2yOX8PQJGjCrFTzGoLEGPGJhHBOWqgEeWHQHvZlYrNdFue+uM0F3+2X/
	7qwGSYQccBIk1Sag4dKiqCrF8eZZT/hdFFgBT9ea6XfhiStFUv0vp5jSjOOm60a9gEPheCAX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDmT8QCc9ZpOAxSvIJNEAP1O4I2wVTs
	obDkZgzKyHvXxNy0HPTmuB9/GAQDSlCp43waKXvNWrRcSD72jROfhu6vZJ0Q4x+0GOxZvoENDONK
	wZkjGlUCvU6ZAmJB8zrNH9BlxMWrrEY4M+w4AQhbqSGAGfxNlhQyZmS3TgLw2A6IYs0s+nIXtFtu
	niKDu14+J4FMbYOEJdE462Jlg4EydpQqASJFC/49WOPBr5nlEUI4xPEUX7GJGdZmen72biiqO9Oq
	N9fYDrB2r0jp9PaW3IvC12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.08)
X-Recommended-Action: accept
Subject: Re: [PATCH 28/45] swig: move to Python 3
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
X-List-Received-Date: Fri, 27 May 2016 16:19:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 25-05-16 14:45, alexander.kanavin@linux.intel.com wrote:
>> I'm trying to get my head around how this change will impact python2
>> based programs that use swig, such as gnuradio.
>>
>> Does this mean all programs that use swig will need to move to python3
>> now?
>
> Probably. At least nothing in meta-oe or oe-core was impacted by this, as
> far as I see, but if GNU radio isn't building properly anymore, then
> copy-paste the error, and we'll work out a solution.

This probably means that projects using Python 2 extensively will be forced=
 to=20
either "freeze" the OE version to the state before the transition or attemp=
t=20
to maintain a "python-2" fork.




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






