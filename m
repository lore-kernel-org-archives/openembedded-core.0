Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SkIPi-0001zU-KA
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 19:21:55 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Jun 2012 10:10:58 -0700
Received: by pbbro8 with SMTP id ro8so3288022pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=qXOMRN2s7vIuOWMQU9AMv55vykCpY/CmR4BFrFoovEo=;
	b=Q6MJeSqbyn7Cplkw6o0en697b1nP3zrbfoEhC4ElGaKio0T5woKyhxa0qI33Bn63fQ
	jBQR6bN+pPIIIOEyqB33aYFceNxS0pKKWfXB5oOSlRYwCRemvunMNYF1I4fmixktvfeX
	9Aya5Cd4VXQ8rc+o7kjRBk94x27roPsllP/NGhEA7grSSHHNYfZWu1+7rof/GjZ3O7ht
	WiS/yuDxpsx+ZXcnIIlaafkkP1bffBaSrb9SF2sPlCRgmbVqV75MUxm9fxuq9FCK0C1e
	fq9kQ+5pSHJSEOf4oNSKUPKJcezUauepIr/VzfVPmkm0Xu5qaT5QAoZoFglvwbQRZRvI
	WZ/A==
Received: by 10.68.232.232 with SMTP id tr8mr9731948pbc.73.1340903457677;
	Thu, 28 Jun 2012 10:10:57 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id os9sm2632870pbb.62.2012.06.28.10.10.55
	(version=SSLv3 cipher=OTHER); Thu, 28 Jun 2012 10:10:55 -0700 (PDT)
Message-ID: <4FEC901D.3020407@intel.com>
Date: Thu, 28 Jun 2012 10:10:53 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQnM/bG8ZyNGD+52/CjhCL2tuI4ozU0fA9mn8pqkoezosCb6Phejj6WzSiUD+5/I8nUrtXZU
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/5] linux-yocto/kern-tools: consolidated pull request
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
X-List-Received-Date: Thu, 28 Jun 2012 17:21:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2012 09:59 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here is the first batch of updates to the kernel, configuration and
> tools for the 1.3 development work.
>
> This update represents a baseline for the tools and configuration
> parts of the system. We'll refine it further for the remaining
> workflow and configuration changes that are underway, and for those
> that we need to revisit for 1.3 (i.e. things like -tiny and a
> common base configuration).
>
> These have been in use for about two weeks, and have been built/booted
> on qemu + hardware reference platforms.
>
> [YOCTO #843] and [YOCTO #1694] are addressed by this series.
>
> cc: Darren Hart<dvhart@linux.intel.com>
> cc: Tom Zanussi<tom.zanussi@intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:
>
>    sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (5):
>    kern-tools: add buildall and robustness fixes
>    linux-yocto/3.4: update and categorize configuration options
>    linux-yocto/3.4: update to v3.4.3
>    linux-yocto-rt/3.4: update qemuppc branch
>    linux-yocto/3.4: -rt build fixes + configuration audit (part2)
>
>   meta/classes/kernel-yocto.bbclass                  |    2 +-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |   10 +++++-----
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++++++++--------
>   4 files changed, 15 insertions(+), 15 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



