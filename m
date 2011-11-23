Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RTANs-0000o8-CS
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 11:48:56 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.83.0;
	Wed, 23 Nov 2011 11:42:20 +0100
Date: Wed, 23 Nov 2011 11:42:22 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111123104222.GB16705@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
	<CAP9ODKpCvkQEE8qgCLP=T2g7ZD2MG2jEfs=pNnr7DqyJ772EAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpCvkQEE8qgCLP=T2g7ZD2MG2jEfs=pNnr7DqyJ772EAg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Wed, 23 Nov 2011 10:48:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [111123 11:39]:
> On Tue, Nov 22, 2011 at 18:36, Saul Wold <sgw@linux.intel.com> wrote:

>     On 11/22/2011 06:34 AM, Anders Darander wrote:

>         This updates busybox to the latest stable, 1.19.3.

>         Among other things, there should be rudimentary support in syslogd for
>         systemd, by enabling CONFIG_FEATURE_SYSTEMD.

>     How much size does this add to busybox by having it enabled by default?
>     Is it possible to conditional add a config fragment if systemd is enabled
>     ad the DISTRO/IMAGE_FEATURE level?

> If it is small it would be nice to have it enabled.

If I didn't copy my figures wrongly, it's just a couple of hundred
bytes. Thus it shouldn't really hurt more than e.g. shipping SysV-init
files on a systemd-image...

OTOH, I'll leave it up to you guys to decide on the defconfig, as I'll
always use my own custom defconfig.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


