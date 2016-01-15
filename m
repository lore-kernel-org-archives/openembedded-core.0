Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 58234731D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 15:18:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 15 Jan 2016 07:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,300,1449561600"; d="scan'208";a="633959128"
Received: from sbenedet-mobl.ger.corp.intel.com (HELO
	jlock-mobl1.gar.corp.intel.com) ([10.252.31.169])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jan 2016 07:17:50 -0800
Message-ID: <1452871066.16112.11.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 15:17:46 +0000
In-Reply-To: <cover.1452640824.git.akuster808@gmail.com>
References: <cover.1452640824.git.akuster808@gmail.com>
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 00/13] Jethro, Fido openssl and libxml security fixes vi git
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
X-List-Received-Date: Fri, 15 Jan 2016 15:18:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-01-12 at 15:25 -0800, Armin Kuster wrote:
> changes in contrib branch for alt integration.
> 
> The following changes since commit
> 0073b234d793099a371b2e529f740987decce756:
> 
>   yocto-bsp: Typo on the file extension (2016-01-07 12:13:55 +0000)
> 
> are available in the git repository at:
> 

Thanks very much for these Armin. I've included them in my
joshugal/fido-next branch and intend to submit that for merge soon.

Regards,

Joshua

>   git://git.yoctoproject.org/poky-contrib akuster/jethro_sec_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/je
> thro_sec_fixes
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
> 
>  .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ++++++++++
>  ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101
> +++++++++++++++
>  .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 +++++++
>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   4 +
>  meta/recipes-core/libxml/libxml2.inc               |  14 +++
>  ...-2015-5312-Another-entity-expansion-issue.patch |  39 ++++++
>  ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch |  40 ++++++
>  ...00-Fix-memory-access-error-due-to-incorre.patch | 131
> +++++++++++++++++++
>  ...2015-8035-Fix-XZ-compression-support-loop.patch |  38 ++++++
>  ...42-Buffer-overead-with-HTML-parser-in-pus.patch |  49 ++++++++
>  ...n-name-parsing-at-the-end-of-current-inpu.patch | 138
> +++++++++++++++++++++
>  ...ssing-entities-after-encoding-conversion-.patch |  89
> +++++++++++++
>  ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch |  88
> +++++++++++++
>  ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch |  43 +++++++
>  ...top-parsing-on-entities-boundaries-errors.patch |  39 ++++++
>  ...leanup-conditional-section-error-handling.patch |  56 +++++++++
>  ...ror-in-previous-Conditional-section-patch.patch |  35 ++++++
>  ...iation-of-overflow-in-Conditional-section.patch |  39 ++++++
>  ...ng-early-on-if-encoding-conversion-failed.patch |  42 +++++++
>  20 files changed, 1162 insertions(+)
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
>  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-
> 8035-Fix-XZ-compression-support-loop.patch
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
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-
> Cleanup-conditional-section-error-handling.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-
> Fix-an-error-in-previous-Conditional-section-patch.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-
> Another-variation-of-overflow-in-Conditional-section.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317-
> Fail-parsing-early-on-if-encoding-conversion-failed.patch
> 
> -- 
> 2.3.5
> 

