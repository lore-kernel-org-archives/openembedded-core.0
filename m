Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F2DAE6D0FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:17:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 15 Oct 2013 17:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,503,1378882800"; d="scan'208";a="411590736"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2013 17:17:37 -0700
Message-ID: <525DDB21.4060305@linux.intel.com>
Date: Tue, 15 Oct 2013 17:17:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <525C2320.8000502@mlbassoc.com>
In-Reply-To: <525C2320.8000502@mlbassoc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kmod packaging question
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
X-List-Received-Date: Wed, 16 Oct 2013 00:17:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/2013 10:00 AM, Gary Thomas wrote:
> I'm having some issues with the 'kmod' package.  In particular,
> the package claims:
>    commit b4bc0a7f1b90a51e26d6ab74d964ff81cfe05904
>    Author: Khem Raj <raj.khem@gmail.com>
>    Date:   Tue Jan 31 00:34:01 2012 -0800
>
>      kmod: Add recipes
>
>      kmod is replacement for module-init-tools
>
>      (From OE-Core rev: 716606f5446534e48b45fcc017e8bbdfe7f15e26)
>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> But is is really a "replacement"?  I know that there is a provides
> which makes the build happy, but unless you explicitly install the
> kmod package into your image, you don't end up with all of the module
> tools.  The main missing piece is 'depmod' - the rest seem to come
> from busybox, not kmod.
>
> I ran into this when trying to run 'opkg upgrade' which sucked in
> some new kernel modules and found that 'depmod' was not installed.
>
> Did I miss something?
>
Nope, it was a good catch, I will investigate the size increase for 
adding depmod into busybox.

Sau!

> n.b. this was tested using Poky/Yocto
> 0fc8317c6385eb1ed69ca4522ee6424c456dbb92
> which is a few days old.  I've not checked the very latest master (yet).
>

