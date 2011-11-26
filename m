Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RU8IA-00039q-UZ
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 03:47:03 +0100
Received: by lahe6 with SMTP id e6so116983lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 18:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=HTAQoq+3QrS4PbjkgimtbDkNmKk9VRn2hn/wguk6W6s=;
	b=EcgFW9AZYABLTqYZnvkFVeDVJXKhJzNnxeLeyrDTcatQwB4LBUiKe/2RMk/sBUQrdj
	HDrVzi6l1MG4/uKeQsOQMmz1kR3P6ohtkMO0IpWjmSZ15kv0ansVOWi1bTO/FpogN1oQ
	5XMGCP4KpywZz1xRJQdkk2w3/cFjs9P5TxIFQ=
Received: by 10.152.134.77 with SMTP id pi13mr22258959lab.21.1322275227447;
	Fri, 25 Nov 2011 18:40:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 25 Nov 2011 18:39:56 -0800 (PST)
In-Reply-To: <1322233577.22654.0.camel@ted>
References: <1322233577.22654.0.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Nov 2011 18:39:56 -0800
Message-ID: <CAMKF1sqynERGyJ_1AGVkqjvEwswoC1w6BuEVJyuKiX=HMmMzhA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript-native: Ensure the sys/time/h fix is applied for native builds
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
X-List-Received-Date: Sat, 26 Nov 2011 02:47:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2011 at 7:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On my system, the sys/time.h header is in a subdir off /usr/include
> which causes a build failure. Apply the target CFLAGS fix to native
> builds as well to address this.

hmmm I thought CFLAGS would be automtically translated with
BBCLASSEXTEND =3D "native"

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta=
/recipes-extended/ghostscript/ghostscript_9.04.bb
> index d444810..86d5ef2 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> @@ -40,6 +40,7 @@ EXTRA_OECONF =3D "--without-x --with-system-libtiff --w=
ithout-jbig2dec --without-j
> =C2=A0# http://bugs.ghostscript.com/show_bug.cgi?id=3D692443
> =C2=A0# http://bugs.ghostscript.com/show_bug.cgi?id=3D692426
> =C2=A0CFLAGS +=3D "-DHAVE_SYS_TIME_H=3D1"
> +BUILD_CFLAGS +=3D "-DHAVE_SYS_TIME_H=3D1"
>
> =C2=A0inherit autotools
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


