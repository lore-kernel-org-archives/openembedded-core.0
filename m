Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C831F79D6F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 03:32:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 19:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="246987316"
Received: from zhiyionk-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.168.156])
	by orsmga004.jf.intel.com with ESMTP; 04 Nov 2018 19:32:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Date: Mon, 05 Nov 2018 16:32:26 +1300
Message-ID: <4820003.uEWOQMMmpA@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
MIME-Version: 1.0
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: 2.6 migration guide
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
X-List-Received-Date: Mon, 05 Nov 2018 03:32:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 31 October 2018 11:06:31 AM NZDT Scott Rifenbark wrote:
> I have an initial section at
> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.6-release,
> which is based on Richard's input.  I am sure there are more items.

OK, so I have removed Richard's items from the wiki page (since they're now
in the manual) and added items I have gathered from reviewing all of the 
git commits in the release. Let me know if you need clarification on anything
- everyone else, let us know if I missed or messed up something.

  https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

BTW I think the section on postinstalls (from Richard's input) is a little terse
and needs expansion - most importantly it needs to describe what actions the
user might need to take. I'll take care of this on review if nobody else does.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



