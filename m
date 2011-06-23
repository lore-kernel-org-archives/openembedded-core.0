Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZfWH-0000Tn-BS
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 10:44:14 +0200
Received: by pzk36 with SMTP id 36so1183669pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 01:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Be/HzUDmwDyY6V7RXbPQklLjH3znyLek2xi4iEFy1ow=;
	b=Nt4ZzgZeRmJil5UJ9CHr9d8wfNSRNOUaMFyVZ1nUrTlVpOhGDtegu3FjYYWSXkKgW8
	4hGcbClxGLlUTwcR+R8MiDCUKuC9ZDdPc8cJRItclysHRsuiH8lp+eZ9JOeP1aZohGcP
	NiDUAtC3AICuZTPpLqjekz2Wu2rP/nyz9y2kw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Nba5LdkKWUhTpu0bkAnIXJnk56RNdnpHLJjm9EneIG2sj7AJsvTKQaCW0ELFr380pC
	IAa2p1m4jm9ewc48bTBzbQ4xTbMVNff+629K1k2e/845ZbwrbaW7vljGMi2S9Bg58+Qr
	1KyRq7TJfTIytlzn9X7OSD40CTTL4ehmyFg1A=
Received: by 10.68.43.227 with SMTP id z3mr1010563pbl.160.1308818436081; Thu,
	23 Jun 2011 01:40:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Thu, 23 Jun 2011 01:40:06 -0700 (PDT)
In-Reply-To: <C48D1426-0755-45BC-B4E8-011677F3B11A@dominion.thruhere.net>
References: <cover.1308706692.git.raj.khem@gmail.com>
	<1308758420.20015.82.camel@rex>
	<C48D1426-0755-45BC-B4E8-011677F3B11A@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jun 2011 01:40:06 -0700
Message-ID: <BANLkTik+gq5Pyc_UUmdBiHksJDSiwsTPiQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Thu, 23 Jun 2011 08:44:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 9:08 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 22 jun 2011, om 18:00 heeft Richard Purdie het volgende geschreven:
>
>> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
>>> changes since V1
>>>
>>> Separate out non gcc changes to a different pull request
>>> Patches are not attached inline due to sheer size of them
>>> as they might choke patchwork. The are only on the branch
>>>
>>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba3=
2997:
>>>
>>> =C2=A0binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_6=
4 (2011-06-21 17:58:06 -0700)
>>>
>>> are available in the git repository at:
>>> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.6
>>> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/l=
og/?h=3Dkraj/gcc-4.6
>>>
>>> Khem Raj (2):
>>> =C2=A0gcc-4.6: Switch to using svn SRC_URI for recipe
>>> =C2=A0tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION
>>
>> I'm afraid I don't like having "gcc 4.6" being so publicly visible. Its
>> fine for the recipe names but the PV itself really needs to be something
>> like "4.6.2+svn".
>>
>> I say this as a person who'd have to deal with people claiming we're
>> behind on gcc since we were on 4.6[.0] :/
>
> There will always be people claiming nonsense about numbers :)

Hi Richard

I have pushed updated patches to the branch now. PV is set to 4.6.0+svnr${S=
RCPV}
and we use wild card in choosing gcc version


