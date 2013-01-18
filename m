Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwGsI-0008HU-AQ
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 19:41:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jan 2013 10:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,494,1355126400"; d="scan'208";a="278741970"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2013 10:25:43 -0800
Message-ID: <50F993A7.30308@linux.intel.com>
Date: Fri, 18 Jan 2013 10:25:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
References: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
In-Reply-To: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: Archive the native builds as well
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
X-List-Received-Date: Fri, 18 Jan 2013 18:41:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2013 06:34 AM, Holger Hans Peter Freyther wrote:
> On my build no copy of gcc/opkg-utils was archived. For gcc it is
> bad as libgcc will end up in the image and the sources should be
> provided. Update the method and comment to not exclude the native
> version of the build.

I understand what the issue is here, but I am not sure this is the right 
solution. This will likely bring in way more than is wanted or needed 
for source archiving.

What's needed from the opkg-utils-native?

Sau!


> ---
>   meta/classes/archiver.bbclass |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index a4a2158..516f947 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -187,11 +187,11 @@ def get_applying_patches(d):
>
>   def not_tarball(d):
>       """
> -    packages including key words 'work-shared', 'native', 'packagegroup-' will be passed
> +    packages including key words 'work-shared', 'packagegroup-' will be passed
>       """
>       workdir = d.getVar('WORKDIR', True)
>       s = d.getVar('S', True)
> -    if 'work-shared' in s or 'packagegroup-' in workdir or 'native' in workdir:
> +    if 'work-shared' in s or 'packagegroup-' in workdir:
>           return True
>       else:
>           return False
>


