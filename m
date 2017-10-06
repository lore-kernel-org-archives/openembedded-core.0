Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8F7260685
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:15:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Oct 2017 05:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,483,1500966000"; d="scan'208";a="1227804486"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2017 05:15:25 -0700
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<1507274867-26612-1-git-send-email-andrej.valek@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <17970e95-8d1a-a79d-f02a-2e24accb49f1@linux.intel.com>
Date: Fri, 6 Oct 2017 15:11:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507274867-26612-1-git-send-email-andrej.valek@siemens.com>
Subject: Re: [PATCH v3] libxml2: 2.9.4 -> 2.9.6
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
X-List-Received-Date: Fri, 06 Oct 2017 12:15:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/06/2017 10:27 AM, Andrej Valek wrote:
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>   .../libxml/libxml2/libxml-m4-use-pkgconfig.patch   |   2 +-
>   .../libxml/libxml2/libxml2-CVE-2016-4658.patch     | 269 ----------
>   .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 -------
>   .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 --
>   .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 ---
>   .../libxml/libxml2/libxml2-CVE-2017-8872.patch     |  37 --
>   .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ----
>   .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ----------
>   .../libxml2/libxml2-fix_NULL_pointer_derefs.patch  |  45 --
>   ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 ---------------------
>   .../libxml2/libxml2-fix_node_comparison.patch      |  67 ---
>   meta/recipes-core/libxml/libxml2/runtest.patch     |  34 +-
>   .../libxml/{libxml2_2.9.4.bb => libxml2_2.9.6.bb}  |  18 +-

You need to explain why patches are being removed or modified. CVE fixes 
are likely backports, but this should not be guessed.

Alex

