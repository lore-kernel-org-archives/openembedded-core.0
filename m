Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 003EE7824F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 09:05:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jan 2018 01:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,334,1511856000"; 
   d="scan'208";a="9287412"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 09 Jan 2018 01:05:42 -0800
To: Martin Kelly <mkelly@xevo.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Jussi Pakkanen <jpakkane@gmail.com>,
	Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ee65ca42-3632-8f67-4615-dffd816823fe@linux.intel.com>
Date: Tue, 9 Jan 2018 11:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
Subject: Re: Issues with meson in cross-compiling environment
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
X-List-Received-Date: Tue, 09 Jan 2018 09:05:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/09/2018 01:51 AM, Martin Kelly wrote:

> Recently, we got meson added to OE-core as part of Yocto (thanks 
> Alexander Kanavin!).
As a part of that integration, we've had to add a few patches that fix 
problems specific to cross-compilation. You can see them here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/meson/meson

I'd really like to have them merged upstream, so if you're generally in 
favor, I'll submit them (or you can simply take them directly).


Alex

