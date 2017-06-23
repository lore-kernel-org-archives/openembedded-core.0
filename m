Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A046E71AC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 10:04:06 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id d14so31575375qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zCiHVfekwrKuh/6RxPlVzXCM/uo7fKG9d19g/FTzo+s=;
	b=DAXJcQlq4FhiptpZYMoAy7bymxvD4vTlINbgPV32bRgS8Da0h7BNSldBmXzPtn/uqT
	9+c56fFkFxqh+v2Rrj1KelOfKsMXua+1eD5WYrNVd/WDhgPHMO1s31DNPqW/13zgDEeU
	sUFxSkfRefOoQDEHFKjwwfO8eg0+Aaw2pXos90nkytKYpZsJL00KZmkfHkwCzhQzuvtw
	5v6S48SgsyFdtt3EeViKmpJ3vaPBf4FX+Gc37vetRNDIEd6OkFj4pns/QGndK/nwTnO7
	TztoHEAonVj6caKiQnoZfcSI8P+d7D5FsaH08OODR793/BnpZrC6Qa/pg0TVgWIsR+Sm
	XfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zCiHVfekwrKuh/6RxPlVzXCM/uo7fKG9d19g/FTzo+s=;
	b=AxtmzZsoLss7uxht1ds1x6Hsb5z02IHUNOSNLnH5W74UE9PXMYxO/BRytt8KFt/GlA
	rGa3KTzg8QgrYa32Cc+gPNFA25HOP3iuvDNcOppJOuW6ciK0RCjZ/50EKqzatdXsTh3L
	rMh8j//e24O5QmpDjDy8PZTaAfA9+zi/PKBKdP5a10U1sA0beQnvmk2ABPwzJxySPkov
	1YNS8vpTRR6pnYEyoIZ4T3KIKH0pKyTjwj5N2FA7tk4gyPl9sXe95LlcaGen2/97vGpu
	vyN9Ly35BwM5vljxt1hN7FIJRtD23zUAgeKBu0FhYdRgoNRjOu3QJ0fM8QI0+oKm5ScW
	EUVA==
X-Gm-Message-State: AKS2vOx2L1NzykMKyP6xQyPSfnlOvoyi4UGEkHZP2OTgLNAvGEakmK2R
	96lWCbSkhhhqkhUzdNQpzxU2qGG/NY1o
X-Received: by 10.55.181.69 with SMTP id e66mr7649789qkf.109.1498212247720;
	Fri, 23 Jun 2017 03:04:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 23 Jun 2017 03:03:47 -0700 (PDT)
In-Reply-To: <51edd9ddac23497337640c4e63dee744338b095b.1497540930.git.pkj@axis.com>
References: <cover.1497540930.git.pkj@axis.com>
	<51edd9ddac23497337640c4e63dee744338b095b.1497540930.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jun 2017 11:03:47 +0100
Message-ID: <CAJTo0LYk9RM7RRSdvMNKuSsMHL2GOQpGQonzK8vGff_ZyiwQeA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 03/11] rpm: Add dependencies on bash, perl and python3-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2017 10:04:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d222d3194d05529db843"

--94eb2c05d222d3194d05529db843
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 16:37, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> +RDEPENDS_${PN} = "bash perl python3-core"
>

That's quite a collection.  Are they all needed for basic RPM to work?

(this results in core-image-sato pulling in bash when previously it didn't)

Ross

--94eb2c05d222d3194d05529db843
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 16:37, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"">+RDEPENDS_${PN} =3D &quot;<span class=3D"il">bash</span> perl pytho=
n3-core&quot;<br></div></blockquote></div><br>That&#39;s quite a collection=
.=C2=A0 Are they all needed for basic RPM to work?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">(this results in core-image-sa=
to pulling in bash when previously it didn&#39;t)</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05d222d3194d05529db843--
