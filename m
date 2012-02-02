Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rt1TN-0003Ui-Ab
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:33:29 +0100
Received: by qcso7 with SMTP id o7so1511536qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=O3f0hNdEzfbm63m1o5KslKjjYyGDNUv8Z6kztITmpZA=;
	b=TKi44e7OFOOlYNGgiaQLOc/9b3R775jTsTyIidEzPYHC1w7yn8BNtrDcmnPvFaMovx
	G5EbqE1QlFZxeVi/f5jXsbRFVhL/898FmwXxLUIAYkyuV8ir8kvVKOzIAXs1J2+BGqj1
	sZz4XJeu/W2qrwCZjVNleARh6aPgXSqcy9DHo=
Received: by 10.224.214.200 with SMTP id hb8mr5561452qab.80.1328207132495;
	Thu, 02 Feb 2012 10:25:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.95.207 with HTTP; Thu, 2 Feb 2012 10:25:12 -0800 (PST)
In-Reply-To: <20120128202349.GE22106@sakrah.homelinux.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<a36fa8d970d1a2eceb16774604e5b5b7aff0b2cb.1327684024.git.chris_larson@mentor.com>
	<20120128202349.GE22106@sakrah.homelinux.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 2 Feb 2012 11:25:12 -0700
X-Google-Sender-Auth: yT8HNnAvrkfN-UAUIuqrInxrSFM
Message-ID: <CABcZANk+5QS5e+9DL4W=XB-2SeBd0dmm_vAspbMrEgDbR2DFqA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 03/10] binutils: fixes for build with an external csl toolchain
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
X-List-Received-Date: Thu, 02 Feb 2012 18:33:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2012 at 1:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (27/01/12 11:13), Christopher Larson wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>> =C2=A0meta/recipes-devtools/binutils/binutils.inc | =C2=A0 =C2=A05 +++--
>> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-=
devtools/binutils/binutils.inc
>> index 6130ab4..e343242 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -51,6 +51,7 @@ B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>> =C2=A0EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-i=
nstall-libbfd \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-s=
hared \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-werro=
r \
>
> I specifically wanted to avoid this option but I guess we have to have
> it to support wide versions of gcc.

Yeah, it'd be nice if it wasn't needed, but sadly it is for some.
--=20
Christopher Larson


