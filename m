Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-out14.antispamcloud.com (mx6-out14.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id E702A7322D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:13:18 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Yx937-0008O7-1T; Tue, 26 May 2015 09:13:19 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 26 May 2015 09:13:45 +0200
Message-ID: <55641D0C.5020408@topic.nl>
Date: Tue, 26 May 2015 09:13:16 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <55641868.1080406@topic.nl>
	<CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>
In-Reply-To: <CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw5QQPRw4IhVOMwzWXgsd365Fz/fbPx+t55bJJwV1f3ggm9sTnd4gnnvBfIIwsV2ywq8g
	ejvs5mxBUzg3jVOf3vvmP3xMDswqyQ6mQ6XwvGLsuJVCkJk9TlVS86xgAgZafbHqj5fcgWKFi0cp
	Vjs6qIvg/E0IoWeW6m7zZ2unNX2ZKF64I3KNSe1+si/hz4Rp1CG7X+t1TW39Ja77LGPpOwDOjyd3
	oGE1tEOqXHYvZIk4yBUEDKaxNZhQ5w2b7VrnnPRMPeCzA4fvS0eXZ3J8iZshEWyJzIkwSFAW0Pw8
	uiKeJ9eX2UhoCOjofuIFDReRUAFSU+YtS5ujHPpGDgHLmNg7cwe96RgJ9LTG/qMdWsI692PNDpgL
	sd6Ddd/s7VM53o6ccHCldH+5aCvCLfmaIvz3uFL8N7VKh/CG+lj0Rj1mjuG3OyA90NHVTFoNkTji
	gYIHzgrL8il3sV0dVRVXzjqRVYKU9W9tbmVXJBqdHHDmlFyaiSgCQQ1OadeU0o3KJDNLKZUH8kQv
	CzH7IKj6sa/ualLqdVKZ7M4MLatihdWgAi1tftfjOchxjqEU2Rrq/h4D4HsdV7EXqt9Tb4r+2qWN
	NMsEGomciMSNP+kQUAg0NcOuoWwNJV/UejZysXKtExgD/FVEY7v4laIdTJ8d+KC4ixWSYWIo3iDq
	xvNn8MbZG8FV/fQARVcG5/WF9EqvuQ==
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
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00771043108187)
X-Recommended-Action: accept
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Tue, 26 May 2015 07:13:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 26-05-15 09:02, Bruce Ashfield wrote:
> On Tue, May 26, 2015 at 2:53 AM, Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>> I get this when running
>> bitbake -c menuconfig virtual/kernel
>>
>> scripts/kconfig/mconf.o: In function `show_help':
>> mconf.c:(.text+0x884): undefined reference to `stdscr'
>> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
>> checklist.c:(.text+0x2c): undefined reference to `wmove'
>> checklist.c:(.text+0x4c): undefined reference to `acs_map'
>> checklist.c:(.text+0x54): undefined reference to `waddch'
>> checklist.c:(.text+0x66): undefined reference to `waddnstr'
>> checklist.c:(.text+0x76): undefined reference to `wmove'
>
> This has popped up on and off for several years now, and we have a few bu=
gzilla
> entries that track it. The fix is never as simple as we would like.
>
> The most recent version is here:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7609
>
> If you have more details about your enviroment, adding them to that bug w=
ould
> be idea.
>
> The problem with using the -native version, or the host, is that at times=
 menu
> config is rendered unusable. The fix isn't only in the dependencies, but =
in the
> way that menuconfig is build within the kernel environment.
>
> This older bug tracks the details of that:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3898

I have an Ubuntu 14 system. The weird thing is, that I have several almost=
=20
identical machines, and some of them fail and some don't.

This one works fine:
MACHINE=3Dtopic-miami-florida-med-xc7z030

This one fails:
MACHINE=3Dtopic-miami-florida-gen-xc7z030

They all use the same kernel recipe, version, git tag, etc. These two even=
=20
share the very same defconfig. Their builds run within the same OE=20
environment, so the native sysroot for both is the same too!


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






