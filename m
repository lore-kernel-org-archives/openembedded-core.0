Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q1cXE-0007pM-Uu
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 11:40:31 +0100
Received: by vws2 with SMTP id 2so5135268vws.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 03:37:19 -0700 (PDT)
Received: by 10.220.61.201 with SMTP id u9mr1126402vch.131.1300703477243; Mon,
	21 Mar 2011 03:31:17 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.220.41.13 with HTTP; Mon, 21 Mar 2011 03:30:57 -0700 (PDT)
X-Originating-IP: [78.106.51.95]
In-Reply-To: <4D86C98C.9060008@intel.com>
References: <71E89804-8B25-4810-95EE-C9B1880C0103@dominion.thruhere.net>
	<4D86C98C.9060008@intel.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Mon, 21 Mar 2011 13:30:57 +0300
X-Google-Sender-Auth: CSnhQadpurLpBzz0n7HXSeWd1GU
Message-ID: <AANLkTi=9CfssdfsA_JNGqP-PDeL7e96N06Hrn9Zg-FTG@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qemu-native requires alsa-libs-native
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
X-List-Received-Date: Mon, 21 Mar 2011 10:40:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/21 Zhai, Edwin <edwin.zhai@intel.com>:
> Koen,
> We enabled alsa in configure for the feature of receiving sound from guest.
> It is assumed that audio system on host is already enabled.

I see following purposes of qemu-native:
(1) automated runtime images testing
(2) manual images testing/using

(1) should be used against small subset of compatible targets. For
oe-core this is set of qemu machines only. For automated testing
purposes qemu wav driver may be more suitable than alsa imho. As well
as vnc instead of sdl. This happens on build (testing?) host, which
may be node in large build farm. I would prefer to have minimal
dependencies on such nodes.

(2) is different. Here we need alsa and sdl. But this should happens
not on build host in ideal case. In common case user already have X11,
sdl, alsa, etc on his home workstation. So here we may use anything.

So, my idea to separate (1) and (2). we may use different recipes.
qemu-testing and qemu e.g. Then qemu-testing may have minimal set of
features suitable only for runtime testing but qemu may have full set
of features suitable for common usage.

-- 
Yury Bushmelev


