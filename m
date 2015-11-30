Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Nov 2015 14:11:30 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC8B601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:11:30 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1a3OwG-0003gv-Ki for openembedded-core@lists.openembedded.org;
	Mon, 30 Nov 2015 14:56:20 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:56:20 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:56:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 Nov 2015 14:56:00 +0100
Message-ID: <n3hkhg$bik$1@ger.gmane.org>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
In-Reply-To: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Mon, 30 Nov 2015 14:11:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 26-11-15 om 22:00 schreef Paul Eggleton:
> Hi all,
> 
> Over the past several years one of the regular complaints people have made 
> about our project has been that patches sometimes take a long time to make it 
> into master, and it's not always clear what the state of a patch is during 
> that time. On the other side of things, maintainers are finding it increasingly 
> hard to keep up with testing and integrating incoming patches. Additionally, 
> trivial mistakes sometimes creep in that would be fairly easy to catch with an 
> automated process. We've been talking about this for a while and now I'd like 
> to propose a plan to finally address this:
> 
> 1) Upgrade the OE Patchwork instance [0] to a newer release; this should fix 
> some of the problems we are having [1] plus give us additional features. I 
> propose using the fork that freedesktop.org are using [2] [3] which is moving 
> a bit faster than upstream Patchwork; whilst the changes there may eventually 
> make it upstream (and work is ongoing there) we have a much greater ability to 
> influence the fork given that it's being worked on by one of my colleagues who 
> is pushing it in the direction we need it to go e.g. proper support for series 
> as opposed to treating every patch individually, improved UI, etc.

I very much support upgrading patchwork to the fdo version, the set-aware
feature removes a lot of visual clutter.

regards,

Koen


