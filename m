Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1SYtn7-00084x-Ee
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 08:50:57 +0200
Received: by werg55 with SMTP id g55so1820075wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 May 2012 23:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ZzBTbt1W8DNaxGkYKd12RwYmNJTXl1nXiF+DnJ4Ep9s=;
	b=ZA0EyJ+D88iEyX01ysqPmsmli1SoJCB8ufNCN2NxnikmOeWzmYsJzWxbsB9zQPhAk+
	JOHo446voAMJz4Kq6LhK3YNCS6NtC4eCwb1Rw5CKdERHTL13UoOWelpwxjFIn9b/0SbU
	pGMLoV0aZUmEcApQq38LR5UdLt+mDT4jefa5oHVKNXaXgYRC5xXcgJX4nyabPX23zI+s
	h3EMnGriO8hfKwIRoX56JcWhb1RlrtzwaYW9zkZ8ZTTra1tV8TNOsR3bubsJUYkvwLin
	71bkdc6tuHvCXetaeUvrs00zBuHkpvnFIrB0KUL8Pyh2f5BJGbc1coLBe8C54ngC0bNI
	QVkg==
Received: by 10.216.219.101 with SMTP id l79mr3467605wep.219.1338187241726;
	Sun, 27 May 2012 23:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.89.131 with HTTP; Sun, 27 May 2012 23:40:21 -0700 (PDT)
In-Reply-To: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
From: Ive Found <ive.found@gmail.com>
Date: Mon, 28 May 2012 09:40:21 +0300
Message-ID: <CABnTX71kzsDK0s+u=gnD2T-HB4E9ASHc4L8zcXabr8g1q+s3Jg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PING v2] [PATCH 0/2] Support additional user-defined package metadata
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
X-List-Received-Date: Mon, 28 May 2012 06:50:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping again. Any comments?

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


