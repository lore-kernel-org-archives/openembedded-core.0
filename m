Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 37D277169F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 10:33:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 09 Jan 2015 02:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="509805328"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.186])
	by orsmga003.jf.intel.com with ESMTP; 09 Jan 2015 02:27:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 09 Jan 2015 10:33:02 +0000
Message-ID: <2550081.xQ1aUrNKGO@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <dddb23918ea58dc6676fd02b20ad5ca6df2586aa.1420781433.git.liezhi.yang@windriver.com>
References: <cover.1420781433.git.liezhi.yang@windriver.com>
	<dddb23918ea58dc6676fd02b20ad5ca6df2586aa.1420781433.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] python-git: upgrade to 0.3.3
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
X-List-Received-Date: Fri, 09 Jan 2015 10:33:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Thursday 08 January 2015 21:33:39 Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...python-git_0.3.2.RC1.bb => python-git_0.3.3.bb} |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-git_0.3.2.RC1.bb =>
> python-git_0.3.3.bb} (85%)
> 
> diff --git a/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
> b/meta/recipes-devtools/python/python-git_0.3.3.bb similarity index 85%
> rename from meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
> rename to meta/recipes-devtools/python/python-git_0.3.3.bb
> index 02a0eac..860c37b 100644
> --- a/meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
> +++ b/meta/recipes-devtools/python/python-git_0.3.3.bb
> @@ -10,8 +10,9 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183" DEPENDS =
> "python-gitdb"
> 
>  SRC_URI =
> "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
> -SRC_URI[md5sum] = "849082fe29adc653a3621465213cab96"
> -SRC_URI[sha256sum] =
> "fd6786684a0d0dd7ebb961da754e3312fafe0c8e88f55ceb09858aa0af6094e0" +
> +SRC_URI[md5sum] = "c9fdde02c476c11168fd620659496aba"
> +SRC_URI[sha256sum] =
> "08193acf4e22b57a471cde3748ebce7c17e0f15f1e5042db74ca2c5e9e3e4db5"
> 
>  S = "${WORKDIR}/GitPython-${PV}"

Interesting, I didn't expect this project to have come back alive again 
upstream, as earlier it looked like it was considered deprecated in favour of 
pygit2. Thanks for taking care of the upgrade.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

