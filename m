Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 75EE46A5DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 10:55:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jun 2013 03:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,836,1363158000"; d="scan'208";a="252904240"
Received: from unknown (HELO helios.localnet) ([10.252.122.12])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jun 2013 03:55:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: John Stirling <ap.john.stirling@gmail.com>
Date: Mon, 10 Jun 2013 11:55:29 +0100
Message-ID: <2326207.iuBVrRrsbt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 10:55:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi John,

On Monday 10 June 2013 11:31:26 John Stirling wrote:
> I've successfully built qt4-embedded (oe-core, denzil, beaglebone) and have
> got a Qt/QML application running (on a beaglebone)
> 
> The image size is quite big however and I notice there a load of
> examples/demos etc that I don't need on the filesystem.
> 
> I presume I am probably just building the wrong thing ? Can someone advise
> the recommended way to get Qt built without all the demos etc  ?
> 
> This is what I added to our image -
> 
> IMAGE_INSTALL += " \
>   qt4-embedded \
>   "

It's not what you're building that's the problem, but the package you're 
selecting to go into the image. The "qt4-embedded" package will pull in all of 
the Qt/Embedded packages, which probably isn't what you want. Assuming your Qt 
application is compiled rather than pure QML, most of the time you can get 
away with only installing your Qt application - the Qt libraries that it uses 
will be installed automatically as dependencies. Then the only thing you will 
need to install as far as Qt is concerned are any plugins (database, image, 
etc.). You may also want qt4-embedded-qml-plugins and qt4-embedded-qmlviewer 
depending on how you start your application.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

