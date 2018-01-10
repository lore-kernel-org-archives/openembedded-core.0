Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 286E278834
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:37:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 04:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; 
   d="scan'208";a="9635436"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Jan 2018 04:37:04 -0800
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<ee65ca42-3632-8f67-4615-dffd816823fe@linux.intel.com>
	<CADqQcK7e7r_bdqqdg3yWC74jxC1rGEO48aGx3xFP2asu0FSJdg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9d47e947-eecf-a440-1279-456081987a20@linux.intel.com>
Date: Wed, 10 Jan 2018 14:37:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CADqQcK7e7r_bdqqdg3yWC74jxC1rGEO48aGx3xFP2asu0FSJdg@mail.gmail.com>
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 10 Jan 2018 12:37:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/09/2018 11:41 AM, Nirbheek Chauhan wrote:

> On a quick scan of the patches I can see the issues you're having but
> the solutions are not correct in the general case, so they need some
> work. Could you please file separate PRs for each patch? That way our
> CI will run on them and show failures, and we'll also be able to work
> towards ironing them out and upstreaming them.

Sure; I certainly don't want to claim they're generally correct. Take 
them as an illustration of the issues we faced when using meson in a 
cross-compilation environment against a target sysroot set to something 
else than /.

I'll file them when I have a bit of quiet moment this week.

Alex

