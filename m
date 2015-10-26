Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CB81573D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:12:57 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZqkOE-00053Q-5t; Mon, 26 Oct 2015 17:12:55 +0100
Message-ID: <1445875841.5251.107.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Oct 2015 16:10:41 +0000
In-Reply-To: <562E3896.6080405@windriver.com>
References: <562E3896.6080405@windriver.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: Prelink problems -- need help!
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
X-List-Received-Date: Mon, 26 Oct 2015 16:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[Cc list trimmed]

On Mon, 2015-10-26 at 09:28 -0500, Mark Hatle wrote:
> As you can see, pretty much everything is currently broken and I'm
> struggling to
> find community people with the right skill sets to help me resolve
> the issues.

I think it's true that prelink is a technology which has largely had
its day, and I could well imagine that upstream Red Hat is no longer
very interested in it.  https://fedorahosted.org/fesco/ticket/1183 has
a summary of some of the reasons why.

Before investing any significant amount of time in fixing up prelink
(and from what you've described it sounds like it might indeed be a
significant effort to get it working again on all platforms) it might
be a good idea to make sure we are still convinced that prelink
provides useful and meaningful benefits for OE-core users.

If the answer to that is yes then I probably could spare a bit of time
to look at the ARM and MIPS issues at least. 

p.


