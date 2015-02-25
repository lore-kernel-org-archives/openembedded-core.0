Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C3508605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 21:43:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2015 13:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,647,1418112000"; d="scan'208";a="683451408"
Received: from unknown (HELO [10.219.4.176]) ([10.219.4.176])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2015 13:43:03 -0800
Message-ID: <54EE41E7.4070106@linux.intel.com>
Date: Wed, 25 Feb 2015 15:43:03 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1424718281-9133-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<CAP9ODKr+kp=+yez1ibVBuwUyuc1V1D0gitaANhgBoGp8=rRXAQ@mail.gmail.com>
In-Reply-To: <CAP9ODKr+kp=+yez1ibVBuwUyuc1V1D0gitaANhgBoGp8=rRXAQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Wed, 25 Feb 2015 21:43:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/02/15 13:49, Otavio Salvador wrote:
> @@ -34,7 +34,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>               perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>               split-strip packages-list pkgv-undefined var-undefined \
> -            version-going-backwards \
> +            version-going-backwards  symlink-to-sysroot\
> Is this a 'development change' which should be dropped or another
> change which should go in another commit?
Yes, development change, this should go in WARN_QA

>
> Please take a look on the 'sed'  warning when building with ptest. It
> is a 'false-positive' failure.
>
As discussed in the IRC this is related to a different bug, its a 
"build-deps" bug not "file-rdeps", I would gladly fix it, although I am 
not able to reproduce it so far, if anyone can and has some info, I'd 
appreciate it.

