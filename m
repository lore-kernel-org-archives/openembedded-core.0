Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 62B28731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NHIjwD007062; Mon, 23 Jan 2017 17:18:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JyGrqb16aN-y; Mon, 23 Jan 2017 17:18:45 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NHIduF007059
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 17:18:40 GMT
Message-ID: <1485191919.30673.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2017 17:18:39 +0000
In-Reply-To: <CAMKF1socZ7RtN+0UcLtmGF9GQVcEP8LXjCVxA3Y3feeHKtokhQ@mail.gmail.com>
References: <1485176279-1373-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1socZ7RtN+0UcLtmGF9GQVcEP8LXjCVxA3Y3feeHKtokhQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tremor: Use mirror tarball instead of svn url
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
X-List-Received-Date: Mon, 23 Jan 2017 17:18:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-01-23 at 09:11 -0800, Khem Raj wrote:
> On Mon, Jan 23, 2017 at 4:57 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > This is the only remaining svn url in OE-Core and building
> > subversion-native
> > for things like the url checker is wearing and slows down builds.
> > Since
> > this rarely changes, use the mirror tarball instead.
> Do we explicitly add subversion-native to builds ?  or is it going to
> be removed automatically now that there is nothing needed it ?
> subversion-native should still remain though for other layers to use.

Its automatic, no svn:// urls, no subversion-native builds.

(git-native in ASSUME_PROVIDED stops that for git:// urls but remove
it, the same thing happens).

Cheers,

Richard

