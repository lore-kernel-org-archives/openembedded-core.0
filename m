Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R9jRB-00034E-Ei
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 22:12:01 +0200
Received: by qyk4 with SMTP id 4so2537726qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=eqjR2ecCxCS3SrCIm5N2vea5GiKT5a6BsOS7pFYDv+Q=;
	b=DrlPsVk9uy/eW+PRN5t3zoREXddSqgV1K+hi+U2TY80t+co6ZFQM5SiCD4kz2f38JP
	mtz0E0wpEksCsXOacuKraqSOJCwqikHl4CrkTmayhAgU1z0viUYPksDt6jAT6Gy8Q3OZ
	F57aKW7/i9tbccthy7q4J77PT7+tAti0zfpQs=
Received: by 10.68.8.195 with SMTP id t3mr61119012pba.107.1317413188059; Fri,
	30 Sep 2011 13:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Fri, 30 Sep 2011 13:05:58 -0700 (PDT)
In-Reply-To: <CAEsOVNcC79qr6+zp6ify_vViu-+FsiYq=XvUCyWFc924RPyqjg@mail.gmail.com>
References: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
	<4E85FCF7.6030208@gmail.com>
	<CAEsOVNcC79qr6+zp6ify_vViu-+FsiYq=XvUCyWFc924RPyqjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2011 13:05:58 -0700
Message-ID: <CAMKF1srCrTcfy2niJNF-jkArvZHaU0P8=zH5sqMjFrs1BcKA2g@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Adding TARGET_VECTOR
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
X-List-Received-Date: Fri, 30 Sep 2011 20:12:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 10:49 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Fri, Sep 30, 2011 at 12:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 8/25/2011 7:35 AM, Kumar Gala wrote:
>>>
>>> We have some packages like flac that are aware of vectorization that ma=
y
>>> or may not exist on a given processor. =C2=A0I was wondering if adding =
something
>>> like TARGET_VECTOR similar to TARGET_FPU made sense as a way for recipe=
s to
>>> decide on how to set various vectorization flags if needed.
>>>
>>> I was looking at this mostly from the PPC side in which we have:
>>>
>>> TARGET_VECTOR =3D "" /* processor has no vector hw */
>>> TARGET_VECTOR =3D "altivec" /* processor has AltiVec support */
>>> TARGET_VECTOR =3D "spe" /* processor has signal processing engine suppo=
rt */
>>> TARGET_VECTOR =3D "vsx" /* processor has Vector-Scalar Extension */
>>>
>>
>> is target vector a property of FPU itself or is it a separate processing
>> unit in hardware.?
>
> We have several powerpc cores each containing a different vector
> features. We need a way to differentiate in the recipes between
> different cores and decide to enable SPE, Altivec, etc to build the
> package properly.
>
> I've sort of gone the route of adding:
>
> OVERRIDES :=3D ":core_type"
>
> And using that in recipes. But, I think we need a consensus on how we
> want to handle this.

there is SOC_FAMILY thats used predominantly in TI chips that could be
of interest here.
but in this case I wanted to understand
if it is a feature of FPU or is it a separate unit, still not clear to me.

>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


