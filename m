Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rl1kr-0002Lx-8G
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 18:14:29 +0100
Received: by werm13 with SMTP id m13so779117wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 09:06:59 -0800 (PST)
Received: by 10.216.209.99 with SMTP id r77mr11536051weo.25.1326301617785;
	Wed, 11 Jan 2012 09:06:57 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a6sm4957118wiy.6.2012.01.11.09.06.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jan 2012 09:06:56 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F0DBCBC.2070007@linux.intel.com>
Date: Wed, 11 Jan 2012 18:07:00 +0100
Message-Id: <21E1FD3C-5539-48E3-8F4F-48600B33A0AA@dominion.thruhere.net>
References: <cover.1326267271.git.sgw@linux.intel.com>
	<1326278405.23315.16.camel@ted> <4F0DBCBC.2070007@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 0/5] final items for M2 RC1
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
X-List-Received-Date: Wed, 11 Jan 2012 17:14:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jan. 2012, om 17:45 heeft Saul Wold het volgende geschreven:

> On 01/11/2012 02:40 AM, Richard Purdie wrote:
>> On Tue, 2012-01-10 at 23:36 -0800, Saul Wold wrote:
>>> Richard,
>>>=20
>>> Here are the final items we discussed yesterday, a succesful
>>> build finished, and we seem to be in good shape, please pull
>>> these early in your day and fire up AB Master is you can.
>>>=20
>>>=20
>>> Thanks
>>> 	Sau!
>>>=20
>>>=20
>>> The following changes since commit =
9b944ae2f0e4dbac5a8f1f235f60730e56b26516:
>>>=20
>>>   Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" =
(2012-01-10 18:32:16 +0000)
>>>=20
>>> are available in the git repository at:
>>>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>>   =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Ds=
gw/stage
>>>=20
>>> Lianhao Lu (2):
>>>   meta/PRService: Added export/import fuctions.
>>>   package.bbclass: per recipe PRSERV_HOST support
>>>=20
>>> Robert Yang (2):
>>>   Incremental rpm image generation
>>>   Incremental rpm image generation(Add config sample)
>>=20
>> I merged these, thanks.
>>=20
>>> Shane Wang (1):
>>>   hdparm: upgrade to 9.37
>>=20
>> This one needs to be split up as Paul points out...
>>=20
> Ok, but one question about bisect-ability, if they are split and the =
hdparm is in one side of a bisect without the new stat package, doesn't =
that break the bisect ability "rule"?

That's why you add the stat recipe first.=


