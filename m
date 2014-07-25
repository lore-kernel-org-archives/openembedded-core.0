Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 26DAE60703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 16:17:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2014 09:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,732,1400050800"; d="scan'208";a="567238441"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.35])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2014 09:16:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 17:16:26 +0100
Message-ID: <1962350.z6r6hkHnKy@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1406205685-7685-2-git-send-email-georgex.l.musat@intel.com>
References: <1406205685-7685-1-git-send-email-georgex.l.musat@intel.com>
	<1406205685-7685-2-git-send-email-georgex.l.musat@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] oeqa/runtime: Added skipModule import for test modules that use it.
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
X-List-Received-Date: Fri, 25 Jul 2014 16:17:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 July 2014 15:41:25 Lucian Musat wrote:
> The modules that use skipModule should import it themselves and not rely on
> somebody else to import it.
> 
> Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
> ---
>  meta/lib/oeqa/runtime/buildcvs.py      | 2 +-
>  meta/lib/oeqa/runtime/buildiptables.py | 2 +-
>  meta/lib/oeqa/runtime/buildsudoku.py   | 2 +-
>  meta/lib/oeqa/runtime/ldd.py           | 2 +-
>  meta/lib/oeqa/runtime/pam.py           | 8 ++++----
>  meta/lib/oeqa/runtime/skeletoninit.py  | 2 +-
>  meta/lib/oeqa/runtime/smart.py         | 2 +-
>  meta/lib/oeqa/runtime/vnc.py           | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/buildcvs.py
> b/meta/lib/oeqa/runtime/buildcvs.py index f1fbf19..6201ed1 100644
> --- a/meta/lib/oeqa/runtime/buildcvs.py
> +++ b/meta/lib/oeqa/runtime/buildcvs.py
> @@ -1,4 +1,4 @@
> -from oeqa.oetest import oeRuntimeTest
> +from oeqa.oetest import oeRuntimeTest, skipModule
>  from oeqa.utils.decorators import *
>  from oeqa.utils.targetbuild import TargetBuildProject
> 
> diff --git a/meta/lib/oeqa/runtime/buildiptables.py
> b/meta/lib/oeqa/runtime/buildiptables.py index f6061a7..c77b114 100644
> --- a/meta/lib/oeqa/runtime/buildiptables.py
> +++ b/meta/lib/oeqa/runtime/buildiptables.py
> @@ -1,4 +1,4 @@
> -from oeqa.oetest import oeRuntimeTest
> +from oeqa.oetest import oeRuntimeTest, skipModule
>  from oeqa.utils.decorators import *
>  from oeqa.utils.targetbuild import TargetBuildProject
> 
> diff --git a/meta/lib/oeqa/runtime/buildsudoku.py
> b/meta/lib/oeqa/runtime/buildsudoku.py index a754f1d..f51af92 100644
> --- a/meta/lib/oeqa/runtime/buildsudoku.py
> +++ b/meta/lib/oeqa/runtime/buildsudoku.py
> @@ -1,4 +1,4 @@
> -from oeqa.oetest import oeRuntimeTest
> +from oeqa.oetest import oeRuntimeTest, skipModule
>  from oeqa.utils.decorators import *
>  from oeqa.utils.targetbuild import TargetBuildProject
> 
> diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime/ldd.py
> index 4374530..079130f 100644
> --- a/meta/lib/oeqa/runtime/ldd.py
> +++ b/meta/lib/oeqa/runtime/ldd.py
> @@ -1,5 +1,5 @@
>  import unittest
> -from oeqa.oetest import oeRuntimeTest
> +from oeqa.oetest import oeRuntimeTest, skipModule
>  from oeqa.utils.decorators import *
> 
>  def setUpModule():
> diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
> index cc5c1bd..c26e6ea 100644
> --- a/meta/lib/oeqa/runtime/pam.py
> +++ b/meta/lib/oeqa/runtime/pam.py
> @@ -2,7 +2,7 @@
>  # Note that the image under test must have "pam" in DISTRO_FEATURES
> 
>  import unittest
> -from oeqa.oetest import oeRuntimeTest
> +from oeqa.oetest import oeRuntimeTest, skipModule
>  from oeqa.utils.decorators import *
> 
>  def setUpModule():
> @@ -17,8 +17,8 @@ class PamBasicTest(oeRuntimeTest):
>          (status, output) = self.target.run('login --help')
>          self.assertEqual(status, 1, msg = "login command does not work as
> expected. Status and output:%s and %s" %(status, output)) (status, output)
> = self.target.run('passwd --help')
> -        self.assertEqual(status, 0, msg = "passwd command does not work as
> expected. Status and output:%s and %s" %(status, output)) +       
> self.assertEqual(status, 6, msg = "passwd command does not work as
> expected. Status and output:%s and %s" %(status, output)) (status, output)
> = self.target.run('su --help')
> -        self.assertEqual(status, 0, msg = "su command does not work as
> expected. Status and output:%s and %s" %(status, output)) +       
> self.assertEqual(status, 2, msg = "su command does not work as expected.
> Status and output:%s and %s" %(status, output)) (status, output) =
> self.target.run('useradd --help')
> -        self.assertEqual(status, 0, msg = "useradd command does not work as
> expected. Status and output:%s and %s" %(status, output)) +       
> self.assertEqual(status, 2, msg = "useradd command does not work as
> expected. Status and output:%s and %s" %(status, output))

Stefan pointed out to me that this contains a seemingly unintentional revert 
of the following earlier change:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/lib/oeqa/runtime/pam.py?id=14735be703de1b1e173d444b51df7aad902428d5

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

