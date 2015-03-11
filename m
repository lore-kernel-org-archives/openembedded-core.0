Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6DA73966
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 17:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2BHvFWv017857; Wed, 11 Mar 2015 17:57:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RimHNAepQTiM; Wed, 11 Mar 2015 17:57:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2BHv2Ss017762
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Mar 2015 17:57:14 GMT
Message-ID: <1426096622.9114.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 11 Mar 2015 17:57:02 +0000
In-Reply-To: <550079EA.7030500@windriver.com>
References: <alpine.LFD.2.11.1503111228420.5897@localhost>
	<550079EA.7030500@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how many ways to delete/de-activate a recipe's task?
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
X-List-Received-Date: Wed, 11 Mar 2015 17:57:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-11 at 12:22 -0500, Mark Hatle wrote:
> On 3/11/15 11:30 AM, Robert P. J. Day wrote:
> > 
> >   i recall that richard purdie might have explained this once but i
> > have no idea where that post is and i need to add something to it,
> > anyway ... how many ways are there to "delete" a task from a recipe,
> > and what are the differences?
> > 
> >   so far, i've seen:
> > 
> > 1) bitbake supports a "deltask" directive
> 
> The task and all it's dependencies go away.  So anything dependent on it and the
> things it depends on, are no longer dependent.
> 
> > 2) you can use the [noexec] task flag
> 
> The task and it's dependencies remain, but nothing is executed.
> 
> > 3) i've also seen redefining the task with a no-op ":" command
> 
> The task is executed and does nothing.  (I believe this dumps a stamp file and
> the noexec does not.. but I may be wrong.)

What Mark said. 3) is the old way of doing 2), we added 2) to make it
more efficient since there is no task execution overhead (which at one
point was measurable, it may be less so now).

Cheers,

Richard




