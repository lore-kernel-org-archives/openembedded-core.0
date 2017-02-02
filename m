Return-Path: <seebs@seebs.net>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Feb 2017 16:28:00 UTC
Received: from mail.plethora.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 4673571ADE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 16:28:00 +0000 (UTC)
Received: from seebsdell (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id D9D7B2ADCE4;
	Thu,  2 Feb 2017 10:21:06 -0600 (CST)
Date: Thu, 2 Feb 2017 10:21:05 -0600
From: Seebs <seebs@seebs.net>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170202102105.07a3bb91@seebsdell>
In-Reply-To: <1486031880.14889.35.camel@intel.com>
References: <1486031880.14889.35.camel@intel.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 16:28:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Feb 2017 11:38:00 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> Why do we make the real user ID on the build system visible at all
> when running under pseudo? The uid and user name have no meaning
> there, as the user won't exist on the target system. Instead we could
> map the owner of all files to root:root by default, i.e. in those
> cases where no other ownership is recorded in the pseudo database.

We could. Honestly, the underlying reason we don't is at least in part
that that makes the behavior differ more from the behavior of "sudo";
with sudo, you see actual ownerships. But that's less applicable here.

I would be more inclined to report a Definitely Absolutely Not Okay
user ID, like 65533. (65534 and 65535 have both been used as Magic
Cookies in the past, I think.)

-s

