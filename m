Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVS8y-00026B-8S for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 19:11:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATI4IWq018793;
	Tue, 29 Nov 2011 18:04:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18084-09; Tue, 29 Nov 2011 18:04:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATI4Bcw018787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 18:04:12 GMT
Message-ID: <1322589860.7964.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 18:04:20 +0000
In-Reply-To: <CAEsOVNcZYhLayMYXcwm8fYFpqJ=dVTfbyDjvM+Ox_qqVOmEn_w@mail.gmail.com>
References: <cover.1322554339.git.wenzong.fan@windriver.com>
	<ba86babf9425bb34f62c879e2c44febf7308a543.1322554339.git.wenzong.fan@windriver.com>
	<CAEsOVNcZYhLayMYXcwm8fYFpqJ=dVTfbyDjvM+Ox_qqVOmEn_w@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/5] m4: Add m4-nativesdk recipes
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
X-List-Received-Date: Tue, 29 Nov 2011 18:11:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 17:48 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Nov 29, 2011 at 2:38 AM,  <wenzong.fan@windriver.com> wrote:
> > From: Wenzong Fan <wenzong.fan@windriver.com>
> >
> > [YOCTO #1603]
> >
> > m4-nativesdk is required by autoconf-nativesdk.
> 
> Is there a reason we don't just extend the m4 recipe for native and
> nativesdk? (I'm just curious)

Its a good question, BBCLASSEXTEND = "nativesdk" should really work and
those recipes look wrong (they shouldn't need to set
INHIBIT_AUTOTOOLS_DEPS = "1" or have the custom do_configure).

The m4-native recipe is a little tricker as its one of the early
bootstrap dependencies required by autotools. This is why it does need
the INHIBIT_AUTOTOOLS_DEPS and custom do_configure line although those
should be possible with modern BBCLASSEXTEND...

Cheers,

Richard



