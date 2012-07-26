Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTWr-0007su-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:15:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2012 12:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186998571"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 12:03:43 -0700
Message-ID: <5011948F.6080506@linux.intel.com>
Date: Thu, 26 Jul 2012 12:03:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343220683-9012-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1343220683-9012-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] meta/lib: remove test.py
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
X-List-Received-Date: Thu, 26 Jul 2012 19:15:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 05:51 AM, Paul Eggleton wrote:
> This looks like it was added by accident in OE-Core revision
> 7903433898b4683a1c09cc9a6a379421bc9bbd58.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/lib/test.py |    3 ---
>   1 file changed, 3 deletions(-)
>   delete mode 100644 meta/lib/test.py
>
> diff --git a/meta/lib/test.py b/meta/lib/test.py
> deleted file mode 100644
> index 12f4d83..0000000
> --- a/meta/lib/test.py
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -import oe.license
> -
> -print(oe.license.is_included('LGPLv2.1 | GPLv3', ['*'], []))
>

Merged into OE-Core

Thanks
	Sau!


