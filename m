Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qt3NM-0004UQ-FV
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 22:03:08 +0200
Received: by pzk2 with SMTP id 2so10905641pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=sMwT33fYFyQVUMMK3YUfkz7sIRTIa4udAWff/fAXmEs=;
	b=CFLJorHgEfEhC+lHhbkmKJvjDGOf3ccKJwTm5puSLZTHRtZmH3L66CPfpqs6HRlKZS
	idCrtmPF7S7Qh2jubXDv1KY2KYz/8iDeF5iBJLjj3mcv6f5nKzIiOuJNhrmF3TFftQTe
	xsYI6RHfaRzZes8RSOqa66/qJwTonp7TYWWS0=
Received: by 10.142.213.9 with SMTP id l9mr1942833wfg.233.1313438311080; Mon,
	15 Aug 2011 12:58:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Mon, 15 Aug 2011 12:58:01 -0700 (PDT)
In-Reply-To: <1313426936.6733.192.camel@phil-desktop>
References: <1313426936.6733.192.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Aug 2011 12:58:01 -0700
Message-ID: <CAMKF1squaeshWFxTdmJ4tM=SBVFXtB3CFNasDFcB4sRwHmqmcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fontconfig-2.8.0/fix_pkgconfig.patch
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
X-List-Received-Date: Mon, 15 Aug 2011 20:03:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2011 at 9:48 AM, Phil Blundell <philb@gnu.org> wrote:
> Does anybody know where this patch came from or what it is supposed to
> be achieving? =C2=A0As far as I have been able to tell with some limited =
git
> archaeology, it seems to have originated from Poky in the
> fontconfig-2.6.0 sort of timeframe but that's about all I have been able
> to find out.
>
> The actual content of the patch is:
>
> -Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@
> +Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ -L{libdir} -lfreetype @ICONV_L=
IBS@
>

it could be that it was needed to pacify libtool in a cross env but
may not be needed now
that libtool knows sysroot.

> ... which, as far as I can tell, is just completely bogus. =C2=A0The adde=
d
> "-L{libdir}" is causing cmake to blow up if it tries to inspect the
> private libs for fontconfig to anything that depends on it: it's
> arguably a bug in cmake that it can't tolerate {} there, but it seems
> fairly clear that this patch in its current form can't be producing any
> useful effect.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


