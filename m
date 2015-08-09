Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F44176834
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 15:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79FLpXr026693; Sun, 9 Aug 2015 16:21:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GqZmXSBc8Bvf; Sun,  9 Aug 2015 16:21:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79FLWn7026670
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 9 Aug 2015 16:21:45 +0100
Message-ID: <1439133691.30467.100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Aug 2015 08:21:31 -0700
In-Reply-To: <37380D15-6A67-405F-ACFF-7E03F6843595@gmail.com>
References: <1439103829.30467.93.camel@linuxfoundation.org>
	<37380D15-6A67-405F-ACFF-7E03F6843595@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Add error handling for unexpected tap devices
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
X-List-Received-Date: Sun, 09 Aug 2015 15:21:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-08-09 at 00:31 -0700, Khem Raj wrote:
> > On Aug 9, 2015, at 12:03 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > In theory the code reduces the tap device number to an integer. This
> > patch adds error checking to ensure that does happen and that the script
> > exits if something unexpected happens.
> > 
> 
> I see these patches are already on master. Are you sending them again by mistake for review or something else ?

Sorry, I've hit the wrong commands. The plan was to queue them for a
fast turnaround into master once the current build completed and they'd
spent some time on the list for review. It looks like I pushed them
early :/.

The good news is that with these patches, one of the "random" issues
we've been seeing is fixed and we might be able to start trusting the
autobuilder a bit more again. There are still other issues but this is
perhaps the one with the most visible impact.

It does look like we're going to need an M2 rc2 once we figure out the
libpam issues so I'm going to hold off the various queued upgrades until
we figure out a good rc2 build combination of changes.

Cheers,

Richard


