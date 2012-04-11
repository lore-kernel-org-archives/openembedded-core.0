Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHzQf-0006Ag-Bo
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:25:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Apr 2012 08:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129668423"
Received: from unknown (HELO [10.255.12.89]) ([10.255.12.89])
	by azsmga001.ch.intel.com with ESMTP; 11 Apr 2012 08:16:27 -0700
Message-ID: <4F85A04A.1010100@linux.intel.com>
Date: Wed, 11 Apr 2012 08:16:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334098277.git.paul.eggleton@linux.intel.com>
	<43ee4f8a379076a147644e6b933d3d0a0ab93361.1334098277.git.paul.eggleton@linux.intel.com>
In-Reply-To: <43ee4f8a379076a147644e6b933d3d0a0ab93361.1334098277.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] classes/package_deb: create .gz index instead of .bz2
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
X-List-Received-Date: Wed, 11 Apr 2012 15:25:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2012 03:52 PM, Paul Eggleton wrote:
> apt is looking for Packages.gz files instead of the .bz2 files we are
> currently creating and failing when they cannot be found. It is not
> immediately obvious how to make the current version use the .bz2
> indexes; thus create .gz indexes for now which allows us to
> successfully create images.
>
> Tested on both a Fedora 14 and an Ubuntu 11.10 host machine.
>
> Fixes [YOCTO #1858].
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   meta/classes/package_deb.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 9880258..dc0f963 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -83,7 +83,7 @@ package_update_index_deb () {
>   			continue;
>   		fi
>   		cd ${DEPLOY_DIR_DEB}/$arch
> -		dpkg-scanpackages . | bzip2>  Packages.bz2
> +		dpkg-scanpackages . | gzip>  Packages.gz
>   		echo "Label: $arch">  Release
>   	done
>   }

Merged into OE-Core

Thanks
	Sau!



