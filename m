Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SA00R-0000ez-02
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 15:25:47 +0100
Received: by wera1 with SMTP id a1so76924wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 07:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PfBMTEX1yfcOTVWgJQV0dDwfyz0RGZLpDxmlIpYas40=;
	b=o+tNKMsfxNhGTZiVaYZZ3nKx+o4MPLXZ5Di2yAVH9ivO+JCx27YLlm0NCQa2pjzAvD
	luwGIZUkIKVx/rj8OHYBt3vXaTpv2C5Y3YdPeaeJqzFDtAIvuiRFNhrt0Gbr42hLUNTH
	k0ZyoFDyNzDXoFvROBPBYoOGRAK/CgulPwhJWMJdn2LrMmE0Qjursg9sxfJ+mhYHGQxe
	M8RraGDBu7j9DU65aWC8OemH38mOGEO/iOUbghJ1hXaQ4hzFkTcBXWOBpRbvxOMyNblI
	gdOFDj96QLDq14lTRBOfomrkHhZcn3NicM2kljiy8i/ypVMPmPNfZlb3J7zqq5teKOvK
	qXaQ==
Received: by 10.180.95.34 with SMTP id dh2mr163982wib.15.1332253014374;
	Tue, 20 Mar 2012 07:16:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d7sm7097658wiz.6.2012.03.20.07.16.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 07:16:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120320141200.GA13944@giant>
Date: Tue, 20 Mar 2012 15:16:47 +0100
Message-Id: <1FB40B91-CFCB-4E72-9159-00BD674EE3A9@dominion.thruhere.net>
References: <22576197.WV0krj9sgO@helios>
	<1331799945-14172-1-git-send-email-bjst@enea.com>
	<20671C9C-1AC1-482A-9B4A-C40EE9087BD7@dominion.thruhere.net>
	<20120319155803.GF9911@giant>
	<99D97950-0951-4127-BA84-D6D6A3C8D596@dominion.thruhere.net>
	<20120320141200.GA13944@giant>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnGV3IJSXeTOMYJtKfuTKry3eFO23JOVsH1vVir2hMc+omgm0olnt8QrKKtTZY2KqKNj4Ju
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Tue, 20 Mar 2012 14:25:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 15:12 heeft Bj=F6rn Stenberg het volgende =
geschreven:

> Koen Kooi wrote:
>>> My intention with the patch was to provide a native-only recipe for =
pigz,
>>> to improve distro build speed.
>>=20
>> But it went in as a regular recipe and hence needs to play well with =
others.
>=20
> I thought I made it native-only by only providing gzip-native?

try 'bitbake pigz' :)=


