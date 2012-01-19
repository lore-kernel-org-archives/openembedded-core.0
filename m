Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnwuJ-0004R9-TF
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 19:40:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 10:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100501969"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 10:32:39 -0800
Message-ID: <4F1861C6.9000907@linux.intel.com>
Date: Thu, 19 Jan 2012 10:32:38 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326738710-20604-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1326738710-20604-1-git-send-email-andrei@gherzan.ro>
Cc: florcirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] libsoup: Update package from v2.2.100 to v2.2.105
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
X-List-Received-Date: Thu, 19 Jan 2012 18:40:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2012 10:31 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> I included a patch as well to solve a compile error. In this package, a dfprinf function
> is declared. It will fail as eglibc provides it's function as well. So i renamed libsoup's
> dprintf function into dprinfsoup.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   .../dprintf_conflict_with_eglibc.patch             | 1184 ++++++++++++++++++++
>   meta/recipes-support/libsoup/libsoup_2.2.100.bb    |   18 -
>   meta/recipes-support/libsoup/libsoup_2.2.105.bb    |   19 +
>   3 files changed, 1203 insertions(+), 18 deletions(-)
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch
>   delete mode 100644 meta/recipes-support/libsoup/libsoup_2.2.100.bb
>   create mode 100644 meta/recipes-support/libsoup/libsoup_2.2.105.bb
>

Merged into OE-Core

Thanks
	Sau!



