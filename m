Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QCarz-0003yF-MH
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 19:07:15 +0200
Received: by fxm19 with SMTP id 19so630247fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=P0YB22sjqXEhFCWTF/moXqvQ5GIQklvwgtSbWGfUU60=;
	b=mlhrN9cAUpxaxeyq8pWuKxaCseUasHzJEZzyiqvLr8tYBdPB4HbNS29qcUFcgGvq5q
	CYmC25egJ8yM5yISP0lwW+RA87m0PDr0UQTwkA7p0sv+007wOPhCIp3+vlhhQ/vd7DRf
	J1v1wfMvRnZgGGVEQXTuEAXmw4TXwPaF9mOOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UCgvPB6BsKas6xWyUnWO4f11tSSV7IvNjPOgWJzM90lrYVEECQH8gMu6yB6GH/96mj
	yxnFEOrjEu9CFWegsAP7spYFiJtCW3DH7po+GLt5ucz8if8Jei+Blu7dnWZ+YPO9g/xm
	Bdh/dEeZjvAlIZf5xnXRo1tH4HNPl7ekTzC9U=
Received: by 10.223.54.213 with SMTP id r21mr913938fag.54.1303319091288; Wed,
	20 Apr 2011 10:04:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Wed, 20 Apr 2011 10:04:20 -0700 (PDT)
In-Reply-To: <430B907C-AA81-410E-A9C7-EC5B15E58FAA@dominion.thruhere.net>
References: <1303273629-1631-1-git-send-email-raj.khem@gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94515DC58B@orsmsx504.amr.corp.intel.com>
	<4DAF0E5C.10106@linux.intel.com>
	<430B907C-AA81-410E-A9C7-EC5B15E58FAA@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Apr 2011 10:04:20 -0700
Message-ID: <BANLkTint2tspjGTh7H1VdRxJEhUF47_7Ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Add recipes for 4.6.0
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
X-List-Received-Date: Wed, 20 Apr 2011 17:07:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 9:51 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 20 apr 2011, om 18:48 heeft Saul Wold het volgende geschreven:
>
>> On 04/20/2011 08:42 AM, Kamble, Nitin A wrote:
>>> Hi Khem,
>>> =C2=A0 Great to have these patches. And thanks for getting them out ear=
ly :) I will check them out and give you feedback on them. Are they availab=
le in a tree format or tar.gz so that I can try them with Yocto easily?
>>> Thanks& =C2=A0Regards,
>>> Nitin
>>>
>> Nitin,
>>
>> you should be able to save Khem's email and apply it directly to your gi=
t branch via a "git am -i -s <saved email file>" =C2=A0The -i option is for=
 interactive apply and -s sign's it.
>
> Or get the mbox from http://patches.openembedded.org/patch/2523/ , that s=
hould work as well
>

We should bring the contrib/patchwork/pw-am.sh from OE into core


