Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbwEz-0007gC-FI
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:59:46 +0200
Received: by wwi14 with SMTP id 14so3887063wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 07:56:03 -0700 (PDT)
Received: by 10.227.32.129 with SMTP id c1mr811266wbd.32.1309359363098;
	Wed, 29 Jun 2011 07:56:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm969512wbh.8.2011.06.29.07.56.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 07:56:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309359293.2551.49.camel@phil-desktop>
Date: Wed, 29 Jun 2011 16:55:56 +0200
Message-Id: <A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
References: <1309358918.2551.48.camel@phil-desktop>
	<1309359293.2551.49.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: bitbake -b busted again?
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
X-List-Received-Date: Wed, 29 Jun 2011 14:59:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 29 jun 2011, om 16:54 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-06-29 at 15:48 +0100, Phil Blundell wrote:
>> Using bitbake master from today, I'm now getting this error whenever I
>> try to do "bitbake -b anything.bb":
> 
> Actually, it looks like I was just unlucky/unskilled in my choice of
> recipes when I tested.  It does in fact work for at least some files;
> there must be something about the ones I was trying to begin with that
> is upsetting it.  I'll investigate further.

Try bitbake -b /full/path/to/recipe, that seems to make things work for me.


