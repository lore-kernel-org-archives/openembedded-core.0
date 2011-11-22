Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSwPA-0004fl-4o
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 20:53:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Nov 2011 11:46:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,554,1315206000"; d="scan'208";a="94213917"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2011 11:46:44 -0800
Message-ID: <4ECBFC24.9060601@linux.intel.com>
Date: Tue, 22 Nov 2011 11:46:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
In-Reply-To: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
Subject: Re: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Tue, 22 Nov 2011 19:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2011 01:48 AM, Henning Heinold wrote:
> Hi,
>
> with the setup now in useradd.bbclass, at least dbus-native depends
> on the base-passwd from target. I think this is not wanted.
> My patch resets the DEPENDS line for native packages similar to
> nativesdk.
>
> Henning Heinold (1):
>    useradd.bbclass: do not let depend native packages on base-passwd
>      from target
>
>   meta/classes/useradd.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>

This was merged into OE-Core by Richard doing it with an updated commit 
message and adding the SYSROOTFUNC changes he suggested in the thread.

Thanks
	Sau!


