Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA7177F7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 13:14:49 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2017 06:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="90267838"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 22 May 2017 06:14:40 -0700
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
	<20170522093003.17711-2-nicolas.dechesne@linaro.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <54e6fc69-700d-c5ef-1b51-5432d9628e02@linux.intel.com>
Date: Mon, 22 May 2017 16:12:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170522093003.17711-2-nicolas.dechesne@linaro.org>
Subject: Re: [PATCH 1/3] android-tools: import from meta-oe
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
X-List-Received-Date: Mon, 22 May 2017 13:14:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2017 12:30 PM, Nicolas Dechesne wrote:
> Many development boards come with Android bootloaders nowadays (for example, all
> Qualcomm based development boards to date). The android-tools provides many
> Android specific tools which are useful when working with such boards. For
> example, it is fairly common now to rely on fastboot to flash Android sparse
> images onto these devices.
>
> android-tools-native will provide all the needed tools to create Android sparse
> images, as a standard OE image type, for example.

Are you committing to maintain these recipes going forward?

Alex


