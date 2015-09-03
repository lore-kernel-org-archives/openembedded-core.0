Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7DF777011
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 08:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t838i3ep010210; Thu, 3 Sep 2015 09:44:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oB60etQhMWGp; Thu,  3 Sep 2015 09:44:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t838hoFH010207
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 09:44:01 +0100
Message-ID: <1441269830.24871.90.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Thu, 03 Sep 2015 09:43:50 +0100
In-Reply-To: <b27a8d540bc9724008d5be09c7ea83ffdbdd6c20.1441219463.git.peter.seebach@windriver.com>
References: <cover.1441219463.git.peter.seebach@windriver.com>
	<b27a8d540bc9724008d5be09c7ea83ffdbdd6c20.1441219463.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.7.1.bb: New version of pseudo
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
X-List-Received-Date: Thu, 03 Sep 2015 08:44:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 13:47 -0500, Peter Seebach wrote:
> Pseudo 1.7 adds an experimental feature (which I think needs more testing
> before it becomes the default) allowing the pseudo client to store modes
> and uid/gid values in extended attributes rather than using the sqlite
> database. On most Linux-like systems, this works only if the underlying
> file is a plain file or a directory.
> 
> Also added is a profiling feature to allow some amount of reporting on
> the wall-clock time the client spends in wrappers, processing operations,
> or in IPC. This feature is not intendeded to be precisely accurate, but
> gives a good overview of where time is going.
> 
> Based on the results from the profiling feature, the client now suppresses
> OP_OPEN and OP_EXEC messages if the server is not logging messages, and
> no longer uses constant dynamic allocation and free cycles for canonicalized
> paths.
> 
> There's a few other likely-looking optimizations being considered, but
> this seemed like a good cutoff for now.
> 
> (1.7.1 fixes two bugs, one affecting mostly XFS systems with 64-bit
> inode values, and one affecting code that called realpath(x, NULL), such
> as the RPM backend.)

This is better however opkg is still unhappy. This is build with this
pseudo patch applied:

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/469

and this is a build with the same patches expect for the pseudo one:

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/470

so something is still unhappy :(. The rpm builds were a lot better
though.

Cheers,

Richard


