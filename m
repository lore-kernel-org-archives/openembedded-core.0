Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0766160034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 06:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9N6gBcZ025286; Fri, 23 Oct 2015 07:42:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QGMnfcibO0UA; Fri, 23 Oct 2015 07:42:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9N6ftFf025276
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Oct 2015 07:42:07 +0100
Message-ID: <1445582515.21913.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 23 Oct 2015 07:41:55 +0100
In-Reply-To: <CABcZAN=CGvq4Wmd_fZosRijgqTtfrcJAeG39T=VRc165sG=qsg@mail.gmail.com>
References: <cover.1445570852.git.randy.e.witt@linux.intel.com>
	<4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
	<80093b6693dad32322aba0119f466a76fc468c67.1445570852.git.randy.e.witt@linux.intel.com>
	<CABcZAN=CGvq4Wmd_fZosRijgqTtfrcJAeG39T=VRc165sG=qsg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] populate_sdk_base: Ensure PKGDATA_DIR exists
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
X-List-Received-Date: Fri, 23 Oct 2015 06:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-22 at 21:11 -0700, Christopher Larson wrote:
> On Thu, Oct 22, 2015 at 8:30 PM, Randy Witt
> <randy.e.witt@linux.intel.com> wrote:
>         -do_populate_sdk[dirs] = "${TOPDIR}"
>         +do_populate_sdk[dirs] = "${TOPDIR} ${PKGDATA_DIR}"
> 
> I hope do_populate_sdk doesn't care where it's run from, as this
> doesn't just make sure the dir exists, it changes the dir the task
> runs in (the last entry in dirs is the cwd of the task).

I was trying to remember which way around that was and planned to check
before merging. I agree this needs to be reversed (and the commit needs
a touch more explanation). I'll tweak that.

Cheers,

Richard



