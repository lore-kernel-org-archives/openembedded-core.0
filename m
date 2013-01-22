Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxaQF-0002km-5h
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 10:45:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M9U8pq026106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 01:30:08 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 01:30:08 -0800
Message-ID: <50FE5C29.7060102@windriver.com>
Date: Tue, 22 Jan 2013 17:30:17 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
X-Originating-IP: [128.224.163.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r0M9U8pq026106
Subject: Re: [PATCH 00/10] Initial systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 09:45:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01/20/2013 06:47 AM, Ross Burton wrote:
> Hi,
>
> This series has the goal of enabling core-image-minimal to boot using s=
ystemd.
> As such it touches no real services, just the infrastructural tweaks to=
 make the
> init manager a distribution choice, systemd itself, and a few low-level=
 changes.
>
> 95% of the credit obviously must go to the contributors of meta-systemd=
:
>
>      Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>      Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>      Holger Hans Peter Freyther <holger@moiji-mobile.com>
>      Khem Raj <raj.khem@gmail.com>
>      Koen Kooi <koen@dominion.thruhere.net>
>      Martin Jansa <Martin.Jansa@gmail.com>
>
> And thanks to Radu Moisan <radu.moisan@intel.com> for the work pulling =
together
> a series for merging into oe-core.
>
> Confirmed that this series using sysvinit results in a zero-delta in
> core-image-minimal.
>
> Cheers,
> Ross
>
>

Maybe we need to add something like below to=20
meta-yocto/conf/local.conf.sample ?

# set default init manager: sysvinit or systemd
DISTRO_FEATURES_INITMAN ?=3D "sysvinit"

This may help make it clearer how to choose an init manager in=20
conf/local.conf file.

Cheers,
Chen Qi


