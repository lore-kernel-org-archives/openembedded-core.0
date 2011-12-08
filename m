Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RYfVc-0004Zm-Kl
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:03:41 +0100
Received: by qabg14 with SMTP id g14so1603747qab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9SIWb85qnCRaWUdmOr2j1ZLhrMwBkwJN7oj6pztgIos=;
	b=R2vtBxUiMXbN5jR7R6x6cLSza3EcrB7CqlKucLOBlstZkVwMkh2Wei4zVcvjziVnug
	ePDh021Cqeqq860ScyW9w3r4YOgjyADXndtrLYvfE4EqIXMwI3mwMVmTVJMDLashc5OV
	Mf5giaZ5PXXznUENr7bwamyemYC2EwyNO507c=
MIME-Version: 1.0
Received: by 10.224.189.78 with SMTP id dd14mr3199931qab.31.1323356210703;
	Thu, 08 Dec 2011 06:56:50 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 8 Dec 2011 06:56:50 -0800 (PST)
In-Reply-To: <4EDF12D3.4060306@gmail.com>
References: <4EDF12D3.4060306@gmail.com>
Date: Thu, 8 Dec 2011 07:56:50 -0700
Message-ID: <CA+M6bXk22TQ8jowRyjTyyJzRhUbE7fhvcf1YH_AS9EYn=sX+WA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC fails when SDK is not extracted to /usr/local
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
X-List-Received-Date: Thu, 08 Dec 2011 15:03:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 12:16 AM, Tasslehoff Kjappfot
<tasskjapp@gmail.com> wrote:
> gcc fails when I extract my SDK to another place than /usr/local.
>
> Output when it fails:
>
> $ ./arm-angstrom-linux-gnueabi-gcc
> bash: ./arm-angstrom-linux-gnueabi-gcc: No such file or directory
>
> Readelf output:
>
> $ readelf -d arm-angstrom-linux-gnueabi-gcc
>
> Dynamic section at offset 0x34394 contains 21 entries:
> =A0Tag =A0 =A0 =A0 =A0Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 Name/Value
> =A00x00000001 (NEEDED) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Shared lib=
rary: [libc.so.6]
> =A00x0000000f (RPATH) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Library =
rpath:
> [/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linux/u=
sr/lib/armv7a-angstrom-linux-gnueabi:/usr/local/angstrom-eglibc-i686-armv7a=
/sysroots/i686-angstromsdk-linux/lib]
>
> Is it the RPATH here that's making trouble for me?

Not exactly.  And RPATH is needed to find some of the shared libraries
that are needed.  I thought we had been running chrpath over these to
make them relocatable, however.

--=20
Tom


