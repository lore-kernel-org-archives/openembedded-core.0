Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QMhO4-0002BB-Cd
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 16:06:10 +0200
Received: by gxk3 with SMTP id 3so586506gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=0LsA8riPw0pqlTodN1/N5Jl4oYLRsL+Akt3fnXrmbw4=;
	b=mS7lPhxxb9W1lHS3I4ugKstGqJgak8SNp4UDNiQTscK66+D5sUJ0Sq67zozu0tDVAh
	ZS95VY6i9Hu5NxIBe7N7pKpPyb8b1z8AGS2LCrGSoOhWP//ShlqrvtV8inuCo9bb/X13
	l8rEYBE9Zc+qb31whncb1ViueDuP1/0Mcn/Ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kE+XC4W+ESdiF4ylDsOvkVdpGNcS3Qexa9C5k26x92g32IsM7KxE1NimGCo2I2l7o2
	Dx23+7lUkF0P1EMZUlx7mBEI/+4aF6qvcx11s9sDTWhJbho65m8Os41p/MN5r2tuvPt3
	ffa7Y1EglQEuYC9FoMeO0WasybrbTwi5EJdWg=
MIME-Version: 1.0
Received: by 10.91.47.1 with SMTP id z1mr1503767agj.22.1305727391322; Wed, 18
	May 2011 07:03:11 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Wed, 18 May 2011 07:03:11 -0700 (PDT)
In-Reply-To: <BANLkTimZ4JWUnxC54mHKWiqWozmaodxsGA@mail.gmail.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
	<1305725413.3424.316.camel@rex>
	<BANLkTimZ4JWUnxC54mHKWiqWozmaodxsGA@mail.gmail.com>
Date: Wed, 18 May 2011 10:03:11 -0400
Message-ID: <BANLkTik2wSMqoOsZ2Xo6Ug0sqHWO-MYsFA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] 18-May-2011 Consolidated Pull
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
X-List-Received-Date: Wed, 18 May 2011 14:06:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 9:50 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, May 18, 2011 at 10:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2011-05-18 at 01:17 -0700, Saul Wold wrote:
>>> This requests includes the removal of clutter, yaffs and older
>>> gcc version, along with the GCC 4.6 Update for x86 and arm.
>>>
>>> There is the start of the meta-skeleton layer, which I believe
>>> we want to be part of oe-core for solid examples to developers.
>>>
>>> As of this writing there is a problem with perl which I think a
>>> change to the utils.bbclass might fix (adding readlink -fn $0), but
>>> I am still testing this.
>>
>> I merged this with the exception of the change to gcc 4.6 by default.
>> I'm a little hesitant to make that switch until a few more people have
>> tried using it (e.g. I noticed Bruce was having problems yesterday).
>
> His problems where fixed dropping sstate-cache.

This was my solution, and that seems to have fixed things. So I'd
be comfortable saying that gcc 4.6.0 alone is fine, but if you switch
to it with an existing sstate-cache .. some very non obvious things
happen.

Which would likely be something lurking in that cache code. I'll revisit
it once I've sent out my gcc 4.6.0 kernel fixes.

Cheers,

Bruce

>
> --
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


