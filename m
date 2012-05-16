Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUls2-0001DY-K7
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:34:58 +0200
Received: by vbbfr13 with SMTP id fr13so1218012vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1SbQBmzKnvG9wRni5lXhTMB3Gb7sqHC97EpufPS4rxI=;
	b=NnIdkhvsWGmLE9SUH6x/++oqBbaRddvtMewSm0GE6zb/GQaB3rLAUGSr0ExpG97SpD
	Qke/LqHjDZtitLWtlZn2fPmkOTwHypnxt6FR2+c28jMgWjsg8sopiw1GVMMDt/Dt6jvr
	jnx0VvtBco72CRhsmy0PM2nMoQkoIVPVKMN+5kpMUAc4cmC+8xqvRKUgsoUB1WDlZxCR
	rem+/RYQOsizQSE9gA/beSQFobZoB4LPhdmKNwf9BHyTEjLt4QgQH6RXAfN5E84dn5Lo
	tnapKSLVKP3x9BaurFTXmdz2hl1d3uYc6LMWPzmz0upW7UFjrSRHehL065dRhYgdt8sT
	zAPg==
MIME-Version: 1.0
Received: by 10.220.115.81 with SMTP id h17mr3475649vcq.66.1337203496493; Wed,
	16 May 2012 14:24:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Wed, 16 May 2012 14:24:56 -0700 (PDT)
In-Reply-To: <E7972075-09C9-41B2-B353-A9D4B6AB4299@dominion.thruhere.net>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
	<E7972075-09C9-41B2-B353-A9D4B6AB4299@dominion.thruhere.net>
Date: Wed, 16 May 2012 18:24:56 -0300
X-Google-Sender-Auth: LXbNCBS63RLdXi235pqUEo2TyK0
Message-ID: <CAP9ODKpK6JxuP--5JcHtH_rXnBuG8D9jWBz0rydaBw5xvT1qqg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:34:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 6:06 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Op 16 mei 2012, om 22:59 heeft Otavio Salvador het volgende geschreven:
>> On Wed, May 16, 2012 at 5:55 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> Op 16 mei 2012 om 21:51 heeft Daiane Angolini <daiane.angolini@freescal=
e.com> het volgende geschreven:
>>>> Port recipe from Meta-OE at 4bf0e7e02544e9ffa54aa0ead966c411d7dbd0be
>>>> and update to version 1.30 using FreeDesktop GIT as source.
>>>
>>> Why bloat oe-core? Nothing is using it oe-core
>>
>> Have it in oe-core allow for inclusion of it with other test utilities
>> and easier to use for Yocto people. Why do you object in have it
>> there?
>
> OE-core is too big already, it needs to get *smaller*, not bigger.

And where do you think it ought to be then? test and debug utilities
for common stuff seems very commonly need to be in oe-core IMO.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


