Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A947A6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 21:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id E10152613B5
To: openembedded-core@lists.openembedded.org
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <5671D1FE.7010306@collabora.co.uk>
Date: Wed, 16 Dec 2015 21:05:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
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
X-List-Received-Date: Wed, 16 Dec 2015 21:05:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

On 05/12/15 19:35, Armin Kuster wrote:
> Each CVE is an independant patch so they can be easily merged to other distros
> and/or stable branches.

As others have mentioned elsewhere I think this would be much nicer if 
each patch was added to the SRC_URI in the same commit which introduces 
the patch.

In addition, I believe it would also make sense to have 2 patches for 
the same CVE applied at once?

Ideally this series would be 11 patches, each of which updated SRC_URI 
and added the patch files to fix a single CVE.

What do you think? I am more than happy to take this series and make the 
suggested change (11 commits, each editing SRC_URI) myself before 
requesting my fido-next branch be merged?

Thanks,

Joshua

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


