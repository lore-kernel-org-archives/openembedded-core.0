Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C692A79AF4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 02:22:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9H2MYdd016727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 19:22:45 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 16 Oct 2018 19:22:23 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Oct 2018 22:22:19 -0400
Message-ID: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: valgrind upgrade
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
X-List-Received-Date: Wed, 17 Oct 2018 02:22:54 -0000
Content-Type: text/plain

I know it's late, 
I know we're weary, 
I know our plans don't include  [1]
valgrind 3.14 which was released recently after 1.5 years of development. 
I believe that some of the M3 valgrind QA results we'ren't very good
so if we're going to try to fix those problems, perhaps
we should be working on the 3.14 release.

I've reviewed and updated the patches but so far I've only built for qemux86. 
The other qemus are building overnight. 

If someone wants to test basic runtime functions and 
better still run the ptests, that would be great.

The important bits of the release notes IMO:

* More than 100 bugs fixed.

* Valgrind is now buildable with link-time optimisation (LTO).  A new
  configure option --enable-lto=yes allows building Valgrind with LTO.  If the
  toolchain supports it, this produces a smaller/faster Valgrind (up to 10%).
  Note that if you are doing Valgrind development, --enable-lto=yes massively
  slows down the build process.
-- I haven't added support for that option yet. A 10% performance boost
   is hard to turn down but we'd need to understand the build impact.

* The new option --keep-debuginfo=no|yes (default no) can be used to retain
  debug info for unloaded code.  This allows saved stack traces (e.g. for
  memory leaks) to include file/line info for code that has been dlclose'd (or
  similar).  See the user manual for more information and known limitations.
-- sounds like it should be a default but I haven't added it yet.

Full release notes:
http://valgrind.org/docs/manual/dist.news.html

../Randy

[1] With apologies for the first line to Kenny Rogers.



