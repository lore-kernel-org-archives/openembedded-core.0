Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E4A7D6E688
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 13:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2CDNZKP011639; Sat, 12 Mar 2016 13:23:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XXNWspBfZqZA; Sat, 12 Mar 2016 13:23:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2CDNT5E011635
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 12 Mar 2016 13:23:30 GMT
Message-ID: <1457789009.2804.275.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Khem Raj
	<raj.khem@gmail.com>
Date: Sat, 12 Mar 2016 13:23:29 +0000
In-Reply-To: <CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
	<CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
	<CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
	<CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][master] arch-armv8a.inc: Add tune for 32-bit ARMv8a
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
X-List-Received-Date: Sat, 12 Mar 2016 13:23:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-03-12 at 09:02 -0300, Otavio Salvador wrote:
> On Sat, Mar 12, 2016 at 8:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Sat, Mar 12, 2016 at 7:41 PM, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com>
> > > wrote:
> > > > 
> > > > > On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <
> > > > > daniel.dragomir@windriver.com> wrote:
> > > > > 
> > > > > This patch adds tunes for 32-bit armv8a platforms. The user
> > > > > can select
> > > > > little or big endian, hard or soft float, the vector floating
> > > > > -point
> > > > > instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc
> > > > > and crypto
> > > > > extensions.
> > > > 
> > > > This does not feel right to me. Look at how thunderX looks like
> > > > ARMv8 is the time to fix this tune explodes on arm, this patch
> > > > is not helping
> > > > it.
> > > > 
> > > > Do we need the hf/neon/vfp/thumb2 variants?
> > > 
> > > Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone
> > > and
> > > just have optional features in and out?
> > 
> > something like that yes. Just aarch64 and aarch32 make it simple as
> > that
> 
> ARMv8.1a has different semantics, how does we handle this?

I do think Khem has a point here, there are way too many tunes in this
class and I've very much doubt they all make sense, there are likely
only a handful of key ones and it would be ideal just to filter the
class down to those.

The trouble I face is I don't really know all the details of armv8 so
I'm reliant on others with more knowledge of which ones make sense to
make the call...

Cheers,

Richard

