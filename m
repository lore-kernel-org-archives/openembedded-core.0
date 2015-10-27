Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-05.smtp.antispamcloud.com (mx6-05.smtp.antispamcloud.com
	[95.211.2.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F058755F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:30:34 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZqzeB-0002Mp-E8; Tue, 27 Oct 2015 09:30:33 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 27 Oct 2015 09:29:10 +0100
To: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>,
	<openembedded-core@lists.openembedded.org>
References: <20151026151307.GA16394@deadlock.dhs.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <562F3615.8040907@topic.nl>
Date: Tue, 27 Oct 2015 09:30:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20151026151307.GA16394@deadlock.dhs.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw2b4JrXPy6/bMqmNesZXSHDhcQdEuTxqpK2WBlBljYFxIiL8jpVorCDRyRz8s+N1dwYH
	6+C4wCQ+Wzm9DzluoY4kzW+lLm5fs3AP07hCrxG0G/45LuYWJsWNKzGzAznZ/oq+Kj8XsfH6M1iC
	r9Pl7cTsYlvFccfyefK3rf6//Zz3TmXIsgwsHEGBU3qhW0Osz84CxdOlMbYC7Cyh0TS8wxz2fsmK
	inR3OUlIyA/09h1V5YE5enyccp7RH4WQio3uGcdGxQ6d5hivGO7oPpIBNraJdlCnvQ+khpxZdnh3
	Rg+eq6FYx9JcxaWalMnLitersBpW6anL7tC8sZz8vH3+AmVuDfHvHcz98qdqfyBu7+vBXgEv6IcZ
	yhgDwEXM/y2dENLMQ7BHiJbu58xrnlvfsHxFpVkKCyND7N5gKvIbHYAyNC21jdz1tZu80T3nzSSG
	Qf9qwM7RXpJS8RjTdyh2j5Bl3tVk0zvXhIncNpb4rh9W1mAshzxi/pH8tL+eoCWzQJqOK2s30lVp
	LO7zSzcHnUsSYuA67lhZAkD3Jep4WLi4dpEz9Gwe39F7zwtl+PHiqBqZR3KVQgqF/fPYYAfEfsh2
	09d1vs84nVIeSXSCzP2kdHa+JbJzvTaeZjZqn02HJltENAqPiFTVkXlpuZ1TdQ9cdH2/qKNtBIzq
	TOCSOTIm
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
Subject: Re: Problem with RDEPENDS in multimachine builds for allarch packages
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
X-List-Received-Date: Tue, 27 Oct 2015 08:30:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 26-10-15 16:13, Sergey 'Jin' Bostandzhyan wrote:
> Hi,
>
> I recently ran into a problem that I described here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8578 and while debugg=
ing
> this issue an other problem came to light.
>
> I have a multimachine configuration (armv5/imx6) and the same distro for =
both
> of them (poky 2.0 RC based).
>
> I have some allarch packages which have no DEPENDS, however which have an
> RDEPENDS_${PN} setting.
>
> I can see that even though there were no changes to the recipe itself and
> also no changes to the recipes listed in RDEPENDS, my recipe still gets
> rebuilt each time.
>
> What we tried:
>
> <bluelightning> so cleansstate the recipe, change machine, cleansstate ag=
ain,
>                  then build it, then change machine, build it again and n=
ote
>                  the first task that executes
>
> The logs for these steps, one with RDEPENDS and one without are at the en=
d of
> this mail. I can see that with present RDEPENDS "real" tasks get executed
> even though no changes occured in the recipe; this is not the case when I
> drop RDEPENDS.
>
> Is this a bug or is this just something that needs to be documented?

I think it's the same problem as described here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/70070/focus=
=3D70072

> What is the "desired" behaviour?

Apparently, this needless rebuilding is "desired".



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

Visit us at : Aerospace Electrical Systems Expo Europe which will be held f=
rom 17.11.2015 till 19.11.2015, Findorffstrasse 101 Bremen, Germany, Hall 5=
, stand number C65
http://www.aesexpo.eu



