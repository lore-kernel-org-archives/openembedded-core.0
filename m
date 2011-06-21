Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYubv-0007ih-5D
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 08:38:55 +0200
Received: by wwg12 with SMTP id 12so2698609wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 23:35:22 -0700 (PDT)
Received: by 10.216.133.161 with SMTP id q33mr5278555wei.73.1308638122077;
	Mon, 20 Jun 2011 23:35:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm3276136weq.27.2011.06.20.23.35.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2011 23:35:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DFFCEFA.2030000@mentor.com>
Date: Tue, 21 Jun 2011 08:35:19 +0200
Message-Id: <A6EDAD88-83D6-4028-B9A7-D7C53A16EF08@dominion.thruhere.net>
References: <4DFFAB8C.30905@linux.intel.com> <4DFFCEFA.2030000@mentor.com>
To: Tom Rini <tom_rini@mentor.com>
X-Mailer: Apple Mail (2.1084)
Cc: "poky@yoctoproject.org Project" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] eggdbus build failure in master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2011 06:38:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 21 jun 2011, om 00:51 heeft Tom Rini het volgende geschreven:

> On 06/20/2011 01:20 PM, Darren Hart wrote:
>> I'm seeing a consistent eggdbus build failure that seems to be related
>> to the perl-native relocation. I've cleanall'd autoconf and automake,
>> native and target versions. The failure persists.
>> 
>> Anyone have any ideas on how to get this building? I'll start a clean
>> build in another directory for now.
> 
> It's a glib problem, you need to switch glib-mkenums to using
> /usr/bin/env perl (you're building in too deep a path for #! to work
> with the full path to perl-native).

I sent that last week to oe-core :)

Have a look at http://patches.openembedded.org/patch/6137/


