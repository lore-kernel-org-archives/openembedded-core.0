Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 05BF36C4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:14:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w9so4149757wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=pdwxwFghkOW73lqiL1t1+D2Ru/A2/OmeNXvxePhWfoI=;
	b=V5bZ/1mmZA9M2QEZrEuhbP/F9CbbcknRDasF6JYDAFpvSyKe+wNjhYOA/WCAutDHUR
	WkqrDTb4gS4DTzSg3M6CZLSeVHXofJftA0ds7xvEbm7jUaJBqtxKmGhUEzVrBAmm6q+w
	uLI4EZo3+9iF/wTMLgKh+WKQu6/GM3wpDAGRD7Cq0h1CJh4Mjd/hi/bmL8XCD9qCa7+R
	lW3NzAV8XfTnr2B5tpXTlmW1e/pl+Lp7O5bLyeEKb3+S0WOMMNsiSZ8DSNVVmR4xx5La
	69RnH57FRCsP+/p7IgNWAP/v3fVo0u3JbtFyOFHdjHKJHzUO7sLKpR1yKFlH8ov2xLh8
	kzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pdwxwFghkOW73lqiL1t1+D2Ru/A2/OmeNXvxePhWfoI=;
	b=kCZ+ti0sFSReEXEdlX8dVceO3yqZkniChD2Wi63uXO18oYWj26wDS/zywUnecuRRKc
	H6VnAfZ5jAVdWO5vr09g1KywEPlgQjUGqC/zB8xMdwAwIRBw/XYO4qf62oIcySZYxYAa
	TC6+dM0IS2SG8Bb8EvdcU/YQX1nBEeWjCxQw4F9FKQ9MpRfMl3a6XF1CTL0OmhDdlaeq
	mmV0Rar/9gCOBLAYLSaslP3gdGXnpmMmdVOEd5waainaJ9CBRlQG4mauL/Bk1YgYpDbp
	+d+msaK3GHOCkV6k7pSwIObkqA9Jou2U3vaLVSKjbkAyCz1tf7HMyyz+eKCp6lrVQlBP
	+cyg==
X-Gm-Message-State: APjAAAWxpTCN1tnuZBBtd60z0MymkBHB/X03U44RrggV8YrzH4blM39b
	NoqQBIRZJbS9pZ+X3CCv61A=
X-Google-Smtp-Source: APXvYqyXIpcD4FU6YuuRpDXVsU7tL/nR99B/q6J9YrJWrxRN7DsAe/R8l1FzyiU1hXsnzKtIzO1Ntg==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr7326972wmf.20.1560935695465; 
	Wed, 19 Jun 2019 02:14:55 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	x3sm21011613wrp.78.2019.06.19.02.14.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:14:54 -0700 (PDT)
Message-ID: <2964bfd2c8101f0497faf7c4de54b78172b5631d.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jun 2019 10:14:54 +0100
In-Reply-To: <CAO5Uq5QK8+bF812AF4o-AG+sOMb4E51Wj88CoLWL4jSccLdy6A@mail.gmail.com>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
	<615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
	<2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
	<CAO5Uq5QK8+bF812AF4o-AG+sOMb4E51Wj88CoLWL4jSccLdy6A@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Jun 2019 09:14:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 10:06 +0100, Alex Kiernan wrote:
> On Wed, Jun 19, 2019 at 9:48 AM Luca Boccassi <
> luca.boccassi@gmail.com
> > wrote:
> > On Tue, 2019-06-18 at 17:11 +0100, Richard Purdie wrote:
> > > On Tue, 2019-06-18 at 08:53 -0700, Khem Raj wrote:
> > > > On Tue, Jun 18, 2019 at 1:26 AM Luca Boccassi <
> > > > luca.boccassi@gmail.com
> > > > 
> > > > > wrote:
> > > > > On Thu, 2017-11-02 at 16:48 +0100, Ayoub Zaki wrote:
> > > > > > sanitize fitImage hash algorithm selection with
> > > > > > FIT_HASH_ALG
> > > > > > switch default hash algorithm from sha1 to sha256
> > > > > > 
> > > > > > Signed-off-by: Ayoub Zaki <
> > > > > > ayoub.zaki@embexus.com
> > > > > > 
> > > > > > 
> > > > > > Acked-by: Denys Dmytriyenko <
> > > > > > denys@ti.com
> > > > > > 
> > > > > > 
> > > > > > ---
> > > > > >  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
> > > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/meta/classes/kernel-fitimage.bbclass
> > > > > > b/meta/classes/kernel-fitimage.bbclass
> > > > > > index 179185b..3cc3a33 100644
> > > > > > --- a/meta/classes/kernel-fitimage.bbclass
> > > > > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > > > > @@ -36,6 +36,9 @@ python __anonymous () {
> > > > > >  # Options for the device tree compiler passed to mkimage
> > > > > > '-D'
> > > > > > feature:
> > > > > >  UBOOT_MKIMAGE_DTCOPTS ??= ""
> > > > > > 
> > > > > > +# fitImage Hash Algo
> > > > > > +FIT_HASH_ALG ?= "sha256"
> 
> Should this be ??=
> 
> > > > > > +
> > > > > >  #
> > > > > >  # Emit the fitImage ITS header
> > > > > >  #
> > > > > > @@ -95,7 +98,7 @@ EOF
> > > > > >  # $4 ... Compression type
> > > > > >  fitimage_emit_section_kernel() {
> > > > > > 
> > > > > > -     kernel_csum="sha1"
> > > > > > +     kernel_csum="${FIT_HASH_ALG}"
> > > > > > 
> > > > > >       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> > > > > >       if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> > > > > > @@ -128,7 +131,7 @@ EOF
> > > > > >  # $3 ... Path to DTB image
> > > > > >  fitimage_emit_section_dtb() {
> > > > > > 
> > > > > > -     dtb_csum="sha1"
> > > > > > +     dtb_csum="${FIT_HASH_ALG}"
> > > > > > 
> > > > > >       cat << EOF >> ${1}
> > > > > >                  fdt@${2} {
> > > > > > @@ -152,7 +155,7 @@ EOF
> > > > > >  # $3 ... Path to setup image
> > > > > >  fitimage_emit_section_setup() {
> > > > > > 
> > > > > > -     setup_csum="sha1"
> > > > > > +     setup_csum="${FIT_HASH_ALG}"
> > > > > > 
> > > > > >       cat << EOF >> ${1}
> > > > > >                  setup@${2} {
> > > > > > @@ -179,7 +182,7 @@ EOF
> > > > > >  # $3 ... Path to ramdisk image
> > > > > >  fitimage_emit_section_ramdisk() {
> > > > > > 
> > > > > > -     ramdisk_csum="sha1"
> > > > > > +     ramdisk_csum="${FIT_HASH_ALG}"
> > > > > >       ramdisk_ctype="none"
> > > > > >       ramdisk_loadline=""
> > > > > >       ramdisk_entryline=""
> > > > > > @@ -237,7 +240,7 @@ EOF
> > > > > >  # $6 ... default flag
> > > > > >  fitimage_emit_section_config() {
> > > > > > 
> > > > > > -     conf_csum="sha1"
> > > > > > +     conf_csum="${FIT_HASH_ALG}"
> > > > > >       if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
> > > > > >               conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> > > > > >       fi
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > Any update on this patch? It was acked almost 2 years ago.
> > > > > 
> > > > > It would be great to have a way to change the hashsum
> > > > > algorithm
> > > > > when
> > > > > building signed images.
> > > > > 
> > > > 
> > > > I agree, but it would be good to resend this patch on top of
> > > > current
> > > > master
> > > 
> > > I managed to apply it to master so its in testing now.
> > > 
> > > My concerns about the lack of tests for this class are the main
> > > reason
> > > patches here get held up.
> > > 
> > > Cheers,
> > > 
> > > Richard
> > 
> > Thanks Richard - in case it helps, we've been using this patch for
> > a
> > few months at $work (on top of sumo) and it seems to work fine.
> > 
> 
> I expect that's true for everyone touching stuff in this class - it
> works fine for them... the problem is everyone else, since it's
> terribly fragile and has no tests.
> 
> I'd not be at all surprised if changing the default from sha1 to
> sha256 doesn't break someone.

Keeping the default to sha1 would be fine by me, it's the ability to
configure it that is useful.

-- 
Kind regards,
Luca Boccassi


