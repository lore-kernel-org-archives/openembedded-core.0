Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sfb9E-0001A7-Ue
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:21:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2012 11:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="166206838"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2012 11:10:43 -0700
Message-ID: <4FDB7AA3.6060708@linux.intel.com>
Date: Fri, 15 Jun 2012 11:10:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Fri, 15 Jun 2012 18:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2012 12:59 AM, Bogdan Marinescu wrote:
> Removed the x32 specific patches, since they seem to be fully
> integrated into 4.7. Also removed the sigmask patch, since the
> new version doesn't seem to use sigmask anymore.
>
> Signed-off-by: Bogdan Marinescu<bogdan.a.marinescu@intel.com>
> ---
>   .../strace/strace-4.6/sigmask.patch                |   23 -
>   .../strace-4.6/strace-4.6_add_x32_support.patch    | 1242 --------------------
>   meta/recipes-devtools/strace/strace_4.6.bb         |   23 -
>   meta/recipes-devtools/strace/strace_4.7.bb         |   20 +
>   4 files changed, 20 insertions(+), 1288 deletions(-)
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.6/sigmask.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.6/strace-4.6_add_x32_support.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace_4.6.bb
>   create mode 100644 meta/recipes-devtools/strace/strace_4.7.bb
>

Merged into OE-Core

Thanks
	Sau!



