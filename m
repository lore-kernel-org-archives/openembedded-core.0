Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3F77874E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:04:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 09:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="204430758"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Feb 2018 09:04:24 -0800
To: Niko Mauno <niko.mauno@vaisala.com>,
	openembedded-core@lists.openembedded.org
References: <20180228162008.14197-1-niko.mauno@vaisala.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <aff352ce-9c5a-c8bb-fa78-74951722d4f8@linux.intel.com>
Date: Wed, 28 Feb 2018 18:58:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180228162008.14197-1-niko.mauno@vaisala.com>
Subject: Re: [PATCH] package_manager.py: Explicit complementary fail
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
X-List-Received-Date: Wed, 28 Feb 2018 17:04:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/28/2018 06:20 PM, Niko Mauno wrote:
> When running bitbake -c populate_sdk <image_name>, it is expected that
> packages matching SDKIMAGE_INSTALL_COMPLEMENTARY name mask (unless
> declared in PACKAGE_EXCLUDE_COMPLEMENTARY) are installed to resulting
> SDK. Underlying mechanism issues a package manager install call for set
> of complementary packages. However the mechanism doesn't seem to inform
> the user all too obviously in case the package manager command behind
> install_complementary() method fails -- and since it is combined with
> attempt_only=True option, user might end up wondering why several *-dev,
> *-dbg packages are missing from resulting SDK.
> 
> Improve associated install() method behaviour in affected OpkgPM and
> DpkgPM classes so that a problematic state of affairs becomes directly
> obvious for bitbake user, resulting in shell output like:

Does rpm need the same fix?

Alex

