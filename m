Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8B03172FE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 19:47:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 11:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,198,1484035200"; d="scan'208";a="68340502"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 23 Feb 2017 11:46:51 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1487616539.git.humberto.ibarra.lopez@intel.com>
	<6ffca9715a250277407dba45b26d22b819153f17.1487616539.git.humberto.ibarra.lopez@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <09b022cc-b4ac-7c5e-0a75-b286c57f374b@linux.intel.com>
Date: Thu, 23 Feb 2017 21:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <6ffca9715a250277407dba45b26d22b819153f17.1487616539.git.humberto.ibarra.lopez@intel.com>
Subject: Re: [PATCH 1/1] selftest/runtime-test.py: Add test to check PACKAGE_FEED_URIS var
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
X-List-Received-Date: Thu, 23 Feb 2017 19:47:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2017 08:54 PM, Humberto Ibarra wrote:
>          features = 'INHERIT += "testimage"\n'
>          features += 'TEST_SUITES = "ping ssh selftest"\n'
> +        features += 'PACKAGE_FEED_URIS = "http://192.168.7.1:8080"\n'

Can you make the assumption that the IP address will be exactly this? 
I'm seeing various IP addresses in autobuilder logs when for example 
testimages are being tested simultaneously, and they're not always 
192.168.7.1.

Alex

