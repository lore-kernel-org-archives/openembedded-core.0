Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOGbF-0004L4-9x
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 01:31:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Oct 2012 16:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,595,1344236400"; d="scan'208";a="206838469"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2012 16:17:42 -0700
Message-ID: <507DEB16.1060803@linux.intel.com>
Date: Tue, 16 Oct 2012 16:17:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Marc Ferland <ferlandm@sonatest.com>
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
In-Reply-To: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lmsensors: Initial commit (cover letter)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2012 23:31:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2012 02:47 PM, Marc Ferland wrote:
> Hi,
>
> This is a first attempt at getting lm_sensors included in oe-core. Comments
> are very welcomed!
>
Can you give more background as to why it should be in oe-core?  What 
distros/hardware types use this?


> Regards,
>
> Marc
>
> Marc Ferland (1):
>    lmsensors: Initial commit.
>
>   meta/recipes-bsp/lm_sensors/files/fancontrol       |    2 +
>   meta/recipes-bsp/lm_sensors/files/fancontrol.sh    |   48 ++++++
>   meta/recipes-bsp/lm_sensors/files/sensord.cgi      |   10 ++
>   meta/recipes-bsp/lm_sensors/files/sensord.conf     |   16 ++
>   meta/recipes-bsp/lm_sensors/files/sensord.sh       |   49 +++++++
>   meta/recipes-bsp/lm_sensors/files/sensors.conf     |    2 +
>   meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb     |  150 ++++++++++++++++++++
>   meta/recipes-support/rrdtool/files/automake.patch  |   15 ++
>   meta/recipes-support/rrdtool/files/configure.patch |   19 +++
Just a note these two patches need Signed-off-by and Upstream-Status 
tags to be accpeted.
>   meta/recipes-support/rrdtool/rrdtool_1.4.7.bb      |   31 ++++
>   10 files changed, 342 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol
>   create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol.sh
>   create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.cgi
>   create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.conf
>   create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.sh
>   create mode 100644 meta/recipes-bsp/lm_sensors/files/sensors.conf
>   create mode 100644 meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
>   create mode 100644 meta/recipes-support/rrdtool/files/automake.patch
>   create mode 100644 meta/recipes-support/rrdtool/files/configure.patch
>   create mode 100644 meta/recipes-support/rrdtool/rrdtool_1.4.7.bb
>


