Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E91E177A88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 10:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2SAlYtM023912; 
	Tue, 28 Mar 2017 11:47:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w8LllKLQfBBf; Tue, 28 Mar 2017 11:47:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2SAlXlF023908
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Mar 2017 11:47:34 +0100
Message-ID: <1490698052.13980.274.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 28 Mar 2017 11:47:32 +0100
In-Reply-To: <alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703251400150.8339@localhost.localdomain>
	<1490621485.13980.263.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Replace "if test" file tests with POSIX file tests
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
X-List-Received-Date: Tue, 28 Mar 2017 10:47:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-28 at 05:56 -0400, Robert P. J. Day wrote:
> On Mon, 27 Mar 2017, Richard Purdie wrote:
> 
> > 
> > On Sat, 2017-03-25 at 14:03 -0400, Robert P. J. Day wrote:
> > > 
> > > In entire meta/classes/ directory, replace shell tests of the
> > > form
> > > "if test -? ..." with POSIX tests of the form "if [ -? ...
> > > 
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > 
> > > ---
> > > 
> > >   as i cannot abide those silly "if test" constructs, i zipped
> > > through
> > > and changed them to POSIX form. is there any objection to this
> > > kind
> > > of
> > > cleanup? next up ... all those "x${VAR} = x" tests ...
> > I've merged most of this. There were pieces of the diff that simply
> > didn't apply so I skipped them.
> > 
> > The reason I've taken what applied is that this is very expensive
> > for us to test right now and I made the most of the testing time I
> > had on the weekend. The issue is changes to the core classes
> > rebuild
> > everything so we can't reuse sstate and the tests are much slower.
> > 
> > We're running late with M3 rc2 but just about to build it and I
> > thought it was worth getting some of this in rather none at all.
> > Please do figure out the remaining pieces and send them and we may
> > or may not tweak the remaining bits in M4.
>   my next cleanup was going to be (as mentioned above) replace all
> those silly "x${VAR} = x" string tests with either of:
> 
>   [ -z "${VAR}" ]
>   [ -n "${VAR}" ]
> 
> is there time to get that in before the next freeze? if so, i can do
> it quickly for testing; if not, i guess it can just wait.

I think that needs to wait for 2.4 but I agree its worth cleaning that
up.

Cheers,

Richard

