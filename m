Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIoyT-0007bi-AN
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 00:28:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 15:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153422387"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2012 15:18:15 -0700
Message-ID: <4F88A627.3050000@linux.intel.com>
Date: Fri, 13 Apr 2012 15:18:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334313002.git.andrei@gherzan.ro>
In-Reply-To: <cover.1334313002.git.andrei@gherzan.ro>
Subject: Re: [V5 0/2] Package gdbm compat libs in gdbm-compat and PR bumps
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
X-List-Received-Date: Fri, 13 Apr 2012 22:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 03:33 AM, Andrei Gherzan wrote:
> V4 had some commits sent to oe-core and are not merged and forgot about
> those. This led to a confict in python bb file.
>
> The following changes since commit 6703173449ad21e1623ac75a66535cb2ed52aeeb:
>
>    package_rpm.bbclass: Set tmppath for rpm to somewhere which won't conflict with the rootfs (2012-04-12 21:25:10 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib ag/gdbm
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/gdbm
>
> Andrei Gherzan (2):
>    gdbm: Package compat libs in gdbm-compat
>    PR bump packages with gdbm in DEPENDS
>
>   meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
>   meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
>   .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
>   meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
>   meta/recipes-support/gdbm/gdbm_1.10.bb             |    7 ++++++-
>   5 files changed, 10 insertions(+), 5 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


