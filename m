Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1FA60B05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 21:33:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 14:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="582183162"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 14:33:57 -0700
Message-ID: <53E54245.4070704@linux.intel.com>
Date: Fri, 08 Aug 2014 14:33:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1408081529290.23581@localhost>
In-Reply-To: <alpine.LFD.2.11.1408081529290.23581@localhost>
Subject: Re: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
X-List-Received-Date: Fri, 08 Aug 2014 21:34:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2014 12:31 PM, Robert P. J. Day wrote:
>
> Given that there are no machine-specific files for the tslib recipe
> anymore, might as well remove this line.
>

Robert,

Can you please review the commit guidelines

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

The summary line should be in the form of
tslib: Remove ...

I know it's a trivial patch, but it would good to have the commit 
message correct.

Thanks
Sau!

> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>    still not totally sure i know what i'm doing here, but git history
> shows that any machine-specific tslib files vanished long ago, so
> there's little reason to hang onto this. i'm willing to be corrected.
>
> diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
> index 05d58b6..6d8c7dd 100644
> --- a/meta/recipes-graphics/tslib/tslib_1.1.bb
> +++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
> @@ -32,8 +32,6 @@ do_install_append() {
>   	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
>   }
>
> -SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
> -
>   # People should consider using udev's /dev/input/touchscreen0 symlink
>   # instead of detect-stylus
>   #RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
>

