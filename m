Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qh43r-000587-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 20:21:27 +0200
Received: by pzk36 with SMTP id 36so4942199pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=oNte/PC/oTc90REaWlNV0xqKxNR5wYYn1PHxXPXl0Q0=;
	b=SnpacH2MmpmUTwX8NfX/WTtq0EL+jLJTL//MPkA49txwvKZTe7eVtVzOHQjpg3r7cx
	Yd9SHX2ofNX3lp1AzZYYVAS844W6LVVtx42gvKxtMTAiDGPVxvFstRB366qeDqMqVT7V
	uNLenUqpAC7a/prUPGdrvwOkvyYMcEVxDpf+Q=
Received: by 10.68.35.105 with SMTP id g9mr1517467pbj.479.1310581045092; Wed,
	13 Jul 2011 11:17:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Wed, 13 Jul 2011 11:16:54 -0700 (PDT)
In-Reply-To: <1310550533.6337.236.camel@phil-desktop>
References: <1310530784-16538-1-git-send-email-raj.khem@gmail.com>
	<1310550533.6337.236.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jul 2011 11:16:54 -0700
Message-ID: <CAMKF1sqEh3zTH9ThY1UxPiDt26+gLLnfX_EgmhyipPi2jbCKcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] strace: Define own sigmask macro if not defined already in signal.h
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
X-List-Received-Date: Wed, 13 Jul 2011 18:21:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2011 at 2:48 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-07-12 at 21:19 -0700, Khem Raj wrote:
>> ++#ifndef sigmask
>> ++/* Compute mask for signal SIG. =C2=A0*/
>> ++#define sigmask(sig) =C2=A0 __sigmask(sig)
>> ++#endif /* sigmask */
>
> That looks a bit dubious to me. =C2=A0If this is relying on some uclibc
> implementation detail then I think it should either be applied for
> uclibc only, or guarded with something like "#if defined(__UCLIBC__)
> && !defined(sigmask)". =C2=A0Otherwise you might end up trying to call
> __sigmask() on non-uclibc systems which could have unwanted effects.

in general for eglibc/glibc it wont matter since signal.h defines sigmask
and is defined to point to __sigmask but for non glibc/eglibc libc yes
there is a
chance.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


