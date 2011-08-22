Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvZKI-0005yF-Pc
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 20:34:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 11:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,264,1312182000"; d="scan'208";a="42833495"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2011 11:29:19 -0700
Message-ID: <4E529FFE.9030402@linux.intel.com>
Date: Mon, 22 Aug 2011 11:29:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<7dc65a7b7090c2504783307152ec3ab6e5376e53.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <7dc65a7b7090c2504783307152ec3ab6e5376e53.1313816148.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 2/8] kernel.bbclass: blacklist perf-dbg
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
X-List-Received-Date: Mon, 22 Aug 2011 18:34:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 09:58 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/classes/kernel.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a2b10f2..ff3fa46 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -440,7 +440,7 @@ python populate_packages_prepend () {
>   	metapkg = "kernel-modules"
>   	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
>   	bb.data.setVar('FILES_' + metapkg, "", d)
> -	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> +	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
>   	for l in module_deps.values():
>   		for i in l:
>   			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))

A possible better question is why perf-dbg is getting generated and 
what's in it?

BTW, as noted elsewhere, it would be good to add additional comments as 
to why you are doing some of the changes.

Thanks
	Sau!


