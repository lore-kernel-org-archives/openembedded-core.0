Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81856748E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 13:21:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 06:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="41895708"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 09 Apr 2018 06:21:06 -0700
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1523273377-15643-1-git-send-email-maxin.john@intel.com>
	<1523273377-15643-2-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <34682c2c-4dea-ed7c-802e-ef2624f18562@linux.intel.com>
Date: Mon, 9 Apr 2018 16:14:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1523273377-15643-2-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH v2 1/2] at-spi2-core: upgrade to version 2.28.0
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
X-List-Received-Date: Mon, 09 Apr 2018 13:21:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/09/2018 02:29 PM, Maxin B. John wrote:
> +GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
> +GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
> +
> +GI_ENABLE_FLAG = "-Denable-introspection=yes"
> +GI_DISABLE_FLAG = "-Denable-introspection=no"
> +
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
> +                                                                                       '${GI_DISABLE_FLAG}', d)} "
> +
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
> +                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
> +

At some point (once we have enough recipes), we can move EXTRA_OEMESON 
lines to g-i and gtkdoc classes. Hopefully the upstreams start 
converging on the flag names as well.

Alex

