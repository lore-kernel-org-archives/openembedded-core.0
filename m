Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuTtp-0004Yb-Vf
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 20:34:34 +0200
Received: by pzk2 with SMTP id 2so7273578pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=gB0QD0ys1u4WPtQ2H6eREpptx4LRGLs2/ZMVweMKLfc=;
	b=P68JIjf5LwqbbNXBZ/4kUatn+/m3AhSYOKGvuI+XDMRuQbD1Tg6/bBiLvP7w0nqzj/
	xnv6uuV6jYSyx0r0NLIKFIK8NK5VDHw4lcFPlzjjhoFHIBRKXhWWhI269LVG6ZTzF0/p
	XbOV1RcxFKlRAHTyk5jSlRKlsHPtgYdmWV2Xw=
Received: by 10.142.156.20 with SMTP id d20mr30000wfe.119.1313778592351; Fri,
	19 Aug 2011 11:29:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Fri, 19 Aug 2011 11:29:22 -0700 (PDT)
In-Reply-To: <1313771035.6733.304.camel@phil-desktop>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<788258d226dc94004ce8284a62cf8524bcf4b010.1313700595.git.sgw@linux.intel.com>
	<1313771035.6733.304.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2011 11:29:22 -0700
Message-ID: <CAMKF1spxnsBL9WTKPz-RDsD4Z3-m0j-sznBi6YKFamgadoQk1A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 16/32] gcc-4.6: Use --with-linker-hash-style configure option
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
X-List-Received-Date: Fri, 19 Aug 2011 18:34:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 9:23 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
>> =C2=A0# Third digit in PV should be incremented after a minor release
>> =C2=A0# happens from this branch on gcc e.g. currently its 4.6.0
>> @@ -90,6 +90,7 @@ EXTRA_OECONF_BASE =3D " --enable-lto \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --disable-bootstrap \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --disable-libgomp \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --disable-libmudflap \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--with-linker-hash-style=3D${LINKER_HASH_STYLE} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --enable-cheaders=3Dc_global "
>>
>> =C2=A0EXTRA_OECONF_INITIAL =3D "--disable-libmudflap \
>
> Which gcc did you test this against? =C2=A0As far as I can tell this patc=
h
> was only applied to the trunk (as of May this year) and not the 4.6
> branch. =C2=A0The corresponding configury certainly doesn't seem to exist=
 in
> the oe-core build tree that I happen to have lying around in front of
> me, so it isn't apparent that this patch will have any useful effect.
>

Yes that patch is missing
I noted it in mail to other thread. the patch was being applied
in meta-oe. I will redo these 2 patches and resend

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


