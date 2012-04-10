Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHd9h-0006aa-OY
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:38:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 08:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127352823"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 08:29:34 -0700
Message-ID: <4F8451DE.3050504@linux.intel.com>
Date: Tue, 10 Apr 2012 08:29:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333974508.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1333974508.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] git 1.7.7: remove perl.mak before compile
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
X-List-Received-Date: Tue, 10 Apr 2012 15:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2012 05:38 AM, Robert Yang wrote:
> Test info:
>
> * $ bitbake git-native -ccompile
> * $ touch tmp/sysroots/i686-linux/usr/lib/perl-native/perl/5.14.2/Config.pm
> * $ bitake git-native -f -ccompile
>
> git-native (or git) built successfully.
>
> // Robert
>
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/git
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/git
>
> Robert Yang (1):
>    git 1.7.7: remove perl.mak before compile
>
>   meta/recipes-devtools/git/git.inc |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


