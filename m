Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA9C7FE3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 16:06:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so7917149wro.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aC9YG6891Cm8L1USHS5qkr0KeD4W1PdEPt5NiTBflpU=;
	b=Nt/tQSpAN2udwkSnttLNOr8l3PPmMlT0fY0Dkt3PSKmMX8c8VMgKuvg8J3aOCIMm/Z
	7gBos5+PlOdvS5Cy/8daR33Hfm1EcymDR7/FwSYsaTqdV09d7F//P6etkrcQEX7sDheQ
	vveUoETp75PtGF2K+tJzj+nkmf0+9kEG0+MQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aC9YG6891Cm8L1USHS5qkr0KeD4W1PdEPt5NiTBflpU=;
	b=aF2mumJRZYW9c/E5kiFHZiyrHoYgqpaqxzxLoC7a8w5kaeAoit7fO3dqiZx0b596c4
	A9xyYEYLKgb7FOEPjUTg58pDN99VoafCr0v2FGS3u1d/4G7dS0xeR+myjOX1itESdgjN
	s/bOse0woKCBYW4W+e5TxSurl4zvFywEjlV/aWphaVxSfgf+PVzQaU8gm43acaycDHOs
	oPXS9rOByfPWa9uJ5pOFC0uJAO1kFkFc6pEpz2brbc/VWaugr5aOj5+6qua99jgphQwA
	L8euKUQVrEcRjoctrzAc3olGBNzCfFXmXzAcswRirOXNKdHiH2xQ6ehX/rD6Xv9xq9DH
	Bnkg==
X-Gm-Message-State: APjAAAVPmKsV7v7/n9l7IEXZX3CyjQu/fLh7qE90PmCjRhs2wtQ3ic1h
	1ezrrxF8L39fxYGgvuWXLSi+Vg==
X-Google-Smtp-Source: APXvYqzepkEfK0t9jt40E4Umh+U4H5FKxJWwnLZBxwj7h7GYJZ57wEskHpO7X2pKNJ4N7pmz8Cxhmw==
X-Received: by 2002:adf:c746:: with SMTP id b6mr11851964wrh.298.1579709220072; 
	Wed, 22 Jan 2020 08:07:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w22sm4253242wmk.34.2020.01.22.08.06.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 08:06:59 -0800 (PST)
Message-ID: <e6c8ea7d5e9497e0f11da3da3babdf57660b3ebe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 16:06:58 +0000
In-Reply-To: <b1001ab8-5972-b791-b9db-9aab7fa34da0@gmail.com>
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
	<20200119185959.406212-4-JPEWhacker@gmail.com>
	<d3f6ae17e1a4da2e9aea675d37654a1fe0b1df3d.camel@linuxfoundation.org>
	<b1001ab8-5972-b791-b9db-9aab7fa34da0@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] oeqa: reproducible: Do not strip packages
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
X-List-Received-Date: Wed, 22 Jan 2020 16:07:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-22 at 10:02 -0600, Joshua Watt wrote:
> On 1/22/20 9:53 AM, Richard Purdie wrote:
> > On Sun, 2020-01-19 at 12:59 -0600, Joshua Watt wrote:
> > > Do not strip packages when testing reproducible builds. In some cases,
> > > stripped data differs between builds, but then gets removed. However,
> > > the contents affect the generation of the GCC build-id, which then
> > > differs in the resulting ELF files, even though the data that caused
> > > this is no longer there. Inhibit stripping so that their causes can be
> > > evaluated.
> > > 
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >   meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> > > index c00b92d2e90..34462a0b3a4 100644
> > > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > > @@ -149,6 +149,7 @@ class ReproducibleTests(OESelftestTestCase):
> > >           config = textwrap.dedent('''\
> > >               INHERIT += "reproducible_build"
> > >               PACKAGE_CLASSES = "{package_classes}"
> > > +            INHIBIT_PACKAGE_STRIP = "1"
> > >               TMPDIR = "{tmpdir}"
> > >               ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
> > >                           tmpdir=tmpdir)
> > This generates quite the failure list:
> > 
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dbg_20190110-r0_all.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dev_20190110-r0_all.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-doc_20190110-r0_all.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates_20190110-r0_all.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/acl-ptest_2.2.53-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/attr-ptest_2.4.48-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/bc-doc_1.07.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/binutils-doc_2.33.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/busybox-ptest_1.31.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/coreutils-doc_8.31-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/e2fsprogs-doc_1.45.4-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/elfutils-ptest_0.178-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ethtool-ptest_5.3-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/flex-ptest_2.6.4-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/icu-dev_64.2-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libevdev-src_1.8.0-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt-dbg_1.8.5-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt_1.8.5-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput-dbg_1.14.3-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput10_1.14.3-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libx11-locale_1.6.9-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxml2-ptest_2.9.10-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence-dbg_1.3-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence1_1.3-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/m4-ptest_1.4.18-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-doc_4.8.23-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-helpers-perl_4.8.23-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20190803-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-doc_1.1.1d-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/opkg-utils-doc_0.4.2-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-dbg_1.8.29-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-doc_1.8.29-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo_1.8.29-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tcp-wrappers-src_7.6-r10_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/time-doc_1.9-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg-dbg_1.20.6-r0_amd64.deb
> >   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg_1.20.6-r0_amd64.deb
> > 
> > (I lined wrapped it)
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/629
> 
> Ok, thanks. Did the offending packages get captured somewhere so I can 
> take a look at them?

I've placed them here:

https://autobuilder.yocto.io/pub/repro-fail/build-st-12270/

which is after I fixed that code:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=9f225cf966b8a96775d74f41423206d157bce2e3

Perhaps we could make this a cofiguration parameter I could pass in and
make it clean up empty directories if nothing is saved. I might then be
able to make it "auto publish" these failures.

Cheers,

Richard




