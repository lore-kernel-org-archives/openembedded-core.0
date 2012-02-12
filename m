Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1RwhXL-0002rD-1g
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Feb 2012 23:04:47 +0100
Received: by lahc1 with SMTP id c1so3685841lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2012 13:56:38 -0800 (PST)
Received: by 10.112.85.70 with SMTP id f6mr4782129lbz.16.1329083798424; Sun,
	12 Feb 2012 13:56:38 -0800 (PST)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.112.87.197 with HTTP; Sun, 12 Feb 2012 13:56:18 -0800 (PST)
X-Originating-IP: [2.92.3.1]
In-Reply-To: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Mon, 13 Feb 2012 00:56:18 +0300
X-Google-Sender-Auth: CgKLYqM00qVkvY4i-qat-WUj9Xw
Message-ID: <CAJG6M_Pc6rKvdG2iTr6ws-4Rw1XmpwG8Hqu3LTpXt2NxcDA5Gw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkFhHtC6p+YesK9wjuX1RiCO3wKR0XOIfSlnB4v2Be49xjgQTWyGPe+0gmnvlt5vTX4S9hs
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Sun, 12 Feb 2012 22:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/2/10 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> Just grepped for the occurances of disabled parallel make and I see
> around 40 cases on oe-core
>
> git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"
>
> If someone has time to kill then it would help to see if some of these
> are fixed by time or can be fixed
>
> it can help in paralleling the build a bit more.

I can run set of builds to check is P_M still needed for that recipes or not.
But I need suggestion - what MACHINE/DISTRO/IMAGE to build?

-- 
Yury Bushmelev


