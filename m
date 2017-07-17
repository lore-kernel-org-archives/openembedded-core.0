Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 72DFD6006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 13:22:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 06:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,374,1496127600"; d="scan'208";a="126027601"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 17 Jul 2017 06:22:26 -0700
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1499241206.git.kai.kang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b11709a0-3c5e-9bbf-9b09-b94768ae5f09@linux.intel.com>
Date: Mon, 17 Jul 2017 16:20:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1499241206.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/2] Introduce a distro feature openssl-no-weak-ciphers
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
X-List-Received-Date: Mon, 17 Jul 2017 13:22:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/05/2017 10:58 AM, kai.kang@windriver.com wrote:

> Introduce a distro feature openssl-no-weak-ciphers to make openssl disable weak
> ciphers support, including:
> 
> * des
> * ec
> * ecdh
> * ecdsa
> * md2
> * mdc2

How are those handled in openssl 1.1? If they are disabled by default, 
then maybe the whole distro feature is not needed when 1.1 is in oe-core.

Alex


Alex

