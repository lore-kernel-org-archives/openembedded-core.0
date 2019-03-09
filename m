Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 09 Mar 2019 22:19:59 UTC
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id A076B7C631
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2019 22:19:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id A019BDC6;
	Sat,  9 Mar 2019 17:10:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Sat, 09 Mar 2019 17:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=i
	UNjCx2FMxb7bIIp+L5Nj1xPMyzc5hX2Fq0GuUkYkDk=; b=iWAklIz0hqTfAdlVx
	TBE4VO//0r8VNx6b3bbYWGH5ojHt1aeDxVEr5CWn9AxXO2dNlNVTpp5KLFcZoQsA
	ld4SS9wCy5AN+wdcIMjqr5Yq8Tr0DJ4cjhRIlvP+ZMeWjYGW9S09e75zs71njglB
	v2hAudPLCenBRcEhdSPI0PibEEM9k3Fj+y2aYjKNboL3Ib/m+N8y67F41gqL02Te
	W6RWYObhU0tJTNbXcj+kFRGTemvjrU1GNtH2PFlJOwcqEoptt9bOFFWpnqLkIOE6
	uH5eghc4sURd15usbKEaoujhYB2lBT4Ga3Keym9HKwEJSpSSuOXmDBHazG8/HJ66
	ig/fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=iUNjCx2FMxb7bIIp+L5Nj1xPMyzc5hX2Fq0GuUkYk
	Dk=; b=Q2BVjOD9QtiFiCYPKNfddQs9qXV3EPyVlSu8OED7xpSqWCAyWltA9eReV
	MTqRieaQTDgx0Qc+dwbLME5Y/LajPC7BvP+azMpwZm8VCSt3U7GeZDt8T0FQRgx3
	+dnwwn6jiccr+wpD8EtmQg8hkh7YfQ3bZIafsd3vix8HZwZ1tmTi1ukew6XiwVT0
	Lw4p0MZqez4duuCG2XRPihx8KPL5xmcwBb5FuomMnzK0fKZ0sOHRYtdn4ise6hTH
	We6MHnzcG4v783/H/B01iei6Ykp4xiloXwuXpNiWXcDKQXbr76i05KFb9d60n/eJ
	KFzQKqHlxQnlC7GGkNKjGjJD9JzGA==
X-ME-Sender: <xms:uDmEXFUvy9cOeIWU7WZxyqUTy0e726oWMvPL4R00UaeMFVFfriOkOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrgedvgdduiedtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepuffvfhfhohfkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefrrghu
	lhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecukfhppe
	ekuddrudekjedrfedvrddufeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhes
	sggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:uDmEXJQ_BF3akRxfRQZKy8431s-_P5c4B6LisirJ6FPt_Mhl_DbHRg>
	<xmx:uDmEXMcXsFZstEyI6jbThFE8P_ZU9B0IGwIpZ0P6bVCYV4xZkuNQ7Q>
	<xmx:uDmEXFzJQ1cnD7fAZO2lbZIucdCphoxb4yLGbJYRzx5qhbnGO5APOw>
	<xmx:uTmEXK5l2E9encwT7PWzCTbNSquKDwQtb-pfCdDFmBvhJs2W2MYcZQ>
Received: from [192.168.1.100] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 46C6610336;
	Sat,  9 Mar 2019 17:10:00 -0500 (EST)
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<05adfd2c8d029ee397c9d2046ebb11aec8d3e952.1551889557.git.bruce.ashfield@gmail.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <751a6405-4e20-89d6-daf5-664ec775bb7d@betafive.co.uk>
Date: Sat, 9 Mar 2019 22:09:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <05adfd2c8d029ee397c9d2046ebb11aec8d3e952.1551889557.git.bruce.ashfield@gmail.com>
Subject: Re: [PATCH 1/6] kernel-yocto: allow kernel-meta repositories to be patched
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Mar 2019 22:19:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/03/2019 16:37, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> For testing purposes, it is often easier to patch a fragment
> in a kernel-meta repository versus needing to make a copy or
> modify the source repository.
> 
> We can allow this sort of patching when a patchdir of kernel-meta
> is passed (to indicate the nested kernel-meta repository).
> 
> Also note that we must patch the meta data before they are
> processed/gathered, since migrated copies to the kernel source
> directory will be used later.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/classes/kernel-yocto.bbclass | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 496c8a7f68..d2b194dd55 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -5,12 +5,21 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
>   
>   # returns local (absolute) path names for all valid patches in the
>   # src_uri
> -def find_patches(d):
> +def find_patches(d,subdir):
>       patches = src_patches(d)
>       patch_list=[]
>       for p in patches:
> -        _, _, local, _, _, _ = bb.fetch.decodeurl(p)
> -        patch_list.append(local)
> +        _, _, local, _, _, parm = bb.fetch.decodeurl(p)
> +        # if patchdir has been passed, we won't be able to apply it so skip
> +        # the patch for now, and special processing happens later
> +        patchdir = ''
> +        if "patchdir" in parm:
> +            patchdir = parm["patchdir"]
> +        if patchdir:

Did you mean 'if subdir:' here?

I'm seeing duplicate attempts to apply a patch listed on SRC_URI in the 
linux-raspberrypi_4.14.bb recipe from meta-raspberrypi. The first 
attempt is in do_kernel_metadata and this succeeds, the second is in 
do_patch and this fails as the patch has already been applied.

In this case, patchdir = '' as there is no patchdir set for this in the 
recipe. The patch is still picked up when find_patches() is called with 
subdir='kernel-meta' since the test here is false and the comparison 
below is not performed.

> +            if subdir == patchdir:
> +                patch_list.append(local)
> +        else:
> +            patch_list.append(local)
>   
>       return patch_list
>   
> @@ -119,8 +128,20 @@ do_kernel_metadata() {
>   		fi
>   	fi
>   
> +	# was anyone trying to patch the kernel meta data ?, we need to do
> +	# this here, since the scc commands migrate the .cfg fragments to the
> +	# kernel source tree, where they'll be used later.
> +	check_git_config
> +	patches="${@" ".join(find_patches(d,'kernel-meta'))}"
> +	for p in $patches; do
> +	    (
> +		cd ${WORKDIR}/kernel-meta
> +		git am -s $p
> +	    )
> +	done
> +
>   	sccs_from_src_uri="${@" ".join(find_sccs(d))}"
> -	patches="${@" ".join(find_patches(d))}"
> +	patches="${@" ".join(find_patches(d,''))}"
>   	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
>   
>   	# a quick check to make sure we don't have duplicate defconfigs
> 

-- 
Paul Barker
Beta Five Ltd

