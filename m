Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1Qbqt6-0005vj-0I
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:16:48 +0200
Received: by fxh10 with SMTP id 10so1118505fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6XQacDG1WCRPKYeA4VAafdY5PgYx8GKBDOsKJVdLRZI=;
	b=WZ9o56reLD+rEvetq3K+Y7iLRtU+bsOFZ7YpWLVC6trEVyPPNGlzoBUwLe8ygn7nZp
	PKQwSxGWHDlp7Ku6pCbW8ZCgT6rnYVtVafd69HHSj2UHX0l2QoiHEYSmwPBEMk91WCiB
	sQLpOOffQ0T2woO6MO0AMccR7UgVH3DQA5fmc=
MIME-Version: 1.0
Received: by 10.223.7.150 with SMTP id d22mr936622fad.17.1309338786131; Wed,
	29 Jun 2011 02:13:06 -0700 (PDT)
Received: by 10.223.111.130 with HTTP; Wed, 29 Jun 2011 02:13:06 -0700 (PDT)
In-Reply-To: <7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
Date: Wed, 29 Jun 2011 11:13:06 +0200
Message-ID: <BANLkTinP99HNJaQwpw+tXzivPwk+EuBqrA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 09:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2011 at 10:56, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Op 29 jun 2011, om 10:50 heeft Anders Darander het volgende geschreven:
>> On Wed, Jun 29, 2011 at 10:24, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>> Op 29 jun 2011, om 00:41 heeft Khem Raj het volgende geschreven:
>>>> If they are independent then may be the openssh recipe should be
>>>> divided into openssh-ssh and openssh-rest so one can use openssh
>>>> provided daemon or dropbear provided as they wish
>>>
>>> Dividing the openssl recipe would gain us little and the gains would be=
 only for the power companies since you'd have to build openssh twice to ge=
t both sftp and ssh. The decrease in build time for only sftp is neglible.
>>
>> Hm, speaking against what I've often been advocating (reducing build
>> time by factoring out dependenies etc)...
>>
>> I think the simplest and most straightforward solution is to just
>> split the packaging into
>> openssh-ssh and openssh-sftp, where openssh-sftp packages just what is
>> needed for handling
>> the sftp-server in cooperation with dropbear. It could possibly also
>> include the sftp-client if
>> desired/needed.
>
> That's already the case now. The problem is the PROVIDES overlap since th=
e Poky people decided a distro could only have one true ssh implementation =
instead of choosing it per image. So if your distro doesn't set the PREFERR=
ED_PROVIDER_sshd you get those nagging messages during parsing that scare u=
sers and make consultants rich.
>
> OE .dev isn't a lot better with the misguided DISTRO_SSH_DAEMON, but at l=
east it doesn't show those nag messages.

Ah, I see. I didn't check it out, just assumed something...

Then I fully understand what the problem case is.

Anders


