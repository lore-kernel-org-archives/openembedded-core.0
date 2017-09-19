Return-Path: <prvs=043542d3a3=mike.looijmans@topicproducts.com>
Received: from mx18-out11.antispamcloud.com (mx18-out11.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9F6781EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:59:05 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1duB8N-0003ee-Fe; Tue, 19 Sep 2017 07:31:48 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Sep 2017 07:31:39 +0200
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <41991e1f-0bae-50be-64ef-1cc12a52e860@topic.nl>
Date: Tue, 19 Sep 2017 07:31:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: PqwsvolAWURa0gwxuN3S5YEa3T7JuZT23fGO2rGt3ZgWMD8gia7lRmdoHJ3n0cm6Vtfp9X1ZBchZ
	wvx8a7dTUQWF0kx98HH3GX+iQK7NiP6LBDMrD7q/cJogwbqzsuokIXMJ1U4MKKnQ5SAJ1V9dkP9x
	bu57BDazLmklZgT7xzbWyXVbvklPlspgKC9K9pItE4W6kulFa2ZPl22uLthKLqlfaq+DBrVoVRzW
	R8TkUBA8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFi3RmQe2WJ
	u3l9j65JLwZUXc27xUWaMJW0NsP7xHsVGijfLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+EE+rDN/FnSl88wIa35p4FFXznVNpEBSRM
	35KuCE6M5jOyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC4K
	XP3vTB7AsR5+kaiIjlO6Iw9C0PQ5NLyrXuzfSqvsyZk5KK9j8Gtxt95LhxB7PEV8JmFmLZ6h3eau
	qEcwyeT0VZvJGSxm4bcH1lFUB/zPeGsnJ395jBJAgljEd2a/UHQV6Xe4bIYRHe1fiVaECIfGCs+d
	m3T5GTMS0IoMjuD73NkW0hXdwXAcFMPC3HLevdActK1VbuIevEZIZ0xtO4rEaQGbLq9rO8Lk9XxG
	ahlHJvBmp7b2o56FN7idGT/O/c6h4ydtLpBIPpVH//OBdHPT9aGjYWPj2AXTYuXa2eEyw0n3W9/O
	QA7BdYo720jcIElWlO+cBxz1RcrEOyT4v/nxwIZc0S/gjKcitM24zeyaFw==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Tue, 19 Sep 2017 05:59:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 18-09-17 21:19, Burton, Ross wrote:
> On 18 September 2017 at 20:01, Andre McCurdy <armccurdy@gmail.com=20
> <mailto:armccurdy@gmail.com>> wrote:
>=20
>      > The question is does it do something useful *now*?
>=20
>     I don't have a board with a serial console to test at the moment.
>     Busybox hasn't changed in recent memory though, so as long as the
>     resize command does actually get run I presume it's still going to
>     work.
>=20
>=20
> Re-read the code.  There's a call to ioctl with TIOCSWINSZ which I'm=20
> *guessing* is set window size.  Google is not useful for this!  It does a=
ll=20
> this on stderr.
>=20

Google on TIOCSWINSZ yields:
https://linux.die.net/man/4/tty_ioctl

TIOCSWINSZ
const struct winsize *argp
     Set window size.

Of course, there is no explanation on what a "set window size" is supposed =
to=20
accomplish on the terminal device.


> So yes it *should* work, but not if you redirect stderr to /dev/null.

Yep.


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




