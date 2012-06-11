Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8u6-0000Yd-K3
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:59:50 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:46:47 -0700
Received: by lahj13 with SMTP id j13so2485636lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=VMGZPgUweFWx4Flp7/0Dir+VzTzU7TgfTcnQEb08dDs=;
	b=KRqfSdsiAGTpImjco1TgBN+1iTes27weFvsjbCpZts5xPaMdQz5TvPSD0d22ksEca2
	RXydm4UuHluKh/9P36Husw/hu3Q0Y4Dort01fLrzZIvF+ZFWsKNcaW8/cxchCHQbI92y
	Efs10Z0c55XE1Z37PTtCH3eCHoD1hW5qN0yAp63p1tncPrRFO95ndodQirphrpLX09Zk
	QnbdidWZrSNQzfLAwOaoNYeb8Y7W7+IxA8wF4ycHBXT5BnsnQ5xK9yBnhvh06V59t2OR
	pfj2Vo5THkf0z3ZU3zYhpNMAyF9dnJntZODjLUnzbcX60YsFGhmxgneV1fprbs1PCm9f
	LT9Q==
MIME-Version: 1.0
Received: by 10.152.109.166 with SMTP id ht6mr18149649lab.46.1339436805772;
	Mon, 11 Jun 2012 10:46:45 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:46:45 -0700 (PDT)
In-Reply-To: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
References: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
Date: Mon, 11 Jun 2012 10:46:45 -0700
Message-ID: <CAPhnLPAL8TvsHGO5LPRTtp4sscj_bKPuSXmUmOMNOfkKv0q1Kg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn34LQFfVYED0O4pfDMfCZbt2BMsdtK32YrOxxxnTiG5UeY0moqxdSXChA85LEfmlm48ahA
Subject: Re: [PATCH 0/2] Package upgrades: directfb, directfb-examples
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
X-List-Received-Date: Mon, 11 Jun 2012 17:59:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 4:41 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> Tests done(qemuarm):
> =A0 =A0 =A0 =A0- compiles fine on all architectures;
> =A0 =A0 =A0 =A0- directfb examples run OK. I did not test all of them, ju=
st a few, to see directfb works.
>
> Laurentiu Palcu (2):
> =A0directfb: upgrade to 1.5.3
> =A0directfb-examples: upgrade to 1.5.3
>
> =A0...xamples_1.2.0.bb =3D> directfb-examples_1.5.3.bb} | =A0 =A04 +--
> =A0meta/recipes-graphics/directfb/directfb.inc =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0...se-ARM-assembler-for-atomic-operations-on.patch | =A0 27 ++++++++++=
++++++++++
> =A0...ibdirect-remove-include-of-linux-config.h.patch | =A0 27 ++++++++++=
++++++++++
> =A0meta/recipes-graphics/directfb/directfb_1.4.15.bb =A0| =A0 20 --------=
-------
> =A0meta/recipes-graphics/directfb/directfb_1.5.3.bb =A0 | =A0 23 ++++++++=
+++++++++
> =A06 files changed, 80 insertions(+), 23 deletions(-)
> =A0rename meta/recipes-graphics/directfb/{directfb-examples_1.2.0.bb =3D>=
 directfb-examples_1.5.3.bb} (77%)
> =A0create mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-U=
se-ARM-assembler-for-atomic-operations-on.patch
> =A0create mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-r=
emove-include-of-linux-config.h.patch
> =A0delete mode 100644 meta/recipes-graphics/directfb/directfb_1.4.15.bb
> =A0create mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb
>
> --
> 1.7.9.5
>
>

Merged into OE-Core

Thanks

-b

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


