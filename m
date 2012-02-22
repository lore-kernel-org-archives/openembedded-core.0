Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0Bsx-0008NP-5I
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:05:31 +0100
Received: by wgbdr13 with SMTP id dr13so5916223wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 04:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.136.211 as permitted sender)
	client-ip=10.216.136.211; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.136.211 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.136.211])
	by 10.216.136.211 with SMTP id w61mr8931853wei.18.1329915431290
	(num_hops = 1); Wed, 22 Feb 2012 04:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Jl3oeKXjC3ZFJRe6Kl/ARL9KVCIRx4C1HHB+ms35es0=;
	b=Q7SNhhCfd8MsI6wdszxMp2wDHRD5zGGzaQrFKkPvEoRjJqfp/UbziUZw5mcBrvVvE8
	Uw81g3j6qHZnuG1mN8J5XJIZBt41rR5LAl4fQYUjxVU5zfwte8COAtk7s257xmIZPzLr
	C67YCBc8/FIxlUhjH2LF0LjNUhlDa/p8zrSSY=
Received: by 10.216.136.211 with SMTP id w61mr7359493wei.18.1329915431210;
	Wed, 22 Feb 2012 04:57:11 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hs6sm36631245wib.2.2012.02.22.04.57.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 04:57:10 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329910007-8441-3-git-send-email-obi@opendreambox.org>
Date: Wed, 22 Feb 2012 13:57:13 +0100
Message-Id: <23368B4F-A69C-455A-B167-F7A3DAF0E0C4@dominion.thruhere.net>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329910007-8441-3-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnfpdxf1o/Eu05Cd3eiJDD6GYTqanwQ0rLLkYaBbagwzaKoeqRbl2kFZqSWU1HyAMduALuW
Subject: Re: [PATCH 2/5] libproxy: don't depend on gconf unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 13:05:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 12:26 heeft Andreas Oberritter het volgende =
geschreven:

> * Drop dependency on GNOME if x11 is disabled.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> meta/recipes-support/libproxy/libproxy_0.4.7.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb =
b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> index f31b701..659100d 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> @@ -6,9 +6,9 @@ LICENSE =3D "LGPLv2.1+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7d7044444a7b1b116e8783edcdb44ff4 \
>                     =
file://utils/proxy.c;beginline=3D1;endline=3D18;md5=3D55152a1006d7dafbef32=
baf9c30a99c0"
>=20
> -DEPENDS =3D "gconf"
> +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'x11', 'gconf', '', =
d)}"

that one likely needs a --disable-something to be deterministic.

regards,

Koen=


