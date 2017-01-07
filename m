Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A925671A31
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2017 22:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v07MqEAm018902; Sat, 7 Jan 2017 22:52:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y2ZfwQj7d-as; Sat,  7 Jan 2017 22:52:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v07Mq80p018896
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 7 Jan 2017 22:52:09 GMT
Message-ID: <1483829528.4367.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Phil Blundell <pb@pbcl.net>
Date: Sat, 07 Jan 2017 22:52:08 +0000
In-Reply-To: <1483815653.4383.28.camel@intel.com>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
	<1483737447.4360.180.camel@pbcl.net>
	<1483776414.4383.22.camel@intel.com>
	<1483783158.4360.182.camel@pbcl.net>
	<1483815653.4383.28.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Sat, 07 Jan 2017 22:52:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-01-07 at 20:00 +0100, Patrick Ohly wrote:
> On Sat, 2017-01-07 at 09:59 +0000, Phil Blundell wrote:
> > 
> > On Sat, 2017-01-07 at 09:06 +0100, Patrick Ohly wrote:
> > > 
> > > 
> > Yes, but there's already a solution for that problem:
> > > 
> > > useradd-staticids.bbclass
> > > 
> > > I was assuming that someone who wants identical files is already
> > > using
> > > that. Should it be mentioned in a comment next to the new
> > > feature?
> > That sounds like a good idea.  And in that case, maybe it would be
> > better to sort on uid rather than username?  That would preserve
> > the
> > "traditional" ordering in the file, i.e. root first.
> I had thought about that, but then did not pursue that further
> because
> it would have made sorting quite a bit more complex (needs to know
> about
> line content, id not present in each file).
> 
> I can give it a try, though, if that's considered worth some
> additional
> complexity.

I think those functions can be python functions and this might not be
too bad to write in python....

Cheers,

Richard

