Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2F80C78BEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 12:01:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6VC1VGG029312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 31 Jul 2018 13:01:32 +0100
Message-ID: <02c7f3287776cfa47e68579454e5abb42d8c0e9d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, "Maxin B. John"
	<maxin.john@intel.com>
Date: Tue, 31 Jul 2018 13:01:31 +0100
In-Reply-To: <CAJTo0LZ7OLpo=Sm_Kobr5D730O1wTSmyQsqN=_CSrxCcqkunSQ@mail.gmail.com>
References: <1533034411-26881-1-git-send-email-maxin.john@intel.com>
	<1533034411-26881-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LZ7OLpo=Sm_Kobr5D730O1wTSmyQsqN=_CSrxCcqkunSQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] vulkan-demos: upgrade to latest commit
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
X-List-Received-Date: Tue, 31 Jul 2018 12:01:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-31 at 12:17 +0100, Burton, Ross wrote:
> On 31 July 2018 at 11:53, Maxin B. John <maxin.john@intel.com> wrote:
> > Update subcomponents gli and glm based on the new structure of
> > repository.
> 
> If they're submodules then the gitsm: fetcher should get those for
> you.

The gitsm fetcher is broken from an archive/mirroring persective iirc
though. Using it in OE-Core by default is therefore potentially
problematic :(.

Cheers,

Richard



