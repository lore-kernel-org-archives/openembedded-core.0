Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEF8A71D42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 03:42:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 20:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,347,1491289200"; d="scan'208";a="1148227019"
Received: from pbeh7-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.24])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2017 20:42:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mirza Krak <mirza.krak@endian.se>
Date: Tue, 16 May 2017 15:42:03 +1200
Message-ID: <5665197.7sMgVyMVFb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
References: <20170510093705.12171-1-mirza.krak@endian.se>
	<20170510113147.26292.19160@do.openembedded.org>
	<CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFttZXRhLW9lLG1vcnR5LDEvMV0gb3BlbnNzbC1uYXRpdmU6IENvbXBpbGUgd2l0aCAtZlBJQw==?=
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
X-List-Received-Date: Tue, 16 May 2017 03:42:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mirza,

On Monday, 15 May 2017 7:05:23 PM NZST Mirza Krak wrote:
> 2017-05-10 13:31 GMT+02:00 Patchwork <patchwork@patchwork.openembedded.org>:
> > == Series Details ==
> >
> > Series: [meta-oe,morty,1/1] openssl-native: Compile with -fPIC
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/6671/
> > State : failure
> 
> I seem to have messed up here.
> 
> Why does the testing framework think that I was targeting master? Was
> my subject prefix wrong?

It probably doesn't understand "," as a separator and thus didn't see "morty" 
as a branch name and assumed master as the default - if that's the case we 
should probably fix that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

