Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvXQ8-0001a6-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 17:00:02 +0100
Received: by wyb38 with SMTP id 38so2166118wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 07:58:30 -0800 (PST)
Received: by 10.227.200.76 with SMTP id ev12mr679311wbb.141.1299254310727;
	Fri, 04 Mar 2011 07:58:30 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bd8sm1889262wbb.19.2011.03.04.07.58.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 07:58:30 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 4 Mar 2011 16:58:29 +0100
Message-Id: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1082)
X-Mailer: Apple Mail (2.1082)
Subject: Gst-plugin dependencies
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
X-List-Received-Date: Fri, 04 Mar 2011 16:00:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

The current gst-plguin-<foo> in oe-core is a bit anemic and the ones in =
OE are really full featured. How do we want to handle this going =
forward? I'm a big fan of shifting the pain to buildtime so people can =
install any plugin they want at runtime instead of needing to rebuild =
it.
At TI we have cut-down versions of the recipes to save buildtime[1], but =
it's a pain to maintain those and keep them up to date. It would be nice =
to come with a way to say you want full featured gstreamer or not. With =
my angstrom hat on, I would like the full feature set :)

regards,

Koen

[1]  As well as dealing with the inabiltiy to build opencv with a =
specific CSL toolchain=


