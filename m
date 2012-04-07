Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SGfgh-0004YJ-Ll
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Apr 2012 02:08:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Apr 2012 16:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="129862295"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 07 Apr 2012 16:59:43 -0700
Message-ID: <4F80D4EF.8090704@linux.intel.com>
Date: Sat, 07 Apr 2012 16:59:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333695164.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1333695164.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] shadow-native: disable logging to syslog
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
X-List-Received-Date: Sun, 08 Apr 2012 00:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 11:53 PM, Scott Garman wrote:
> Hello,
>
> This pull request includes a patch to shadow to disable logging to
> syslog, to prevent sysroot user and group additions from writing
> entries to the host's syslog.
>
> I have build-tested this with core-image-sato (which builds a few
> useradd-based recipes, such as avahi and dbus) for all 5 of our
> qemu architectures, while watching my syslog to verify that no
> useradd or groupadd entries were written.
>

With this patch applied, the following error was seen on the AB:

| Running useradd commands...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| WARNING: useradd command did not succeed. Retrying...
| ERROR: tried running useradd command 10 times without success, giving up

Check the AB here:

http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/369/steps/shell_19/logs/stdio


Sau!

> Scott
>
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/shadow-syslog-fix-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/shadow-syslog-fix-oe
>
> Scott Garman (1):
>    shadow-native: disable logging to syslog
>
>   .../shadow/files/disable-syslog.patch              |   34 ++++++++++++++++++++
>   .../shadow/shadow-native_4.1.4.3.bb                |    5 ++-
>   2 files changed, 37 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/shadow/files/disable-syslog.patch
>


