Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 793956E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 18:05:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 10 Sep 2015 11:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,506,1437462000"; d="scan'208";a="766456638"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2015 11:04:31 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id AD1F46A4087; Thu, 10 Sep 2015 11:03:39 -0700 (PDT)
Received: from 10.252.58.194
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 10 Sep 2015 21:03:39 +0300 (EEST)
Message-ID: <57582.10.252.58.194.1441908219.squirrel@linux.intel.com>
In-Reply-To: <F0FA75E8-F6E8-496C-8757-68144FDCD0CA@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com> <55F16E82.1070708@gmail.com>
	<55F172C9.3030601@linux.intel.com> <55F173AC.7010808@mlbassoc.com>
	<CAJTo0LYWxFtoYNseSup-zXAvJMigP_y1c4wdSrFXwk6SP_C-=A@mail.gmail.com>
	<F0FA75E8-F6E8-496C-8757-68144FDCD0CA@gmail.com>
Date: Thu, 10 Sep 2015 21:03:39 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Khem Raj" <raj.khem@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 18:05:19 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Pending means "I wrote a patch but cannot be bothered to send it
>> upstream”.
>
> Or more politely, I am working on upstreaming it on my own schedule.

Allowing "own schedule" doesn't work out in reality. Here's how many
'Pending' patches the yocto releases have:

master: 712
fido: 681
dizzy: 683
daisy: 598
dora: 611
dylan: 555
danny: 548
denzil: 518
edison: 426

There should be measures to keep this number from growing indefinitely.

Regards,
Alex

