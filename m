Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00AC576E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 20:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51Kw3eD030737; Wed, 1 Jun 2016 21:58:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hKb0HgYTsWRG; Wed,  1 Jun 2016 21:58:03 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51KvwAp030734
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 21:57:59 +0100
Message-ID: <1464814678.9588.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 01 Jun 2016 21:57:58 +0100
In-Reply-To: <CABcZANkmNG1MvPsYf-KJs2gmPMGjR+CjwLGjxc9k5-MRhgHuiw@mail.gmail.com>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CABcZANkmNG1MvPsYf-KJs2gmPMGjR+CjwLGjxc9k5-MRhgHuiw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/22] oe-buildenv-internal: Update to python3
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
X-List-Received-Date: Wed, 01 Jun 2016 20:58:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-01 at 08:35 -0700, Christopher Larson wrote:
> 
> On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > Check that 'python' is a python v2 since that is what we assume
> > everywhere
> > and upstream python devs recommend. We can need both python2 and
> > python3
> > available since we don't control the software we might download and
> > run.
> > 
> > Also check that python 3 is >= 3.4.0, our minimum version for
> > bitbake.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> I'm curious, why don't we just have a bit of logic to figure out what
> the names are of the binaries, create a subdir and prepend it to the
> path, and add symlinks or wrapper scripts there to the real binaries
> on the system?

We could do this I guess, I'm kind of hoping we don't have to as it
just adds more complexity. 

Tempted to leave the patch as it stands for initial merging and then we
can see how many people have issues...

Cheers,

Richard



