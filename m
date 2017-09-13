Return-Path: <seebs@seebs.net>
X-Greylist: delayed 375 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Sep 2017 22:14:44 UTC
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id CAE4C786D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 22:14:44 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D5D962ADD09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:09:44 -0500 (CDT)
Date: Wed, 13 Sep 2017 17:09:43 -0500
From: Seebs <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170913170943.60a3d856@seebsdell>
In-Reply-To: <20170913204659.1919-1-Martin.Jansa@gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Wed, 13 Sep 2017 22:14:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Sep 2017 22:46:59 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

>   And some-other-unrelated-file is really some different file, not
> just hardlink to the same file from some different directory (like
> between WORKDIR and sysroot other "path mismatch" entries show).

To clarify a thing: In practice, "path mismatch" with links > 1 is
probably harmless. I think I had a patch floating around to stop
alerting about it except when being paranoid.

-s

