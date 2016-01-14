Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3F01731BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 06:22:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0E6MYll029489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 13 Jan 2016 22:22:34 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 22:22:33 -0800
To: "Wold, Saul" <saul.wold@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1452640824.git.akuster808@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56973EA7.4050200@windriver.com>
Date: Thu, 14 Jan 2016 14:22:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1452640824.git.akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 14 Jan 2016 06:22:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi RP and Saul,

I've verified that these patches built well on jethro, would you please help
to merge them?

   git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Armin Kuster (13):
   openssl: fix for CVE-2015-3193
   openssl: fix for CVE-2015-3194
   openssl: fix for CVE-2015-3195
   libxml2: security fix CVE-2015-7941
   libxml2: security fix CVE-2015-8317
   libxml2: security fix CVE-2015-7942
   libxml2: security fix CVE-2015-8035
   libxml2: security fix CVE-2015-7498
   libxml2: security fix CVE-2015-7497
   libxml2: security fix CVE-2015-7499
   libxml2: security fix CVE-2015-7500
   libxml2: security fix CVE-2015-8242
   libxml2: security fix CVE-2015-5312

// Robert

On 01/13/2016 07:25 AM, Armin Kuster wrote:
> changes in contrib branch for alt integration.
>
> The following changes since commit 0073b234d793099a371b2e529f740987decce756:
>
>    yocto-bsp: Typo on the file extension (2016-01-07 12:13:55 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib akuster/jethro_sec_fixes
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_sec_fixes
>
> Armin Kuster (13):
>    openssl: fix for CVE-2015-3193
>    openssl: fix for CVE-2015-3194
>    openssl: fix for CVE-2015-3195
>    libxml2: security fix CVE-2015-7941
>    libxml2: security fix CVE-2015-8317
>    libxml2: security fix CVE-2015-7942
>    libxml2: security fix CVE-2015-8035
>    libxml2: security fix CVE-2015-7498
>    libxml2: security fix CVE-2015-7497
>    libxml2: security fix CVE-2015-7499
>    libxml2: security fix CVE-2015-7500
>    libxml2: security fix CVE-2015-8242
>    libxml2: security fix CVE-2015-5312
>
>   .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ++++++++++
>   ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 +++++++++++++++
>   .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 +++++++
>   ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ++++++++++
>   .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   4 +
>   meta/recipes-core/libxml/libxml2.inc               |  14 +++
>   ...-2015-5312-Another-entity-expansion-issue.patch |  39 ++++++
>   ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch |  40 ++++++
>   ...00-Fix-memory-access-error-due-to-incorre.patch | 131 +++++++++++++++++++
>   ...2015-8035-Fix-XZ-compression-support-loop.patch |  38 ++++++
>   ...42-Buffer-overead-with-HTML-parser-in-pus.patch |  49 ++++++++
>   ...n-name-parsing-at-the-end-of-current-inpu.patch | 138 +++++++++++++++++++++
>   ...ssing-entities-after-encoding-conversion-.patch |  89 +++++++++++++
>   ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch |  88 +++++++++++++
>   ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch |  43 +++++++
>   ...top-parsing-on-entities-boundaries-errors.patch |  39 ++++++
>   ...leanup-conditional-section-error-handling.patch |  56 +++++++++
>   ...ror-in-previous-Conditional-section-patch.patch |  35 ++++++
>   ...iation-of-overflow-in-Conditional-section.patch |  39 ++++++
>   ...ng-early-on-if-encoding-conversion-failed.patch |  42 +++++++
>   20 files changed, 1162 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch
>

