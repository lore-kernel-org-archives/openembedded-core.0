Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBNwe-00016M-1p for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 11:11:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OA2daG004967
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 10:02:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03056-03 for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 10:02:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OA2UcQ004961
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 10:02:30 GMT
Message-ID: <1332583353.9740.500.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 24 Mar 2012 10:02:33 +0000
In-Reply-To: <313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
	<313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv 08/10] libusb*: import native support from meta-oe
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
X-List-Received-Date: Sat, 24 Mar 2012 10:11:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 23:30 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 +++++--
>  meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)

Looking at this, it makes no sense. Why does our build system need to be
trying to extract information from the *native* system's USB bus?

I can understand pango and cairo for font rendering in something like
icons but libusb-native?

Are you really sure we need this and have no other options as I can't
see it actually being used...

Looking at the other patches, I'm guessing they're broken without your
PACKAGECONFIG change to fix -natives. A goal of this release is to have
everything building and working that we ship. These 'simple'
BBCLASSEXTENDs are likely going to change that. 

I don't really want to spend my weekend trying to fix and then test the
PACKAGECONFIG change so I can merge these patches, particular as I've
spent most of the week including the evenings just getting things to
build. Arguably there could be other PACKAGECONFIG issue already I guess
so we probably should fix that before release anyway. With -rc1 on
Monday, that will be tricky :(.

Cheers,

Richard



