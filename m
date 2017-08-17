Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3BD784C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:26:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 04:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="124703121"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2017 04:26:46 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f196b821-f6bd-1aec-8c45-ca1aa4c3d577@linux.intel.com>
Date: Thu, 17 Aug 2017 14:23:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Thu, 17 Aug 2017 11:26:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/17/2017 01:31 PM, Martin Jansa wrote:
> So you cannot just select which openssl implementation you want for 
> given component, unless it's very simple component with small dependency 
> tree.

Unfortunately yes. The header names clash, and there's no way to have 
them both in the sysroot at the same time.

The only solution I see is the hard one: first update the component to 
latest upstream version, and see if that version compiles with 1.1.
If not, then Fedora probably has a vendor patch for the API fixing, as 
they've already moved to 1.1 as default.

FWIW, qt5 has merged openssl 1.1 support 
https://codereview.qt-project.org/#/c/189399/, but I don't know if 
there's a release with it included.

Alex

