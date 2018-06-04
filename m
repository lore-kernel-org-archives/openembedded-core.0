Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 39D9574BE5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:40:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 09:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; d="scan'208";a="234270903"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 04 Jun 2018 09:40:12 -0700
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20180604163157.4032-1-dev@sashko.rv.ua>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <943153a3-abc5-669d-5c9c-a06067142442@linux.intel.com>
Date: Mon, 4 Jun 2018 19:40:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180604163157.4032-1-dev@sashko.rv.ua>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: Re: [meta-oe][PATCH v2] chrpath: fix SRC_URI
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
X-List-Received-Date: Mon, 04 Jun 2018 16:40:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/2018 07:31 PM, Oleksandr Kravchuk wrote:

> -SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
> +SRC_URI = "http://${DEBIAN_MIRROR}/main/c/chrpath/chrpath_${PV}.orig.tar.gz \

Should be ${DEBIAN_MIRROR} without the http:// prefix. See 
classes/mirrors.bbclass for the definition.

Do remember to try and fetch the source with bitbake before you send the 
patches :)

Alex

