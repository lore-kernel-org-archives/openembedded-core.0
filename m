Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMZTm-0005zE-J7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 07:39:30 +0200
Received: by eye27 with SMTP id 27so359758eye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 22:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=UjP8kSOqYC6xQIkbj2LrmAgz5HNLg7RsWdohMh3Dv5I=;
	b=D0JEU1UVp1OfbDU4GAGMj+KKZM8eN7A+QRFfjXmMgyQ+62VDB2B741gGFSJJxNaL+E
	Ws54ntEcL4uxyUOt3PMJWHF+efy21Q9jttX6GBRe8xyXFi4fpb6vgvaEYJRZhumBAUr8
	ETMRy7SqfThaCLZEBuQ2d9hb/pXmsFP+dOCkw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=C1hYfdVzgnh/pDNkOfGCrUe/MTxFOJmPiMUjLiBK6OcqAo6sA9W96tJyfMCa0LmCaF
	Ijyh4M8cf4vUhmfs9NU5cB24X9+BRg59Jbgx+L6Alq7kgkN2ifCrH/4p3D1fElWmKWj4
	dJgBHmf8Z1KXSVuH4hwe7Ivx/frMyiC3+Ydg4=
Received: by 10.14.9.18 with SMTP id 18mr510308ees.236.1305696996222; Tue, 17
	May 2011 22:36:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 22:36:06 -0700 (PDT)
In-Reply-To: <1305625498.2429.158.camel@phil-desktop>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<1305623837.2429.126.camel@phil-desktop>
	<1305624899.3424.209.camel@rex>
	<1305625498.2429.158.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 22:36:06 -0700
Message-ID: <BANLkTikvnw0A-L=V0QOE9kaMdDGfgMwXXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Wed, 18 May 2011 05:39:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 2:44 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-05-17 at 10:34 +0100, Richard Purdie wrote:
>> How about this idea:
>>
>> TMPDIR_append =3D "-uclibc"
>
> Hm, I'm not totally sure what this really buys us.
>
> If the whole issue boils down to saying that you just can't share a
> TMPDIR between builds with competing C libraries (which sounds
> reasonable, since it's probably about the same thing as saying that libc
> selection is a DISTRO property) then it seems like something that can be
> fixed in the documentation. =C2=A0Users can just select a different TMPDI=
R by
> hand, same as they would when changing DISTROs, and it doesn't seem that
> there is any real need for the build system to try to work around it for
> them.

there are certain parts of build process which could be shared e.g.
native sysroot
and nativesdk package builds across target system library selections.
and we build
a lot of native packages it will be good if they could be shared
secondly the all-*-* package builds could be shared as well. Similarly
multimachine build is another aspect which could share builds too
having selected same C library.

Many users of oe would be development tool vendors who have BSPs for
many processor boards and C libraries and they would like to have this
possibility


