Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTdJb-0004DK-C6
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:10:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jun 2011 10:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,327,1304319600"; 
   d="scan'208";a="7931119"
Received: from unknown (HELO [10.255.13.99]) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2011 10:06:53 -0700
Message-ID: <4DED092D.9000902@linux.intel.com>
Date: Mon, 06 Jun 2011 10:06:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307040964-11468-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1307040964-11468-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] base.bbclass: add cleansstate task between clean	and cleanall
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
X-List-Received-Date: Mon, 06 Jun 2011 17:10:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 11:56 AM, Martin Jansa wrote:
> * sometimes it's usefull to remove only sstate cache and keep downloaded sources for rebuild
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/base.bbclass |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 8f4ef1e..6f0484e 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -408,10 +408,13 @@ def check_gcc3(data):
>   	
>   	return False
>
> -addtask cleanall after do_clean
> -python do_cleanall() {
> +addtask cleansstate after do_clean
> +python do_cleansstate() {
>           sstate_clean_cachefiles(d)
> +}
>
> +addtask cleanall after do_cleansstate
> +python do_cleanall() {
>           src_uri = (bb.data.getVar('SRC_URI', d, True) or "").split()
>           if len(src_uri) == 0:
>               return
Merged into oe-core

Thanks
	Sau!


