Return-Path: <prvs=0309414a8e=mike.looijmans@topicproducts.com>
X-Greylist: delayed 3934 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 May 2017 08:41:19 UTC
Received: from mx36-44.antispamcloud.com (mx36-44.antispamcloud.com
	[209.126.121.60])
	by mail.openembedded.org (Postfix) with ESMTP id 93D1E71985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 08:41:19 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx36.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1dAX18-0000Ul-Cx; Tue, 16 May 2017 09:35:45 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 May 2017 09:35:36 +0200
To: Patrick Ohly <patrick.ohly@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
Date: Tue, 16 May 2017 09:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNF+Z
	TOpbOuhOEXyg5zj4fihcYm2vUuIG4N+iQ6LRk6MPU9XNHd9Ijwzlu8VvydcSeWbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/tuoZJ8on6v5Cr+cgrX/HyaQvLy4+jvA
	Q1TOZuvSzHUZR73upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeUTMKkbMlXz2JUArHA+14szgKKlg5rRfJw9pxA0+9OX6RKm353ztx8x
	waw1cKnsBGyxcEIKVJg0J7erdcW8mf2rcxw3qqhc+N6cuEg4XWh5Fgb/MuIXu+2kk2WrDexOHyU7
	WKxT4LlSKLDfp/19yPrhzuhWV9IJ54Wz8x0xb7HoMKmxVEE6gtF+B/lEIPzms76tk/3XLTmRwzit
	RAMwkvBlOAbafFWolSz8SP6cor7doMIclqURQOfTUwDe+Ri01fJq3wtLZ7hKXB7AUDoiysS7n/yG
	pIaetDFw3rNtF1x6IIdFlvrZm9oncq/9pVplh4ivIHo77OZsQVM4N41Tn9775j98TA7MKskOpkOl
	8Lxi7FIIPDyod71wDzAkT5SU3Vo=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 08:41:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFThis seems to assume that every project is similar and that develo=
p vs=20
production is something well defined. Well, it's not.

I for one would welcome the demise of debug-tweaks. It's an option that=20
enforces one of two policies that may both be wrong.

For example, if the target is a settop box where users tend to port-forward=
=20
the SSH port to the internet, and which is open so that they're expected to=
=20
log in and make changes, the policy we want is that there is initially no r=
oot=20
password, and that SSH access requires a valid password. This makes the sys=
tem=20
secure against outside attacks. Setting debug-tweaks will allow blank SSH=20
passwords, while not setting it would invalidate the root login. Neither is=
=20
acceptable for this project, so one has to resort to overriding the image=20
class methods zap_root_password and ssh_allow_empty_password to do nothing.

Instead of some obscure switch with implications hidden somewhere in variou=
s=20
recipes, classes, distros and local configs, can't we just define options t=
hat=20
actually do what they say, like for example a boolean option=20
"ssh_allow_empty_password"?

While the "development/production" switch may be great for some projects,=20
it'll make things only more complicated for others while gaining nothing ab=
ove=20
what we have now.



On 15-05-17 15:26, Patrick Ohly wrote:
> At OEDAM [1] I took the AR to flesh out some of my ideas for
> introducing global and per-image settings for switching between
> development and production builds. The goal is partly to establish
> common configure options that then can be used by different layers,
> partly to have some actual useful functionality attached to them
> already in OE-core.
>
> "development" builds are what a developer does when trying out a
> distro or working on his own personal device. "production" is what
> device manufacturer put onto the actual end-user hardware.
>
> At OEDAM we already concluded that per-image settings are more
> useful. However, sometimes a component also has compile-time choices
> that cannot be changed later on in an image, and indeed I found one
> example for that (kmod) in OE-core.
>
> Therefore I have included "debug-build" DISTRO_FEATURES support. It's a
> bit similar to manpages.bbclass, but in contrast to that (currently)
> is meant to be inherited globally - that's partly due to
> misunderstanding how manpages.bbclass was meant to be used. This can
> be changed, for now I just want to demonstrate that such a distro
> feature is not entirely useless, and what effect it could have already
> in OE-core.
>
> In refkit, we also switch globally between development and production
> builds via .inc files. However, I am in the process of replacing that
> with the more flexible per-image IMAGE_MODE check. So from my
> perspective, the IMAGE_MODE is more important and useful than the
> "debug-build" DISTRO_FEATURE.
>
> From a design perspective, the approach taken here is to let a
> developer or image define what mode it wants, and default features can
> be configured accordingly. That alternative would be to continue defining
> features as before and use the mode to configure QA warnings or errors.
>
> But I find that less flexible, and I suspect it would be harder to
> keep track of what is meant to be usable in which mode. Developers
> also would have a harder time overriding the defaults.
>
> [1] https://www.openembedded.org/wiki/OEDAM_2017
>
> Patrick Ohly (6):
>   build-mode.bbclass: distro-wide debug-build mode
>   basefiles: warn about non-production DISTRO_FEATURES in motd
>   defaultsetup.conf: enable special "debug-build" DISTRO_FEATURES support
>   image-mode.bbclass: per-image production/development/debug mode
>   image.bbclass: include IMAGE_MODE support
>   local.conf.sample: make debug-tweaks depend on IMAGE_MODE
>
>  meta/classes/build-mode.bbclass                   | 16 ++++-
>  meta/classes/image-mode.bbclass                   | 62 ++++++++++++++++-
>  meta/classes/image.bbclass                        |  3 +-
>  meta/conf/distro/defaultsetup.conf                |  2 +-
>  meta/conf/local.conf.sample                       |  5 +-
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 11 +++-
>  6 files changed, 96 insertions(+), 3 deletions(-)
>  create mode 100644 meta/classes/build-mode.bbclass
>  create mode 100644 meta/classes/image-mode.bbclass
>
> base-commit: 9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail



Join our presentation at Electronics & Applications 2017:
FPGA for real-time data processing, subject =E2=80=9CHardware platform for =
industrial ultrasound steel plate Inspection=E2=80=9D Topic Embedded System=
s - Herman Kuster, 1st June 10 AM

Visit http://eabeurs.nl/author/612884/ for more information


