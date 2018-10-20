Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 95BBC79CF2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 08:51:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9K8plia002561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 20 Oct 2018 09:51:48 +0100
Message-ID: <7523239aa2a51ca88927ae4f086a64bb12625cb1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 20 Oct 2018 09:51:47 +0100
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: 2.6 M4 Status
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
X-List-Received-Date: Sat, 20 Oct 2018 08:51:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I appreciate we're behind with 2.6 M4. I believe we're getting there
however there are some things I still think need to be addressed:

* We need to merge the oeqa json test results reporting. Why? QA for
the project is changing in 2.7 and we're going to be relying on
automation very heavily. Having this in the next stable series (2.6)
would massively assist with this work and lead to a better future for
the project.

* The checksum issues Mark highlighted are problems. Unfortunately the
patches as proposed aren't working.

* rootfs build time performance regression - Ross and I are simply out
of time to look into this ourselves. This one will likely miss the
release.

* cmake changes - they're clearly important but currently break things
and I'm worried whether we'd find all the problems if they merge.

* any other fallout from the _remove change. Hopefully the queued patch
fixes the problems we were seeing.

* ptest regressions. I believe with master+openssl+valgrind patches we
should be equivalent to rc2 results wise but its close run and there
are still some tests failing which previously passed.

There are also some decisions to make:

* what to do with go versioning for 2.6. 1.11 is late but tempting
given the problems with 1.10.


I know a number of people are travelling for ELC-E which may further
delay the release build but its ready when its ready...

Cheers,

Richard


