Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoI7Z-0007PF-Q7
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:51:41 +0200
Received: by eaal1 with SMTP id l1so4162671eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KIFWq/AOdJYm0bHE1m9n7f1naATeP7HfMn+7ER8WYCo=;
	b=McINTqAkqUoihpgUqjr1rTfev69APOQM833aASwCFGX0IcPIKp8raAH8yDSUgaa3gJ
	saybzbiVcKP4KoR/zU1FR0L/fMnbmywclEcKrpREpr2wtkB7H3iqNBoQ7wZMbnnhVFwp
	dCOCt8/q/cHk5f7qIFuxW4utNra205LzOMC0qhWBfFD5lFa611nWHOWJUi+E+P+bFcEC
	LabNAu2W2Ozl011zaXmWtGqdZLzR65BwhR/gpoqNPx2hudj7zyqoMf919chE7GZ2zEYV
	lyvFyfS9bGnMAP4+KaN8ZodW/AULJB9AIrj5hBjDOne3NAuSbE9+VUme95bZDgg6OB2i
	1IzQ==
Received: by 10.14.99.201 with SMTP id x49mr8111202eef.142.1341855632242; Mon,
	09 Jul 2012 10:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 10:40:02 -0700 (PDT)
In-Reply-To: <1341853247.8066.36.camel@ted>
References: <alpine.DEB.2.02.1207070649530.18262@oneiric>
	<CAK18fxGjWFXQ4C40QgmCnk5G3PucaN4JzDAsDhMb4m6+pxNxzg@mail.gmail.com>
	<1341853247.8066.36.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 10:40:02 -0700
Message-ID: <CAMKF1sq+DNviuMJ+ovOPTEO1Qzpg3HhE93UdKKbeq8W_JnadAA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: tcf-agent, matchbox-wm-2: Correct "proto=git" to "protocol=git".
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
X-List-Received-Date: Mon, 09 Jul 2012 17:51:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 10:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-07-09 at 12:27 +0300, Andrei Gherzan wrote:
>> On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day
>> <rpjday@crashcourse.ca> wrote:
>>
>>         "proto=git" is not a valid parameter for the git fetcher.
>>
>> NOTE: package matchbox-wm-2-0.1+git1
>> +01fa5465743c9ee43d040350f4405d35293e4869-r1: task do_fetch:
>> Succeeded
>>
>> Anyway, in the git.py, code is searching for "protocol" parameter:
>> ud.proto = ud.parm['protocol']
>>
>> ... so your change seems legit.
>>
>> On another hand, svn.py is using:
>>  proto = ud.parm.get('proto', 'svn')
>>
>> A good think would be to use the same parameter names for all
>> protocols.
>>
> I agree but how do we do this without breaking the world? We probably
> should try and standardise it, probably to "protocol".

so may be change the keyword to protocol and have both for this
release additionally give a deprecation warning on proto and then
after 1.3 remove proto


