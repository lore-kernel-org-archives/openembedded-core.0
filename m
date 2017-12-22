Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 43E8B78855
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 08:39:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2017 00:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,440,1508828400"; 
   d="scan'208";a="4533299"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 22 Dec 2017 00:39:36 -0800
To: "Slater, Joseph" <joe.slater@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20171221212318.242658-1-jslater@windriver.com>
	<1513895309.16507.97.camel@linuxfoundation.org>
	<007BD92917A2324FA403BCF9A464CF84D87A1EE0@ALA-MBC.corp.ad.wrs.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d3dc9e70-694e-5b41-1583-fa8b18bdc6f4@linux.intel.com>
Date: Fri, 22 Dec 2017 10:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84D87A1EE0@ALA-MBC.corp.ad.wrs.com>
Subject: Re: [PATCH 1/1] liberation-fonts: do not inherit allarch
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
X-List-Received-Date: Fri, 22 Dec 2017 08:39:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/22/2017 02:00 AM, Slater, Joseph wrote:
> A number of postinstall's run target binaries, whether on the host or
> target.  This means they invoke qemu on the host and try to tell it
> where bits are.  I think it might not be necessary to pass explicit
> information about library locations to qemu, but that is the way it
> is done, and that information is arch dependent.  It might well be
> the case that "confusion" occurs only when multilib is enabled, but
> the point is that it does happen.

I think Ross had a different patch to deal with the multilib-qemu libray 
confusion, so this might not yet be necessary.

Also, if this needs to be fixed, you need to fix it everywhere - 
cantarell-fonts, adwaita-icon-theme, etc. etc.

Alex

