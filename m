Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UMkbd-0000g9-8h
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 21:41:25 +0200
Received: by mail-pb0-f48.google.com with SMTP id xb4so678849pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2013 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=nuvgtqiGEu8OsePLj635kmjw6tAXNQ0QjoPbf3XQTrY=;
	b=UmWFAqzKl8JYXUkTOTqN3CgRdKWJHOphCiOt/oc17sK84OLs1Hn5KNd0dVYjfTPl13
	eKjbEJM+MZkZ1uvqhST6fXBuZYWsffdzwVR2CsOfpEKXiZBMtA7qhAUTRRYBolz7GCXb
	CZ5YMPSMXXfTltrRhnY/ncYHezYiWyrCo2G8ttvTKAAExGfZTH9tOqXwIpcj+nmp0U9U
	h8O89KiMbsntdwyQNoe5huzsrprK9LuVyESM43VWZ2IWCqFFPIIVdCh9Qq7wYpurTBnS
	V093vOQwfIb8MCOPYlIIWF4Z0zy+dVN+eqwaQti8AFeeuAIqWlWzquhRIEtpv+nshTvP
	Nj5Q==
X-Received: by 10.68.247.163 with SMTP id yf3mr19700213pbc.113.1364844255790; 
	Mon, 01 Apr 2013 12:24:15 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id kt5sm14816986pbc.30.2013.04.01.12.24.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 12:24:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1364835699.git.bruce.ashfield@windriver.com>
Date: Mon, 1 Apr 2013 12:24:15 -0700
Message-Id: <146E9829-6FA3-4124-8BF2-5B31B8CA146C@gmail.com>
References: <cover.1364835699.git.bruce.ashfield@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-yocto: mips, -rt update and yocto-custom fix
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
X-List-Received-Date: Mon, 01 Apr 2013 19:41:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 1, 2013, at 10:09 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> [PATCH 1/3] linux-yocto/3.8: update mips SA_RESTORER fix
>=20
>    During the 3.8.4 integration there was a build issue on MIPS due to
>    SA_RESTORER changes. A solution was put in place for mips, but it
>    didn't cover other impacted architectures.
>=20
>    This is a backport of the proposed fix for the next 3.8-stable,
>    since the full -stable might not be available in the right =
timeframe.


Does this fix systemd/ crash and/or mips64 boot on qemu I wonder=


