Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0C16E6D041
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 21:26:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2013 14:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,509,1378882800"; d="scan'208";a="417963005"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2013 14:26:53 -0700
Message-ID: <525F049D.2090905@linux.intel.com>
Date: Wed, 16 Oct 2013 14:26:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: wenzong.fan@windriver.com
References: <cover.1381485178.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1381485178.git.wenzong.fan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] populate_sdk_rpm: add python to nativesdk INSTALL_PROVIDESNAME_RPM list
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
X-List-Received-Date: Wed, 16 Oct 2013 21:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2013 03:06 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> If any native SDK packages involve python scripts that start with
> '#!/usr/bin/python', then the populate_sdk step will fail with:
>
>      error: Can't install nativesdk-xxx-$ver@x86_64_nativesdk: \
>      no package provides /usr/bin/python
>
There is a different problem, these should be using /usr/bin/env python 
not /usr/bin/python.  Since the nativesdk ships with a python binary to 
ensure that we have a correct and known version of python to work with.

What every is getting packaged with /usr/bin/python needs to be fixed.

> Just like perl, we also need to add python to INSTALL_PROVIDESNAME_RPM
> list to fix this issue.
>
perl is different, we don't care so much about perl's version as we do 
with python, perl is more forgiving.

> The following changes since commit 102bf5e0f640fe85068452a42b85077f1c81e0c9:
>
>    build-appliance: Update SRCREV for release (2013-10-08 16:33:43 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/nativesdk-ignore-python
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/nativesdk-ignore-python
>
> Wenzong Fan (1):
>    populate_sdk_rpm: add python to nativesdk INSTALL_PROVIDESNAME_RPM
>      list
>
>   meta/classes/populate_sdk_rpm.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

