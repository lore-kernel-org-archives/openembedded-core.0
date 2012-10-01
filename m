Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TInSH-0005Ez-7L
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 23:23:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2012 14:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,519,1344236400"; d="scan'208";a="229247690"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2012 14:10:08 -0700
Message-ID: <506A06B0.4010401@linux.intel.com>
Date: Mon, 01 Oct 2012 14:10:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1349101037-5831-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1349101037-5831-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix invalid test for network error
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
X-List-Received-Date: Mon, 01 Oct 2012 21:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The commit message should include the filename such as:

sanity.bbclass: Fix invalid test for network error

Sau!


On 10/01/2012 07:17 AM, Bogdan Marinescu wrote:
> The test for network error in sanity.bbclass was negated.
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   meta/classes/sanity.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index e2095dd..f2e9a74 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -174,7 +174,7 @@ def check_sanity_tmpdir_change(tmpdir, data):
>       # Check that we can fetch from various network transports
>       errmsg = check_connectivity(data)
>       testmsg = testmsg + check_connectivity(data)
> -    return testmsg, errmsg == ""
> +    return testmsg, errmsg != ""
>
>   def check_sanity_version_change(data):
>       # Sanity checks to be done when SANITY_VERSION changes
>


