Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C981C787D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 11:29:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0IBTkC1013446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 18 Jan 2018 11:29:48 GMT
Message-ID: <1516274986.24502.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 11:29:46 +0000
In-Reply-To: <af2c70ff-edfa-fa06-b669-3fdce584b024@windriver.com>
References: <cover.1515403603.git.liezhi.yang@windriver.com>
	<af2c70ff-edfa-fa06-b669-3fdce584b024@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 00/12 V2] Fixes for multilib and eSDK
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
X-List-Received-Date: Thu, 18 Jan 2018 11:29:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-18 at 17:35 +0800, Robert Yang wrote:
> Two of the patches have been merged, so I rebased others and put them
> to:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/multilib
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/
> multilib
> 
> Robert Yang (10):
>    staging.bbclass: fix for multilib
>    populate_sdk_ext.bbclass: fix for multilib
>    staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
>    staging.bbclass: print searched manifest when not found
>    staging.bbclass: extend_recipe_sysroot(): search multilib manifest
>    package_manager.py: reverse archs correctly
>    multilib.bbclass: extend allarch recipes
>    toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
>      image
>    multilib.bbclass: deltask populate_sdk and populate_sdk_ext
>    populate_sdk_ext.bbclass: remove the try...finally

Just to update, I also have a set of patches which alter the manifest
code in staging.bbclass, I wanted to compare what we're doing and
likely create a combination of those patches.

For the deltask commit, could you make it bb.build.deltask() only when
image.bbclass is inherited?

Cheers,

Richard

