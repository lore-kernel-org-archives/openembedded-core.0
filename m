Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T3G2J-0005mf-0O
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 02:40:07 +0200
Received: by pbcwy7 with SMTP id wy7so7151723pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=MAj3UTyKvZ4QTS0zdPQ+cDaJhTHYbAhuDnjyYlnCWGc=;
	b=wlTkPGaMnAKOOnBkxRvIqPp6DRgfc6Ood7siA9LUp5+4pvWIhqsT1FCCDhYgBpmfJx
	MzVZ13caNbd95IQpTLuo1Mm+eYjizdd8KSbw4e9MphWEPMYNPFE4ZrRSjPtUy1EPS9R6
	SpNaucNReNynwXgtyZadGjTZA9RRPUdIAwQPS7Fg4IJXS3BwybMELiNSqgIYkC/HERq5
	sUbRVGyXpeuaOzekyai7AvsGTlDsBAmFfb3RYhStWpkb9RQhDwpUDNeyXyOlpVFR9epO
	mP7LfS7h1W/ZYQUqKoAUBTqCMilY7BoXwB8tBwO1r+QCbnGWJoN5U+p0MBXgOwrgqP90
	fZkg==
Received: by 10.66.84.163 with SMTP id a3mr22300184paz.61.1345422484250;
	Sun, 19 Aug 2012 17:28:04 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id wd6sm9871286pbc.15.2012.08.19.17.28.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 17:28:02 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:21:38 +1000
Message-Id: <1345422099-26198-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
Subject: Add recipe for hplip 3.12.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 00:40:07 -0000

Hi,

This adds a recipe for hplip 3.12.6 with a configuration targeted for USB 
printers. I'm not much of a linux printing expert, so just went with a
setup that let me print all the different doc types required.

This is based on a recipe for an earlier version which didn't seem to make it
into oe-core. I'm guessing that oe-core is the correct place for it: next to
cups, ghostscript and foomatic.

Cheers,
Marc



