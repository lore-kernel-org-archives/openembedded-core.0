Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B37356FEBE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 02:01:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5M21xtD016194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jun 2014 19:01:59 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Sat, 21 Jun 2014 19:01:58 -0700
Message-ID: <53A63915.4080900@windriver.com>
Date: Sun, 22 Jun 2014 10:01:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1401154976.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1401154976.git.liezhi.yang@windriver.com>
Subject: Re: [dora] [PATCH 0/3] 3 fixes for dora
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
X-List-Received-Date: Sun, 22 Jun 2014 02:02:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Ping.

// Robert

On 05/27/2014 10:15 AM, Robert Yang wrote:
> The following changes since commit 4c58fe468790822fe48e0a570779979c831d0f10:
>
>    openssl: fix CVE-2014-0198 (2014-05-21 09:32:38 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib robert/dora-next
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next
>
> Chen Qi (1):
>    populate-extfs.sh: keep file timestamps
>
> Jonathan Liu (1):
>    consolekit: fix console-kit-log-system-start.service startup
>
> Mark Hatle (1):
>    rpm: Fix rpm -V usage
>
>   .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   10 ++++++++-
>   .../rpm/rpm/rpm-verify-files.patch                 |   22 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>   .../recipes-support/consolekit/consolekit_0.4.6.bb |    6 ++++++
>   4 files changed, 38 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
>

