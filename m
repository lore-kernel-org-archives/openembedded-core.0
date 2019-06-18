Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 08DEF7E874
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:11:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so109695wru.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=K+fT/OlOqCvf1wrWHGBEu66d3j1hXBMWjboPCvpQgj0=;
	b=c76SIYm279BIHBowI5aVO8qJO8hHeBrNXo3/7QbeQgJimlfcWwQlCYkk+KqPK/v/9u
	6SKeWXr8mZ8ILtVrJXdLDccIonu5X62KvStP57Y49Q20Qrrk7ah/Tidp3kIeT1/GHZM5
	XhS3+yTI5Pevqd5S3jm9jNSjSaaA52hr4UEA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=K+fT/OlOqCvf1wrWHGBEu66d3j1hXBMWjboPCvpQgj0=;
	b=FTV8IeGuJJ5oby0r0ecP4K5ktbQBNVig6/hBWwmnDtMiJGVomncWX6okZftRfL7VYp
	WbYTHlLxfUK9Oondmy+ZXqrbEKlnvGhzxd37YCrw273UxmiCvDSyTu66Q3KV+XnwnvJD
	Ox57RAh++dtZnD1gP3PvvLHSi34aYIW1ynwdMLRnA8/Mp/t0b0EI3RgKYYV8YxiFYeVI
	2QuxI3DROCrEqvqbkfzEN5bDQW0+1ge4URcyDQOgDHPeeLNdXNo1S/pT8jNMDBM4BYWA
	CH7TuB71XCegpjXVpyt5t9C1a6Ol0NZZhJ7GxSaJ03cbcPI8YipHVUeSUxShMjFNFNLn
	VnXg==
X-Gm-Message-State: APjAAAUfkHuKzXBY5+zjxOhSE9g8mdi2oAUhTZf7to/mDpwgKFoOUppr
	yvBVTjbi+jFUFwKzqZyJTMTCJg==
X-Google-Smtp-Source: APXvYqzudfvggcXybJS+lHv/gb159Xoon6RRb9WXUZ6Q/Qs1dV7B8V17v4TjoWhEOOU2g8JW6oNucA==
X-Received: by 2002:adf:ce11:: with SMTP id p17mr52694764wrn.58.1560874275843; 
	Tue, 18 Jun 2019 09:11:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o8sm15558699wrj.71.2019.06.18.09.11.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 09:11:15 -0700 (PDT)
Message-ID: <615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Luca Boccassi <luca.boccassi@gmail.com>
Date: Tue, 18 Jun 2019 17:11:14 +0100
In-Reply-To: <CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
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
X-List-Received-Date: Tue, 18 Jun 2019 16:11:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-18 at 08:53 -0700, Khem Raj wrote:
> On Tue, Jun 18, 2019 at 1:26 AM Luca Boccassi <
> luca.boccassi@gmail.com> wrote:
> > On Thu, 2017-11-02 at 16:48 +0100, Ayoub Zaki wrote:
> > > sanitize fitImage hash algorithm selection with FIT_HASH_ALG
> > > switch default hash algorithm from sha1 to sha256
> > > 
> > > Signed-off-by: Ayoub Zaki <
> > > ayoub.zaki@embexus.com
> > > Acked-by: Denys Dmytriyenko <
> > > denys@ti.com
> > > ---
> > >  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/classes/kernel-fitimage.bbclass
> > > b/meta/classes/kernel-fitimage.bbclass
> > > index 179185b..3cc3a33 100644
> > > --- a/meta/classes/kernel-fitimage.bbclass
> > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > @@ -36,6 +36,9 @@ python __anonymous () {
> > >  # Options for the device tree compiler passed to mkimage '-D'
> > > feature:
> > >  UBOOT_MKIMAGE_DTCOPTS ??= ""
> > > 
> > > +# fitImage Hash Algo
> > > +FIT_HASH_ALG ?= "sha256"
> > > +
> > >  #
> > >  # Emit the fitImage ITS header
> > >  #
> > > @@ -95,7 +98,7 @@ EOF
> > >  # $4 ... Compression type
> > >  fitimage_emit_section_kernel() {
> > > 
> > > -     kernel_csum="sha1"
> > > +     kernel_csum="${FIT_HASH_ALG}"
> > > 
> > >       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> > >       if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> > > @@ -128,7 +131,7 @@ EOF
> > >  # $3 ... Path to DTB image
> > >  fitimage_emit_section_dtb() {
> > > 
> > > -     dtb_csum="sha1"
> > > +     dtb_csum="${FIT_HASH_ALG}"
> > > 
> > >       cat << EOF >> ${1}
> > >                  fdt@${2} {
> > > @@ -152,7 +155,7 @@ EOF
> > >  # $3 ... Path to setup image
> > >  fitimage_emit_section_setup() {
> > > 
> > > -     setup_csum="sha1"
> > > +     setup_csum="${FIT_HASH_ALG}"
> > > 
> > >       cat << EOF >> ${1}
> > >                  setup@${2} {
> > > @@ -179,7 +182,7 @@ EOF
> > >  # $3 ... Path to ramdisk image
> > >  fitimage_emit_section_ramdisk() {
> > > 
> > > -     ramdisk_csum="sha1"
> > > +     ramdisk_csum="${FIT_HASH_ALG}"
> > >       ramdisk_ctype="none"
> > >       ramdisk_loadline=""
> > >       ramdisk_entryline=""
> > > @@ -237,7 +240,7 @@ EOF
> > >  # $6 ... default flag
> > >  fitimage_emit_section_config() {
> > > 
> > > -     conf_csum="sha1"
> > > +     conf_csum="${FIT_HASH_ALG}"
> > >       if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
> > >               conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> > >       fi
> > 
> > Hi,
> > 
> > Any update on this patch? It was acked almost 2 years ago.
> > 
> > It would be great to have a way to change the hashsum algorithm
> > when
> > building signed images.
> > 
> 
> I agree, but it would be good to resend this patch on top of current
> master

I managed to apply it to master so its in testing now.

My concerns about the lack of tests for this class are the main reason
patches here get held up.

Cheers,

Richard


