Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWpAK-0000LV-TS for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 15:30:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4MDKCIg001659
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 14:20:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00826-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 14:20:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4MDK2X1001645
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 14:20:03 +0100
Message-ID: <1337692801.8248.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:20:01 +0100
In-Reply-To: <CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
	<CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
	<CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
	<CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
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
X-List-Received-Date: Tue, 22 May 2012 13:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-22 at 13:02 +0300, Andrei Gherzan wrote:
> Even after using your workaround i can still reproduce this issue.
> Yocto linux still fails.
> 
> | ERROR. Could not find an excutable target for yocto/standard/base
> | ERROR. Could not locate meta series for yocto/standard/beagleboard
> | ERROR. Could not modify yocto/standard/base
> NOTE: package linux-yocto-3.0.24+git1
> +34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1
> +6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: task do_patch: Failed
> ERROR: Task 3
> (/media/HDD/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.0.bb,
> do_patch) failed with exit code '1'

Have you tried this against a clean DL_DIR so there is no risk of any of
the files contained within there being corrupted?

We need to get to the bottom of this but most people who were reporting
issues have reported this as resolved now...

Cheers,

Richard




