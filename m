Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A810174C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 22:45:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9MMjOQu032544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Oct 2018 23:45:26 +0100
Message-ID: <466227376536e7827eac122aebfe0e57890581ae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Olaf Mandel <o.mandel@menlosystems.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 23:45:24 +0100
In-Reply-To: <afda4768-3684-ffc6-b054-a58656694d51@menlosystems.com>
References: <20181019152214.1600-1-o.mandel@menlosystems.com>
	<20181022103314.13840.4113@do.openembedded.org>
	<afda4768-3684-ffc6-b054-a58656694d51@menlosystems.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG5wbTogY2hhbmdlIGluc3RhbGwgZGlyZWN0b3J5IHRvIHVwc3RyZWFtIGRlZmF1bHQgKHJldjMp?=
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
X-List-Received-Date: Mon, 22 Oct 2018 22:45:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-22 at 12:45 +0200, Olaf Mandel wrote:
> Hello,
> 
> Am 22.10.2018 um 12:33 schrieb Patchwork:
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head] Suggested fix    Rebase your series on
> > top of targeted branch Targeted branch  master (currently at
> > daba6c5a99)
> > 
> 
> The v2 of the patch does not apply because the master branch already
> contains v1 of the patch. I didn't notice this and resubmitted v2 as
> v3 after a rebase (to the sumo-branch, not the master branch). So v2
> and v3 are identical except for the parent commit hash.
> 
> The problem is: v1 does not actually work. What is the procedure to
> handle this? Should I make a patch that works on top of the v1
> already
> in master?

Normally I'd suggest a new patch against master. In this case I've
created one and queued it in next.

Cheers,

Richard


