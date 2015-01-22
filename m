Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E079E71144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 23:04:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0MN4ScI023595
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 22 Jan 2015 15:04:28 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 Jan 2015 15:04:27 -0800
Date: Thu, 22 Jan 2015 17:04:24 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150122170424.4e5ea3a7@e6410-2>
In-Reply-To: <CAJTo0LYPQenCD2eMaSzPbaaUrky_Ta4cpnjFpN55D+BS5YzRJw@mail.gmail.com>
References: <cover.1421788745.git.peter.seebach@windriver.com>
	<b8134b991239e494b77a232bd723245d753c2734.1421788745.git.peter.seebach@windriver.com>
	<CAJTo0LYPQenCD2eMaSzPbaaUrky_Ta4cpnjFpN55D+BS5YzRJw@mail.gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3
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
X-List-Received-Date: Thu, 22 Jan 2015 23:04:39 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2015 11:26:55 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 20 January 2015 at 21:21, Peter Seebach <peter.seebach@windriver.com>
> wrote:
> 
> > pseudo 1.6.3 merges (with some changes) the changes from
> > Peter A. Bigot to make --without-fallback-passwd work. It
> > also adds a proposed fix for Yocto bug #7097, which has
> > passed the obvious tests I could think of.
> 
> 
> This fails to build on *some* machines in the AB pool.

So, I have a fix for that, but I also have a possible report of a
(preexisting) possible issue involving dangling symlinks, but we haven't been
able to narrow a reproducer down much. So I think I may sit on that for a
little bit in the hopes that I'll be able to fix that one too in 1.6.4. But
if people would rather see this one in right away, the fix is ready, and
fairly trivial.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

