Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2C779868
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 02:38:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2018 19:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,367,1531810800"; d="scan'208";a="89562802"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.20])
	([10.221.21.20])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2018 19:38:10 -0700
To: Kevin Hao <kexin.hao@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180912004446.11661-1-kexin.hao@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <22102831-8c57-6584-88fa-937818a79349@intel.com>
Date: Thu, 13 Sep 2018 10:38:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180912004446.11661-1-kexin.hao@windriver.com>
Subject: Re: [PATCH v3] wic: Introduce the --use-label partition parameter
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
X-List-Received-Date: Thu, 13 Sep 2018 02:38:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/12/2018 08:44 AM, Kevin Hao wrote:
> +         --use-label: This option is specific to wic. It makes wic to use the
> +                      label in /etc/fstab to specify a partition. If the
> +                      --use-label and --use-uuid are used at the same time,
> +                      we prefer the uuid because it is less likely to cause
> +                      name confliction. We don't support using this parameter
> +                      on the root partition since it requires an initramfs to
> +                      parse this value and we do not currently support that.
> +
>           --active: Marks the partition as active.

Would this also need a corresponding patch for yocto-docs as well?

Thanks,

Anuj

