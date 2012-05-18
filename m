Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1SVSA8-0006bu-Ha
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 20:44:28 +0200
Received: by werg55 with SMTP id g55so2207164wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=evgpfc7H4smAXG4yhmmA7ppLE/2DiiSvRhqBF+pP8Cc=;
	b=oO1SqfGU3Sq6YxhsM1V79YXlSGq0v+VcBxE7Lqk7hOolq5zMZHdQY8ud82tnusLcJe
	I1B6UkoAf+GOgDaFbVV0TzbyNRMlPVmynfEBqUSudOxdPjJgShRUV7e4v0WyoWY/hJKE
	F4vkFEs7ZDntheeGBQoW9d4oKodgUoNl1iaiR2X9C0WxYZXeHxo2S3hfSpnM3Pws2GrM
	7kigZzp3oHDGH/e4kVgcsvTwhVt65AlOXfUR4+Upg2hv6MkYFGCu6Q4dxBMdwwVzCv0F
	/sb+/bqJYliKA147qZPqzHzMSpjJbx/2ag0uIb4H2so3MIw2y4oprEoQ/qvVDa3wORrk
	ZYOA==
MIME-Version: 1.0
Received: by 10.180.104.231 with SMTP id gh7mr4037344wib.10.1337366064610;
	Fri, 18 May 2012 11:34:24 -0700 (PDT)
Received: by 10.223.71.194 with HTTP; Fri, 18 May 2012 11:34:24 -0700 (PDT)
In-Reply-To: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
Date: Fri, 18 May 2012 21:34:24 +0300
Message-ID: <CABnTX72_vh_1a4c7yqgS6sRiT1sW6Bg7guQQ1pxV=cPi+f_cUA@mail.gmail.com>
From: Ive Found <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Support additional user-defined package metadata
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
X-List-Received-Date: Fri, 18 May 2012 18:44:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping. Any comments?

Btw, '[PATCH 0/3]' in subject is my accidental mistake. It shoud be
'[PATCH 0/2]'.

On Sun, May 13, 2012 at 4:28 PM, Leonid Borisenko <ive.found@gmail.com> wro=
te:
>
> I'm an owner of Kindle Touch. It's basically a computer with ARM
> Cortex-A8 based CPU and Linux. There is a [small] community of
> enthuasists developing homebrew modifications for stock software. For
> distributing of these modifications .ipk package format had been chosen
> with OE as build infrastructure.
>
> There are already several firmware versions for device and some more are
> expected. Every firmware can introduce unpredictable changes, so
> modifications for previous firmware versions could stop working.
>
> Custom metadata field with supported firmware version(s) could be
> included into package control file for preventing of installing packaged
> modifications onto unsupported firmware.
>
> But OE currently doesn't allow to define additional package metadata in
> recipes. Patch fixes it.
>
> There is already RPMSPEC_PREAMBLE variable used in package_rpm.bbclass.
> I think, it is still useful for defining custom macros in header of spec
> file (while additional user-defined metadata is placed somewhere between
> common tags).
>
> I didn't found any way to define newline character inside variable value
> and it is needed to allow multiple [one-line] metadata fields/tags. So
> I've used ability of OE to split list-typed variables (and re-joined
> splitted value with real newline character).
>
> The following changes since commit cab85fd0b481cdbf36477348de75352be3f38c=
a2:
>
> =C2=A0gdk-pixbuf: Drop unneeded RPROVIDES (2012-05-12 11:23:27 +0100)
>
> up to 052d78ed7f986e76afb1ce6ef02e94ba1bbc9719:
>
> =C2=A0package_{ipk, deb, rpm}.bbclass: support additional user-defined me=
tadata (2012-05-13 14:51:26 +0300)
>
> ----------------------------------------------------------------
> Leonid Borisenko (2):
> =C2=A0 =C2=A0 =C2=A0package.bbclass: add getter of additional metadata
> =C2=A0 =C2=A0 =C2=A0package_{ipk, deb, rpm}.bbclass: support additional u=
ser-defined metadata
>
> =C2=A0meta/classes/package.bbclass =C2=A0 =C2=A0 | =C2=A0 11 +++++++++++
> =C2=A0meta/classes/package_deb.bbclass | =C2=A0 =C2=A05 +++++
> =C2=A0meta/classes/package_ipk.bbclass | =C2=A0 =C2=A05 +++++
> =C2=A0meta/classes/package_rpm.bbclass | =C2=A0 =C2=A07 +++++++
> =C2=A04 files changed, 28 insertions(+)
>


