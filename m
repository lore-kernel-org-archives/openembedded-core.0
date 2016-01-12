Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4465731F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:14:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C1EX8Q012349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:14:33 -0800
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 17:14:32 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
	<f0764a042c923ae4be18160a550873524df057dd.1452472146.git.hongxu.jia@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56945377.8090400@windriver.com>
Date: Mon, 11 Jan 2016 20:14:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <f0764a042c923ae4be18160a550873524df057dd.1452472146.git.hongxu.jia@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 3/9] pax-utils: 1.0.5 -> 1.1.4
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
X-List-Received-Date: Tue, 12 Jan 2016 01:14:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-01-10 07:30 PM, Hongxu Jia wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb}              | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb} (83%)
>
> diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
> similarity index 83%
> rename from meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
> rename to meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
> index 0716a08..6c96780 100644
> --- a/meta/recipes-devtools/pax-utils/pax-utils_1.0.5.bb
> +++ b/meta/recipes-devtools/pax-utils/pax-utils_1.1.4.bb
> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>
>   SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "d731f5385682a7a62ee2e7b7dacc13a7"
> -SRC_URI[sha256sum] = "f69a9938e4af7912d26d585094bc0203e43571a990fdd048319088a8b8ad906f"
> +SRC_URI[md5sum] = "1bfbb5237881f0c5e476b2f7ffcc00d5"
> +SRC_URI[sha256sum] = "796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414"
>
>   RDEPENDS_${PN} += "bash python"
>

FYI,

This looked like it might be a significant upgrade but
I checked it out and it's not that big a deal as shown below.

I like to see a diffstat and if present a ChangeLog diff
on package uprev. Do people think that's worthwhile
so that there's evidence that we've looked at the package
changes and thought about the impact to the YP build?
Again, in this case, there's no ChangeLog and the commits
and diffstat don't reveal interesting new functionality to me
at least.


../Randy


$ git clone git://anongit.gentoo.org/proj/pax-utils.git pax-utils.git
$ cd pax-utils.git
$ git diff v1.0.5..v1.1.4 | diffstat
  b/Makefile        |   57 ++++++-----
  b/Makefile.am     |   52 +++++++++-
  b/configure.ac    |   18 +++
  b/dumpelf.c       |    1
  b/lddtree.py      |    6 -
  b/lddtree.sh      |   20 +++
  b/make-tarball.sh |    2
  b/paxelf.c        |    2
  b/paxinc.h        |    7 +
  b/paxmacho.h      |    2
  b/porting.h       |   23 +++-
  b/pspax.c         |    4
  b/scanelf.c       |   81 +++++++++-------
  b/scanmacho.c     |    5
  b/security.c      |  272 +++++++++++++++++++++++++++++++++++++++++...+
  b/security.h      |   29 +++++
  man/.cvsignore    |    1
  17 files changed, 507 insertions(+), 75 deletions(-)

$ git log --oneline v1.0.5..v1.1.4 | wc -l
22

$ git log --oneline v1.0.5..v1.1.4
353a328 security: whitelist the getcwd syscall
a7ec3aa porting: fix android builds
9575f81 security: fix build on systems w/out si_syscall
1f7a936 security: whitelist the futex syscall
ee6925b security: whitelist dup syscalls
6fa4f46 security: do not warn when seccomp is disabled in the kernel
c39a557 security: whitelist fakeroot syscalls
bcb6683 security: add a debug handler for seccomp
9d0a60f build: add plumbing for building w/debug code
6e0e840 security: clean up syscall ifdefs
d6fcdb5 security: use seccomp to lock ourselves down
bdf41eb security: lock down privs a bit via prctl
a743806 security: leverage namespaces to restrict the runtime a bit
ef15f60 lddtree.sh: fix interp handling when doing a full listing
5e8a1d4 lddtree.py: fix glob handling w/ld.so.conf
0fccfd9 avoid using \n with warn macros
99f303d build: refresh autotool regen logic for git
ce30b2e build: use pkg-config for libcap settings
0afc2cc scanelf: fix memory leak with the -s option
51d892d debug: improve cleanup logic
cf37405 build: use pkg-config for libcap settings
ca9a45b use __typeof__ instead of typeof to build with stricter standards

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

