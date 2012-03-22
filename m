Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoBq-00061u-GL
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 21:00:54 +0100
Received: by iaag37 with SMTP id g37so3608111iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7JDe93dLSI80t4CMoVSflInqS25kSXY15h/5+YlsMEE=;
	b=Aw3Kx5ut/8TWENHZpsMKJ/3PTbft8oI1z/QWuy4ntC2IJShhCWfShRB2BvMHkHk3IM
	/H5tou7qfGHxDuQi834esoU/00klgnY2HnuNpmor+rmOAWaHzfcHTkAgcvLrlSDUraaF
	62LvR0v3N/Z9wlOxxS4+boXRx9hOWUPYe8QMHdaY9WfD6X3jZYhiFlFezdP1CTanXBOL
	Fxz6qkMd35OnOHxjiZPz1j3ehdH9T4s5UriDQeXjrJv27RuCOs3R1/LLKDnFjSx/M3Mi
	Sxdb9nVFDzrWNk26VyxV+i4xYfR4aXIcbVnUCysMMibyY4EL00L2HzmoiHZoaE/ykTvl
	79bQ==
MIME-Version: 1.0
Received: by 10.50.192.228 with SMTP id hj4mr37635igc.65.1332445918679; Thu,
	22 Mar 2012 12:51:58 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Thu, 22 Mar 2012 12:51:58 -0700 (PDT)
In-Reply-To: <E67D3882-EE14-4CEB-9FDC-E8E99EA0ADB0@dominion.thruhere.net>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
	<E67D3882-EE14-4CEB-9FDC-E8E99EA0ADB0@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 20:51:58 +0100
Message-ID: <CALbNGRTN4JV3OoEgqQrQJp0LY3KLcGJC12ZiZMqmNjF7KU5fng@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
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
X-List-Received-Date: Thu, 22 Mar 2012 20:00:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 8:34 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 22 mrt. 2012, om 20:15 heeft Andreas M=FCller het volgende geschreven:
>
>> * Before this patch every inheritance of this class rebuilt the full ico=
n cache at the first boot.
>> * With this patch the icon cache will only be build once at the first bo=
ot and on pkg installations that require it.
>> * This patch reduces the time needed for the first boot from 96 minutes =
to 5 minutes on the test machine.
>> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash") & fr=
om scratch
>> * Run-tested with systemd and opkg
>
> Wouldn't adding it to the opkg intercept code (and likely rpm as well) be=
 a better idea?
>
We wanted to be independent of package manager selected and decided to
follow the systemd-compat-units approach. Ehm opkg intercept code -
teach me :)

Andreas


