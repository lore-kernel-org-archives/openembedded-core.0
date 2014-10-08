Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D078971647
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 02:50:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s982oExS022865
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Oct 2014 19:50:14 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 7 Oct 2014 19:50:14 -0700
Message-ID: <5434A663.4000109@windriver.com>
Date: Wed, 8 Oct 2014 10:50:11 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1412068156.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 0/3] Update three packages
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
X-List-Received-Date: Wed, 08 Oct 2014 02:50:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/30/2014 05:33 PM, Chong Lu wrote:
> The following changes since commit 39ca8b429b6244e9649e7303cbb240adf007bf22:
>
>    bitbake: toastergui fix size rendering in dirinfo page (2014-09-29 14:11:59 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib chonglu/updatepkg
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/updatepkg
>
> Chong Lu (3):
>    tcl: Upgrade to 8.6.2
>    strace: Upgrade to 4.9
>    byacc: Upgrade to 20140715
>
>   ...-conflict-between-sys-ptrace.h-and-linux-.patch | 108 ---------------------
>   .../strace-fix-64-bit-process-detection.patch      |  34 -------
>   .../Makefile-ptest.patch                           |  44 ++++++---
>   .../{strace-4.8 => strace-4.9}/git-version-gen     |   0
>   .../strace/{strace-4.8 => strace-4.9}/run-ptest    |   0
>   .../strace-add-configure-options.patch             |  37 ++++---
>   .../strace/{strace_4.8.bb => strace_4.9.bb}        |   8 +-
>   .../tcltk/{tcl_8.6.1.bb => tcl_8.6.2.bb}           |   5 +-
>   .../byacc/{byacc_20140422.bb => byacc_20140715.bb} |   4 +-
>   9 files changed, 57 insertions(+), 183 deletions(-)
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
>   rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/Makefile-ptest.patch (61%)
>   rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/git-version-gen (100%)
>   rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/run-ptest (100%)
>   rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/strace-add-configure-options.patch (63%)
>   rename meta/recipes-devtools/strace/{strace_4.8.bb => strace_4.9.bb} (77%)
>   rename meta/recipes-devtools/tcltk/{tcl_8.6.1.bb => tcl_8.6.2.bb} (94%)
>   rename meta/recipes-extended/byacc/{byacc_20140422.bb => byacc_20140715.bb} (74%)
>


