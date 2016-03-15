Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36A146FF91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 02:17:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2F2HYTe005979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 19:17:34 -0700 (PDT)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 14 Mar 2016 19:17:33 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1457938004.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56E770BC.2000401@windriver.com>
Date: Tue, 15 Mar 2016 10:17:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1457938004.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/4] [jethro] Consolidated pull
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
X-List-Received-Date: Tue, 15 Mar 2016 02:17:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2016 02:51 PM, Robert Yang wrote:
> The following changes since commit 1a51bb69b7600cbe6da7928d46e0ea058a14ccde:
>
>    base: check for existing prefix when expanding names in PACKAGECONFIG (2016-03-11 23:15:01 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Added another patch:

Chang Rebecca Swee Fun (2):
       tune-corei7.inc: Fix PACKAGE_EXTRA_ARCHS for corei7-32

// Robert

>
> Chang Rebecca Swee Fun (1):
>    make 4.1: fix segfault when ttyname fails
>
> Jagadeesh Krishnanjanappa (1):
>    license.bbclass: fix host contamination warnings for license files
>
> Mariano Lopez (1):
>    dhcp: CVE-2015-8605
>
> Peter Kjellerstedt (1):
>    lib/oe/patch: Make GitApplyTree._applypatch() support read-only
>      .git/hooks
>
>   meta/classes/license.bbclass                       |   10 ++
>   meta/lib/oe/patch.py                               |   26 +++--
>   .../dhcp/dhcp/CVE-2015-8605.patch                  |   99 ++++++++++++++++++++
>   meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |    1 +
>   ...-SV-43434-Handle-NULL-returns-from-ttynam.patch |   63 +++++++++++++
>   meta/recipes-devtools/make/make_4.1.bb             |    2 +
>   6 files changed, 187 insertions(+), 14 deletions(-)
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
>   create mode 100644 meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
>

