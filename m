Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC62973281
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NEWKXJ022206; Mon, 23 Jan 2017 14:32:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ms7orxhECz8k; Mon, 23 Jan 2017 14:32:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NEWWwZ022263
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 14:32:33 GMT
Message-ID: <1485181952.30673.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Mon, 23 Jan 2017 14:32:32 +0000
In-Reply-To: <1485181781.20333.39.camel@intel.com>
References: <1484935979-328-1-git-send-email-anibal.limon@linux.intel.com>
	<1484941467.20333.3.camel@intel.com>
	<8c0f5529-3dbb-1049-dc59-0cb368e04359@linux.intel.com>
	<1485181781.20333.39.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Mon, 23 Jan 2017 14:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-01-23 at 15:29 +0100, Patrick Ohly wrote:
> On Mon, 2017-01-23 at 16:01 +0200, Alexander Kanavin wrote:
> > 
> > On 01/20/2017 09:44 PM, Patrick Ohly wrote:
> > 
> > > 
> > > In contrast to Alexander, I would also keep
> > > http://wiki.qemu-project.org/download/${BP}.tar.bz2 in
> > > qemu_2.7.1.bb
> > > with SRC_URI =+ because then there can be a qemu_git.bb with a
> > > different
> > > URL than the one above.
> > I would discourage creation of such separate _git recipes, unless
> > there 
> > is a clear benefit to the whole of oe-core. They are almost always 
> > untested and neglected, and eventually removed because they're
> > outdated 
> > and broken and no one cares.
> I wasn't suggesting to add one, just using the possibility that one
> might want to add one as the rationale for keeping the download URL
> for
> the tarball out of the .inc file.
> 
> It's all rather subjective and hinges on the likelihood of adding a
> _git.bb (don't include it in the .inc) vs. adding more than one
> versioned .bb (then including the common download in the .inc reduces
> duplication).

There is actually an alternative proposal somewhere in bugzilla which
would be to leave enough markup that we can easily enable a git
version. That markup mostly being the git:// url in a variable. Ross
was looking at that.

Cheers,

Richard



