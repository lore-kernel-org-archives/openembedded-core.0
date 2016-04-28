Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C67F3731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 16:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3SGdmrH031486; Thu, 28 Apr 2016 17:39:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3iDloOkhydPG; Thu, 28 Apr 2016 17:39:48 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3SGdhGZ031483
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Apr 2016 17:39:44 +0100
Message-ID: <1461861583.5465.61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2016 17:39:43 +0100
In-Reply-To: <E9C7C73B-7E2E-4330-B65C-8D9B555A2C57@gmail.com>
References: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
	<996BAFC5-CEC6-4296-A8BD-E7EA383A754F@gmail.com>
	<1461860536.5465.59.camel@linuxfoundation.org>
	<E9C7C73B-7E2E-4330-B65C-8D9B555A2C57@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] security_flags: turn potential string format security issues into an error
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
X-List-Received-Date: Thu, 28 Apr 2016 16:39:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-28 at 09:35 -0700, Khem Raj wrote:
> > On Apr 28, 2016, at 9:22 AM, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Thu, 2016-04-28 at 08:58 -0700, Khem Raj wrote:

> > > Can we use _remove operation instead of introducing a new
> > > variable
> > > and emptying it out here.
> > 
> > I actually suggested we do the above. The reason is that this way,
> > the
> > user can configure which flags they actually want to use. "remove"
> > also
> > has the problem that its near impossible for the user to override
> > further.
> > 
> 
> Thats right, and I was of the view that security flags should be one
> set
> and not offered at combination of multiple options, we just end up
> increasing
> the test matrix.

OE-Core will continue to test with all of them, I think its better
thantpeople can disable part of this, than have to disable everything
for their layer though?

Cheers,

Richard

