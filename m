Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFW2o-0000if-Ch
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:43:37 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so108380vbb.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 13:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=2tns/3jupNrkED8O2Er28j2eelcfCDfbldLxWANUbRA=;
	b=kAIKVg/DxZyPHPwr8WGNdjlzrtLjmx/xYT2MVAseFYmSoLvZmEUddRykMOW0uBVyhg
	KQBSxshr135avfX6sesZp1TLTYEZCnKC8aDc7xsQF2xThWz7TWU62t9fDppqXxH5+sM0
	z2Qtd6atHlaEzL5miI5oFr/Xqg/6bvLhJlMgUJ6UKxYvtdfyfHLJeXJivcXTwFoxC5CN
	dYaHcT0anCftQakA9erSyLkwsypf4V1qvt0IDe9vXhTpnH8o7829/zUInMuPBzXt+TpX
	2xas+vXiOAGSkO6J0NZfjuKKLFU5YeizM9wd8nP17b0FdkVTLHNrbyPKOMUNGuVKDNpt
	31dg==
X-Received: by 10.220.151.144 with SMTP id c16mr6892930vcw.18.1363120014160;
	Tue, 12 Mar 2013 13:26:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 13:26:34 -0700 (PDT)
In-Reply-To: <1363119114-5177-1-git-send-email-denis@denix.org>
References: <1363119114-5177-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 13:26:34 -0700
Message-ID: <CAJTo0LYqqUCbO3bD3fCwgcaD0DK-qe2sxKJu9_HyDTEb1SUzJw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQmmQHNoWn6cS6vpa4Abdd110kcwDjyS+RV6RL59G7t5wLMOVOBt7p+QV1kgiBw9Xu6fDBzU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] kernel.bbclass: Add missing modules.order and modules.builtins
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
X-List-Received-Date: Tue, 12 Mar 2013 20:43:38 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 13:11, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
>
> When running depmod, from kmod, warnings about missing modules.order
> and modules.builtins occur.  Looking back it is not clear why these
> files were being ignored, other then nobody knew what to do with them.
>
> Add the files into the kernel-base package, if they exist, ensuring
> they will always get installed if at least one module is installed.

Merged into danny-next locally, I'll push when I have reasonable connectivity.

Ross


