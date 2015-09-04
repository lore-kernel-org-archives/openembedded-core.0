Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D66E74242
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:16:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2015 05:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="762265942"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2015 05:16:51 -0700
Message-ID: <55E98C1A.9050005@linux.intel.com>
Date: Fri, 04 Sep 2015 15:18:34 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1441369014-4788-1-git-send-email-alexander.kanavin@linux.intel.com>
In-Reply-To: <1441369014-4788-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] pcmanfm: add an icon theme dependency
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
X-List-Received-Date: Fri, 04 Sep 2015 12:16:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2015 03:16 PM, Alexander Kanavin wrote:
>   FILES_${PN} += "${libdir}/pcmanfm"
> +
> +RRECOMMENDS_${PN} += "gnome-icon-theme"
>

Please discard, forgot to revert to correct theme here :)


Alex

