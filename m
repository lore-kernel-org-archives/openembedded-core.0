Return-Path: <seebs@seebs.net>
X-Greylist: delayed 491 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Nov 2017 18:16:05 UTC
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 147A677CCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:16:05 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id B16EC2ADC93;
	Wed, 29 Nov 2017 12:07:55 -0600 (CST)
Date: Wed, 29 Nov 2017 12:07:54 -0600
From: Seebs <seebs@seebs.net>
To: Richard Tollerton <rich.tollerton@ni.com>
Message-ID: <20171129120754.0f73543c@seebsdell>
In-Reply-To: <20171129180242.29308-1-rich.tollerton@ni.com>
References: <20171129180242.29308-1-rich.tollerton@ni.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][PSEUDO 0/4] Fix stripped mode with newer coreutils cp
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
X-List-Received-Date: Wed, 29 Nov 2017 18:16:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2017 12:02:38 -0600
Richard Tollerton <rich.tollerton@ni.com> wrote:

> So we noticed that cp -Rp was stripping special bits off of
> directories when run under pseudo. The super interesting thing was
> that people saw this when upgrading their build machines from Ubuntu
> 12.04 to 16.04. Root cause is in the commit message in the first
> patch, which also contains the fix.
> 
> I also added a test for this, and fixed up the perms on another test.
> run_tests.sh reports 13/13 pass.
> 
> Also updated contact info in the README.

This looks good to me. Thanks!

(I'm still hoping to get a free day or two to merge patches. Any day
now.)

-s

