Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B8F7B7E7BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:47:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g135so818975wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=t9uP04QZDdgGFcPoEpRHs8yM9ouXbTXeRndFnmu32WU=;
	b=iNJA0RKNj0Bqq0Bb3GDVaQjAeoWLY0kyzMcJDCZOuxPGzxNcCAeXxWwoPj/KkDvafu
	1uvwEASOnNnA0i2dwoUFDgETfJZlrSMbsf65eM5hBPmz488O5XWaeNuPMdyFdtwQrZf1
	pRQ2A8KAFCLuxjtasBG/sULL3G9BJjxCkHmg/cS5DXQUBpVSi76RQB2MIp2REcrar7wd
	jwKRilV5IB/omAyZbhh4PJPZR+brX+V2wg50PKIzDm1vWKtpZYP20tl+cBe1OntcAtGB
	ibyrzErIsZSZc5gbqTubCtqNS2c7DrnyX21SNR2TGugOCNWb3PlQLHYvmNmkM80Te/ie
	+KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=t9uP04QZDdgGFcPoEpRHs8yM9ouXbTXeRndFnmu32WU=;
	b=HBOvVf+WD4OQd6IzEVB7SCIAhwmHibjdSp4h6Seh5HZzZoK+khFzlUmYWWfTnXSKp5
	Y+HPfbzdiLRmhy0wF4KwtMnWrnRK9tfKwbYZv0hZ6FK9L9W1dzxA/71Muy9chQ67gMh/
	K3c0IX1aQ6jDcuSysOF9VTQW2elPpyERx0Iq1YmDd+uuLx8jxQUtDpHJgQZQrZVDyGsA
	VVmHk/FGqeuFgaCa6bkDsbM9Q1XbsH6oEXlGR+51t1OlRYTvDptPBnjBTjMSKYIwfTTN
	P8wa2ACH96hPaW2V2RZdksy7LpXb+eyEBnGapuoLjR4I+ylkPG0Bhckcw6qpNLNsBqwy
	kvgA==
X-Gm-Message-State: APjAAAWf+7ID/kTMBPRd1Y6OhQeGk7Al3EyJH7KEgr7eEbmFw3+I/Qni
	zeQIdnuCzeWfGrbGDSqCXPQ=
X-Google-Smtp-Source: APXvYqzfilXGj/9Jd816xf8JWKko33HdmxfTiil8n36K8vovLQ/pLjAXq0S/ihErc+WQ5XADRz7d1Q==
X-Received: by 2002:a1c:7a01:: with SMTP id v1mr7499071wmc.10.1560934076162;
	Wed, 19 Jun 2019 01:47:56 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id e7sm704582wmd.0.2019.06.19.01.47.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 01:47:55 -0700 (PDT)
Message-ID: <2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
Date: Wed, 19 Jun 2019 09:47:54 +0100
In-Reply-To: <615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
	<615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 19 Jun 2019 08:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-18 at 17:11 +0100, Richard Purdie wrote:
> On Tue, 2019-06-18 at 08:53 -0700, Khem Raj wrote:
> > On Tue, Jun 18, 2019 at 1:26 AM Luca Boccassi <
> > luca.boccassi@gmail.com
> > > wrote:
> > > On Thu, 2017-11-02 at 16:48 +0100, Ayoub Zaki wrote:
> > > > sanitize fitImage hash algorithm selection with FIT_HASH_ALG
> > > > switch default hash algorithm from sha1 to sha256
> > > > 
> > > > Signed-off-by: Ayoub Zaki <
> > > > ayoub.zaki@embexus.com
> > > > 
> > > > Acked-by: Denys Dmytriyenko <
> > > > denys@ti.com
> > > > 
> > > > ---
> > > >  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
> > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/kernel-fitimage.bbclass
> > > > b/meta/classes/kernel-fitimage.bbclass
> > > > index 179185b..3cc3a33 100644
> > > > --- a/meta/classes/kernel-fitimage.bbclass
> > > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > > @@ -36,6 +36,9 @@ python __anonymous () {
> > > >  # Options for the device tree compiler passed to mkimage '-D'
> > > > feature:
> > > >  UBOOT_MKIMAGE_DTCOPTS ??= ""
> > > > 
> > > > +# fitImage Hash Algo
> > > > +FIT_HASH_ALG ?= "sha256"
> > > > +
> > > >  #
> > > >  # Emit the fitImage ITS header
> > > >  #
> > > > @@ -95,7 +98,7 @@ EOF
> > > >  # $4 ... Compression type
> > > >  fitimage_emit_section_kernel() {
> > > > 
> > > > -     kernel_csum="sha1"
> > > > +     kernel_csum="${FIT_HASH_ALG}"
> > > > 
> > > >       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> > > >       if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> > > > @@ -128,7 +131,7 @@ EOF
> > > >  # $3 ... Path to DTB image
> > > >  fitimage_emit_section_dtb() {
> > > > 
> > > > -     dtb_csum="sha1"
> > > > +     dtb_csum="${FIT_HASH_ALG}"
> > > > 
> > > >       cat << EOF >> ${1}
> > > >                  fdt@${2} {
> > > > @@ -152,7 +155,7 @@ EOF
> > > >  # $3 ... Path to setup image
> > > >  fitimage_emit_section_setup() {
> > > > 
> > > > -     setup_csum="sha1"
> > > > +     setup_csum="${FIT_HASH_ALG}"
> > > > 
> > > >       cat << EOF >> ${1}
> > > >                  setup@${2} {
> > > > @@ -179,7 +182,7 @@ EOF
> > > >  # $3 ... Path to ramdisk image
> > > >  fitimage_emit_section_ramdisk() {
> > > > 
> > > > -     ramdisk_csum="sha1"
> > > > +     ramdisk_csum="${FIT_HASH_ALG}"
> > > >       ramdisk_ctype="none"
> > > >       ramdisk_loadline=""
> > > >       ramdisk_entryline=""
> > > > @@ -237,7 +240,7 @@ EOF
> > > >  # $6 ... default flag
> > > >  fitimage_emit_section_config() {
> > > > 
> > > > -     conf_csum="sha1"
> > > > +     conf_csum="${FIT_HASH_ALG}"
> > > >       if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
> > > >               conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> > > >       fi
> > > 
> > > Hi,
> > > 
> > > Any update on this patch? It was acked almost 2 years ago.
> > > 
> > > It would be great to have a way to change the hashsum algorithm
> > > when
> > > building signed images.
> > > 
> > 
> > I agree, but it would be good to resend this patch on top of
> > current
> > master
> 
> I managed to apply it to master so its in testing now.
> 
> My concerns about the lack of tests for this class are the main
> reason
> patches here get held up.
> 
> Cheers,
> 
> Richard

Thanks Richard - in case it helps, we've been using this patch for a
few months at $work (on top of sumo) and it seems to work fine.

-- 
Kind regards,
Luca Boccassi


