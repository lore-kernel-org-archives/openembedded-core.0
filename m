Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TldEx-00059m-2l
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 11:20:59 +0100
Received: from mail-qa0-f70.google.com ([209.85.216.70])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 02:05:49 -0800
Received: by mail-qa0-f70.google.com with SMTP id hg5so5762591qab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 02:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=eZ2SDxHLzX9BtgTjkOssEkzfdta0c6Je3d3V2zaqB1M=;
	b=pteN7RfnJb24fdV6otNamgCCoDL5qr06aqiZA4heG97XcFxkH0kUVv8Eprzwuyh1+z
	MROUjkI1VhPEm4uHWVRUJtIQCi1zLqRdeNc2njdrgLo6LoXHEupd6gZmWnqn2OAJCaQH
	dZFbNeEF3HtfCSzE9woYMt5cVXd+KX8ebSRHifnvEAmaLiIZlMamjQ1pBuSj5Pahs5lV
	4+CKvaNkkb6nOXuzVRxN+z7dKbmqwFwg7zi/l4ZZXmqQMnnHWdL+Tth7aNxX3oJXjbjL
	EYlLJ7J1d91XrkbiG3ygtHtP2plJFm1hkyXLwaM/eai5Fu7VFYFRcZy87WM4wq6981PB
	CgHQ==
X-Received: by 10.52.37.9 with SMTP id u9mr11708822vdj.83.1355997948105;
	Thu, 20 Dec 2012 02:05:48 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr11708815vdj.83.1355997948028; Thu, 20
	Dec 2012 02:05:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 02:05:27 -0800 (PST)
In-Reply-To: <8bfee81d0404d9325ccaccb260cadad8269d92ae.1355990839.git.hongxu.jia@windriver.com>
References: <cover.1355990839.git.hongxu.jia@windriver.com>
	<8bfee81d0404d9325ccaccb260cadad8269d92ae.1355990839.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 10:05:27 +0000
Message-ID: <CAJTo0LYrfbtkoO5WD+ckvm4s2xejxyAtjWhWyMfyaGPOGtTZnA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQnm4+WH/xWU8RQS2O8+OVhhup324WzIFhlnqebCdppZ+zJyj658nQj6ekgbQ1SedkAEmiDubQsH6xrlZwIvE7Q40uaSqPlaODbX/3VLsdOJ1Rp84dCetfZ31oyL7QIrYPuV3gkDTwAs5j8x6oY137M8xbqfEmS6+OU5eYHwFsQb3+YYeqgKsbu3WsSwnOURUQw0vU9Q
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Thu, 20 Dec 2012 10:20:59 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 08:10, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +# Add option -march to BUILD_CFLAGS in order to let the atomic operations
> +# ("lock free") be available while using old version GCC on x86 host to
> +# compile glib-2.0-native
> +BUILD_CFLAGS += "-march=`echo ${BUILD_ARCH} | sed 's/_/-/'`"

Should we do this inside bitbake.conf instead of just in glib?

Ross


