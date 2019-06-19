Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71E4A7E7BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:07:08 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u13so36560008iop.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eyWIHgFLgtEv5ZLhttWH7O79aMtJ7ijX4MfJNcq2eVo=;
	b=HPvTjCZWz2F4cSH1E+u3zGsJVeZL1WCLuvHjudm2uGb/Sll+zZzZbkNVhPbsp+x30k
	Ri+kChXhoejPctZLu9j3Fhyhd30JdY6XDgZWQuPsJrefy3AbXByuFn97ii1C81sH/CZE
	OdCqmRaX3mqOh8knFlg+iohOxZJEBpL0TwDCBsaZ0InSOdO01cw0kk+VUMirdqxP7mLO
	gwAMpJpYVtiPOu1GarMqykfgAK26iHl0v8sL8uu0NLwLP+GS7FC4IV0Tw97Kvpa1+UG5
	5wFCBtOCt/OdWMaltzkdo8ghZ5F35BQULOEeMh40KrtT9gdUMzHTsnPcSLaky+4bbylT
	gukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eyWIHgFLgtEv5ZLhttWH7O79aMtJ7ijX4MfJNcq2eVo=;
	b=CEMmLIW7QDUFuro9WZVDUl0uEqLnCmRN2cN2hWNiJXZIys1KIHsMnoshRNQVkS9SfA
	jJq+PzCF0Adi5hky9cy2REN1iQO875VNO3stGHf8kXlhW0fdbM8pPdPQzpAajQKfqeCB
	8gEymM/WvYVnl+NHUJDIrUF0MZXnkvf++MGbvUH6UV5UzQUAqqVcjo0RqO2mNRcTPchF
	X76SeYW/UAbzlVvO528IxiDnoNATJpRAJGCVIbSverVPVM3/kuDaUEr7RbLAI7zxaiEN
	Jmnar3h7DgAv4WSWZbVqnqTLfN94ZDRbXj9u5izH+BZdo8Xhcc8cq7HueNQC4/qb7Lhh
	GulQ==
X-Gm-Message-State: APjAAAWvnkjBkrVouYFZQmD5QAASFwvF2OdYkCwEjwSYYLKnlIFcOw4X
	PfNMGIeOw/7OtqI/DHhY0t5YuILH6tLYJIfn7CE=
X-Google-Smtp-Source: APXvYqwJS4HGVIexauFGE8LZVmFJMjr56e/1mLKvrv+pyrrhcR8KmLICgCHONAckpPzYOm0azn4RMNDqhuQYrnVhR6s=
X-Received: by 2002:a6b:7208:: with SMTP id n8mr10318409ioc.151.1560935229348; 
	Wed, 19 Jun 2019 02:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
	<615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
	<2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
In-Reply-To: <2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jun 2019 10:06:58 +0100
Message-ID: <CAO5Uq5QK8+bF812AF4o-AG+sOMb4E51Wj88CoLWL4jSccLdy6A@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Jun 2019 09:07:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 19, 2019 at 9:48 AM Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Tue, 2019-06-18 at 17:11 +0100, Richard Purdie wrote:
> > On Tue, 2019-06-18 at 08:53 -0700, Khem Raj wrote:
> > > On Tue, Jun 18, 2019 at 1:26 AM Luca Boccassi <
> > > luca.boccassi@gmail.com
> > > > wrote:
> > > > On Thu, 2017-11-02 at 16:48 +0100, Ayoub Zaki wrote:
> > > > > sanitize fitImage hash algorithm selection with FIT_HASH_ALG
> > > > > switch default hash algorithm from sha1 to sha256
> > > > >
> > > > > Signed-off-by: Ayoub Zaki <
> > > > > ayoub.zaki@embexus.com
> > > > >
> > > > > Acked-by: Denys Dmytriyenko <
> > > > > denys@ti.com
> > > > >
> > > > > ---
> > > > >  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
> > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel-fitimage.bbclass
> > > > > b/meta/classes/kernel-fitimage.bbclass
> > > > > index 179185b..3cc3a33 100644
> > > > > --- a/meta/classes/kernel-fitimage.bbclass
> > > > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > > > @@ -36,6 +36,9 @@ python __anonymous () {
> > > > >  # Options for the device tree compiler passed to mkimage '-D'
> > > > > feature:
> > > > >  UBOOT_MKIMAGE_DTCOPTS ??= ""
> > > > >
> > > > > +# fitImage Hash Algo
> > > > > +FIT_HASH_ALG ?= "sha256"

Should this be ??=

> > > > > +
> > > > >  #
> > > > >  # Emit the fitImage ITS header
> > > > >  #
> > > > > @@ -95,7 +98,7 @@ EOF
> > > > >  # $4 ... Compression type
> > > > >  fitimage_emit_section_kernel() {
> > > > >
> > > > > -     kernel_csum="sha1"
> > > > > +     kernel_csum="${FIT_HASH_ALG}"
> > > > >
> > > > >       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> > > > >       if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> > > > > @@ -128,7 +131,7 @@ EOF
> > > > >  # $3 ... Path to DTB image
> > > > >  fitimage_emit_section_dtb() {
> > > > >
> > > > > -     dtb_csum="sha1"
> > > > > +     dtb_csum="${FIT_HASH_ALG}"
> > > > >
> > > > >       cat << EOF >> ${1}
> > > > >                  fdt@${2} {
> > > > > @@ -152,7 +155,7 @@ EOF
> > > > >  # $3 ... Path to setup image
> > > > >  fitimage_emit_section_setup() {
> > > > >
> > > > > -     setup_csum="sha1"
> > > > > +     setup_csum="${FIT_HASH_ALG}"
> > > > >
> > > > >       cat << EOF >> ${1}
> > > > >                  setup@${2} {
> > > > > @@ -179,7 +182,7 @@ EOF
> > > > >  # $3 ... Path to ramdisk image
> > > > >  fitimage_emit_section_ramdisk() {
> > > > >
> > > > > -     ramdisk_csum="sha1"
> > > > > +     ramdisk_csum="${FIT_HASH_ALG}"
> > > > >       ramdisk_ctype="none"
> > > > >       ramdisk_loadline=""
> > > > >       ramdisk_entryline=""
> > > > > @@ -237,7 +240,7 @@ EOF
> > > > >  # $6 ... default flag
> > > > >  fitimage_emit_section_config() {
> > > > >
> > > > > -     conf_csum="sha1"
> > > > > +     conf_csum="${FIT_HASH_ALG}"
> > > > >       if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
> > > > >               conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> > > > >       fi
> > > >
> > > > Hi,
> > > >
> > > > Any update on this patch? It was acked almost 2 years ago.
> > > >
> > > > It would be great to have a way to change the hashsum algorithm
> > > > when
> > > > building signed images.
> > > >
> > >
> > > I agree, but it would be good to resend this patch on top of
> > > current
> > > master
> >
> > I managed to apply it to master so its in testing now.
> >
> > My concerns about the lack of tests for this class are the main
> > reason
> > patches here get held up.
> >
> > Cheers,
> >
> > Richard
>
> Thanks Richard - in case it helps, we've been using this patch for a
> few months at $work (on top of sumo) and it seems to work fine.
>

I expect that's true for everyone touching stuff in this class - it
works fine for them... the problem is everyone else, since it's
terribly fragile and has no tests.

I'd not be at all surprised if changing the default from sha1 to
sha256 doesn't break someone.

-- 
Alex Kiernan

