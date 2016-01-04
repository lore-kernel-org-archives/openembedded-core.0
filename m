Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E53DB731B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 12:52:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jan 2016 04:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,520,1444719600"; d="scan'208";a="719866554"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Jan 2016 04:52:05 -0800
To: openembedded-core@lists.openembedded.org
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
	<DUB130-W169AB1FBDD4284EB42D7DBDAF20@phx.gbl>
	<CAJTo0LY6MpvHRaZ9teS088jaoSrgb5NLMF32uo7KmXJK0nGppA@mail.gmail.com>
	<DUB130-W21AF20AA18BC334FB9E61BDAF20@phx.gbl>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <568A6A49.7030508@linux.intel.com>
Date: Mon, 4 Jan 2016 14:49:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <DUB130-W21AF20AA18BC334FB9E61BDAF20@phx.gbl>
Subject: Re: gobject introspection - distccd?
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
X-List-Received-Date: Mon, 04 Jan 2016 12:52:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2016 02:24 PM, Chris Trobridge wrote:
> That's what I was thinking: gobject-introspection doesn't call it in
> directly but it does require compilation to be performed on the 'target'
> system and that could pull it in indirectly.

g-introspection does not require compilation to be performed on the 
target. It requires running binaries that were cross-compiled for the 
target architecture, which is achieved by running them using qemu.

> distcc (and hence avahi) are not required, so is this a general problem
> or just something I should explicitly remove from my image?

I think it's a problem of your local setup; the g-o patchset definitely 
doesn't involve distcc at any point. You can build against a clean 
directory with only basic poky layers to verify that.


Alex


