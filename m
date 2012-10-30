Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TTEXc-0006xF-PT
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 17:19:48 +0100
Received: by mail-we0-f175.google.com with SMTP id t44so192362wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 09:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=y4F+vQBdAqVMHx45cxue26x8HX+nyE7+IoPyQIIlatk=;
	b=FHTzyO0IH6O3c4gOPQyfc2LeK7SHQSajS18KPDBCio5oAOAd+ioH2dy+Pe7OJ1w3pN
	1/runFS5ThQcLImExG+8I3+cvwVUaqvh3G3xlpCit50kNgY5exjxpKvmAeIHnUOtNGDm
	1zjNrb5a0FdAP+611qwzJEFinDc23Dg4IyEgKHRZujQYNy9oNGrpnttTgr+PNq42qeeY
	XWjARYq8Fqn3B0woKoiDc7eBJ49uvjsSqLM/2/m8udTj9ye49Wr5tT1Wk6Iq2/WE2jbb
	8ppYHqi//xu3NO3Fahk61BF3IlRrVDw4ZHrzfgRGERRbUtyknHI15dSh+BZkYb26boqX
	O60g==
Received: by 10.216.204.19 with SMTP id g19mr16385062weo.189.1351613173112;
	Tue, 30 Oct 2012 09:06:13 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id o3sm1807419wiz.9.2012.10.30.09.06.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 09:06:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZ1=uTF26dn2MdE6ZwRgOYcVS9i-uqGWYab4uEXnAGTtA@mail.gmail.com>
Date: Tue, 30 Oct 2012 17:06:12 +0100
Message-Id: <0C90FBC6-CB11-48BC-AC3F-C6562AD4977A@dominion.thruhere.net>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
	<CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
	<CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
	<CAJTo0LZcHi16POq8_bQpURnjLxvj7fy=9m_LX27+Nz_RADQT2w@mail.gmail.com>
	<CAK18fxFcMPNVPXy6QcFAKAUmgyF83fBAX_BdUS8nLG=f=KQgyw@mail.gmail.com>
	<CAJTo0LZ1=uTF26dn2MdE6ZwRgOYcVS9i-uqGWYab4uEXnAGTtA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQlTt4RmHAKCg1jrl4cdk7Qol/6ysCtI6JCWlJNeIvznhdg68edmuh1AJHhj5IkO2hNAjHPP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Tue, 30 Oct 2012 16:19:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 okt. 2012, om 12:00 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 30 October 2012 10:31, Andrei Gherzan <andrei@gherzan.ro> wrote:
>>> Oh joy, one of those instances where GPLv3 isn't actually a problem.
>>>=20
>>> gnome-common is some scripts and tools used at configure time, so
>>> there isn't any linkage, so there isn't any GPLv3 in the images, so
>>> there isn't a problem.
>>>=20
>>> The question is how do we express this?
>>=20
>> Should it be whitelisted?
>=20
> So I did some digging.  The file in git that is explicitly v3 only
> appeared in 3.6, so I considered reverting to 3.5.5 before it
> appeared.  Then I noticed that we're still shipping gnome-common 2.28
> from 2009, which doesn't have any v3 code in (to be honest it barely
> has any license at all, but it's definitely not v3.  I've pinged
> upstream.
>=20
> The v3 license in the metadata came from:
>=20
> commit 8a2b4e2a5e85f4937e72f03e579b1aaa264074a1
> Author: Zhai Edwin <edwin.zhai@intel.com>
> Date:   Thu Jul 1 15:35:11 2010 +0800
>=20
>    gnome-common: Fix the metadata
>=20
>    Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
>=20
> diff --git a/meta/packages/gnome/gnome-common_2.20.0.bb
> b/meta/packages/gnome/gnome-common_2.20.0.bb
> index 075ac14..c2eae72 100644
> --- a/meta/packages/gnome/gnome-common_2.20.0.bb
> +++ b/meta/packages/gnome/gnome-common_2.20.0.bb
> @@ -1,7 +1,11 @@
> -LICENSE =3D "GPL"
> +DESCRIPTION =3D "Common macros for building GNOME applications"
> +HOMEPAGE =3D "http://www.gnome.org/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "GPLv3"
>=20
> Looks like a misguided attempt at fixing a warning from not specifying
> what version of GPL was in use.  Traditionally the bulk of GNOME is
> LGPLv2.1
>=20
> But following the dependencies, gnomebase adds DEPENDS=3Dgnome-common.
> Shouldn't that be gnome-common-native? =20

No, it checks for the files in the target sysroot. I can't say it that's =
a bug or not, though.

regards,

Koen=


