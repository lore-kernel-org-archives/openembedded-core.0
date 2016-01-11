Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 07A67731FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BN7Mr0027716; Mon, 11 Jan 2016 23:07:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7MB7iZ1suNi3; Mon, 11 Jan 2016 23:07:39 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BN7Z68027771
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jan 2016 23:07:36 GMT
Message-ID: <1452553655.7598.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Phil Blundell <pb@pbcl.net>
Date: Mon, 11 Jan 2016 23:07:35 +0000
In-Reply-To: <4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
	<4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Mon, 11 Jan 2016 23:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-11 at 14:58 -0800, Khem Raj wrote:
> > On Jan 7, 2016, at 3:40 PM, Phil Blundell <pb@pbcl.net> wrote:
> > 
> > On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
> > > FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit
> > > -frame-pointer -O4 -ffast-math"
> > > +FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit
> > > -frame-pointer -O4 -ffast-math"
> > 
> 
> O4 ? may be just replace this whole thing with -Ofast now a days
> -fexpensive-optimizations is enabled at -O2,-O3 anyway same for fomit
> -frame-pointer and -Ofast turns on
> feast-match on top of -O3
> 
> > I wonder if this would be better as just FULL_OPTIMIZATION_arm. 
> >  That
> > said, the OPTIMIZATION variables are primarily distro knobs and
> > it's not
> > entirely clear that individual packages ought to be overriding them
> > at
> > all.
> > 
> > Does anybody know whether there is any actual science behind the
> > use of
> > those flags on armv7a specifically?
> 
> it came into ffmpeg circa 2008 and proliferated into related
> components primarily to support vectorization and neon
> which was quite nascent for ARM architecture in those days in gcc.
> Today if you were to configure libav with default options
> then it uses mainly -fomit-frame-pointer-O3 -fno-math-errno -fno
> -signed-zeros -fno-tree-vectorize
> 
> which is primarily -Ofast -fno-tree-vectorize

I have to admit that my personal instinct on these is simply to remove
them. I doubt they're buying much now and if people really want to tune
specific recipes by hand they still can do so from their local/distro
config.

Cheers,

Richard


