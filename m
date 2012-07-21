Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SsNfk-0005eZ-Fs
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 02:35:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jul 2012 17:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="169163151"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2012 17:24:27 -0700
Message-ID: <5009F6BB.50006@linux.intel.com>
Date: Fri, 20 Jul 2012 17:24:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342714534-7032-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1342714534-7032-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] sanity: display the parsed BBPATH when complaining about CWD elements
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
X-List-Received-Date: Sat, 21 Jul 2012 00:35:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 09:15 AM, Ross Burton wrote:
> Many people don't understand the nuances of PATH/BBPATH, so help them by clarifying
> the warning and displaying the parsed list element-by-element.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/sanity.bbclass |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 6ef5450..575ce15 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -400,6 +400,7 @@ def check_sanity(sanity_data):
>                   "Please check your layer.conf files and other BBPATH "        \
>                   "settings to remove the current working directory "           \
>                   "references.");
> +        bb.warn("Parsed BBPATH is" + str(bbpaths));
>
>       if sanity_data.getVar('TARGET_ARCH', True) == "arm":
>           # This path is no longer user-readable in modern (very recent) Linux
>

Merged into OE-Core

Thanks
	Sau!


