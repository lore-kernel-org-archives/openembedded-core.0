Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 09B9C6079F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NEmDF3026490; Fri, 23 Sep 2016 15:48:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0GSecF_yeyZF; Fri, 23 Sep 2016 15:48:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NEmANf026486
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Sep 2016 15:48:11 +0100
Message-ID: <1474642090.30475.0.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Christopher Larson <clarson@kergoth.com>, Mariano Lopez
	<mariano.lopez@linux.intel.com>
Date: Fri, 23 Sep 2016 15:48:10 +0100
In-Reply-To: <CABcZAN=K8oZwJds4AnjMcvLoq3PtrS+Be8hu=GQYKQUy-s=65A@mail.gmail.com>
References: <cover.1474444335.git.mariano.lopez@linux.intel.com>
	<facdb05bcfaa9eab9eed0b7db17fad854f6ec046.1474444335.git.mariano.lopez@linux.intel.com>
	<CABcZAN=K8oZwJds4AnjMcvLoq3PtrS+Be8hu=GQYKQUy-s=65A@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 23 Sep 2016 14:48:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-09-21 at 19:06 -0700, Christopher Larson wrote:
> 
> On Wed, Sep 21, 2016 at 12:54 AM, <mariano.lopez@linux.intel.com>
> wrote:
> > diff --git a/meta/files/toolchain-shar-relocate.sh
> > b/meta/files/toolchain-shar-relocate.sh
> > index d4bcf0e..e491153 100644
> > --- a/meta/files/toolchain-shar-relocate.sh
> > +++ b/meta/files/toolchain-shar-relocate.sh
> > @@ -1,3 +1,8 @@
> > +if ! xargs --version > /dev/null 2>&1; then
> > +       echo "xargs is required by the relocation script, please
> > install it firts. Abort!"
> > +       exit 1
> > +fi
> > 
> This is pointless, xargs is mandated by posix/sus.

It appears we have some users with stripped down containers where it
hasn't been installed though and having a user readable message is
better than the rather obtuse one reported into the bugzilla...

Cheers,

Richard

