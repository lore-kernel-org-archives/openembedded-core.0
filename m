Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFVuj-00077o-U6
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 20:26:09 +0200
Received: by eye27 with SMTP id 27so939967eye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=FX7HALF/+1VNkI7WJtzu97jW+JF8XBjH/+kUCh5KoHk=;
	b=J5Q4Hll/E9G49G/VUkHRv1CS9b1tzvcDzQST5kqMiNcCTEPwLgjmwRoCZvvdlgJR1t
	WM0IBLa7q4uzrqqAWlMDgxyIljTUn/t2O9eLg95UNctmj3sFBYU/c2UYrnbj/5AqmHWw
	ozzb8iC11jpxRRvN7MmaKxFad8gPIxRyCxvJw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Wtti3A9XgXk8KQ9xwkJk1zpaMp5k9GQQ+76qvSaulGZlU/FkGrcr0Bbzf1ZtyCw6z8
	s+WyvEgCmKaQWvCwnpNKPHFAl17t9Tgq8cYXW0Hinjrhu+XrXsNEjgrDioy2Me+XAmPE
	6IleGbnJTrVwcFFOsZ1hz1F+U+nqnGI+swZTQ=
Received: by 10.14.34.88 with SMTP id r64mr1797133eea.77.1304015017469; Thu,
	28 Apr 2011 11:23:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Thu, 28 Apr 2011 11:23:07 -0700 (PDT)
In-Reply-To: <4DB99F31.4000308@mlbassoc.com>
References: <4DB99F31.4000308@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2011 11:23:07 -0700
Message-ID: <BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Thu, 28 Apr 2011 18:26:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 10:09 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> I got my OMAP target to build with GCC-4.6.0 using the latest
> Poky tree after a fresh rebuild. =C2=A0Sadly, the Linux kernel (2.6.37.3)
> does not run correctly when built with this compiler. =C2=A0It
> fails when enumerating the USB bus :-(
>
> Are there known issues with the Linux kernel on ARM and GCC-4.6?
>

There has been fixes on top of 4.6.0 the one we have right now is vanilla
4.6.0 release. I plan to add second set of patches but you have to dig a bi=
t
more to identify the problem

> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


