Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 25A3A712A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 14:05:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1XoYXh-0005O8-AR for openembedded-core@lists.openembedded.org;
	Wed, 12 Nov 2014 15:05:05 +0100
Received: from S0106001c10b78396.vc.shawcable.net ([96.49.26.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 15:05:05 +0100
Received: from jurobystricky by S0106001c10b78396.vc.shawcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 15:05:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Juro Bystricky <jurobystricky@hotmail.com>
Date: Wed, 12 Nov 2014 07:31:08 +0000 (UTC)
Message-ID: <loom.20141112T082701-941@post.gmane.org>
References: <cover.1415745561.git.peter.seebach@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 96.49.26.10 (Mozilla/5.0 (Windows NT 6.0; WOW64;
	rv:33.0) Gecko/20100101 Firefox/33.0)
Subject: Re: [PATCH 0/1] v2: option groups fixup
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
X-List-Received-Date: Wed, 12 Nov 2014 14:05:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Peter Seebach <peter.seebach@...> writes:

> 
> This is like the previous one, only it's been updated to
> use a conditional test on HAVE_MBSTATE_T so it doesn't break
> poky-tiny.
> 
> The following changes since commit 33b7885ecdc8774e34ac3534ec49fed6ffdb3916:
> 
>   oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:19:58 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib seebs/optiongroups2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/optiongroups2
> 
> Peter Seebach (1):
>   eglibc-use-option-groups.patch: Minor fixups.
> 
>  .../glibc/glibc/eglibc-use-option-groups.patch     |   25 +++----------------
>  1 files changed, 4 insertions(+), 21 deletions(-)
> 

Shouldn't the patch contain 

...
++ $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
...

instead of 

...
++ $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem.out
...
?





