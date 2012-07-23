Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <manuel.bessler@gmail.com>) id 1StQmF-0005do-S7
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 00:06:55 +0200
Received: by wgbdr1 with SMTP id dr1so5832103wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iH8/hhclboZdgyv0v92VZsk/AcGNY2NHXk7TB5IS1sE=;
	b=hjUqoB4JCsp+n2Pcja9f56QLzGPdhp/CVAbHmGe8Sr7BUs3bdQwp6ydTmHGFlRlylR
	8t8tdWgDgnbYw2t3I/jgUCNGREUv23HKqloV5cJqxKlW3T9rS/ohxH6GbHAIHKw9dCMB
	Pahoz/65AE9Q4+pczpyYAMYMlzMA2Dh9SFAhovW4G6aPFDOOMIJTFlcUVOvq2x1q2Fng
	wNlStr8SI/vo0nb55jyr0f4XkyR1qHHokFsH6RURFmhCxKpFf2NAqkx1Tq04DbGbCePA
	e4//eV5/AWzAQDLujZrABfhRVh3YhwK8P5vcc31viuREsY+A3F4Ja1UpqCY2kySxFj5g
	90Og==
MIME-Version: 1.0
Received: by 10.180.103.136 with SMTP id fw8mr1067396wib.20.1343080528518;
	Mon, 23 Jul 2012 14:55:28 -0700 (PDT)
Received: by 10.216.93.142 with HTTP; Mon, 23 Jul 2012 14:55:28 -0700 (PDT)
In-Reply-To: <50099B89.7060308@windriver.com>
References: <CAKSdS8L32A5wB4fzuc-EQTBX9_GXLhLO_gt4HgzgJk=UC+XZKw@mail.gmail.com>
	<50087A5B.9030905@windriver.com>
	<CAKSdS8LB0=8RieBGJSAyxyw9APPEksCKZ1WVz0EWwMZ49-SRow@mail.gmail.com>
	<50099B89.7060308@windriver.com>
Date: Mon, 23 Jul 2012 17:55:28 -0400
Message-ID: <CAKSdS8LuVR_ehn9+Qt0=gz3WGNg1gkb7YYE-V4t=P-t-Jf1L+w@mail.gmail.com>
From: Manuel Bessler <manuel.bessler@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain type SDK containing external toolchain possible?
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
X-List-Received-Date: Mon, 23 Jul 2012 22:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 20, 2012 at 1:55 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> What do you mean by "via a crosssdk/cross-canadian binary"? Built by
>> bitbake using the *-cross-canadian recipes?
>
>
> You need to create a crosssdk/cross-canadian recipe that copies the binary
> toolchain into the right SDK location(s).  Using external-csl-toolchain (or
> similar) as a guide.

I'm looking at external-csl-toolchain and others I've found as examples,
and I've had this working for regular builds for a while, but I'm missing
examples showing how this translates for SDKs, ie. cross-canadian.

> Yes, I have external-cs-toolchain.bb, and
> external-cs-toolchain-cross-canadian.bb, which is based on the former.
>
> (most of it is generic, so a single ".inc" version used by both should be
> possible as well..)

I'm slowly working on something like that, but if you have done this somewhere,
I'd really appreciate if I could take a look at an example thats known
to work...

Thanks,
Manuel


