Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RqvM6-00028p-3i
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 00:37:18 +0100
Received: by lahc1 with SMTP id c1so1209393lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 15:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/6+GEbly3c1piLWNPy3rTXZMW9w8FhSsmbCJCQhzyzY=;
	b=R1kVUBzrOJRFrJa94PCUkOMq+rKTDON056G4OXNgOI1hCHuIUXwLPvFoF8iDbeUdGK
	ac7rRFPA6mJ269R0Ryic5Dp2ohM+vc8kdeLooStkPt2S73QFLYkrxW7fzyZAlKes29RG
	h/9ZeD/ZOlfHMyfKLPON2M9ZuExBRMqBOiI1M=
MIME-Version: 1.0
Received: by 10.112.83.197 with SMTP id s5mr2332614lby.9.1327706968678; Fri,
	27 Jan 2012 15:29:28 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Fri, 27 Jan 2012 15:29:28 -0800 (PST)
In-Reply-To: <CALbNGRR8cJJfDcHm1hX8cRf7JOKwkoU-sySx1mYujMgXJYHBdA@mail.gmail.com>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<4F21FDA2.5070803@linux.intel.com>
	<CALbNGRQ0+FDE7QisckBOCXBUspQiumZFLjPJYgRf87a1mqtHaw@mail.gmail.com>
	<CALbNGRTqHJYvSzbman=ZPQ4D=Cyu8oX0F4JdTA7hrH4oMW_wbA@mail.gmail.com>
	<4F22C122.9030206@linux.intel.com>
	<CALbNGRR8cJJfDcHm1hX8cRf7JOKwkoU-sySx1mYujMgXJYHBdA@mail.gmail.com>
Date: Sat, 28 Jan 2012 00:29:28 +0100
Message-ID: <CALbNGRQza2-LE2bH2Z51nC9jVsNk6Vind3JqOfk1vU7z3+x13g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Fri, 27 Jan 2012 23:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2012 at 12:16 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>> Actually the ordering of PACKAGES matters here and since bitbake.conf li=
sts
>> the ${PN}-dev and ${PN}-staticdev package before ${PN}, you can append t=
he
>> ${libdir}/${BPN}/3/backends/*.a to FILES_${PN}-staticdev and it will pul=
l
>> those first before doing the FILES_${PN}. does that make sense? =A0You d=
on't
>> have to re-write FILES_${PN}.
>>
> Sorry - but In oe-core's bitbake.conf I see
>
> PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-l=
ocale"
>
> this might explain why I can append whatever I want to -dev /
> -staticdev - or do I miss something?
>
Have modified bitbake.conf here to

PACKAGES =3D "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc ${PN}-loc=
ale"

now I get the expected behavior.

Will start a build from scratch for the night to see if there is some fallo=
ut..

Andreas


