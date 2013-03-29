Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ULUn4-0000Bb-Sn
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 09:36:12 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so148667dak.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 01:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=lRg2oDk7qsc0GjL5ySAeStY62aE1JiOcwLa1vWMiXpw=;
	b=vaNSPCbfpTuFqAih7vEI9VRtU6osSK/NK2IYrp4X42zcatracFWhfcAR0qvR2s4EQC
	7N7g0FHlFe3jNESMIeX3m+55svisg6HWaF9D2DjcO+j+S+XLMOp4eGQ7D1BSz1mPlsGO
	ZYSDd8BK1tWTyMD1Ab/cF0dOR8b+xhO94pCUlwUKqqzkpSkwt0NQj3/a7/0xdDu6j/J0
	nCT+bLmYIJE+hdio+KwOErIvH8vxQggkMq8nknlTvqhnMI8ZKgRFsH8g3Ofy7QxPbSui
	wW7pm8foE4OMn+uO0Wj6vSTaaS1pP00kISx30AsOpnWj+ia19/zk6fIISQMwiaXZ9Z7d
	hByw==
X-Received: by 10.68.159.133 with SMTP id xc5mr2384127pbb.155.1364545137881;
	Fri, 29 Mar 2013 01:18:57 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id yp2sm2581985pab.10.2013.03.29.01.18.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 01:18:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
Date: Fri, 29 Mar 2013 01:18:56 -0700
Message-Id: <D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1503)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Fri, 29 Mar 2013 08:36:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 29, 2013, at 1:12 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>=20
> Op 29 mrt. 2013, om 06:28 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>=20
>>=20
>> On Mar 28, 2013, at 5:21 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>=20
>>> On Thu, Mar 28, 2013 at 12:48:29AM -0700, Khem Raj wrote:
>>>> udevadm is now moved from /usr/bin to /bin so account for that
>>>> bash completions for udevadm should be packages with udev-utils
>>>> since thats where udevadm itself is, they were in systemd package
>>>> which is not correct location for it
>>>>=20
>>>> Backport patches for readahead fixes on spinning disks
>>>> and to tackle error reported on missing /etc/sysctl.conf
>>>=20
>>> Looks like it creates few new (empty) directories:
>>>=20
>>> WARNING: QA Issue: systemd: Files/directories were installed but not
>>> shipped
>>> /etc/kernel
>>> /etc/kernel/install.d
>>> /usr/lib/kernel
>>> /usr/lib/kernel/install.d
>>=20
>>=20
>> OK I have created a new package called systems-kernel-install and =
these dirs along with
>> kernel-install binary are moved into the new package and updated the =
pull request.
>=20
> There's a new releases, 200, mostly bugfixes and some hwdp and  keymap =
updates. Your 199 patch has the most important fixes, so I'm not sure if =
it's worth to respin to 200 or get this in and update to 200 (or 201) =
later.


yeah lets stay at 199 for some time and cherry pick fixes we need.=20




