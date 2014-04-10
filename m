Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2562B65D19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:32:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A2WMPi024998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Apr 2014 19:32:22 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 9 Apr 2014 19:32:22 -0700
Message-ID: <534602B4.1050509@windriver.com>
Date: Thu, 10 Apr 2014 10:32:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1396980809.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396980809.git.paul.eggleton@linux.intel.com>
Subject: Re: [dora][PATCH 0/4] OpenSSL CVE fixes for the dora branch
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
X-List-Received-Date: Thu, 10 Apr 2014 02:32:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Reviewed and Tested by Robert Yang <liezhi.yang@windriver.com>

// Robert

On 04/09/2014 02:15 AM, Paul Eggleton wrote:
> Three backports for CVE fixes from master, plus one new fix for the
> latest CVE (CVE-2014-0160). The latter is not needed for master with
> Cristiana's upgrade to version 1.0.1g sent out today.
>
>
> The following changes since commit 590c2135858bb5d0cfc375c0d82ca610550ccd4a:
>
>    Revert "buildhistory_analysis: fix error when comparing image contents" (2014-04-04 16:16:39 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/openssl-cves
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssl-cves
>
> Paul Eggleton (1):
>    openssl: backport fix for CVE-2014-0160
>
> Yue Tao (3):
>    Security Advisory - openssl - CVE-2013-4353
>    Security Advisory - openssl - CVE-2013-6450
>    Security Advisory - openssl - CVE-2013-6449
>
>   ...DTLS-retransmission-from-previous-session.patch |  81 ++++++++++++++
>   ...or-TLS-record-tampering-bug-CVE-2013-4353.patch |  31 ++++++
>   ...e-version-in-SSL_METHOD-not-SSL-structure.patch |  33 ++++++
>   .../openssl/openssl-1.0.1e/CVE-2014-0160.patch     | 118 +++++++++++++++++++++
>   .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   4 +
>   5 files changed, 267 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/CVE-2014-0160.patch
>

