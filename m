Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7WL-0003Ls-QF
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:08:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 10:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118575994"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2012 10:57:02 -0700
Message-ID: <4FF3326E.7070802@linux.intel.com>
Date: Tue, 03 Jul 2012 10:57:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341090544.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1341090544.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] apr fixes v2
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
X-List-Received-Date: Tue, 03 Jul 2012 18:08:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2012 02:11 PM, Paul Eggleton wrote:
> Since v1, rebase on latest master (removing now merged patch to add
> libtool) and use site file to set pid_t type.
>
>
> The following changes since commit 54429dfcca0e35a3aeaa78e509240b87d6a8f4ac:
>
>    mklibs-native: Upgrade to 0.1.34 (2012-06-29 13:21:19 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/apr-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/apr-fixes
>
> Paul Eggleton (2):
>    apr: add util-linux to DEPENDS for libuuid
>    site/common-linux: fix incorrect size of pid_t for apr
>
>   meta/recipes-support/apr/apr_1.4.6.bb |    3 ++-
>   meta/site/common-linux                |    1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
>

Merged into OE-Core

Thanks
	Sau!


