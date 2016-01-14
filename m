Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC9F731C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:57:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jan 2016 04:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="726879680"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Jan 2016 04:57:08 -0800
To: openembedded-core@lists.openembedded.org
References: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf4W4vEZYa=Ge_yF3SNBSppALXVYuu5U-7wqHx5cPRaPDw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56979A85.5030403@linux.intel.com>
Date: Thu, 14 Jan 2016 14:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAD3vsf4W4vEZYa=Ge_yF3SNBSppALXVYuu5U-7wqHx5cPRaPDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cantarell-fonts: Add recipe
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
X-List-Received-Date: Thu, 14 Jan 2016 12:57:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2016 07:36 PM, Jagadeesh Krishnanjanappa wrote:
> Ping.
>
> Without cantarell fonts, the pango test case test-layout.test fails.
> Previous result of pango ptest is at
> https://wiki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986f4653e64c4c8d2b5461645e

There is an upstream bug for this:
https://bugzilla.gnome.org/show_bug.cgi?id=755733

You should leave a note at the upstream bug that the absence of the 
needed font is probably the issue. The test should probably be rewritten 
so that it doesn't assume that the font is available.

Alex

