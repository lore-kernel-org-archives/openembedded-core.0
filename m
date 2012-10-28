Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHl5-00073u-KO
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:33:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2012 18:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="233580057"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga002.jf.intel.com with ESMTP; 27 Oct 2012 18:20:14 -0700
Message-ID: <508C884E.5090203@linux.intel.com>
Date: Sat, 27 Oct 2012 18:20:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Mihai Lindner <mihaix.lindner@linux.intel.com>
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
	<c5cc66e7f91378f3be392b0637ed3c655c60bfff.1351261721.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <c5cc66e7f91378f3be392b0637ed3c655c60bfff.1351261721.git.mihaix.lindner@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] distro_identifier: replace slash with hyphen
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
X-List-Received-Date: Sun, 28 Oct 2012 01:33:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2012 07:37 AM, Mihai Lindner wrote:
> Use "-" instead of "/" in "n/a" strings ("Distributor ID" and/or
> "Release"), provided by `lsb_release`.
> This leads to directories and subdirectories created in ./sstate-cache/
> e.g. Distro-n/a/ where "Distro-n" is dir and "a" is subdir.
>
> Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
> ---
>   meta/lib/oe/lsb.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
> index c8852a2..9133356 100644
> --- a/meta/lib/oe/lsb.py
> +++ b/meta/lib/oe/lsb.py
> @@ -31,4 +31,4 @@ def distro_identifier(adjust_hook=None):
>           distro_id, release = adjust_hook(distro_id, release)
>       if not distro_id:
>           return "Unknown"
> -    return '{0}-{1}'.format(distro_id, release).replace(' ','-')
> +    return '{0}-{1}'.format(distro_id, release).replace(' ','-').replace('/','-')
>

Merged into OE-Core

Thanks
	Sau!



