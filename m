Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SWRkn-0000a6-Vt
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 14:30:26 +0200
Received: by wibhm14 with SMTP id hm14so2032379wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 05:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=jcDujax36HZoBpAeZmrqE7Q0Jf/v7rwT995DZXJ/D74=;
	b=jNO2b+Dv4gMuvNmPxKdd5gndd2iKuPVByCteVNqqfRWSvXvVoYnxmGb9xJE2G5Fk2e
	E2zlkETCw+4ly5ziWbyQnPRlPAj6u4HRrLi7Yu+vjcuDicWoJL+cazWka5ijK2K9GSsR
	vzhcG4I1LDdbH3JFbPGGyOvn631Niv1pw3PVnIBidInck3CI0A1Ux2ipfKoxD/WBQFL7
	JZxq+iR9yL9/uv9cKD+vjP/H0jVfhBHYz+4MOaToYNxUz6d0VmUmhJAe+LXLC17Ya3NS
	YIg91GWzqXtjnroQ9AnNgPZutSzZcRJH6+HAmo4LRlgud5OwdoH/20Pkrjj1uQj+hJSb
	i7OQ==
Received: by 10.180.100.233 with SMTP id fb9mr13770560wib.12.1337602818734;
	Mon, 21 May 2012 05:20:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j4sm25385950wiz.1.2012.05.21.05.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 05:20:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <lytxz9d962.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 21 May 2012 14:20:14 +0200
Message-Id: <70ECF485-D265-4969-840C-9F976DF03E70@dominion.thruhere.net>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
	<lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA1416.3050102@opendreambox.org>
	<lyd35xeqw9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA2BAD.5070709@opendreambox.org>
	<401C0B52-7177-4259-AABB-63F942E77EBF@dominion.thruhere.net>
	<lytxz9d962.fsf@ensc-virt.intern.sigma-chemnitz.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkAMoLX20/9XxKWeVEK56/6G9wqQCtE84oMrAnfyl7VshU/gzLnqdI9mKyYaUi8mc0SHT/I
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 12:30:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mei 2012, om 14:13 heeft Enrico Scholz het volgende geschreven:

> Koen Kooi <koen@dominion.thruhere.net> writes:
>=20
>>> Considering that in the meantime my similar patch [1] to =
systemd.bbclass
>>> got merged into meta-oe by Koen, who initially was against it, I =
guess
>>> this patch can finally get merged now, too.
>>=20
>> Crap, I missed the $D part, that's going to get reverted
>=20
> I think we can keep it when we enhance the systemctl script
> (systemd-systemctl-native) to ignore 'stop/start'. =20

That won't work where you don't the have OE tree at hand. Worst case: it =
will call the native systemctl and break the host distro.=


