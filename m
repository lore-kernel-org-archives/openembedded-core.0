Return-Path: <ross.burton@intel.com>
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 22B1B6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 13:28:51 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so3546307vnb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 06:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Cu9SHn7Qnh8B/FLxv7N6pPZFGeM5RGK/iLleWEd+v+E=;
	b=XNDYT+P2QtfmsIqREo50cZG5coVR0NxlfjQe2jW06/UkaJUM7jUqqD3zUqZGwqVi0q
	m73fy+uDgv9nlPXF5KA/Qhk1W93tvROnk/8XxI7Vyvhk9PU79OjmB+mNcZ18i57aJqcC
	9Jyc2IywwJdAagPLNsdo2LenGHeZsVpa6EYVrHggLngAPMTyzVIjShGzINkLh1NZ31Re
	dCSz1c5OLDA9Yx5PScgVpuVyB0CB82E0Du6sfJiEp7WxVBlpNpVqRaDIVsk/yCvXIIV/
	QAQX3xfJn2hChWreC/8fRh4DEbBxHBZXm/Op8yXv4s0i0c4DSvbStVVAEABYb4byr28c
	d2Bw==
X-Gm-Message-State: ALoCoQktxbcomJnPDlSsJdh79WsWsSWViCdmiFY6yivF1IP70qKQqY0emTeSwbjBf8mOznwS93+Q
X-Received: by 10.140.88.80 with SMTP id s74mr24055007qgd.59.1429018132227;
	Tue, 14 Apr 2015 06:28:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 14 Apr 2015 06:28:31 -0700 (PDT)
In-Reply-To: <552319BE.3020308@pabigot.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
	<5522F8D7.3050007@pabigot.com>
	<CABcZANmh-o58Z5iHW++S30_JP6r3q-8+3-g5hegiwV1_2_OP1Q@mail.gmail.com>
	<552319BE.3020308@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Apr 2015 14:28:31 +0100
Message-ID: <CAJTo0LbnN-HPjeuG-_80DmB89APM7DUpNibvA7L-X8wo8SNrSw@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 14 Apr 2015 13:28:55 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4265a730513af3671

--001a11c114c4265a730513af3671
Content-Type: text/plain; charset=UTF-8

On 7 April 2015 at 00:41, Peter A. Bigot <pab@pabigot.com> wrote:

> Thank you.  So, if I understand correctly, the effect of adding bluez5 to
> DISTRO_FEATURES_BACKFILL while keeping the current logic:
>
> # bluetooth support on the platform:
> # "" if bluetooth is not in DISTRO_FEATURES
> # else "bluez5" if bluez5 is in DISTRO_FEATURES
> # else "bluez4"
>
> is that bluez5 becomes the default and is in DISTRO_FEATURES
> automatically, and it stays the default even if bluez4 is also in
> DISTRO_FEATURES unless somebody adds bluez5 to
> DISTRO_FEATURES_BACKFILL_CONSIDERED at which point bluez4 takes precedence.
>
> If that understanding is correct, and reviewing
> http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-features-backfill,
> it's not clear to me that it's the right approach.  We're not backfilling
> "bluetooth", which remains optional and continues to control whether either
> "bluez4" or "bluez5" is relevant.  We're changing the default provider of
> bluetooth services, something that I think can reasonably be changed
> between releases, and something that 1.8 already controls (via explicit
> specification of bluez4 or bluez5 in DISTRO_FEATURES).
>

My reasoning for backfilling bluez5 is that bluetooth.bbclass has a defined
behaviour in 1.8:

if bluetooth in DF:
  if bluez5 in DF:
   return "bluez5"
  else:
    return "bluez4"
else:
  return ""

There's no mention of a bluez4 DISTRO_FEATURE, just a "bluetooth" value to
enable/disable Bluetooth in general, and the toggle between BlueZ 4 and 5
is the presence of a "bluez5" DISTRO_FEATURE.

We don't need to change the algorithm or create new DISTRO_FEATURE entries,
as we have all the logic and items needed: by backfilling bluez5 into
DISTRO_FEATURES we get the default switched, and distributions can flip
back to bluez4 when upgrading to 1.9 by adding in meta-connectivity and
wiping out bluez5 from DISTRO_FEATURES.

Or am I alone in thinking this is the best approach going forward?

Ross

--001a11c114c4265a730513af3671
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 April 2015 at 00:41, Peter A. Bigot <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000=
000">Thank you.=C2=A0 So, if I understand correctly, the effect of adding
    bluez5 to DISTRO_FEATURES_BACKFILL while keeping the current logic:<spa=
n class=3D""><br>
    <br>
    # bluetooth support on the platform:<br>
    # &quot;&quot; if bluetooth is not in DISTRO_FEATURES<br></span><span c=
lass=3D"">
    # else &quot;bluez5&quot; if bluez5 is in DISTRO_FEATURES<br></span>
    # else &quot;bluez4&quot;<br>
    <br>
    is that bluez5 becomes the default and is in DISTRO_FEATURES
    automatically, and it stays the default even if bluez4 is also in
    DISTRO_FEATURES unless somebody adds bluez5 to
    DISTRO_FEATURES_BACKFILL_CONSIDERED at which point bluez4 takes
    precedence.<br>
    <br>
    If that understanding is correct, and reviewing
    <a href=3D"http://www.yoctoproject.org/docs/latest/ref-manual/ref-manua=
l.html#ref-features-backfill" target=3D"_blank">http://www.yoctoproject.org=
/docs/latest/ref-manual/ref-manual.html#ref-features-backfill</a>,
    it&#39;s not clear to me that it&#39;s the right approach.=C2=A0 We&#39=
;re not
    backfilling &quot;bluetooth&quot;, which remains optional and continues=
 to
    control whether either &quot;bluez4&quot; or &quot;bluez5&quot; is rele=
vant.=C2=A0 We&#39;re
    changing the default provider of bluetooth services, something that
    I think can reasonably be changed between releases, and something
    that 1.8 already controls (via explicit specification of bluez4 or
    bluez5 in DISTRO_FEATURES).</div></blockquote></div><br>My reasoning fo=
r backfilling bluez5 is that bluetooth.bbclass has a defined behaviour in 1=
.8:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">if=
 bluetooth in DF:</div><div class=3D"gmail_extra">=C2=A0 if bluez5 in DF:</=
div><div class=3D"gmail_extra">=C2=A0 =C2=A0return &quot;bluez5&quot;</div>=
<div class=3D"gmail_extra">=C2=A0 else:</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 return &quot;bluez4&quot;</div><div class=3D"gmail_extra">else:<=
/div><div class=3D"gmail_extra">=C2=A0 return &quot;&quot;</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">There&#39;s no mentio=
n of a bluez4 DISTRO_FEATURE, just a &quot;bluetooth&quot; value to enable/=
disable Bluetooth in general, and the toggle between BlueZ 4 and 5 is the p=
resence of a &quot;bluez5&quot; DISTRO_FEATURE.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">We don&#39;t need to change the a=
lgorithm or create new DISTRO_FEATURE entries, as we have all the logic and=
 items needed: by backfilling bluez5 into DISTRO_FEATURES we get the defaul=
t switched, and distributions can flip back to bluez4 when upgrading to 1.9=
 by adding in meta-connectivity and wiping out bluez5 from DISTRO_FEATURES.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Or am=
 I alone in thinking this is the best approach going forward?</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c114c4265a730513af3671--
