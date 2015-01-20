Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 876937231B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:35:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jan 2015 08:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,435,1418112000"; d="scan'208";a="664714401"
Received: from jkan1-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.1.52])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2015 08:35:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 20 Jan 2015 16:35:26 +0000
Message-ID: <1667297.YQryn9uIt2@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
References: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/2] recipetool: add python buildsystem support
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
X-List-Received-Date: Tue, 20 Jan 2015 16:35:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 January 2015 11:52:29 Christopher Larson wrote:
> Changes from v1:
> 
> - Drops the 'your responsibility' message, per Paul's request
> - Pulls in sys.builtin_module_names from the host python for now
> - Handles extra_requires both in requires.txt and setup.py. This is
> currently implemented by a naive conversion of the optional features to
>   packageconfigs.
> - Improves the way we extract the setup keywords to make it easier to grab
> the non-literal values, such as calls to `find_packages`, so we can
> implement that in the future.
> - Alters the existing LICENSE line from recipetool rather than adding
>   a duplicated one, by poking at `lines_before`.
> - Moves the HOMEPAGE/SUMMARY/etc below the license info but above SRC_URI,
> to comply with our conventions.
> - Defaults to python- prefixing the dependencies we add.
> - Fixes numerous bugs.
> 
> 
> Example of the generated `PACKAGECONFIG` for `extra_requires` in glances:
> 
> ```
> # The following configs & dependencies are from setuptools extras_require.
> # These dependencies are optional, hence can be controlled via
> PACKAGECONFIG. # The upstream names may not correspond exactly to bitbake
> package names. #
> # Uncomment this line to enable all the optional features.
> #PACKAGECONFIG ?= "web batinfo snmp chart sensors browser"
> PACKAGECONFIG[web] = ",,,python-bottle"
> PACKAGECONFIG[batinfo] = ",,,python-batinfo"
> PACKAGECONFIG[snmp] = ",,,python-pysnmp"
> PACKAGECONFIG[chart] = ",,,python-matplotlib"
> PACKAGECONFIG[sensors] = ",,,python-py3sensors"
> PACKAGECONFIG[browser] = ",,,python-netifaces python-zeroconf"
> ```
> 
> 
> Christopher Larson (2):
>   recipetool: add python buildsystem support
>   recipetool: add python dependency scanning support
> 
>  scripts/lib/recipetool/create_buildsys_python.py | 720
> +++++++++++++++++++++++ scripts/pythondeps                               |
> 250 ++++++++
>  2 files changed, 970 insertions(+)
>  create mode 100644 scripts/lib/recipetool/create_buildsys_python.py
>  create mode 100755 scripts/pythondeps

This works well, great job :)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

