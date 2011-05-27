Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPkj4-00030x-RB
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 02:16:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 17:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,277,1304319600"; 
   d="scan'208";a="8403697"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2011 17:13:21 -0700
Message-ID: <4DDEECA0.90006@linux.intel.com>
Date: Thu, 26 May 2011 17:13:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306402295-14048-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1306402295-14048-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] rm_work: keep all sigdata files in stamps dir
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
X-List-Received-Date: Fri, 27 May 2011 00:16:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/26/2011 02:31 AM, Martin Jansa wrote:
> * this makes fix for [YOCTO #1074] in bitbake 139b8a625818225c358a1b8363518d7ed6913188
>    much more usefull for people using rm_work
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/rm_work.bbclass |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 256a202..303d47d 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -42,6 +42,10 @@ do_rm_work () {
>               *do_setscene*)
>                   break
>                   ;;
> +            *sigdata*)
> +                i=dummy
> +                break
> +                ;;
>               *do_package_write*)
>                   i=dummy
>                   break
Merged into oe-core

Thanks
	Sau!



