Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnAse-0001Wu-13
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:23:24 +0100
Received: by wibhi8 with SMTP id hi8so458799wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 07:15:47 -0800 (PST)
Received: by 10.180.105.129 with SMTP id gm1mr27511275wib.1.1326813347159;
	Tue, 17 Jan 2012 07:15:47 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm45039307wib.0.2012.01.17.07.15.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 07:15:46 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1326812944.3467.46.camel@lenny>
Date: Tue, 17 Jan 2012 16:15:41 +0100
Message-Id: <A8AC9321-01FF-453C-8A29-2113071122FB@dominion.thruhere.net>
References: <1326651241.9066.0.camel@lenny> <4F13A366.1010807@linux.intel.com>
	<1326812944.3467.46.camel@lenny>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 15:23:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 jan. 2012, om 16:09 heeft Colin Walters het volgende geschreven:

> On Sun, 2012-01-15 at 20:11 -0800, Saul Wold wrote:
>> On 01/15/2012 10:13 AM, Colin Walters wrote:
>>> See attached.
>>>=20
>>>=20
>> The current version is 2.4.2 and this requires a PR bump.
>=20
> Hm, do you want a new patch that bumps the PR?  What are the rules for
> when a PR should be incremented?
>=20
>> Also, can you use "git send-email" directly instead of sending the =
patch=20
>> as an attachment, when sent that way, it requires extra steps to edit=20=

>> the file before applying.
>=20
> Ah...the problem is that I'd have to teach git-send-email how to
> authenticate to my mail server which isn't trivial.  Would a workflow
> where I paste the patch inline (thus creating whitespace damage), but
> also link to my github mirror work?  Let's try it with a new patch:
>=20
> =
https://github.com/cgwalters/poky/commit/0255ac2e95bb5230f7fdf1b861be0b97b=
01f2ecf

FWIW =
http://cgit.openembedded.org/openembedded-core/commit/?id=3De1312eef88cb0f=
3f1557d431f0b31520b2a9968e attempts to fix that, but your solution is =
cleaner=


