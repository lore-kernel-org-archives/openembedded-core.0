Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1ScAq1-000393-VU
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 09:39:30 +0200
Received: by wibhm14 with SMTP id hm14so4177838wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=tQ+gTSQJxREO3dQGsRRwPyM9Ab61XRZNP37F410fs84=;
	b=MbNp07Rt3gkvS2TQuGTgjFHSToc+xseOvGSMMlNxd6Ovn3Ve/wDms1LIEfJd4Zwmod
	nJK11ummHNg7xL0JBBFrVl57LWnQm9NATEhNIV3sI9Y6VhNLGfb1JZtYLErz72HlHFqn
	r+K2S7H6gbLP0HiPT968QTspj/thVsNfu7N/KE8aKOd9CelmYCtpzp/f5X3SWMS2CrNc
	fzRDoc8q2eNHLzzAaCr5sXfeLw5ORYP+iJywcBc/+nCgx33ohSEEfHo9zCBVHzMMgW89
	2x72jlPiykKLEMlhDJHjipbqbdxoz1oXEJm4930stHdwvtA0fN911EquU/274xJeKnbN
	CVSQ==
Received: by 10.216.227.214 with SMTP id d64mr4677980weq.93.1338967742846;
	Wed, 06 Jun 2012 00:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.126.1 with HTTP; Wed, 6 Jun 2012 00:28:42 -0700 (PDT)
In-Reply-To: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
From: Ive Found <ive.found@gmail.com>
Date: Wed, 6 Jun 2012 10:28:42 +0300
Message-ID: <CABnTX73jsT2yd74jkBzob4S8U_LdP_ju4VuLK+UiE-yvEOrP4g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PING v3] [PATCH 0/2] Support additional user-defined package metadata
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
X-List-Received-Date: Wed, 06 Jun 2012 07:39:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please, apply patches. They are small, atomic, tested and doesn't ruin
anything, just adding the feature.

It is essential feature for us, so we've put efforts into implementing
it. We'd like to see it merged into upstream. We are small group of
enthusiasts, it will be very hard for us to maintain fork of OE (it
will be impossible in fact).

On Sun, May 13, 2012 at 4:28 PM, Leonid Borisenko <ive.found@gmail.com> wro=
te:
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


