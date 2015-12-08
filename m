Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00C6060110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:16:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB88G3Rr015019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 8 Dec 2015 00:16:03 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 00:16:03 -0800
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <566691C1.4050000@windriver.com>
Date: Tue, 8 Dec 2015 16:16:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH][jethro][fido][ 00/15] Libxml2: multiple security fixes
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
X-List-Received-Date: Tue, 08 Dec 2015 08:16:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Armin,

With these patches, for jethro, I think that the following one is not
needed any more ?

commit d7fa0b41843dd417eba31f1a8dcd60ce08a57d66
Author: Armin Kuster <akuster@mvista.com>
Date:   Wed Nov 11 14:21:46 2015 -0800

     libxml2: fix CVE-2015-7942 and CVE-2015-8035

// Robert

On 12/06/2015 03:35 AM, Armin Kuster wrote:
> Each CVE is an independant patch so they can be easily merged to other distros
> and/or stable branches.
>
> I have included two previous CVE's sent for jethro which can be ignored.
> I put the CVE's in order as there where fixed upstream.
>
> Armin Kuster (15):
>    libxml2: security fix CVE-2015-7941-1
>    libxml2: security fix CVE-2015-7941-2
>    libxml2: security fix CVE-2015-8317
>    libxml2: security fix CVE-2015-7942
>    libxml2: security fix CVE-2015-7942-2
>    libxml2: security fix CVE-2015-8317
>    libxml2: security fix CVE-2015-7498
>    libxml2: security fix CVE-2015-7497
>    libxml2: security fix CVE-2015-7499-1
>    libxml2: security fix CVE-2015-7499-2
>    libxml2: depend fix security issue CVE-2015-7500
>    libxml2: security fix CVE-2015-7500
>    libxml2: security fix CVE-2015-8242
>    libxml2: security fix CVE-2015-5312
>    libxml2: multiple security fixes.
>
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
>   15 files changed, 880 insertions(+)
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

