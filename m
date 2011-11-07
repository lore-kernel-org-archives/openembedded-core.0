Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNUjX-0007ec-LU
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 20:19:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2011 11:13:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="34154843"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Nov 2011 11:13:36 -0800
Message-ID: <4EB82DE0.3090504@linux.intel.com>
Date: Mon, 07 Nov 2011 11:13:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/8] Subversion-1.7.0 and arm/thumb work arounds
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
X-List-Received-Date: Mon, 07 Nov 2011 19:19:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 01:17 AM, Martin Jansa wrote:
> Hi,
>
> arm mode was forced without PR bump, because if it was failing for someone he
> will notice.
>
> Be carefull with using subversion-1.7.0 (read the commit message).
>
> Pulseaudio-1.1 was released, so hopefully this work arounds won't be needed
> there or they could be resolved better with upgrade.
>
> Regards,
>
> The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:
>
>    distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 13:07:16 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2
>
> Martin Jansa (8):
>    pulseaudio-0.9.23: inherit perlnative to work around build on host
>      without XML/Parser.pm
>    libatomics-ops: force ARM mode
>    pulseaudio-0.9.23: force ARM mode
>    webkit-gtk: force arm mode to work around binutils segfault
Martin,

What is the status of these various workarounds, did you do any further 
work to determine root causes, or do we still need these patches to do in?

Thanks
	Sau!

>    apr: add native support
>    neon: add native support
>    apr-util: add native support
>    subversion: add 1.7.0 with native support and negative D_P for now
>
>   .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++++++++
>   .../subversion/subversion_1.7.0.bb                 |   37 ++++++++++++++++++++
>   .../pulseaudio/libatomics-ops_1.2.bb               |    2 +
>   .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   17 +++++++++
>   meta/recipes-support/apr/apr-util_1.3.12.bb        |    8 ++++
>   meta/recipes-support/apr/apr_1.4.5.bb              |    2 +
>   meta/recipes-support/neon/neon_0.29.5.bb           |    3 ++
>   8 files changed, 86 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
>


