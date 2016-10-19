Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 756176FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 22:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9JM9A56022929; Wed, 19 Oct 2016 23:09:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AnLmwqm-tV9m; Wed, 19 Oct 2016 23:09:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9JM954B022924
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 19 Oct 2016 23:09:06 +0100
Message-ID: <1476914945.2166.103.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Robert P. J. Day"
	<rpjday@crashcourse.ca>
Date: Wed, 19 Oct 2016 23:09:05 +0100
In-Reply-To: <1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
	<1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 22:09:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-20 at 08:52 +1300, Paul Eggleton wrote:
> On Wed, 19 Oct 2016 15:42:27 Robert P. J. Day wrote:
> > 
> > On Thu, 20 Oct 2016, Paul Eggleton wrote:
> > > 
> > > On Wed, 19 Oct 2016 15:32:25 Robert P. J. Day wrote:
> > > > 
> > > > i was reading this:
> > > > 
> > > > https://patchwork.openembedded.org/patch/120705/
> > > > 
> > > > but perhaps i'm just misinterpreting what i'm reading.
> > > Right - that patch makes the preservation of the package
> > > management
> > > database (what it refers to as the "packaging data") conditional.
> > > That
> > > code does nothing with the packages themselves.
> >   i'm about to create a new project directory as a test ... is
> > there
> > any configuration i should do to try to preserve all those
> > nativesdk
> > rpm files?
> I am not aware of any configuration that should control the presence
> or 
> absence of those files. As far as I'm concerned, if they are
> disappearing and 
> you're not doing anything to delete them, that's a bug.

I have a suspicion that this is the sstate code removing them because
it decided that they were stale for some reason. Changing SDKMACHINE
could conceivably do that (but probably shouldn't?), as could updating
the metadata and the system deciding the data there was stale and
"unreachable" from the new metadata.

So I can imagine it happening but am not sure what the trigger would
have been. If they were stale/unreachable, it might have been correct
to remove them.

Cheers,

Richard



