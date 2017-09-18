Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A463478244
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:24:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8IDOQ9d014170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 18 Sep 2017 14:24:28 +0100
Message-ID: <1505741066.18640.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, Will Page <Will.Page@ni.com>
Date: Mon, 18 Sep 2017 14:24:26 +0100
In-Reply-To: <20170915181020.6a184e6a@seebsdell>
References: <20170915222700.GA15457@canismajor>
	<20170915181020.6a184e6a@seebsdell>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Mon, 18 Sep 2017 13:24:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-09-15 at 18:10 -0500, Seebs wrote:
> On Fri, 15 Sep 2017 15:27:00 -0700
> Will Page <Will.Page@ni.com> wrote:
> 
> > 
> > The fcntl guts switch on "cmd" parameter to identify the fcntl
> > command being issued, but isn't aware of the file creation flags
> > that
> > can be ORed in.
> This is true. I was, in fact, not aware of those flags. Looks
> reasonable.

I tried adding this to a test build along with AlexK's epoll patch. It
resulted in:

https://autobuilder.yocto.io/builders/nightly-world/builds/475/steps/BuildImages/logs/stdio

Any ideas why?

Cheers,

Richard

