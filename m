Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBVP5-0003p2-IP
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Apr 2011 19:04:55 +0200
Received: by wye20 with SMTP id 20so3744592wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Apr 2011 10:02:32 -0700 (PDT)
Received: by 10.216.5.194 with SMTP id 44mr14876wel.55.1303059752370;
	Sun, 17 Apr 2011 10:02:32 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p5sm2771104wbg.62.2011.04.17.10.02.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Apr 2011 10:02:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DAAEAA2.6040103@mlbassoc.com>
Date: Sun, 17 Apr 2011 19:02:29 +0200
Message-Id: <87BDD358-033C-427E-8DB7-C13D969FA66E@dominion.thruhere.net>
References: <cover.1302936483.git.sgw@linux.intel.com>	<4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>	<5098B0B9-2B87-4BC4-AE7E-34900FAEEFD8@dominion.thruhere.net>
	<A377F56D-F244-4BBE-8004-37CCCB477F26@dominion.thruhere.net>
	<4DAA0D9E.80901@linux.intel.com> <4DAAEAA2.6040103@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.1084)
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 47/58] setuptools: Make options for setup.py more flexible
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
X-List-Received-Date: Sun, 17 Apr 2011 17:04:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr 2011, om 15:26 heeft Gary Thomas het volgende geschreven:

> On 04/16/2011 03:43 PM, Saul Wold wrote:
>> On 04/16/2011 12:46 PM, Koen Kooi wrote:
>>> furthermore both distutils and setuptools use the classes in =
sysroot, so the 'some versions' part of the argument is bogus.
>>>=20
>> Koen,
>>=20
>> Thanks, I guess missed your comments on this issue, thanks for =
pointing them out.
>>=20
>> Richard: Please disregard this patch.
>=20
> Fair enough & indeed, using distutils does work for this package.  My =
follow up question would
> be why are there two seemingly identical classes?

Because python people suck at agreeing on buildsystems.

>  Just looking at a Python package which has
> a 'setup.py' file, how can one one which to use and why??

That is an excellent questions! I sadly have no good answer to that :( =
Figuring out the problem your patch was trying to solve took me about 3 =
weeks. I started using it as a smoke test to see if it's setuptools or =
not. Usually you can get away with using distutils everywhere, but =
sometimes you really need setuptools. My workflow:

try setuptools, if that fails:
try distutils, if that fails:
tell people to stop using that python module

regards,

Koen=


