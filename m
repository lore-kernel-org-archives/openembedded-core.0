Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R7uqS-00088p-Pk
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 21:58:36 +0200
Received: by fxi1 with SMTP id 1so5271900fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 12:53:10 -0700 (PDT)
Received: by 10.223.101.2 with SMTP id a2mr5054366fao.2.1316980390577;
	Sun, 25 Sep 2011 12:53:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w6sm17824506fah.0.2011.09.25.12.53.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 12:53:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316979467-687-3-git-send-email-heinold@inf.fu-berlin.de>
Date: Sun, 25 Sep 2011 21:53:08 +0200
Message-Id: <23ABBF2D-E135-408C-BCA1-05E48436743F@dominion.thruhere.net>
References: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
	<1316979467-687-3-git-send-email-heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/3] feature-arm-d16.inc: add feature for arm cores which do not have a neon unit or no support for it in the kernel
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
X-List-Received-Date: Sun, 25 Sep 2011 19:58:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 sep. 2011, om 21:37 heeft Henning Heinold het volgende geschreven:

> * call it d16 because of the -mfpu=3Dvfpv3-d16 gcc option and
>  avoid naming conflicts with vfp feature

That's a highly artificial seperation to be honest. Is there really any =
demonstrable real world use to it?




