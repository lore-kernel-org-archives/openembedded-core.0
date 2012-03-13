Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1S7UCV-0004Yg-JE
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:03:51 +0100
Received: from mail-bk0-f52.google.com ([209.85.214.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Mar 2012 08:55:05 -0700
Received: by bkcjm19 with SMTP id jm19so565294bkc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 08:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=hoCXv+3SKOcL+OrWaHIm7/kXWFJgtyvdBS3kCp9OYGg=;
	b=GWx+vKZ9jEJYs4BzwjbiFJ3iJjyxOaoQjP77wvJbbFTGNn9cSXKRmtQk1l1P7RenIk
	Se8zd3o7QjtJPDhuiQPYgV/FiYHTfNiIPMhcMP1L4shcg5ikF7H0oA5N82TRcqRbFpAG
	FatR09/mGZyGx3pO3wDSlJ8MlcR4PwyPZji5rHHCOm6VYfXkEtaKJI2SHiC05QvRommc
	/OkjKBvZ+jil6m6STTL7o3NPFjRKpQkGitIDU6sTEjmwia+aIDIRBlgq6FGyhf4ObQtv
	kyg/osTvxiV1/R4NMrGbDZhp3v/fcpt5nlNbitjt74m3fLpvS8e51nfV24DX7o+dDR2L
	4xIg==
Received: by 10.204.129.23 with SMTP id m23mr6242660bks.134.1331654103406;
	Tue, 13 Mar 2012 08:55:03 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id f6sm2339702bkg.10.2012.03.13.08.54.59
	(version=SSLv3 cipher=OTHER); Tue, 13 Mar 2012 08:55:01 -0700 (PDT)
Message-ID: <4F5F6DD1.3020000@intel.com>
Date: Tue, 13 Mar 2012 08:54:57 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQmCWvlEqCQuwomVsHf0dDTwcPZ+63h0sdtMSTJFVz84jcviomhQCMMOs8nG2kzW/jrC22OD
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 13 Mar 2012 16:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2012 08:01 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's the latest consolidated kernel pull request. The patches are as follows:
>
> 3/3 is the kernel updates:
>
>    - v3.0.23 stable update
>    - v3.2.9 stable update
>    - 3.0/3.2: fri2 updates (pch + configuration changes) from Darren Hart
>    - 3.0: pvr merge from Kishore Bodke
>    - linux-yocto/rt: update to 3.0.23-rt38
>    - linux-yocto/rt: update to 3.2.9-rt15
>
> These have been built for all qemu targets, and built for the appropriate
> hardware platforms.
>
> 2/3 is the switch to use the 'bareclone' option that I had previously sent
> to be added to bitbake. Using this, the management of the linux-yocto branches
> in the build directory is much easier, and it removes the remaining restrictions
> around bare vs non-bare clones.
>
> 1/3 is linux-yocto: respect FILESPATH directories. This came from debugging the
> patching issues found with the linux-korg recipe. The solution (outside of
> re-writing the entire routine to python .. which I will do shortly) was to add
> a new routine that returns both the absolute patch source and the url's subdirectory.
> Using this all patches in WORKDIR, regardless of where they are on FILESPATH can
> be found. I tested linux-korg, and patching of all the kernels with this in place.
>
> All three changes are isolated, so you can pick them up in any order that makes
> sense.
>
> Cheers,
>
> Bruce
>
> cc: Darren Hart<dvhart@linux.intel.com>
> cc: Kishore Bodke<kishore.k.bodke@intel.com>
>
> The following changes since commit a439d32dd843d10a9f65cc858b02422fac7deb50:
>
>    soc-family.inc: to be included in machine.conf to add SOC_FAMILY to MACHINEOVERRIDE (2012-03-04 05:41:11 -0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>
> Bruce Ashfield (3):
>    linux-yocto: respect FILESPATH directories
>    linux-yocto: use bareclone option
>    linux-yocto: v3.2.9, v3.0.23 + fixes and updates
>
>   meta/classes/kernel-yocto.bbclass                 |   30 ++++++++++++++++++---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |   12 ++++----
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |   13 ++++-----
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |   10 +++---
>   meta/recipes-kernel/linux/linux-yocto_2.6.37.bb   |    4 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   20 +++++++-------
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   21 +++++++-------
>   7 files changed, 65 insertions(+), 45 deletions(-)
>


Merged into OE-Core

Thanks
	Sau!


