Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A9A9271B32
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 22:36:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w04Ma1tj018182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 Jan 2018 22:36:02 GMT
Message-ID: <1515105360.30291.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jan 2018 22:36:00 +0000
In-Reply-To: <1515103894.665.22.camel@gmail.com>
References: <1515096936.665.19.camel@gmail.com>
	<1515103250.30291.7.camel@linuxfoundation.org>
	<1515103894.665.22.camel@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: Uninative and sstate
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
X-List-Received-Date: Thu, 04 Jan 2018 22:36:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-01-04 at 16:11 -0600, Joshua Watt wrote:
> On Thu, 2018-01-04 at 22:00 +0000, Richard Purdie wrote:
> > There used to be an optimisation we made where we only did it when
> > we
> > needed to (using sstate). The move to RSS meant that we now always
> > have
> > to do it. I'd therefore guess you're using morty or older? On more
> > recent versions you'll see it always relocating. There are pros and
> > cons both ways.
> Yes we are using morty. I suppose that at least explains the
> behavior.

You'll find:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=morty&id=590ef99df7
4581e6b7595e545c12594012653de8

interesting (its on the stable branch now).

That was basically retrofitting some of this behaviour to morty to fix
bugs...

Cheers,

Richard

