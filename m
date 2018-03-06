Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 06FBF789A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 02:56:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 18:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,430,1515484800"; d="scan'208";a="31643514"
Received: from kthulasi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.81])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2018 18:56:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 06 Mar 2018 15:56:15 +1300
Message-ID: <16709492.LLmFivbgu0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
	<30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
	<CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Tue, 06 Mar 2018 02:56:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 6 March 2018 6:30:25 AM NZDT Burton, Ross wrote:
> I was about to write a long email explaining all this but my dinner is
> almost ready.
> 
> Short version: patch fuzz is dangerous, we've had patches apply using fuzz
> which actually break the code, or doing something else stupid like repeat a
> statement.
> 
> We'd like to eventually have do_patch rejecting any fuzz on these grounds,
> so I wrote a nasty script to rebase all the patches and am reviewing them
> bit by bit.  Note that two of these patches are deleting patches that we've
> been applying although upstream have already applied the same fix...

So, for the purposes of being able to know this looking back in the git 
history can you please put this in the commit message? Fine if every single 
one is a copy-paste, but it shouldn't be blank particularly if someone's 
asking now.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



