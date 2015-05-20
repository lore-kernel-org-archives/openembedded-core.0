Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0F95601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KC81jn005147; Wed, 20 May 2015 13:08:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d1cMw1a0Arb6; Wed, 20 May 2015 13:08:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KC7nBv005130
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 May 2015 13:08:00 +0100
Message-ID: <1432123669.28910.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Wed, 20 May 2015 13:07:49 +0100
In-Reply-To: <1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Wed, 20 May 2015 12:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-18 at 15:40 +0300, Tanu Kaskinen wrote:
> When PulseAudio is installed, alsa-plugins is needed to provide
> compatibility for ALSA applications.
> 
> The dependencies are set up so that pulseaudio-server depends on
> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
> on the PulseAudio plugins. This should make the ALSA->PulseAudio
> compatibility configuration work out of the box, while leaving the
> PulseAudio specific configuration out on systems that don't have
> pulseaudio-server installed.
> 
> Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> ---
>  .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 81 ++++++++++++++++++++++
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  5 ++
>  2 files changed, 86 insertions(+)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb

Running this through the autobuilder revealed:
https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/303/steps/BuildImages/logs/stdio
which I'm guessing comes from this patch but I haven't bisected.

Cheers,

Richard


