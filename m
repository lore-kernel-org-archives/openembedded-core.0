Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QU7dK-0007Vx-FR
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 03:32:34 +0200
Received: by wwb17 with SMTP id 17so20195wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 18:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=HyLPZ5JQamVZnw7hrRHy8eV0FOPmeRWwVaf2OnQYjig=;
	b=ExpJCSzcs7AtPdvpkvzHSzCo3SrdDEJm5dRT7pS2o2qV2l2LSa6O7Crc63GtO7vX8Q
	3nsWEjHaW58dFmW9C6n6QSHLvcToVo9i2PN3p4tKdag03xp61yGuKi4ZtI1S0A+LAB4Y
	ZJ8FEqeuHPHK0B1vXBYn8ddt9HdNFy0D4Oc80=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=O8Wnwc8ZfAHb35XLM0IE0uzFFWerkA5xWS9Y9P90YkpkQJn7i1AwnyktvMQz3OEglh
	ZRv6cOyMntd2l3hLgzJr2f3rBRe3EWJxLRDUlEDMuF7k1njzzU/0WjWR4Yr2iiLLaB6b
	ers9CQ2C9/DqlIXhNkMhoM+/u0RZ3JPa79T6Y=
Received: by 10.216.134.67 with SMTP id r45mr6888999wei.44.1307496556120; Tue,
	07 Jun 2011 18:29:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 7 Jun 2011 18:28:46 -0700 (PDT)
In-Reply-To: <1307478987.15712.60.camel@rex>
References: <1307102133.2529.260.camel@phil-desktop>
	<1307439362.2529.4741.camel@phil-desktop>
	<1307478987.15712.60.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2011 18:28:46 -0700
Message-ID: <BANLkTin65Xwx93+HpZKFypX7d0P0wkA8Mg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Wed, 08 Jun 2011 01:32:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2011 at 1:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-06-07 at 10:36 +0100, Phil Blundell wrote:
>> Ping?
>
> I'm not against this move at all but before this patch merges we should
> really have a cleanup which removes the *.machine configuration files
> from the uclibc recipe directory along with all the machine specific
> overrides that are in use instead making them arch specific.
>
> Any volunteers?
>

Yes thats in my todo list.

> Cheers,
>
> Richard
>
>
>> p.
>>
>> On Fri, 2011-06-03 at 12:55 +0100, Phil Blundell wrote:
>> > There is no good reason for uclibc to be machine specific. =C2=A0Remov=
e local
>> > assignment to PACKAGE_ARCH so that it gets the default target
>> > architecture and bump PR for that change.
>> >
>> > See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/00=
3064.html
>> >
>> > Also replace a chunk of anonymous python with a COMPATIBLE_HOST
>> > declaration.
>> >
>> > Signed-off-by: Phil Blundell <philb@gnu.org>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


