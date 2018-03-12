Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26C0477FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 08:48:48 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 01:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,460,1515484800"; d="scan'208";a="37396448"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2018 01:48:48 -0700
Date: Mon, 12 Mar 2018 10:52:13 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20180312085213.GA25631@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Mon, 12 Mar 2018 08:48:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Mar 12, 2018 at 04:38:51PM +0800, Chen Qi wrote:
> Upgrade systemd to 237.
> 
> Note that this version has dropped autotools support.

Very minor nit-picking : 

Even with this patch, "systemd_237.bb" and "systemd.inc" contains duplicated

SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"

Probably a good idea to keep it only in "systemd.inc" file.

> 
> The following patches are rebased:
> 0004-Use-getenv-when-secure-versions-are-not-available.patch
> 0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> 0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> 0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
> 0018-check-for-uchar.h-in-configure.patch
> 0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> 0001-add-fallback-parse_printf_format-implementation.patch
> 0002-src-basic-missing.h-check-for-missing-strndupa.patch
> 0007-check-for-missing-canonicalize_file_name.patch
> 0008-Do-not-enable-nss-tests.patch
> 0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> 0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
> 
> The following backported patches are dropped:
> 0001-core-evaluate-presets-after-generators-have-run-6526.patch
> 0001-main-skip-many-initialization-steps-when-running-in-.patch
> 0001-meson-update-header-file-to-detect-memfd_create.patch
> 0003-fileio-include-sys-mman.h.patch
> 
> The following patch is dropped as autotools support is dropped:
> 0002-configure.ac-Check-if-memfd_create-is-already-define.patch
> 
> The following patches are newly added to fix problems:
> 0027-remove-nobody-user-group-checking.patch
> 0028-add-missing-FTW_-macros-for-musl.patch
> 0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> 0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch

Best Regards,
Maxin

