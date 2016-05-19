Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 496E160290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 09:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4J9k2wT028874; Thu, 19 May 2016 10:46:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xMMJ5pg6ikhB; Thu, 19 May 2016 10:46:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4J9judb028870
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 May 2016 10:45:57 +0100
Message-ID: <1463651156.4578.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Thu, 19 May 2016 10:45:56 +0100
In-Reply-To: <573D2EAF.9010602@windriver.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com> <573D2EAF.9010602@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 09:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


The bottom line is that the system is setup to be sensitive to changes.
Where we've had cases where we haven't reacted to changes, people have
complained and we've ended up making sure we do react to them. The
patch you reference was one such case where users complained we didn't
react enough.

You can't have things both ways, where it reacts to all changes but
also never reacts to changes which don't have any visible effect on the
end result (how do you know?).

The binary diff tool is likely going to be the only way to ultimately
control a binary package feed and is still the only way I can see of
solving this problem. I'd love some help on making that work. Making
deterministic binaries is a large part in making that tool effectively
ultimate and we had some great work on that in the last release.

To be really clear, OE-Core will not have a different signature policy
on release branches since that differing policy would break user
expectations and also wouldn't get tested apart from on the branch so
we'd have less confidence it was working.

Users are free to set their own policies, the system was designed to do
that. If WindRiver wants to have a much more permissive policy, I'm
more than happy for them to do so.

Cheers,

Richard

