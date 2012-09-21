Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBoH-0005ZH-H4
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:34:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 15:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="210074599"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2012 15:22:12 -0700
Message-ID: <505CE893.4050200@linux.intel.com>
Date: Fri, 21 Sep 2012 15:22:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1348046845.git.radu.moisan@intel.com>
In-Reply-To: <cover.1348046845.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]insane.bbclass: add library dir sanity check
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
X-List-Received-Date: Fri, 21 Sep 2012 22:34:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 02:32 AM, Radu Moisan wrote:
>      Check in ${PKGD} for libraries in wrong locations.
>      Trigger a warning if so.
>      Eg. Catch recipe installing /lib/bar.so when ${base_libdir}="lib32"
>      or installing in /usr/lib64 when ${libdir}="/usr/lib"
>
> The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:
>
>    local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib rmoisan/tmp1
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/tmp1
>
> Radu Moisan (1):
>    insane.bbclass: add library dir sanity check
>
>   meta/classes/insane.bbclass |   39 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 38 insertions(+), 1 deletion(-)
>

Merged into OE-Core

Thanks
	Sau!



