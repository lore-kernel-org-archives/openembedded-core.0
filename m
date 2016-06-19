Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 041C960043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 07:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5J7oV3c016807; Sun, 19 Jun 2016 08:50:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vEW_q_AYRkzB; Sun, 19 Jun 2016 08:50:31 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5J7oQbY016804
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Jun 2016 08:50:27 +0100
Message-ID: <1466322626.3319.86.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Sun, 19 Jun 2016 08:50:26 +0100
In-Reply-To: <24C09066-C7EA-47A6-8771-02E59FC60525@linaro.org>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
	<1465045799.13979.33.camel@linuxfoundation.org>
	<F5F5FC08-7E44-4648-A769-EC4D8F4D9EB7@dominion.thruhere.net>
	<1466274078.3319.0.camel@linuxfoundation.org>
	<24C09066-C7EA-47A6-8771-02E59FC60525@linaro.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Sun, 19 Jun 2016 07:50:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-06-19 at 09:46 +0200, Koen Kooi wrote:
> 
> 
> > Op 18 jun. 2016, om 20:21 heeft Richard Purdie <
> > richard.purdie@linuxfoundation.org> het volgende geschreven:
> > 
> > On Sat, 2016-06-18 at 15:08 +0200, Koen Kooi wrote:
> > > > Op 4 jun. 2016, om 15:09 heeft Richard Purdie <
> > > > richard.purdie@linuxfoundation.org> het volgende geschreven:
> > > > 
> > > > On Sat, 2016-06-04 at 10:41 +0200, Koen Kooi wrote:
> > > > > ping 2
> > > > 
> > > > It would be helpful if you'd cc'd the person who's patch you
> > > > were
> > > > suggesting we revert. I added Sasha to cc.
> > > 
> > > Since the original committer has shown zero interest in
> > > responding
> > > here or fixing the problem in the past month, can you please
> > > commit
> > > this? This fixes a clear regression, which alone should have been
> > > reason enough to commit this.
> > 
> > Did 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7028192246552f
> > d9e4aa3674da9c30670fd4ec86 fix this?
> 
> Don’t know since I use OE, not poky.

Ok. Let me paste the hash in "From OE-Core rev: 46bc438374de74af76d288520c6252c9b7840767"
into a new url. I obviously have nothing better to do with my time.

Did http://git.openembedded.org/openembedded-core/commit/?id=46bc438374de74af76d288520c6252c9b7840767
fix this?

Or in case you also don't have a web browser, did revision in the
openembedded-core repository with hash 
46bc438374de74af76d288520c6252c9b7840767 fix this issue?

Cheers,

Richard


