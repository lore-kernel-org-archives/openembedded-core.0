Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 26B1C60589
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490389353; x=1521925353;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=QOVSMY+k22PmbQe1c9VafEvRRwrtqv3r20ccng/YYuE=;
	b=OU236id9iRQn9AYu8lnmRXdwT4oUQzQvNpU7pZf8dLKwN2PyaVqRRpAE
	BE8V6OneNUdu5AL4tw2zuSBEaptI5A==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 14:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,216,1486454400"; d="scan'208";a="1126860220"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2017 14:02:33 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170324163731.12769-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LbXz-Yre9xw5=qFdXfeBg+qoTErUPdYauUP+3YsnErkZA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5cd7ae6f-77bc-97c8-2669-411684c10471@linux.intel.com>
Date: Fri, 24 Mar 2017 23:01:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbXz-Yre9xw5=qFdXfeBg+qoTErUPdYauUP+3YsnErkZA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: move the entire dnf/rpm4 stack to Python 3
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
X-List-Received-Date: Fri, 24 Mar 2017 21:02:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2017 10:12 PM, Burton, Ross wrote:
>      ...ython-pygpgme_0.3.bb <http://ython-pygpgme_0.3.bb> =>
>     python3-pygpgme_0.3.bb <http://python3-pygpgme_0.3.bb>} |   6 +-
>
>
> For some reason this didn't build here.
>
> | x86_64-poky-linux-gcc -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
> -msse4.2
> --sysroot=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot
> -shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fstack-protector-strong -Wl,-z,relro,-z,now -O2 -pipe -g
> -feliminate-unused-debug-types
> -fdebug-prefix-map=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0=/usr/src/debug/python3-pygpgme/0.3-r0
> -fdebug-prefix-map=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot-native=
> -fdebug-prefix-map=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot=
> -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security

I renamed the recipe, but forgot to adjust the security_flags.inc. 
Updated patch coming shortly.

Alex


