Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4Y0x-000369-Gq for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 14:59:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GD0MCd016355 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 14:00:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PfpOvpQscjRU
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 14:00:22 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GD0Hrr016346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 14:00:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 13:54:05 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316177653.20858.23.camel@ted>
Mime-Version: 1.0
Subject: OE-Core release process
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 12:59:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its been mentioned to me that we perhaps haven't made it really clear
what is happening with OE-Core at the moment. When we started this off,
we agreed to try and get on a roughly six month release cadence so
people had some idea of what to expect from the project and when. We
decided to put that in sync with what Yocto was doing since it was felt
OE-Core would equally benefit from the QA and bug fixing Yocto does as
part of its release process.

I did mention we be doing slow down of features, a calming down of
changes, then branching and releasing off the branch. Judging by
people's patch submissions, that seemed to be happening fairly
effectively.

Unfortunately we hit some infrastructure issues to the issues with the
kernel.org servers which in turn affected the Linux Foundation (who my
email goes through) and the Yocto project (who were previously on the
same router). This meant we didn't get test results when I'd have
ideally liked them or been able to branch when I wanted to. Its also
hampered some of the communication which otherwise might have been
clearer.

I think the tree is stable enough to branch now and the position is what
it is, we're just going to have to make the best of it. I'd really like
to release OE-Core and Yocto based on the same revisions. Yocto now has
a -rc2 build with timeslots planned for an -rc3 with -rc1 effectively
just having been build tested. The only way to fit a -rc4 in is to slip
release dates and due to holidays in China where the QA team is based,
that would mean a big slip.

The big problem we now face is that the more change we put into -rc3,
the higher the risk of either build failure regressions or QA
regressions which would mean the release slips.

I'm going to branch the tree today and will be carefully considering
what goes into the release branch.

There will be changes accepted on this branch going forward and there is
the possibility of subsequent point releases although we likely need to
clearly document what is acceptable change there. My quick summary would
be no feature enhancements, dot.dot point release version changes only
for bug fixes and generally bug/regression fix only along with any fixes
needed to build on newer distros. 

Also not that if for any reason this isn't good enough for anyone's
needs, there is freedom to create other "stable" branches based on this
(or otherwise) and if that proved to be more popular/useful, that would
directly influence what we'd do in OE-Core. The best branch would
win :).

Cheers,

Richard




