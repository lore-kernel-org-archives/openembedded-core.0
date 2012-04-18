Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SKPAJ-00069B-Eb
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 09:18:59 +0200
Received: by iaag37 with SMTP id g37so10276700iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m2r2HEqNaoAaMmNs+CEBwAwfT/sG/XJ/WieRpVVVRfg=;
	b=MdQdV35Ek8S5SfzNgU39vkW5NDTQQDez4ln15yKHZNlbbwbxUYPT7spJ9ngcTQzq5r
	ySOoukt2qA/St9Ik4PsB7F7acCA0DYRksUY8P8XYlHJ09B60GhcbJM9GZ6ImQTIqa6mJ
	0FVttXNJPU8ZtPmGN2YzDoMWBwxZaLpcmMAetbITS/QJIyLmjPaW/Cl8wSECNPn2gm/Z
	vPjWMcJ7WV5rTJvJNyWPYmam+u1ZC1vtSPCLdRYZf8TwnA/wKIPqQwyBdfJzTVhCdvSP
	Qz94+OadenylIpyyBHkv0w1Y28EA0hdXBKKKaf9gV88erk3aIY+m0FeS+GMR7BhFDvru
	wQTA==
MIME-Version: 1.0
Received: by 10.50.155.168 with SMTP id vx8mr810199igb.11.1334732971734; Wed,
	18 Apr 2012 00:09:31 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Wed, 18 Apr 2012 00:09:31 -0700 (PDT)
In-Reply-To: <E06E57AF-94D1-42DF-9435-ECE3DAC0DBC4@dominion.thruhere.net>
References: <4F8D8AB7.7000002@opendreambox.org>
	<20120417153919.GG3665@jama.jama.net>
	<E06E57AF-94D1-42DF-9435-ECE3DAC0DBC4@dominion.thruhere.net>
Date: Wed, 18 Apr 2012 09:09:31 +0200
Message-ID: <CALbNGRQc5Q+-zcORQ4HBsJVZ+ybaRpivjMuV2J2OcoKRq-9AdA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
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
X-List-Received-Date: Wed, 18 Apr 2012 07:18:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 17, 2012 at 5:45 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 17 apr. 2012, om 17:39 heeft Martin Jansa het volgende geschreven:
>
>> On Tue, Apr 17, 2012 at 05:22:31PM +0200, Andreas Oberritter wrote:
>>> Hi,
>>>
>>> the following warnings keep appearing on every fresh invocation of
>>> bitbake since a few months, I think:
>>>
>>> WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>>> WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>
> The above 2 only have systemd support, so the WARNING is completely bogus and should be silenced.
The warning is created in case the SYSTEMD_PACKAGES = "${PN}" instead
of SYSTEMD_PACKAGES = "${PN}-systemd". Intention was to force the
separation to keep systemd stuff out of images not supporting systemd.
Problem with this: Images need to be changed e.g need to add
gateone-systemd instead of gateone.

In the RFC for systemd.bbclass I suggested to make systemd a disto
feature together with an automatic RDEPENDS for *-systemd packages.
This was commented as no go [1]. The alternate suggestion making
systemd as image feature ended up in nothing.

Another suggestion was made to separate out systemd into an own layer
[2]. Guess this is not in due to release hysteria.

I faced similar situation with gtk-iconcache runonce [3]: In case a
solution is not perfect it simply ends up in nothing although the
current situation is not acceptable.

I lost interest making gurus happy so do what you want with it

Andreas
[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037788.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-April/038932.html
[3] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019760.html


