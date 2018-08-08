Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB4776078
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:01:22 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id c192-v6so1975369qkg.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PDPd8oAp7sRRXrxvNt9Qt9v99EcX9vv0KngiGtGyqr4=;
	b=Y+mtfCBCQ9HZE6xqlzU2rR9PGC+vUmX9KIfIYo0FDuq0IOsmmKQw6plr21CSlp9Kt4
	0HjrsuJRLMrI4AWlxpb56413T0KoD+FiS8oys8wMG/i7xlGYL9/ZdREcEyehnfeAQ9A8
	4LEKXc1w1kl14233Cev7SFOxNXyUp86U2gUdvB8ChELfUeUJ/GbE3LCTwFs7v+nh4ryG
	AOcDqpaU2yfUzPLq0RIpyRq34PaeRUsk8RXvJvj9qrjzYQUdWsNqC+D43JrX1Nl+UnMm
	aWKY6gIr3ZKtJcocRRR5XOqphBzSQM+Avdgwbj14GCF5/+2kTPvlVytduCfDVbV0Pmc4
	1WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PDPd8oAp7sRRXrxvNt9Qt9v99EcX9vv0KngiGtGyqr4=;
	b=o7Wi72SXLjj/4etGgv1hJ4d99Efx9JPW0VpT/XKcy8v65NzOQ9yGNpO5GhD0M4FaJn
	p7AEDTlU7ZPF8/60s4EejkOqPJcgeaDsmfQanOwYGoDYSm0AM82x5v0W9h7R+fkCRFS/
	KM8Vs6JQFdTcksAd1N6avrScwGHelUOvn1gkIdTpdwAY5+W58j2dSDu7MT0UH5fQQLzF
	J/7VzkBkCxUdMjCNxoeVPnIU/+IKSi1MEbeE/oUEf8uqNKosLIy6vXV1ecchu9XC6EYF
	h/DcO4Wx1XlmzhC9Rk7UrseveQjX3mDptWWCoL7S1zXdTd8fd7lAzDYyv2TNFVmUKhra
	9OIA==
X-Gm-Message-State: AOUpUlHFZtG+U/7TyThRB4O4Alg2O1Ce9te9NeOzYauY08WJLoCZaa+0
	CmPmH1xuefyEgM+woenr/V1RSFC8N4ZF/v+DeQ0=
X-Google-Smtp-Source: AA+uWPzGjckIz8NpMBVgHFnDvw2utLuorzzlKG6Q6Mi4MCDXkMvqIk1KpuvYOz8DPxEmVyiXDFADZ+wvbdzz7UeqmBk=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr3149141qke.12.1533747682931; 
	Wed, 08 Aug 2018 10:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1533595822.git.raj.khem@gmail.com>
	<06c361481025023e6ad962759e5968bd9c19c0b7.1533595822.git.raj.khem@gmail.com>
	<CAJTo0LZcy+LcFu0stiT5ve4mOy3KCYDH_JRONAxxYAZxY343Pg@mail.gmail.com>
	<CAMKF1sq4kwGH4Zs4gDDruwWL4QmCUmf1RkcdMTXryxyUi0K-ew@mail.gmail.com>
	<CAJTo0Lbox+=xhSooxHxe7QOsFRjL69VfUC3vmjzq7C=MZx3BfA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbox+=xhSooxHxe7QOsFRjL69VfUC3vmjzq7C=MZx3BfA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2018 10:00:56 -0700
Message-ID: <CAMKF1sr9BMq8q=n2CE1oUtdejqNUJuHp_3F6F3X67DUhM19y1w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/18] ppp: Use openssl for the DES instead of the libcrypt / glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 17:01:22 -0000
Content-Type: text/plain; charset="UTF-8"

Looking a bit more I see that ppp upstream has switched to using
openssl as well see
https://github.com/paulusmack/ppp/commit/3c7b86229f7bd2600d74db14b1fe5b3896be3875

so we are inline

secondly, using libxcrypt would either mean that we enable obsolete
APIs to support existing functionality in ppp. I would not like to do
that, infact eventually I would suggest to even disable weak hashes as
we move along.
This also would mean at one point we have to switch back to whatever
upstream ppp is doing when we upgrade ppp.This will be throw away
work.


On Wed, Aug 8, 2018 at 8:15 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> My understanding is that libxcrypt was basically the crypto pieces
> ripped out of glibc, but the github page lists DES as an implemented
> algorithm.
>
> Ross
>
> On 8 August 2018 at 16:01, Khem Raj <raj.khem@gmail.com> wrote:
> > Does it provide DES implementation I am not sure but if it does then it
> > might be another option
> >
> > On Wed, Aug 8, 2018 at 3:40 AM Burton, Ross <ross.burton@intel.com> wrote:
> >>
> >> Why not use libxcrypt?
> >>
> >> Ross
> >>
> >> On 6 August 2018 at 23:57, Khem Raj <raj.khem@gmail.com> wrote:
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ---
> >> >  .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       | 84 +++++++++++++++++++
> >> >  meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  5 +-
> >> >  2 files changed, 87 insertions(+), 2 deletions(-)
> >> >  create mode 100644
> >> > meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> >> >
> >> > diff --git
> >> > a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> >> > b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> >> > new file mode 100644
> >> > index 0000000000..e53f240543
> >> > --- /dev/null
> >> > +++ b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> >> > @@ -0,0 +1,84 @@
> >> > +Used openssl for the DES instead of the libcrypt / glibc
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > +
> >> > +Index: ppp-2.4.7/pppd/Makefile.linux
> >> > +===================================================================
> >> > +--- ppp-2.4.7.orig/pppd/Makefile.linux
> >> > ++++ ppp-2.4.7/pppd/Makefile.linux
> >> > +@@ -38,7 +38,7 @@ LIBS =
> >> > + # Uncomment the next 2 lines to include support for Microsoft's
> >> > + # MS-CHAP authentication protocol.  Also, edit
> >> > plugins/radius/Makefile.linux.
> >> > + CHAPMS=y
> >> > +-USE_CRYPT=y
> >> > ++#USE_CRYPT=y
> >> > + # Don't use MSLANMAN unless you really know what you're doing.
> >> > + #MSLANMAN=y
> >> > + # Uncomment the next line to include support for MPPE.  CHAPMS (above)
> >> > must
> >> > +@@ -132,7 +132,7 @@ endif
> >> > +
> >> > + ifdef NEEDDES
> >> > + ifndef USE_CRYPT
> >> > +-LIBS     += -ldes $(LIBS)
> >> > ++LIBS     += -lcrypto
> >> > + else
> >> > + CFLAGS   += -DUSE_CRYPT=1
> >> > + endif
> >> > +Index: ppp-2.4.7/pppd/pppcrypt.c
> >> > +===================================================================
> >> > +--- ppp-2.4.7.orig/pppd/pppcrypt.c
> >> > ++++ ppp-2.4.7/pppd/pppcrypt.c
> >> > +@@ -64,7 +64,7 @@ u_char *des_key;     /* OUT 64 bit DES key w
> >> > +       des_key[7] = Get7Bits(key, 49);
> >> > +
> >> > + #ifndef USE_CRYPT
> >> > +-      des_set_odd_parity((des_cblock *)des_key);
> >> > ++      DES_set_odd_parity((DES_cblock *)des_key);
> >> > + #endif
> >> > + }
> >> > +
> >> > +@@ -158,25 +158,25 @@ u_char *clear;   /* OUT 8 octets */
> >> > + }
> >> > +
> >> > + #else /* USE_CRYPT */
> >> > +-static des_key_schedule       key_schedule;
> >> > ++static DES_key_schedule       key_schedule;
> >> > +
> >> > + bool
> >> > + DesSetkey(key)
> >> > + u_char *key;
> >> > + {
> >> > +-      des_cblock des_key;
> >> > ++      DES_cblock des_key;
> >> > +       MakeKey(key, des_key);
> >> > +-      des_set_key(&des_key, key_schedule);
> >> > ++      DES_set_key(&des_key, &key_schedule);
> >> > +       return (1);
> >> > + }
> >> > +
> >> > + bool
> >> > +-DesEncrypt(clear, key, cipher)
> >> > ++DesEncrypt(clear, cipher)
> >> > + u_char *clear;        /* IN  8 octets */
> >> > + u_char *cipher;       /* OUT 8 octets */
> >> > + {
> >> > +-      des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
> >> > +-          key_schedule, 1);
> >> > ++      DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
> >> > ++          &key_schedule, 1);
> >> > +       return (1);
> >> > + }
> >> > +
> >> > +@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
> >> > + u_char *cipher;       /* IN  8 octets */
> >> > + u_char *clear;        /* OUT 8 octets */
> >> > + {
> >> > +-      des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
> >> > +-          key_schedule, 0);
> >> > ++      DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
> >> > ++          &key_schedule, 0);
> >> > +       return (1);
> >> > + }
> >> > +
> >> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> >> > b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> >> > index a1bb7d71c1..f4646bd693 100644
> >> > --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> >> > +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> >> > @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris
> >> > systems."
> >> >  SECTION = "console/network"
> >> >  HOMEPAGE = "http://samba.org/ppp/"
> >> >  BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
> >> > -DEPENDS = "libpcap"
> >> > +DEPENDS = "libpcap openssl"
> >> >  LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
> >> >  LIC_FILES_CHKSUM =
> >> > "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea
> >> > \
> >> >
> >> > file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8
> >> > \
> >> > @@ -32,6 +32,7 @@ SRC_URI =
> >> > "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
> >> >             file://fix-CVE-2015-3310.patch \
> >> >
> >> > file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
> >> >             file://0001-ppp-Remove-unneeded-include.patch \
> >> > +           file://ppp-2.4.7-DES-openssl.patch \
> >> >  "
> >> >
> >> >  SRC_URI_append_libc-musl = "\
> >> > @@ -49,7 +50,7 @@ EXTRA_OECONF = "--disable-strip"
> >> >  # Package Makefile computes CFLAGS, referencing COPTS.
> >> >  # Typically hard-coded to '-O2 -g' in the Makefile's.
> >> >  #
> >> > -EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${S}/include"'
> >> > +EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl
> >> > -I${S}/include"'
> >> >
> >> >  do_configure () {
> >> >         oe_runconf
> >> > --
> >> > 2.18.0
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

