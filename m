Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 83B8D79312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 21:17:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f17-v6so3218752wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 14:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1drC7p7DhAWM9JcjMRc/r9CUsGjGB3JFUxWzrSVvm9U=;
	b=Ssz2vFRYBNjpz3t8ZX2FbEb+o8JqnGBxdJgZD9ljRg88M5XLJL1UunpqS0skcRO5E5
	T08RH2BoCjjKy3/FCpKNm9A8bf2bnJ4th7chHmG13KI0CBPKgzTJ7ejOKVOC/tmxf2EZ
	DscE6iPPk2gaWAdPqGSzK5VgDpOrfWo6SNQTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1drC7p7DhAWM9JcjMRc/r9CUsGjGB3JFUxWzrSVvm9U=;
	b=b0LB00fgTH5Vj2eYPwRf25NBgD9cRUE0II6CBEsp+15o4t1t+AtWHw08mY3Ju7AN5p
	syKnmrNYYNq4WdDLhk4pt88eMykb2YttDzzK4YHOCwuV867TtdVSzeJNH6nlJC6zSPa9
	ebCkv9n9vwRTqkFOJ/qmsFlRf6cNbR2v+A1ouCNfICWiL3DkS1me6TJG78jiBu/VKFBG
	ltArQyrNE59S/+D/8nv4HhI+mawJ4tY4HU8Aw1jhywlKhkDLmZ2I6RkqAnpMp87i+U1e
	7lUW6UWHSbSXriMBYVSnabAgOHrIC68jzAkZRnBTtomje6NrhD24MSIzjagk4dsyzzUN
	2DXQ==
X-Gm-Message-State: ABuFfoi3dE0HLEYj9PQ3NDOPPGzyS9i72Y0Kiwzor8vZT8qoBDVdN99L
	ayLmbudwL2OFTK0JBpGtR5Xwbg==
X-Google-Smtp-Source: ACcGV604KFy+rT8KlEMHxi4qXYWxvvEZvqiZU4hiLpFC0Dj42Bpsc+RgcOqGfRR1cdRrsMwgu9Pg1w==
X-Received: by 2002:adf:c513:: with SMTP id
	q19-v6mr51300189wrf.46.1540329473861; 
	Tue, 23 Oct 2018 14:17:53 -0700 (PDT)
Received: from hex ([167.98.65.38]) by smtp.gmail.com with ESMTPSA id
	r134-v6sm1514013wmg.9.2018.10.23.14.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Oct 2018 14:17:52 -0700 (PDT)
Message-ID: <3325dc5675228ef92e512aa4c39d4c2480fb88b7.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 22:17:52 +0100
In-Reply-To: <5ca5c33e-42e1-9a14-2b60-ff84d6f5774e@windriver.com>
References: <cover.1539876421.git.kai.kang@windriver.com>
	<8de5585c10d806d15ba4550d05c3c8fbcab26990.1539876421.git.kai.kang@windriver.com>
	<e7a1a326-ce51-2b1b-eadb-c1c650f3fcbe@windriver.com>
	<5ca5c33e-42e1-9a14-2b60-ff84d6f5774e@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] udev-hwdb: fix postinstall scripts failures when multilib enabled
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
X-List-Received-Date: Tue, 23 Oct 2018 21:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-10-23 at 14:43 +0800, Kang Kai wrote:
> On 2018/10/22 下午11:11, Kang Kai wrote:
> > On 2018/10/18 下午11:28, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > When multilib is enabled and both udev-hwdb and ${MLPREFIX}udev-
> > > hwdb are
> > > installed to image, it fails to run one of their postinstall
> > > scripts
> > > that they both call ${base_bindir}/udevadm with same user mode
> > > qemu.
> > > 
> > > Duplicate udevadm and add postinst-intercept update_udev_hwdb to
> > > fix the
> > > failures.
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   meta/recipes-core/systemd/systemd_239.bb     | 13 ++++++-------
> > >   meta/recipes-core/udev/eudev_3.2.5.bb        | 11 +++++------
> > >   scripts/postinst-intercepts/update_udev_hwdb |  6 ++++++
> > >   3 files changed, 17 insertions(+), 13 deletions(-)
> > >   create mode 100644 scripts/postinst-intercepts/update_udev_hwdb
> > > 
> > > diff --git a/meta/recipes-core/systemd/systemd_239.bb 
> > > b/meta/recipes-core/systemd/systemd_239.bb
> > > index 7ed932141d..44e972ebce 100644
> > > --- a/meta/recipes-core/systemd/systemd_239.bb
> > > +++ b/meta/recipes-core/systemd/systemd_239.bb
> > > @@ -284,6 +284,10 @@ do_install() {
> > >               chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> > >           fi
> > >       fi
> > > +
> > > +    # duplicate udevadm for postinst script
> > > +    install -d ${D}${libexecdir}
> > > +    ln ${D}${base_bindir}/udevadm
> > > ${D}${libexecdir}/${MLPREFIX}udevadm
> > >   }
> > >     @@ -542,6 +546,7 @@ FILES_udev += "${base_sbindir}/udevd \
> > >                  ${systemd_unitdir}/system/*udev* \
> > >                  ${systemd_unitdir}/system/*.wants/*udev* \
> > >                  ${base_bindir}/udevadm \
> > > +               ${libexecdir}/${MLPREFIX}udevadm \
> > >                  ${datadir}/bash-completion/completions/udevadm \
> > >                 "
> > >   @@ -580,13 +585,7 @@ pkg_prerm_${PN} () {
> > >   PACKAGE_WRITE_DEPS += "qemu-native"
> > >   pkg_postinst_udev-hwdb () {
> > >       if test -n "$D"; then
> > > -        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-
> > > usermode', 
> > > 'true','false', d)}; then
> > > -            ${@qemu_run_binary(d, '$D',
> > > '${base_bindir}/udevadm')} 
> > > hwdb --update \
> > > -                --root $D
> > > -            chown root:root $D${sysconfdir}/udev/hwdb.bin
> > > -        else
> > > -            $INTERCEPT_DIR/postinst_intercept
> > > delay_to_first_boot 
> > > ${PKG} mlprefix=${MLPREFIX}
> > > -        fi
> > > +        $INTERCEPT_DIR/postinst_intercept update_udev_hwdb
> > > ${PKG} 
> > > mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
> > >       else
> > >           udevadm hwdb --update
> > >       fi
> > > diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb 
> > > b/meta/recipes-core/udev/eudev_3.2.5.bb
> > > index efd62c6495..592dd8f22a 100644
> > > --- a/meta/recipes-core/udev/eudev_3.2.5.bb
> > > +++ b/meta/recipes-core/udev/eudev_3.2.5.bb
> > > @@ -50,6 +50,10 @@ do_install_append() {
> > >         # hid2hci has moved to bluez4. removed in udev as of
> > > version 169
> > >       rm -f ${D}${base_libdir}/udev/hid2hci
> > > +
> > > +    # duplicate udevadm for postinst script
> > > +    install -d ${D}${libexecdir}
> > > +    ln ${D}${bindir}/udevadm
> > > ${D}${libexecdir}/${MLPREFIX}udevadm
> > >   }
> > >     do_install_prepend_class-target () {
> > > @@ -81,12 +85,7 @@ RPROVIDES_eudev-hwdb += "udev-hwdb"
> > >   PACKAGE_WRITE_DEPS += "qemu-native"
> > >   pkg_postinst_eudev-hwdb () {
> > >       if test -n "$D"; then
> > > -        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-
> > > usermode', 
> > > 'true','false', d)}; then
> > 
> > Hi Richard,
> > 
> > It seems check for 'qemu-usermode' should not be removed. And it
> > also 
> > need to check for other intercept scripts.
> 
> I just realize that intercept scripts have been handled well in 
> lib/oe/package_manager.py. So please ignore my last reply.

I'm now confused, which version of this patch do we need?

Cheers,

Richard


