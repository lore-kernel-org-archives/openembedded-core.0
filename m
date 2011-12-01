Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RW7o1-0000p0-Tf
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 15:40:10 +0100
Received: by qadc10 with SMTP id c10so1623846qad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=6FG4GCDzkbDT5dgj9Aopwkd5V4ZzCFGXW4LHInnhjBg=;
	b=wQvr1tDN9IQnFuII8yxJlFP/iPXu0Vmmn38YE3YeIvii2iRM/m1qxYiXDuhzMDre4x
	91X6gGTdN9pwgRSSylIxNWdPZO87oOEZRaEyEogStpDDIGQxO0pPgj5Crs3KRoGaeC13
	Hw192QUadVVHcI2Cc0tk90Nunbz14f/gEM6QE=
Received: by 10.229.46.8 with SMTP id h8mr1357133qcf.86.1322750007424; Thu, 01
	Dec 2011 06:33:27 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Thu, 1 Dec 2011 06:33:06 -0800 (PST)
In-Reply-To: <20111201131337.GG19917@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net> <1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<1322744558.17484.126.camel@ted> <20111201131337.GG19917@jama.jama.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Dec 2011 07:33:06 -0700
X-Google-Sender-Auth: WnNyDrl0UethF4yr9YBx4z763S4
Message-ID: <CABcZANmi7pgkZeHo4+if-cxXtrZDR_Gd_uZ-mMiM_CG9Czc-MA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 14:40:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 6:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Thu, Dec 01, 2011 at 01:02:38PM +0000, Richard Purdie wrote:
>> On Thu, 2011-12-01 at 10:59 -0200, Otavio Salvador wrote:
>> > On Thu, Dec 1, 2011 at 10:37, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 On Thu, 2011-12-01 at 13:24 +0100, Martin =
Jansa wrote:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 > A while back I've proposed to make .bbap=
pend without
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 corresponding .bb
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 > only big fat warning, but not fatal to p=
arse. Now you cannot
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 even build
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 > eglibc if there is libdrm bbappend you d=
on't care at all
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 about..
>> >
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can do this by setting:
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 BB_DANGLINGAPPENDS_WARNONLY
>
> Good to know, thanks.
>
>> > This is even worse; you end up with a package without the changes done
>> > on the bbappend and as most bbappend files do not change PR, adding it
>> > later won't force a package update.

People use bbappends without changing PR? I've been doing a PR .=3D ".1"
or whatever in every bbappend I've created since they were added to
bitbake, and used to do the same with amend.inc. It can result in some
long PR values, but I'd rather that than the alternative..
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


