Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7357F501
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 11:17:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 04:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="281589615"
Received: from adahiya-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.249.39.45])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2019 04:17:37 -0700
To: openembedded-core@lists.openembedded.org
References: <20191023021437.33560-1-maxime.roussinbelanger@gmail.com>
	<20191023021437.33560-2-maxime.roussinbelanger@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <137d0cce-e8b3-0dd7-4779-8963e1a80c68@intel.com>
Date: Wed, 23 Oct 2019 12:17:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023021437.33560-2-maxime.roussinbelanger@gmail.com>
Subject: Re: [PATCH 2/2] meta: add missing description in recipes-gnome
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
X-List-Received-Date: Wed, 23 Oct 2019 11:17:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 23/10/2019 03:14, Maxime Roussin-Bélanger wrote:
> --- a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
> @@ -1,4 +1,8 @@
>   SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
> +DESCRIPTION = "A GObject-based library for accessing the Secret Service API of the
> +freedesktop.org project, a cross-desktop effort to access passwords, tokens
> +and other types of secrets. libsecret provides a convenient wrapper for these
> +methods so consumers do not have to call the low-level DBus methods."
>   LICENSE = "LGPLv2.1"
>   BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"

ERROR: ParseError at 
/home/ross/Yocto/poky/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb:2: 
unparsed line: 'DESCRIPTION = "A GObject-based library for accessing the 
Secret Service API of the'

Please remember to test all patches.

Ross


