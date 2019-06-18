Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9D87E85E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:54:02 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m29so15957402qtu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/TdtdIkPcOvu0K2Qc31XBqti3rcY9KqqbvAbhOwNvPY=;
	b=O1KK5Ow+qXezr40b3S62bNLqypznkU+87VCqpeqbBNl4MIFOE7q2W0cJz8QBcAcgb2
	GwwaPxTVOYuVavjsA2cz1B2oD+k/kJ9svLNpECCI4P0DmunK4+Bed25p9r8wKIUFxqMI
	gXnTirjKK97j9OKV3Dxez8nGPHFSGBMX/jkVSXUwXAfW9dWsnkwOA+SVTzFYEwqZ1/n9
	Okd0TD8vz3G8uTVpaybKEInd3WhvS0/lQATL22iZFO9OEI2aD1BuMYdsCH2LENO9k7cW
	PVl0Ap85U6e6TmZp7HEVPAn0EeinEZocxSfYLrnlS2LmUB9JOJ37ODgPmF76yHuRqmjz
	ItAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/TdtdIkPcOvu0K2Qc31XBqti3rcY9KqqbvAbhOwNvPY=;
	b=VlujEttXO/TnKTEUhLZquucW8VVRZHjY5PdKtOMoU261U3B8Ey8Jtw2c3f0X503hRk
	CMZRQcXFqoxNsE76aB14txOlP6no8uyVBn/gWKp5NOTupjUp1fVdLTyBUurumerUJp6s
	HwjtPS1ExVsekiJnTOdK2hNPQdkC/boDhjM64arUqVvsfg8WqxX2ip/uGFcu8ByqivX7
	S1KlGlZOKXgpZ//ryZLCko+y/+IbpW13FfuX1xo9hnOhyjTTBX5VeEKHW53WitVJqZlt
	29iTtAJOeBnw2dp0y7Yn3Ve67qbxo30GJ7wSui9ZegOLD9uWkhePIzUOiCvCXX+8F42+
	PPDw==
X-Gm-Message-State: APjAAAVK9I75BFIdh7Of/I9yCzMvsGSL2/UMIVTQKKUUAkVi9F2ng3X0
	hJmcd2f7hwijhzJ0p41VC1dBfXIVr+/mDBP/9tA=
X-Google-Smtp-Source: APXvYqwB9KVa4ordH0aZWySEala0zKm0tTcPZYZNp0SLA24v8NRhTsn1YWUzt/rcu9t0kUDzl26RyaYmDZkL7BkwaFo=
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr99329554qtx.194.1560873243155; 
	Tue, 18 Jun 2019 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
In-Reply-To: <f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 08:53:35 -0700
Message-ID: <CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe,v2] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Tue, 18 Jun 2019 15:54:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 1:26 AM Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Thu, 2017-11-02 at 16:48 +0100, Ayoub Zaki wrote:
> > sanitize fitImage hash algorithm selection with FIT_HASH_ALG
> > switch default hash algorithm from sha1 to sha256
> >
> > Signed-off-by: Ayoub Zaki <
> > ayoub.zaki@embexus.com
> > >
> > Acked-by: Denys Dmytriyenko <
> > denys@ti.com
> > >
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass
> > b/meta/classes/kernel-fitimage.bbclass
> > index 179185b..3cc3a33 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -36,6 +36,9 @@ python __anonymous () {
> >  # Options for the device tree compiler passed to mkimage '-D'
> > feature:
> >  UBOOT_MKIMAGE_DTCOPTS ??= ""
> >
> > +# fitImage Hash Algo
> > +FIT_HASH_ALG ?= "sha256"
> > +
> >  #
> >  # Emit the fitImage ITS header
> >  #
> > @@ -95,7 +98,7 @@ EOF
> >  # $4 ... Compression type
> >  fitimage_emit_section_kernel() {
> >
> > -     kernel_csum="sha1"
> > +     kernel_csum="${FIT_HASH_ALG}"
> >
> >       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> >       if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> > @@ -128,7 +131,7 @@ EOF
> >  # $3 ... Path to DTB image
> >  fitimage_emit_section_dtb() {
> >
> > -     dtb_csum="sha1"
> > +     dtb_csum="${FIT_HASH_ALG}"
> >
> >       cat << EOF >> ${1}
> >                  fdt@${2} {
> > @@ -152,7 +155,7 @@ EOF
> >  # $3 ... Path to setup image
> >  fitimage_emit_section_setup() {
> >
> > -     setup_csum="sha1"
> > +     setup_csum="${FIT_HASH_ALG}"
> >
> >       cat << EOF >> ${1}
> >                  setup@${2} {
> > @@ -179,7 +182,7 @@ EOF
> >  # $3 ... Path to ramdisk image
> >  fitimage_emit_section_ramdisk() {
> >
> > -     ramdisk_csum="sha1"
> > +     ramdisk_csum="${FIT_HASH_ALG}"
> >       ramdisk_ctype="none"
> >       ramdisk_loadline=""
> >       ramdisk_entryline=""
> > @@ -237,7 +240,7 @@ EOF
> >  # $6 ... default flag
> >  fitimage_emit_section_config() {
> >
> > -     conf_csum="sha1"
> > +     conf_csum="${FIT_HASH_ALG}"
> >       if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
> >               conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> >       fi
>
> Hi,
>
> Any update on this patch? It was acked almost 2 years ago.
>
> It would be great to have a way to change the hashsum algorithm when
> building signed images.
>

I agree, but it would be good to resend this patch on top of current master

> Thanks!
>
> --
> Kind regards,
> Luca Boccassi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

