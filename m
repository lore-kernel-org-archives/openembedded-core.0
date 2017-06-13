Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id B8049782D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:14:07 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id m47so32575807iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=nVIUNTvq7OEO0H82SZ5PrnYcrob5jkTUvD8x3K+WULU=;
	b=P9keK6kRJxEVVKe7NZcCsSKMFfiLMjLYq3pG3qlAUFSDJWsvZUtvOp8a+WAHyLw4S0
	6fWiGW+ptKBdsAAy2rVRaYeG6xU0qjEIvTiaIrDkuCJykdmSa2IzOfNQl2B1dVhlDJPh
	39ygnsTuluCfiI2gob/5GMyigd01HWqxFBzrHA7a2s0GaQHBOwHI5XLmx14q2njaaueD
	amgdGCIkAAxwva55KJQIpT2wFHKfNuWOfkbGnPsFzfY8dTEnSVza5cIZ2L+MpTxRgcvP
	Am0Z6yRah+ugjE28FsCkNP26K4MXzsgrOuhwvCvmCOeU0UBbHGAEVtFT20aswX8W3N9E
	QqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=nVIUNTvq7OEO0H82SZ5PrnYcrob5jkTUvD8x3K+WULU=;
	b=n6xytIn2jaK7dV/vQxpuH2m+w8whmFD6VpqjoG8orfOGaFp/UgDp/c3jPgXbTOLCH5
	BLzss3d0u5YkiI8AcYGBmUpOOtgEB7ErsY107SncrDmN1iGSTBJKPna4Qnl1dPvqJnYW
	aLcuCRTkv3xRyp51T6ljGHaVec7g/t5GZe8sg6VIVfAnHwIXae8cizRiNFh7GykmYYlJ
	3RVHvTotpvdiDvkGG9ouDdvLVX16xZgY+jnzruhOyNcxyVSvZ73FCXmf4ey+vDBq1eo5
	Bzp3Me4x8t+SjNZTV07gGu9hteGtftcEj9DAJImK8PITQ8JJwfvjaATF0xYpRCBY2POA
	byNA==
X-Gm-Message-State: AODbwcBZN715H4IRZI67JAIW7YRWgUQFu6SvMBcMh+xDdh/bX+6J1pbC
	TbvaDfic0NM3/jyjpbI=
X-Received: by 10.36.172.84 with SMTP id m20mr15300151iti.119.1497338048571;
	Tue, 13 Jun 2017 00:14:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D5A8.dip0.t-ipconnect.de. [93.232.213.168])
	by smtp.gmail.com with ESMTPSA id
	z31sm5269060ita.25.2017.06.13.00.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 00:14:07 -0700 (PDT)
Message-ID: <1497338044.30163.324.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 13 Jun 2017 09:14:04 +0200
In-Reply-To: <20170612232345.GA28053@denix.org>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
	<20170612194635.GX28053@denix.org>
	<1497301519.30163.288.camel@intel.com>
	<20170612232345.GA28053@denix.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Tue, 13 Jun 2017 07:14:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-12 at 19:23 -0400, Denys Dmytriyenko wrote:
> On Mon, Jun 12, 2017 at 11:05:19PM +0200, Patrick Ohly wrote:
> > On Mon, 2017-06-12 at 15:46 -0400, Denys Dmytriyenko wrote:
> > > This now breaks parsing my distro config on these lines:
> > > 
> > > ENABLE_SYSVINIT ?= "0"
> > > DISTRO_FEATURES_append = "${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}"
> > > 
> > > 
> > > Here's the log:
> > > 
> > > ERROR: Unable to parse /OE/arago-master/sources/bitbake/lib/bb/data_smart.py
> > > Traceback (most recent call last):
> > >   File "/OE/arago-master/sources/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s='${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}', varname='DISTRO_FEATURES_append'):
> > >                  except Exception as exc:
> > >     >                raise ExpansionError(varname, s, exc) from exc
> > >      
> > > bb.data_smart.ExpansionError: Failure expanding variable DISTRO_FEATURES_append, expression was ${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)} which triggered exception NameError: name 'base_conditional' is not defined
> > 
> > base_conditional() seems to come from utils.bbclass, which gets
> > inherited by base.bbclass. Looks like DISTRO_FEATURES and thus this
> > DISTRO_FEATURES_append end up getting expanded before these classes are
> > fully parsed.
> 
> FWIW, replacing it with oe.utils.conditional() doesn't help.

How about the following patch? It solves the problem for me.

It also addresses some unease that I had when Richard proposed the
distro overrides approach (cyclic dependency of "DISTRO_FEATURES depends
on OVERRIDES which depends on DISTRO_FEATURES") by setting the overrides
once for the DISTRO_FEATURES as they are set at the end of the base
configuration. That's more deterministic; previously OVERRIDES could
basically change randomly during base configuration parsing.

I couldn't give a good example for this cyclic dependency at the time.
Let me add that now.

This code has an obvious cyclic dependency, and it indeed fails as I had
expected:

DISTRO_FEATURES_append = " ${@ bb.utils.contains('DISTRO_FEATURES', 'foo', 'bar', '', d) }"
DISTRO_FEATURES_append = " foo"

=> bb.data_smart.ExpansionError: Failure expanding variable
DISTRO_FEATURES, expression was ${@ bb.utils.contains('DISTRO_FEATURES',
'foo', 'bar', '', d) } which triggered exception RuntimeError: maximum
recursion depth exceeded

In this code, the cyclic dependency is a bit more hidden, and depending
on when things get evaluated, one gets foo and bar in DISTRO_FEATURES
(for example, in "bitbake -e" and thus recipes):
DISTRO_FEATURES_OVERRIDES += "bar"
DISTRO_FEATURES_append = " bar"
DISTRO_FEATURES_append_df-bar = " foo"

That last example still works with the patch below, but I would argue
that because of the conceptual issue (DISTRO_FEATURES depending on
content of DISTRO_FEATURES) it cannot be expected to work.

Once things get more complicated, it just fails in other unexpected
ways:
DISTRO_FEATURES_OVERRIDES += "bar foo"
DISTRO_FEATURES_append = " bar"
DISTRO_FEATURES_append_df-bar = " foo"

This adds bar and foo to DISTRO_FEATURES, but only bar ends up in
OVERRIDES when using the patch below. It was working with code
that sets distro overrides dynamically. This might be seen as a drawback
of the approach below, but as it only affects code that (IMHO) isn't
valid, I'm not too worried about that.

Let me also point out that the approach below completely sidesteps
potential vardeps problems, because the dependency of OVERRIDES on
DISTRO_FEATURES_OVERRIDES and DISTRO_FEATURES is hidden. My expectation
is that OVERRIDES are part of the base hash and that thus tracking of
how it gets computed isn't necessary. It seems to work in practice for
me:

DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_OVERRIDES += "bar"
DISTRO_FEATURES_append = " bar"
PACKAGECONFIG_append_pn-systemd_df-bar = " gcrypt"

Changing either DISTRO_FEATURES_OVERRIDES or the DISTRO_FEATURES_append
changes the signature of systemd:do_configure as expected.

We are currently having a problem with the yocto-compat-layer.py
signature check in refkit where it complains about:
        List of dependencies for variable DISTROOVERRIDES changed from
        '{'DISTRO'}' to '{'DISTRO_FEATURES', 'DISTRO',
        'DISTROFEATURES2OVERRIDES'}'

That's for a slightly older OE-core and the distrooverrides.bbclass
approach. I don't know yet why that is now failing (it was working for
OE-core 2.3), but my expectation is that the approach below would avoid
it.

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 78926656d77..356aeba72ad 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -234,6 +234,11 @@ python base_eventhandler() {
         # Works with the line in layer.conf which changes PATH to point here
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
+        # Base configuration complete, DISTRO_FEATURES finalized => convert selected features
+        # into overrides.
+        e.data.setVar('DISTROFEATURESOVERRIDES',
+                      ''.join([':df-' + x for x in sorted(set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set(d.getVar('DISTRO_FEATURES').split()))]))
+
 
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bc438cca826..6069130f488 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -727,15 +727,23 @@ FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
 # distro features remain set also for native and nativesdk
 # recipes, so that these overrides can also be used there.
 #
-# Beware that this part of OVERRIDES changes during parsing, so usage
-# of these overrides should be limited to .bb and .bbappend files,
-# because then DISTRO_FEATURES is final.
+# Beware that DISTRO_FEATURES change during parsing of the
+# base configuration. These overrides can be used when setting
+# variables in the base configuration, but variable expansion
+# will only have the desired effect in recipes.
+#
+# Even worse, DISTRO_FEATURES might not be even usable during base
+# configuration parsing. For example, embedded Python code with calls
+# to base_conditional() can fail because the function is not defined.
+# yet. Therefore these conditionals are set by base.bbclass only after
+# parsing the base configuration is complete.
 DISTRO_FEATURES_OVERRIDES ??= ""
 DISTRO_FEATURES_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
 Each entry is added to OVERRIDES as df-<feature> if <feature> is in DISTRO_FEATURES."
 DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"
 DISTRO_FEATURES_FILTER_NATIVESDK_append = " ${DISTRO_FEATURES_OVERRIDES}"
-DISTROFEATURESOVERRIDES = "${@ ''.join([':df-' + x for x in (set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
+# Initially empty, set once when DISTRO_FEATURES is stable.
+DISTROFEATURESOVERRIDES = ""
 
 ##################################################################
 # Include the rest of the config files.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




