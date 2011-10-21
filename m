Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RH9i9-0001eb-GB
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 09:40:13 +0200
Received: by gyc15 with SMTP id 15so3477007gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 00:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=rhnhjUVgb2fUFEhWTvBIs4fhpmHJbrfNPicoVRphzRU=;
	b=sOuG8Al9bO0IsbfHi2ysMGPsJzhIO04g/O/a/79jTbeyLcl66uQw86RdL6CItuoVPH
	pZkHMuO+puzqGaMQYXF9Bnot5yabjpxZ6omTGjkpb+4NvXjLRmU8aUmaBrtY6XIRAOGG
	Ytvrv0vC9xgBicqiH8gGVV+0eQDTfh/0DxPFY=
MIME-Version: 1.0
Received: by 10.150.47.12 with SMTP id u12mr3922239ybu.63.1319182459662; Fri,
	21 Oct 2011 00:34:19 -0700 (PDT)
Received: by 10.151.85.12 with HTTP; Fri, 21 Oct 2011 00:34:19 -0700 (PDT)
In-Reply-To: <1318698176.2342.77.camel@ted>
References: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
	<1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
	<1318698176.2342.77.camel@ted>
Date: Fri, 21 Oct 2011 09:34:19 +0200
Message-ID: <CA+chaQdAQm1jLLJxC1dSUSu+kgo-JqMffVDur=JNxpe-HGczMg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Fri, 21 Oct 2011 07:40:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2011 at 7:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-10-15 at 12:38 +0200, Martin Jansa wrote:
>> * this way we can use
>> =C2=A0 EXTRA_DRIDRIVERS_armv4t +=3D ",glamo" in meta-openmoko layer and
>> =C2=A0 EXTRA_DRIDRIVERS_armv4t +=3D ",foo" in meta-bar layer without kno=
wledge
>> =C2=A0 of other modules in other layers in stack
>> * actually it's like old MACHINE_DRI_MODULES from OE-classic but renamed
>> =C2=A0 to indicate that it should be used for architecture not machine
>
> This is way overcomplicated. Just do:
>
> DRIDRIVERS_append_armv4t =3D ",glamo"

Ah, is it expected that armv4t is no longer valid OVERRIDE?

OVERRIDES=3D"linux-gnueabi:arm:build-linux:pn-libdrm:om-gta02::shr:forcevar=
iable:thumb:libc-glibc"

# OVERRIDES=3D${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-$=
{PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable${@bb.utils.contai=
ns("TUNE_FEATURES",
"thumb", ":thumb", "", d)}${@bb.utils.contains("TUNE_FEATURES",
"no-thumb-interwork", ":thumb-interwork", "", d)}:libc-glibc

So I've to change it to
DRIDRIVERS_append_arm
or is it TRANSLATED_TARGET_ARCH fault?

Regards,


