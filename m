Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFB9605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 21:52:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l132so5494374wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 14:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=urVS6KPJJd/rb7OwDE2WIRSswKFtQpfjFe8Fn1CLnWA=;
	b=a/Gm1DujsFnmbSPB3LTTeky9ZbCkL1b3Xjw6TN3YG2XKDdifiIDLGDzMpqPA9lx6Vj
	XvOyPf2KBoE2r1fIG+hjsI5eA0VoGmgr90RDV7HdVQWGL2f9VPa65dGndDnEAasnw7/U
	4LoSx79FN1Sdnx1U6OUS8FM1UhcidzYyj3SSDB5e+MF7P9kTs03aIdYC0tvXBAgYd+Q3
	lbSMi8I4+J8TslnxdbpxMueCLkzMMbIN4c+UTJNyuQC0aBX7scV1DhJue30KvFNX/M7c
	9NmBJMpj9P5kS7QPxugO+b/G53oHCQIVKokgTunNwPijkUGoU+nRU9xQllNA77D7pXG+
	//AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=urVS6KPJJd/rb7OwDE2WIRSswKFtQpfjFe8Fn1CLnWA=;
	b=DtxbZGk/WO0w0GUixKmSjTUWwofVOtxlK1QmbjOaW/+00ySyGkrcAexSSMJPN7ibaa
	oSdp7C8xCVjFrmpYQHju9uzzXfJ8MkNgN4iyxYc3FEjdEGNBjWTIzNe9IV3rJQFa/Tw5
	HU4/uwU/iEVcdh2bO+4GNVI3sqY0p76Xgy7G0FeHk9yHMIiLirbJKYioHEQczlESDxEb
	rgeB/gU41q2P7q4hQ0+zlQ8QQfiazcqh6L1FBCXs2eu7Iwc9lgiojqu4APsYh20fPnZv
	hZHRUCDChw4x1YpNL+bE9PZdPy+yUNpENX3J4CgqMef57MdPORzjr4ugOaPGBVFWVRE1
	kaNA==
X-Gm-Message-State: AE9vXwMZeduQSbyneEWKm6LO3HClpVsNGW58ZdRTmgFGj7iHMNuqJbGPp3+YHRzlcD2KX0Q1/0ITUDW369+YSw==
X-Received: by 10.194.152.2 with SMTP id uu2mr5783462wjb.24.1474408371801;
	Tue, 20 Sep 2016 14:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.190.233 with HTTP; Tue, 20 Sep 2016 14:52:51 -0700 (PDT)
In-Reply-To: <CABcZAN=ca9cRakHcYvetaQwCKsuAmUX3Bmf--6OfT7AimJuHgw@mail.gmail.com>
References: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
	<CAJ86T=VS6k_GDbCNc_Wf-yNegfP0dUAocZQApi_e+nFSgerTmA@mail.gmail.com>
	<CADyYWLnP3=Lxw93hWV37o=pm0Ow+Ap5bS_8nB+ZYjtr7AX6dQw@mail.gmail.com>
	<CABcZAN=ca9cRakHcYvetaQwCKsuAmUX3Bmf--6OfT7AimJuHgw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 20 Sep 2016 14:52:51 -0700
Message-ID: <CAJ86T=UY08eUCijiBDLCkcGkaZSXCYPRvwmoONHF73XCtGqhSg@mail.gmail.com>
To: Christopher Larson <chris_larson@mentor.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure on host i686
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2016 21:52:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 11:00 AM, Christopher Larson
<chris_larson@mentor.com> wrote:
>
> On Mon, Sep 19, 2016 at 4:10 AM, sujith h <sujith.h@gmail.com> wrote:
>>
>> On Thu, Sep 8, 2016 at 12:36 PM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>>>
>>> On Wed, Sep 7, 2016 at 11:51 PM, Sujith H <sujith.h@gmail.com> wrote:
>>> > From: Christopher Larson <chris_larson@mentor.com>
>>> >
>>> > When built on an i686 host for qemux86-64 without the
>>> > fix to obey LD and it fails:
>>> >
>>> > /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
>>> > Relocatable linking with relocations from format elf64-x86-64
>>> >
>>> > (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/pe=
rf/1.0-r9/perf-1.0/fs/fs.o)
>>> > to format elf32-i386
>>> > (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/pe=
rf/1.0-r9/perf-1.0/fs/libapi-in.o)
>>> > is not supported
>>> >
>>> > This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
>>> > which is -m elf32_x86_64 for x86_64. Without that, direct use of ld
>>> > will fail.
>>> >
>>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>> > Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>>> > ---
>>> >  meta/recipes-kernel/perf/perf.bb | 9 +++++++++
>>> >  1 file changed, 9 insertions(+)
>>> >
>>> > diff --git a/meta/recipes-kernel/perf/perf.bb
>>> > b/meta/recipes-kernel/perf/perf.bb
>>> > index 88e3a0a..85fe0ea 100644
>>> > --- a/meta/recipes-kernel/perf/perf.bb
>>> > +++ b/meta/recipes-kernel/perf/perf.bb
>>> > @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D '\
>>> >      ARCH=3D${ARCH} \
>>> >      CC=3D"${CC}" \
>>> >      AR=3D"${AR}" \
>>> > +    LD=3D"${LD}" \
>>> >      EXTRA_CFLAGS=3D"-ldw" \
>>> >      perfexecdir=3D${libexecdir} \
>>> >      NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
>>> > @@ -98,6 +99,14 @@ EXTRA_OEMAKE +=3D "\
>>> >      'infodir=3D${@os.path.relpath(infodir, prefix)}' \
>>> >  "
>>> >
>>> > +do_configure_prepend () {
>>> > +    for makefile in "${S}/tools/perf/Makefile.perf" \
>>> > +                    "${S}/tools/lib/api/Makefile"; do
>>> > +        if [ -e "$makefile" ]; then
>>> > +            sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,' "$makefile"
>>> > +        fi
>>> > +    done
>>> > +}
>>>
>>> Isn't passing LD via the Make command line enough to over-ride these
>>> definitions in the Makefiles?
>>
>> Unfortunately that didn't helped I believe. That's the reason, this patc=
h
>> was created.
>
> The patch mirrored the handling of CC/AR, which also used sed at the time
> the append was created. If upstream removed the sed for those, then we ca=
n
> remove it for LD as well, presumably. I=E2=80=99d recommend actually test=
ing that.

Brief testing suggests that commenting out LD in
${S}/tools/lib/api/Makefile is still required.

For clarity the new sed command should probably be added next to the
existing ones for CC and AR though, rather than on its own in a new
do_configure_prepend().

There is no "LD =3D ..." line to comment out in ${S}/tools/perf/Makefile.pe=
rf.

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

