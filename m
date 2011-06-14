Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWTEh-0005aW-8t
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 15:00:51 +0200
Received: by wye20 with SMTP id 20so4439164wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 05:57:25 -0700 (PDT)
Received: by 10.216.230.76 with SMTP id i54mr6184577weq.108.1308056245758;
	Tue, 14 Jun 2011 05:57:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm3476783weg.14.2011.06.14.05.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 05:57:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308054623.15712.329.camel@rex>
Date: Tue, 14 Jun 2011 14:57:23 +0200
Message-Id: <2ED7EE5A-704C-4209-AAB4-E2FB3017CD72@dominion.thruhere.net>
References: <cover.1308037752.git.sgw@linux.intel.com>
	<1308054623.15712.329.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [CONSOLIDATED PULL 00/51] 14-June-2011
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
X-List-Received-Date: Tue, 14 Jun 2011 13:00:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 14 jun 2011, om 14:30 heeft Richard Purdie het volgende geschreven:
> Koen Kooi (2):
>>  qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
> 
> This needs more discussion as it forces users to build two image types
> and I'm not sure that every user will appreciate this.

If they don't set IMAGE_FSTYPES they'll get 2 images already. 


