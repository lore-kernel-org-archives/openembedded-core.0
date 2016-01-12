Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56258731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:41:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C1fcV8012883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:41:38 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 17:41:37 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569459D0.5040506@windriver.com>
Date: Tue, 12 Jan 2016 09:41:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/8] Packages Upgrade
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
X-List-Received-Date: Tue, 12 Jan 2016 01:41:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Updated this patches a little, drop libbsd patches since Martin had
upgraded it:

   git://git.openembedded.org/openembedded-core-contrib rbt/PU
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (7):
   autogen-native: 5.18.5 -> 5.18.6
   file: 5.24 -> 5.25
   git: 2.5.0 -> 2.7.0
   wget: 1.17 -> 1.17.1
   iputils: s20121221 -> s20151218
   less: 479 -> 481
   rsync: 3.1.1 -> 3.1.2

// Robert

On 01/11/2016 03:19 PM, Robert Yang wrote:
> The following changes since commit 5661d8cb7849df62358368743134c0aaf523965e:
>
>    image: Really remove lockfiles flag (2016-01-07 13:41:47 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/PU
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU
>
> Robert Yang (8):
>    autogen-native: 5.18.5 -> 5.18.6
>    file: 5.24 -> 5.25
>    git: 2.5.0 -> 2.7.0
>    wget: 1.17 -> 1.17.1
>    iputils: s20121221 -> s20151218
>    less: 479 -> 481
>    libbsd: 0.8.0 -> 0.8.1
>    rsync: 3.1.1 -> 3.1.2
>
>   ...n-native_5.18.5.bb => autogen-native_5.18.6.bb} |    4 +-
>   .../autogen/autogen/increase-timeout-limit.patch   |   29 ++---
>   .../file/{file_5.24.bb => file_5.25.bb}            |    2 +-
>   meta/recipes-devtools/git/git_2.5.0.bb             |   11 --
>   meta/recipes-devtools/git/git_2.7.0.bb             |   11 ++
>   ...-an-inc-recursive-path-is-not-right-for-i.patch |  135 --------------------
>   .../rsync/rsync-3.1.1/rsync.git-eac858085.patch    |  101 ---------------
>   .../rsync/{rsync_3.1.1.bb => rsync_3.1.2.bb}       |    6 +-
>   ...x-build-command-line-argument-with-gnutls.patch |   37 ------
>   .../{iputils_s20121221.bb => iputils_s20151218.bb} |    7 +-
>   .../less/{less_479.bb => less_481.bb}              |    4 +-
>   meta/recipes-extended/wget/wget/fix_makefile.patch |   18 ---
>   .../wget/{wget_1.17.bb => wget_1.17.1.bb}          |    5 +-
>   .../libbsd/0001-Use-local-SHA512-header.patch      |   75 -----------
>   .../libbsd/{libbsd_0.8.0.bb => libbsd_0.8.1.bb}    |    7 +-
>   15 files changed, 39 insertions(+), 413 deletions(-)
>   rename meta/recipes-devtools/autogen/{autogen-native_5.18.5.bb => autogen-native_5.18.6.bb} (90%)
>   rename meta/recipes-devtools/file/{file_5.24.bb => file_5.25.bb} (96%)
>   delete mode 100644 meta/recipes-devtools/git/git_2.5.0.bb
>   create mode 100644 meta/recipes-devtools/git/git_2.7.0.bb
>   delete mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
>   delete mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
>   rename meta/recipes-devtools/rsync/{rsync_3.1.1.bb => rsync_3.1.2.bb} (72%)
>   delete mode 100644 meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch
>   rename meta/recipes-extended/iputils/{iputils_s20121221.bb => iputils_s20151218.bb} (90%)
>   rename meta/recipes-extended/less/{less_479.bb => less_481.bb} (89%)
>   delete mode 100644 meta/recipes-extended/wget/wget/fix_makefile.patch
>   rename meta/recipes-extended/wget/{wget_1.17.bb => wget_1.17.1.bb} (47%)
>   delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch
>   rename meta/recipes-support/libbsd/{libbsd_0.8.0.bb => libbsd_0.8.1.bb} (73%)
>

