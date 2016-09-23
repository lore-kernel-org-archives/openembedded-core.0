Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 68D6C60720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NGnqfD005307; Fri, 23 Sep 2016 17:49:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G-Gselu1hFb9; Fri, 23 Sep 2016 17:49:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NGnlXh005283
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Sep 2016 17:49:48 +0100
Message-ID: <1474649386.30475.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 23 Sep 2016 17:49:46 +0100
In-Reply-To: <1474642615.8561.10.camel@intel.com>
References: <cover.1474444335.git.mariano.lopez@linux.intel.com>
	<facdb05bcfaa9eab9eed0b7db17fad854f6ec046.1474444335.git.mariano.lopez@linux.intel.com>
	<CABcZAN=K8oZwJds4AnjMcvLoq3PtrS+Be8hu=GQYKQUy-s=65A@mail.gmail.com>
	<1474642090.30475.0.camel@rpsys.net>
	<1474642615.8561.10.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] toolchain-shar-relocate.sh: Add error-handling
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
X-List-Received-Date: Fri, 23 Sep 2016 16:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-23 at 16:56 +0200, Patrick Ohly wrote:
> On Fri, 2016-09-23 at 15:48 +0100, Richard Purdie wrote:
> > 
> > On Wed, 2016-09-21 at 19:06 -0700, Christopher Larson wrote:
> > > 
> > > 
> > > On Wed, Sep 21, 2016 at 12:54 AM, <mariano.lopez@linux.intel.com>
> > > wrote:
> > > > 
> > > > diff --git a/meta/files/toolchain-shar-relocate.sh
> > > > b/meta/files/toolchain-shar-relocate.sh
> > > > index d4bcf0e..e491153 100644
> > > > --- a/meta/files/toolchain-shar-relocate.sh
> > > > +++ b/meta/files/toolchain-shar-relocate.sh
> > > > @@ -1,3 +1,8 @@
> > > > +if ! xargs --version > /dev/null 2>&1; then
> > > > +       echo "xargs is required by the relocation script,
> > > > please
> > > > install it firts. Abort!"
> > > > +       exit 1
> > > > +fi
> > > > 
> > > This is pointless, xargs is mandated by posix/sus.
> > It appears we have some users with stripped down containers where
> > it
> > hasn't been installed though and having a user readable message is
> > better
> ... and even better is one without typos ;-}
> 
> s/firts/first/

Indeed. Fix queued in -next.

Cheers,

Richard

