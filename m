Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4kGf-0003vA-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 03:32:17 +0200
Received: by fxm19 with SMTP id 19so779347fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 18:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=zfB9w7K+F3Wb+HO6QLIqfF3SMYFV0lOO7N5Jc4p3jlo=;
	b=cbaI51AXu7NsqVPJGo2sTaoKULKCU7Xh8D1dWrJ/qHc3Kma4+eDUcM7bA3caVRysJH
	+v5Q1isbLwf4NXaW0dG72iH4ef3k2AzFrcxSS/sxWX6wFLQraq4wSEaAXNe7eJD2bdR6
	ltWMGE3/hbdodrj0101KdsKLssERz7kaMfDHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DzgVX9/mruU+C4ly19A1S1MRQpFuLsKAnlq/l7otuyURYuJuizcXRdaV/UB/LWG/Mo
	DfwDJRAY4+DH0Gk4wg6i69zD6qjqQapv/XInMYsSMpHA0jHmePvUH8sxliRC/06qhIuM
	VhjyTmmdLBjvgUTyCx9tfTuOcauSE9GspuK94=
Received: by 10.223.77.16 with SMTP id e16mr555170fak.87.1301448619170; Tue,
	29 Mar 2011 18:30:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Tue, 29 Mar 2011 18:29:48 -0700 (PDT)
In-Reply-To: <20110329150018.GB4529@sakrah.homelinux.org>
References: <cover.1300730825.git.raj.khem@gmail.com>
	<00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>
	<1301405666.24596.27.camel@rex>
	<20110329150018.GB4529@sakrah.homelinux.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Mar 2011 18:29:48 -0700
Message-ID: <AANLkTinG4y=x+NJ0HbTjTo=aAYp_o0SRXgbnndM-fibr@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake.conf: Prune global OPTIMIZATION flags
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
X-List-Received-Date: Wed, 30 Mar 2011 01:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2011 at 8:00 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On (29/03/11 14:34), Richard Purdie wrote:
>> On Mon, 2011-03-21 at 11:11 -0700, Khem Raj wrote:
>> > -fexpensive-optimizations is enabled by default at -O2
>> >
>> > -fomit-frame-pointer is enabled at -O2 selectively by gcc depending up=
on
>> > =C2=A0 architecture if debug info is not hurt
>> >
>> > -frename-registers - This might have some performance advantage on top
>> > =C2=A0of O2 on architectures which have more registers and registers a=
re left
>> > =C2=A0after scheduling but it affects debuggability quite a bit so as =
a i
>> > =C2=A0tradeoff we do not use it.
>> >
>> > -feliminate-dwarf2-dups - We use this option to reduce the size of deb=
ug
>> > =C2=A0information by removing duplicates this is only valid for dwarf2=
+ and we
>> > =C2=A0use dwarf2 by default
>>
>> I've disabled this flag for now as it was causing too many failures
>> across the board (various apps, prelinker). We can add it back when this
>> has been tested more extensively and its been confirmed to work with the
>> prelinker.
>
> It would have been better to disable one by one we would be able to
> utilize current testing. Most probaly the prelink issue is due to -felimi=
nate-dwarf2-dups did you try to remove that out ?
>

To answer myself. I should have looked at the committed patch. :)


>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> -Khem
>


