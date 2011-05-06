Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QIM7N-0006iJ-9O
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 16:34:57 +0200
Received: by wye20 with SMTP id 20so2756522wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 07:32:13 -0700 (PDT)
Received: by 10.227.196.65 with SMTP id ef1mr3983111wbb.23.1304692333235;
	Fri, 06 May 2011 07:32:13 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	o23sm2039006wbc.10.2011.05.06.07.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 07:32:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110506135458.GA17773@jama.jama.net>
Date: Fri, 6 May 2011 16:32:08 +0200
Message-Id: <CD6D7C47-8778-4086-AE29-BB954F9DE09D@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<BANLkTimvbbU4yx_aWhaKp0DvYgV1mH-9pg@mail.gmail.com>
	<20110506135458.GA17773@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 14:34:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mei 2011, om 15:54 heeft Martin Jansa het volgende geschreven:

> On Fri, May 06, 2011 at 06:51:58AM -0700, Chris Larson wrote:
>> On Fri, May 6, 2011 at 6:39 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> And related to this: how do I get the "installed but not packaged" =
output back? The bitbake logging changes are hiding it now, which is =
counterproductive.
>>=20
>> Could change those messages from info to warnings, then they'd show =
up.
>=20
> Agreed, please change it. I'm using -v since those were not shown, but =
-v=20
> brings much more noise then I need.

Like this?

--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -676,7 +676,7 @@ python populate_packages () {
                                unshipped.append(path)
=20
        if unshipped !=3D []:
-               bb.note("the following files were installed but not =
shipped in any package:")
+               bb.warn("the following files were installed but not =
shipped in any package:")
                for f in unshipped:
                        bb.note("  " + f)



