Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIows-0007YY-Ks
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 00:26:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Apr 2012 15:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153422142"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2012 15:17:11 -0700
Message-ID: <4F88A5E7.4000500@linux.intel.com>
Date: Fri, 13 Apr 2012 15:17:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334154247.git.andrei@gherzan.ro>
In-Reply-To: <cover.1334154247.git.andrei@gherzan.ro>
Subject: Re: [PATCH 0/3] Bug 2134 - bitbake package-index fails for rpm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 22:26:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2012 07:26 AM, Andrei Gherzan wrote:
> The bug is that the native python used to run genpkgmetadata.py is picking up
> host's python modules.
>
> More about this. RPM is built without python. And this modules is needed by the
> above py file.
>
> So:
> 1. rpm-native should be built with python support.
> 2. native python should only look into STAGING_DIR_NATIVE directory for
> modules.
> 3. createrepo scripts should use native python
>
>
> The following changes since commit 190f6d791d51aaa4cfb9f1cf932bc205ff674fb5:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:47 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib ag/package-index
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/package-index
>
> Andrei Gherzan (3):
>    createrepo: Python scripts should use the python interpreter from env
>    package-index: Force NATIVE python to use modules from
>      STAGING_DIR_NATIVE
>    rpm-native: Compile python rpm module (with-python)
>
>   meta/recipes-core/meta/package-index.bb            |    3 +
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 -
>   ...n-scripts-should-use-interpreter-from-env.patch |   47 ++++++++++++++++++++
>   .../createrepo/createrepo_0.4.11.bb                |    3 +-
>   4 files changed, 52 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
>

Merged into OE-Core

Thanks
	Sau!


