Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 99AB777BE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491405480; x=1522941480;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=/nPCRBabdSbKT8uJkMf3SbZjK1wAmVv7bWN9n4x8c54=;
	b=pl1+b4mOKJp5MMJmhJUMqdh1Ah2HfhSNsyJ6aNwM9nF6T0DX6urysfMG
	ZyDzzRehElOa8tDqYKvgrbW0MeMh5Q==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 08:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,279,1486454400"; d="scan'208";a="1131395103"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2017 08:17:59 -0700
Message-ID: <1491405979.5062.33.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 05 Apr 2017 10:26:19 -0500
In-Reply-To: <b57ac90f02f18be863551ed630acc2d8007a0ffd.1491399200.git-series.patrick.ohly@intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
	<b57ac90f02f18be863551ed630acc2d8007a0ffd.1491399200.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] yocto-compat-layer: include bitbake-diffsigs output
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
X-List-Received-Date: Wed, 05 Apr 2017 15:17:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-04-05 at 15:36 +0200, Patrick Ohly wrote:
> After filtering out potential false positives, it becomes feasible to
> include the output of bitbake-diffsigs for those tasks which
> definitely have a change.
> 
> Depends on bitbake-diffsigs with the "--signature" parameter.
> 
> Enhanced output now is:
> 
>    AssertionError: False is not true : Layer meta-xxxx changed 120 signatures, initial differences (first hash without, second with layer):
>       gstreamer1.0-plugins-base:do_fetch: 76973f19f2e30d282152bdd7e4efe5bb -> e6e7c6fa9f2bd59d7d8d107f7c6ca1ac
>          Task dependencies changed from:
>          ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
>          to:
>          ['GST_IMX_PATCHES_TO_APPEND', 'PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
>          basehash changed from d679d30bd1ea41c56e57419b57587f3c to 090a79b45f5fa26d10f9d34e2ed7a1e6
>             List of dependencies for variable SRC_URI changed from '{'PV', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]'}' to '{'GST_IMX_PATCHES_TO_APPEND', 'PV', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]'}'
>          changed items: {'GST_IMX_PATCHES_TO_APPEND'}
>          Dependency on variable GST_IMX_PATCHES_TO_APPEND was added
>          Variable SRC_URI value changed:
>          "     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz     file://get-caps-from-src-pad-when-query-caps.patch     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch     file://make-gio_unix_2_0-dependency-configurable.patch     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch     file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch     file://0003-riff-add-missing-include-directories-when-calling-in.patch     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch [--] {+${GST_IMX_PATCHES_TO_APPEND}+}"
> 
>       pulseaudio:do_install: 6bb6fe23e11a6d5fef9c3a25e73e4f9c -> 3f54ea75673a792e307197cfa6ef2694
>          basehash changed from ac4efcfa783bd04a5a98a2c38719aedd to 37679d99623a37c8df955da3a01415a5
>          Variable do_install value changed:
>          @@ -1,3 +1,7 @@
>               autotools_do_install
>            	install -d ${D}${sysconfdir}/default/volatiles
>           	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
>          +    if [ -e "${WORKDIR}/daemon.conf" ] && [ -e "${WORKDIR}/default.pa" ]; then
>          +        install -m 0644 ${WORKDIR}/daemon.conf ${D}${sysconfdir}/pulse/daemon.conf
>          +        install -m 0644 ${WORKDIR}/default.pa ${D}${sysconfdir}/pulse/default.pa
>          +    fi
> 
> [YOCTO #11161]
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/lib/compatlayer/cases/common.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
> index b91da9b..d909d5b 100644
> --- a/scripts/lib/compatlayer/cases/common.py
> +++ b/scripts/lib/compatlayer/cases/common.py
> @@ -76,4 +76,14 @@ class CommonCompatLayer(OECompatLayerTestCase):
>                         (self.tc.layer['name'], len(sig_diff)))
>              for diff in sorted(sig_diff_filtered):
>                  msg.append('   %s: %s -> %s' % diff)
> +                try:
> +                    recipe, taskname = diff[0].rsplit(':', 1)
> +                    output = check_command('Determining signature difference failed.',
> +                                           'bitbake-diffsigs --task %s %s --signature %s %s' %
> +                                           (recipe, taskname, diff[1], diff[2])).decode('utf-8')
> +                except RuntimeError as error:
> +                    output = str(error)

Patrick, just a minor comment:  there is no need for the 'if' check,
because the try and the except bodies set the output variable. 

Leo

> +                if output:
> +                    msg.extend(['      ' + line for line in output.splitlines()])
> +                    msg.append('')
>              self.assertTrue(False, '\n'.join(msg))
> -- 
> git-series 0.9.1



