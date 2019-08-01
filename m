Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [138.201.185.127])
	by mail.openembedded.org (Postfix) with ESMTP id 388ED7F5A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 16:19:39 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 1000)
	id E81C340792; Thu,  1 Aug 2019 18:19:39 +0200 (CEST)
Date: Thu, 1 Aug 2019 18:19:39 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: Seebs <seebs@seebs.net>
Message-ID: <20190801161939.GA3850@swift.blarg.de>
Mail-Followup-To: Seebs <seebs@seebs.net>,
	openembedded-core@lists.openembedded.org
References: <20190801160206.24078-1-max+openembedded@blarg.de>
	<20190801111701.367588b2@seebsdell>
MIME-Version: 1.0
In-Reply-To: <20190801111701.367588b2@seebsdell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH pseudo] ports/linux: wrap faccessat()
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
X-List-Received-Date: Thu, 01 Aug 2019 16:19:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2019/08/01 18:17, Seebs <seebs@seebs.net> wrote:
> > +	rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> 
> We should probably be using flags here, not AT_SYMLINK_NOFOLLOW.
> Or possibly (flags & AT_SYMLINK_NOFOLLOW). Otherwise, we'll get the wrong
> results if called with flags not including AT_SYMLINK_NOFOLLOW.

Thanks, I missed that there was indeed a "flags" parameter which can
be forwarded.  Will resend the patch.

