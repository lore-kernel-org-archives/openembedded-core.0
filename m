Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF02610FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 14:55:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PErfAu004699; Wed, 25 Sep 2013 15:55:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7myC2UHiyk8i; Wed, 25 Sep 2013 15:55:18 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PEtDMr004815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 25 Sep 2013 15:55:15 +0100
Message-ID: <1380120910.18603.333.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2013 15:55:10 +0100
In-Reply-To: <CAMKF1srAiBKPz15vALjs-X+pZojUq=y=zGeoAj1zj-s-oHQW6w@mail.gmail.com>
References: <1380088716-12512-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1srAiBKPz15vALjs-X+pZojUq=y=zGeoAj1zj-s-oHQW6w@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] makedevs: rectify the exit codes and handle the invalid parameter
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
X-List-Received-Date: Wed, 25 Sep 2013 14:55:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-25 at 07:27 -0700, Khem Raj wrote:
> On Tuesday, September 24, 2013, wrote:
>         From: Roy Li <rongqing.li@windriver.com>
>         
>         It is correct behaviours to output help and version
>         information,
>         and should return 0;
>         When input parameter is invalid, print help information and
>         exit.

>
> This can cause gripes for systems who have scripted the old behavior
> And since it's a user visible change I would suggest to get it
> accepted upstream before 
> It's applied in openembedded 
> 
I think we have our own copy of this particular C file so we are the
upstream...

Cheers,

Richard



