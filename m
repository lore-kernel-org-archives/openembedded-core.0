Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0126B6B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KCoGSC014129; Fri, 20 Feb 2015 12:50:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5dYCIfWKbQJU; Fri, 20 Feb 2015 12:50:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KCo3B8014116
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Feb 2015 12:50:15 GMT
Message-ID: <1424436603.11836.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Feb 2015 12:50:03 +0000
In-Reply-To: <20150220124501.GB2322@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
	<87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
	<20150220124501.GB2322@jama>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 20 Feb 2015 12:50:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-20 at 13:45 +0100, Martin Jansa wrote:
> On Tue, Feb 03, 2015 at 04:02:36PM +0000, Burton, Ross wrote:
> > On 3 February 2015 at 01:05, Richard Tollerton <rich.tollerton@ni.com>
> > wrote:
> > 
> > > Done (and sent), and my apologies, because this exercise has made clear
> > > that I was wrong in several of the details here: None of the three
> > > patches were committed; I was confusing one of them with 89a29a3a, which
> > > was from a separate email. The confusion originated in 89a29a3a having
> > > been committed after I had already withdrawn it, which I forgot about
> > > over the holidays.
> > >
> > 
> > That's probably my fault, sorry.  Thanks for following up and resolving
> > this properly.
> 
> Can you please merge those fixes before 1.8 is closed? Or at least
> revert the original patch which shouldn't be merged, until your comment
> for 1/3 is resolved.
> 
> FWIW I haven't noticed v4 to resolve:
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg61018.html

We don't have the "right" patch for this yet. I don't want the fonts in
the sysroots, I agree we need to resolve the other issues though. I also
agree this needs fixing for 1.8, thanks for bringing it up.

Cheers,

Richard




