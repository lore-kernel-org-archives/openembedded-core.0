Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qja2z-0005Bs-82
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 18:54:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 09:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="32590327"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2011 09:50:49 -0700
Message-ID: <4E270769.1060706@linux.intel.com>
Date: Wed, 20 Jul 2011 09:50:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311086793.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311086793.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] build time regression script
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
X-List-Received-Date: Wed, 20 Jul 2011 16:54:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 07:55 AM, Paul Eggleton wrote:
> This is a script I've been using to test build times together with
> "git bisect run". I realise it has some similarities with the script that
> Darren recently posted (bb-matrix); they both evolved at around the same
> time although they are used for quite different purposes. Perhaps they
> can be merged together or share parts of eachother at some point in
> future.
>
> The following changes since commit b975de5ea76c5f8827fb48c0c3c29902872ad3d6:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:22:59 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/test-build-time
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/test-build-time
>
> Paul Eggleton (1):
>    scripts/contrib: add build time regression test script
>
>   scripts/contrib/test_build_time.sh        |  237 +++++++++++++++++++++++++++++
>   scripts/contrib/test_build_time_worker.sh |   37 +++++
>   2 files changed, 274 insertions(+), 0 deletions(-)
>   create mode 100755 scripts/contrib/test_build_time.sh
>   create mode 100755 scripts/contrib/test_build_time_worker.sh
>

Merged into OE-Core

Thanks
	Sau!


