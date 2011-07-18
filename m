Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qihtt-0003hM-J8
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 09:05:57 +0200
Received: by wyg30 with SMTP id 30so2078242wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 00:01:54 -0700 (PDT)
Received: by 10.227.209.205 with SMTP id gh13mr5227842wbb.47.1310972513952;
	Mon, 18 Jul 2011 00:01:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo18sm3190054wbb.29.2011.07.18.00.01.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 00:01:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310944845-15037-1-git-send-email-andrea.adami@gmail.com>
Date: Mon, 18 Jul 2011 09:01:52 +0200
Message-Id: <6B695549-56A6-4AF3-8184-47226E247417@dominion.thruhere.net>
References: <1310944845-15037-1-git-send-email-andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] device_table-minimal: add more devices, sync with org.openembedded.dev
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
X-List-Received-Date: Mon, 18 Jul 2011 07:05:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 jul 2011, om 01:20 heeft Andrea Adami het volgende geschreven:

> * add a layered structure (IMAGE_DEVICE_TABLES foresees that)
> *
> * In some cases static devices can be of use (e.g. initramfs) but
> * unfortunately the file in oe-core lacks input events and more.
> * People do not notice the issues because IMAGE_DEV_MANAGER
> * recreates the device nodes in userland.
> * Though, in the case of e.g. special purposed initramfs images you may
> * not have any udev/mdev, nor initscripts.

Is that still the case with devtmpfs enabled in the kernel?


