Return-Path: <prvs=0434129fea=mike.looijmans@topicproducts.com>
Received: from mx18-out11.antispamcloud.com (mx18-out11.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id 138D97017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:56:30 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx36.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dtwXF-00029w-Qp for openembedded-core@lists.openembedded.org;
	Mon, 18 Sep 2017 15:56:31 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 Sep 2017 15:56:25 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
Date: Mon, 18 Sep 2017 15:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
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
	bu57BDazLmklZgT7xzZt2amH46NiYxrS5L0MPQ5dX00HWCPjH4oz1Jj3dvfpdqGUb0uIIIma56yU
	zOQTdtE8CVsONrMJuGzuoGnKTKcygLJjfy2/hUPxxGqITycuLMdYaphGvYopQ24KJ9kgRDN3pbXn
	aMbbC1QSUBxihEsjBWOBqoptsYkcljagCMIDypReAQCFQo+KUtaSCrVTlxOfVsst/QEVbupaaYfx
	KYRJ8ar4sO9kYmr7/nmchPR9G2DCX9m2p4wUnZpURALMKaPBcC9OMLR/g2nFXNsLRUFij8tkcCDb
	oWjK7lZKUpeltKZtQVD0uw3KBHgQpbpmFOjfLM7Ww0jFUCG51FTiiz6cR64dodD7udB+zcx8OjSt
	1b1YgBvhxKfoFZHs3o0j+S0jv2y8/jlUqm+TeNrMp4+ELPEFZYtMs12E7S2armNREV9l1/WyLBg0
	mKuTgAEprJGyxQgNyqqf/IN48z1lpo6ODRmiSLYXQoEVxAAhr5KC2/vg7iEFLP+SSY+Av5+AiC6o
	tvvT0zpP7e2MS5aRnzFrsVfUC9zgFeLdrJcq4pzDeNfWD9fsZnG5OzJva0ief5zgm2M8nhHp+3/+
	WJ/XJiksqOOz7IUQtphxWIUbM+lycZ4p8ZaiLmU7c9qpkE1nyDAp5rzhvK/7I0skCS9fM9zdV9ZW
	cxhW69nWcO1mr8OzhbuOuDxT2L0COkTss8Eg3T4ED0EFqCmwiC2YFqGZdSve1H7weiNNcncHpm6i
	rl/DyTO9VSrmPxAQvU9ts6ddYuIxL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Mon, 18 Sep 2017 13:56:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 18-09-17 15:24, Mike Looijmans wrote:
> On 18-09-17 15:08, Burton, Ross wrote:
>> On 18 September 2017 at 12:31, Mike Looijmans <mike.looijmans@topic.nl=20
>> <mailto:mike.looijmans@topic.nl>> wrote:
>>
>>         This is basically the same change as I first sent a patch for in
>>         April, and
>>         last pinged this Friday... The only real difference is that this=
 one
>>         misses
>>         passing error output from resize to /dev/null (which it should d=
o to
>>         handle
>>         the case where tty exists, but resize does not).
>>
>>
>>     Yeah, indeed.
>>
>>
>> Apologies for missing that patch!
>>
>>     Other problem is that "resize" outputs shell script on stdout to be
>>     executed, so the proper "total" invokation would be:
>>
>>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
>>
>>     The "eval" part is missing in your version...
>>
>>
>> Who is going to submit the One True patch with all the fixes in?  I prom=
ise=20
>> to merge it.
>=20
> I'll send the one ring, eh, patch, in a few minutes. I'll merge the two i=
nto a=20
> single as well.

On second thought, just use Peter's patch "as is".

I've been experimenting with the "eval" part and it doesn't behave well. Te=
nds=20
to confuse minicom, create garbage, and in particular when run from "profil=
e",=20
it seems to result in counterproductive COLUMNS=3D0 and LINES=3D0.

I'm actually wondering why the call to "resize" is being done at all. Just=
=20
calling "resize" has no effect, since it outputs the results on stdout as=20
shell script, and that is being discarded. Looking at the commit that=20
introduced it:

cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)

that already has no effect whatsoever. See the man page for resize:
https://linux.die.net/man/1/resize

I also would consider running some program's output as shell script a bit=20
spooky, it looks like a security hole waiting to be exploited.



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




