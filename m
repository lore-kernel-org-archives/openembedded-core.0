Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id C7DE8601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:18:23 +0000 (UTC)
Received: from [192.168.2.34] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1Yv3sV-0004fF-D4; Wed, 20 May 2015 15:17:43 +0200
Message-ID: <555C896A.8020107@kernelconcepts.de>
Date: Wed, 20 May 2015 15:17:30 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
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
X-List-Received-Date: Wed, 20 May 2015 13:18:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ross,

On 20.05.2015 15:08, Burton, Ross wrote:
> No need to bump PR.
> 
> Personally I think that the fix here is to stop PN-dev depending on PN, instead
> of creating an empty PN package to confuse people.

well, in this way it automatically fixes this issues with the -dev package which
is not installable for every build where gtk-engines has been built already, so
in my opinion this is a good reason to increment PR.
Randomly laying around packages with broken dependencies have quite more
potential to confuse people than incremented PR most users do not care about much.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

