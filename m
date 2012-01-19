Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RnyId-0002EM-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:09:31 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2012 12:00:46 -0800
Received: by iabz7 with SMTP id z7so345979iab.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 12:00:45 -0800 (PST)
Received: by 10.50.180.198 with SMTP id dq6mr9273572igc.27.1327003245769;
	Thu, 19 Jan 2012 12:00:45 -0800 (PST)
Received: from [10.6.18.223] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id 5sm1272707ibe.8.2012.01.19.12.00.43
	(version=SSLv3 cipher=OTHER); Thu, 19 Jan 2012 12:00:44 -0800 (PST)
Message-ID: <4F18766A.9050504@intel.com>
Date: Thu, 19 Jan 2012 12:00:42 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326906635.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326906635.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto: restore WORKDIR as a patch source directory
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
X-List-Received-Date: Thu, 19 Jan 2012 20:09:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 09:13 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> As was pointed out on IRC this morning, config fragments and other
> config tweaks that were added to the SRC_URI weren't being processed
> by the config phase of the linux-yocto build.
>
> When I switched to using src_patches, I dropped WORKDIR as a
> directory that would be scanned for patches and configs. This patch
> restores that functionality by putting WORKDIR back into the
> path that will be searched.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 5724ee9c3a99519fea96446638910b727b89898d:
>    Mark Hatle (1):
>          package_rpm.bbclass: Add support for filenames with spaces
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto: restore WORKDIR as a patch source directory
>
>   meta/classes/kernel-yocto.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!




