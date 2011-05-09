Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJKfU-0004Hf-59
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:14:12 +0200
Received: by wwb17 with SMTP id 17so4419078wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 00:11:28 -0700 (PDT)
Received: by 10.227.43.9 with SMTP id u9mr6629470wbe.74.1304925087932;
	Mon, 09 May 2011 00:11:27 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id t16sm2550488wbg.6.2011.05.09.00.11.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 00:11:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DC636EB.6080809@gmail.com>
Date: Mon, 9 May 2011 09:11:16 +0200
Message-Id: <251372F6-8F97-44DF-9F1A-432B84248191@dominion.thruhere.net>
References: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
	<1304787012.8459.1.camel@doubt> <4DC636EB.6080809@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Mon, 09 May 2011 07:14:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mei 2011, om 08:23 heeft Khem Raj het volgende geschreven:

> On 5/7/2011 9:50 AM, Darren Hart wrote:
>> According to my discussion with RP, bb.note() is supposed to appear =
on
>> the console. If it doesn't, that is a bug in bitbake, not the recipe
>=20
> it does if we increase verbosity but it also dumps a lot of other =
information along. Default is to print errors and warnings which seems a =
sane default to me. May be there is another level which dumps notes on
> top and then as you increase the level you get more info dumped would =
be
> a good to have

I still think that all unpackaged files are a bug, so it's more than a =
note anyway.

regards,

Koen

>=20
>> logging. I used this information to document the intended use of the
>> similarly named bbnote() in logging.bbclass.
>>=20
>> --
>> Darren
>>=20
>> On Fri, 2011-05-06 at 16:48 +0200, Koen Kooi wrote:
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>> ---
>>>  meta/classes/package.bbclass |    4 ++--
>>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/classes/package.bbclass =
b/meta/classes/package.bbclass
>>> index e6b3df7..082f233 100644
>>> --- a/meta/classes/package.bbclass
>>> +++ b/meta/classes/package.bbclass
>>> @@ -676,9 +676,9 @@ python populate_packages () {
>>>  				unshipped.append(path)
>>>=20
>>>  	if unshipped !=3D []:
>>> -		bb.note("the following files were installed but not =
shipped in any package:")
>>> +		bb.warn("the following files were installed but not =
shipped in any package:")
>>>  		for f in unshipped:
>>> -			bb.note("  " + f)
>>> +			bb.warn("  " + f)
>>>=20
>>>  	bb.build.exec_func("package_name_hook", d)
>>>=20
>>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



