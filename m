Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q7Mvz-0005mw-AI
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 09:13:47 +0200
Received: by wye20 with SMTP id 20so1093916wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:11:41 -0700 (PDT)
Received: by 10.227.110.147 with SMTP id n19mr646459wbp.51.1302073900923;
	Wed, 06 Apr 2011 00:11:40 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id o6sm155292wbo.3.2011.04.06.00.11.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:11:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <23fdb7fffa0e21931f4d6ddd2b02a0a44a450a61.1302039585.git.sgw@linux.intel.com>
Date: Wed, 6 Apr 2011 09:11:38 +0200
Message-Id: <46C1DB33-0AC8-486D-9E88-7D33EE44CF93@dominion.thruhere.net>
References: <cover.1302039585.git.sgw@linux.intel.com>
	<23fdb7fffa0e21931f4d6ddd2b02a0a44a450a61.1302039585.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>
Subject: Re: [PATCH 2/6] gst-meta-base: Support http/https remote streams
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
X-List-Received-Date: Wed, 06 Apr 2011 07:13:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 apr 2011, om 23:48 heeft Saul Wold het volgende geschreven:

> From: Dongxiao Xu <dongxiao.xu@intel.com>
>=20
> Add libgstsouphttpsrc library to support remote stream playing via
> http/https protocols.
>=20
> This solves the mp4 playing issue by regel from mediatomb file server.
>=20
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>=20
> -    gst-plugins-good-autodetect"
> +    gst-plugins-good-autodetect \
> +    gst-plugins-good-souphttpsrc"

FWIW, souphttpsrc is quite heavy in dependencies, so in the future we =
should look for something lighter (GIO?).

regards,

Koen=


