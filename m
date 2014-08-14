Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 818F060EFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 12:13:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7ECDCho011640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 05:13:12 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 05:13:11 -0700
Message-ID: <53ECA7D6.2030408@windriver.com>
Date: Thu, 14 Aug 2014 20:13:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1407917762.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1407917762.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] Set CONFIG_SHELL for xz and gzip
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
X-List-Received-Date: Thu, 14 Aug 2014 12:13:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I added grep's patch which is similar to xz and gzip to the repo,
so there should be 3 patches:

git://git.openembedded.org/openembedded-core-contrib rbt/bash


====== patch ======

grep: set CONFIG_SHELL to /bin/sh

It would be bash, sh, ksh or sh5 according to the host if we don't set
this, and its scripts don't have bashism as the checkbashisms shows.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  meta/recipes-extended/grep/grep_2.19.bb   |    1 +
  meta/recipes-extended/grep/grep_2.5.1a.bb |    2 ++
  2 files changed, 3 insertions(+)

diff --git a/meta/recipes-extended/grep/grep_2.19.bb 
b/meta/recipes-extended/grep/grep_2.19.bb
index f38a9a6..9c162cc 100644
--- a/meta/recipes-extended/grep/grep_2.19.bb
+++ b/meta/recipes-extended/grep/grep_2.19.bb
@@ -36,3 +36,4 @@ ALTERNATIVE_LINK_NAME[grep] = "${base_bindir}/grep"
  ALTERNATIVE_LINK_NAME[egrep] = "${base_bindir}/egrep"
  ALTERNATIVE_LINK_NAME[fgrep] = "${base_bindir}/fgrep"

+export CONFIG_SHELL="/bin/sh"
diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb 
b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 79842ba..1ce112e 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -47,3 +47,5 @@ ALTERNATIVE_${PN} = "grep egrep fgrep"
  ALTERNATIVE_LINK_NAME[grep] = "${base_bindir}/grep"
  ALTERNATIVE_LINK_NAME[egrep] = "${base_bindir}/egrep"
  ALTERNATIVE_LINK_NAME[fgrep] = "${base_bindir}/fgrep"
+
+export CONFIG_SHELL="/bin/sh"
-- 
1.7.9.5

// Robert


On 08/13/2014 04:18 PM, Robert Yang wrote:
> The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:
>
>    SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/bash
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bash
>
> Robert Yang (2):
>    xz: set CONFIG_SHELL to /bin/sh
>    gzip: set CONFIG_SHELL to /bin/sh
>
>   meta/recipes-extended/gzip/gzip.inc       |    2 ++
>   meta/recipes-extended/xz/xz_5.1.3alpha.bb |    2 ++
>   2 files changed, 4 insertions(+)
>

