Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AA4DC731BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 11:37:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jan 2016 03:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,320,1449561600"; d="scan'208";a="864598419"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.26])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2016 03:37:20 -0800
Message-ID: <1453289839.3855.5.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 11:37:19 +0000
In-Reply-To: <cover.1452889139.git.joshua.g.lock@intel.com>
References: <cover.1452889139.git.joshua.g.lock@intel.com>
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 00/16][Fido] Consolidated pull
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
X-List-Received-Date: Wed, 20 Jan 2016 11:37:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-01-18 at 09:18 +0000, Joshua Lock wrote:
> The following changes since commit
> 3f2701c102e4e5b95fc79a8d967f9c48f8232fc6:
> 
>   grub2: Fix CVE-2015-8370 (2016-01-11 11:10:11 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-
> next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=joshuagl/fido-next

I just pushed another patch from Armin to this same branch which adds
security fixes to OpenSSH for CVE-2016-0777 and CVE-2016-0778.

Regards,

Joshua

> 
> Armin Kuster (13):
>   openssl: fix for CVE-2015-3193
>   openssl: fix for CVE-2015-3194
>   openssl: fix for CVE-2015-3195
>   libxml2: security fix CVE-2015-7941
>   libxml2: security fix CVE-2015-8317
>   libxml2: security fix CVE-2015-7942
>   libxml2: security fix CVE-2015-8035
>   libxml2: security fix CVE-2015-7498
>   libxml2: security fix CVE-2015-7497
>   libxml2: security fix CVE-2015-7499
>   libxml2: security fix CVE-2015-7500
>   libxml2: security fix CVE-2015-8242
>   libxml2: security fix CVE-2015-5312

    openssh: CVE-2016-077x

> 
> Hongxu Jia (1):
>   logrotate: do not move binary logrotate to /usr/bin
> 
> Joshua Lock (1):
>   libxml2: remove files for easier maintenance
> 
> Martin Jansa (1):
>   texinfo: don't create dependency on INHERIT variable
> 
>  .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ++++++++++
>  ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101
> +++++++++++++++
>  .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 +++++++
>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   4 +
>  meta/recipes-core/libxml/libxml2.inc               |  16 ++-
>  ...-2015-5312-Another-entity-expansion-issue.patch |  39 ++++++
>  ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch |  40 ++++++
>  ...00-Fix-memory-access-error-due-to-incorre.patch | 131
> +++++++++++++++++++
>  ...015-8035-Fix-XZ-compression-support-loop.patch} |   9 +-
>  ...42-Buffer-overead-with-HTML-parser-in-pus.patch |  49 ++++++++
>  ...n-name-parsing-at-the-end-of-current-inpu.patch | 138
> +++++++++++++++++++++
>  ...ssing-entities-after-encoding-conversion-.patch |  89
> +++++++++++++
>  ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch |  88
> +++++++++++++
>  ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch |  43 +++++++
>  ...top-parsing-on-entities-boundaries-errors.patch |  39 ++++++
>  ...eanup-conditional-section-error-handling.patch} |  25 ++--
>  ...ror-in-previous-Conditional-section-patch.patch |  35 ++++++
>  ...iation-of-overflow-in-Conditional-section.patch |  39 ++++++
>  ...ng-early-on-if-encoding-conversion-failed.patch |  42 +++++++
>  meta/recipes-extended/logrotate/logrotate_3.8.8.bb |   2 +-
>  meta/recipes-extended/texinfo/texinfo_5.2.bb       |   2 +-
>  22 files changed, 1086 insertions(+), 22 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-
> Add-test-for-CVE-2015-3194.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-
> 2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-
> 2015-3194-1-Add-PSS-parameter-check.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-
> 2015-3195-Fix-leak-with-ASN.1-combine.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-
> 5312-Another-entity-expansion-issue.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-
> 7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-
> 7500-Fix-memory-access-error-due-to-incorre.patch
>  rename meta/recipes-core/libxml/libxml2/{CVE-2015-8035.patch =>
> 0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch} (83%)
>  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-
> 8242-Buffer-overead-with-HTML-parser-in-pus.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-
> on-name-parsing-at-the-end-of-current-inpu.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7498-
> Avoid-processing-entities-after-encoding-conversion-.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-
> Add-xmlHaltParser-to-stop-the-parser.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-
> Detect-incoherency-on-GROW.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-
> Stop-parsing-on-entities-boundaries-errors.patch
>  rename meta/recipes-core/libxml/libxml2/{CVE-2015-7942.patch => CVE-
> 2015-7941-2-Cleanup-conditional-section-error-handling.patch} (68%)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-
> Fix-an-error-in-previous-Conditional-section-patch.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-
> Another-variation-of-overflow-in-Conditional-section.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317-
> Fail-parsing-early-on-if-encoding-conversion-failed.patch
> 
> -- 
> 2.5.0
> 

