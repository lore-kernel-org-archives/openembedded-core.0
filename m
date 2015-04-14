Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF2C6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:39:08 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so23292213qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=A8YsCAFD3fu3S86rRlroXcJ8x+IoVt9B3p0JaEZY+x0=;
	b=tfKQkJHL5D3Nf47Xo60vrQ1omfkV0ymhUjL6oXfH3L3dvLrAiH/Az1aPPVPLKeHVEJ
	yWn4Itnzmk8Ha5QpBDgNHvt1Ynn2RMXUTucFsHjBhhasI1PjfyoWIgEB6o3u3dMXPLAy
	FEQ43OK/cleyb5VazqNvuHfVZPTqGNCpsqZSwxWyZgkXAA8t7jXxk8sFBJb97Lkt1J5r
	+WWa1acvI4tdE1IG1bHbtimRkDKl9CNPCpafq1DMoT8AjS/IF1CKvICQZ92toofXjoEh
	Y88Ev8+qmgllakTIUHlOgFth/EggQizT7KBALEdv8gpBSefi/gJ2RFHIDuYNYxS0FwEx
	WRjw==
X-Received: by 10.55.53.8 with SMTP id c8mr31851353qka.63.1429025925025; Tue,
	14 Apr 2015 08:38:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Tue, 14 Apr 2015 08:38:24 -0700 (PDT)
In-Reply-To: <CAJTo0LbnN-HPjeuG-_80DmB89APM7DUpNibvA7L-X8wo8SNrSw@mail.gmail.com>
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
	<CAJTo0LbnN-HPjeuG-_80DmB89APM7DUpNibvA7L-X8wo8SNrSw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 14 Apr 2015 08:38:24 -0700
X-Google-Sender-Auth: LWd9Cl6f4d3Sf-73VdQSm3p906M
Message-ID: <CABcZAN=05BhabBn_oS2JVp2NbDKJGje=8VE7qWv1WNgZ3k8VEQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Tue, 14 Apr 2015 15:39:09 -0000
Content-Type: multipart/alternative; boundary=001a114900caa2d6110513b106eb

--001a114900caa2d6110513b106eb
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 14, 2015 at 6:28 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 7 April 2015 at 00:41, Peter A. Bigot <pab@pabigot.com> wrote:
>
>> Thank you.  So, if I understand correctly, the effect of adding bluez5 to
>> DISTRO_FEATURES_BACKFILL while keeping the current logic:
>>
>> # bluetooth support on the platform:
>> # "" if bluetooth is not in DISTRO_FEATURES
>> # else "bluez5" if bluez5 is in DISTRO_FEATURES
>> # else "bluez4"
>>
>> is that bluez5 becomes the default and is in DISTRO_FEATURES
>> automatically, and it stays the default even if bluez4 is also in
>> DISTRO_FEATURES unless somebody adds bluez5 to
>> DISTRO_FEATURES_BACKFILL_CONSIDERED at which point bluez4 takes precedence.
>>
>> If that understanding is correct, and reviewing
>> http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-features-backfill,
>> it's not clear to me that it's the right approach.  We're not backfilling
>> "bluetooth", which remains optional and continues to control whether either
>> "bluez4" or "bluez5" is relevant.  We're changing the default provider of
>> bluetooth services, something that I think can reasonably be changed
>> between releases, and something that 1.8 already controls (via explicit
>> specification of bluez4 or bluez5 in DISTRO_FEATURES).
>>
>
> My reasoning for backfilling bluez5 is that bluetooth.bbclass has a
> defined behaviour in 1.8:
>
> if bluetooth in DF:
>   if bluez5 in DF:
>    return "bluez5"
>   else:
>     return "bluez4"
> else:
>   return ""
>
> There's no mention of a bluez4 DISTRO_FEATURE, just a "bluetooth" value to
> enable/disable Bluetooth in general, and the toggle between BlueZ 4 and 5
> is the presence of a "bluez5" DISTRO_FEATURE.
>
> We don't need to change the algorithm or create new DISTRO_FEATURE
> entries, as we have all the logic and items needed: by backfilling bluez5
> into DISTRO_FEATURES we get the default switched, and distributions can
> flip back to bluez4 when upgrading to 1.9 by adding in meta-connectivity
> and wiping out bluez5 from DISTRO_FEATURES.
>
> Or am I alone in thinking this is the best approach going forward?
>

For what it's worth, I'd agree with that. There's no need to change the
logic.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114900caa2d6110513b106eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 14, 2015 at 6:28 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra"><span class=3D""><div class=3D"gmail_quote">On 7 April 2015 at 00:41=
, Peter A. Bigot <span dir=3D"ltr">&lt;<a href=3D"mailto:pab@pabigot.com" t=
arget=3D"_blank">pab@pabigot.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000000">Thank you.=C2=A0 So=
, if I understand correctly, the effect of adding
    bluez5 to DISTRO_FEATURES_BACKFILL while keeping the current logic:<spa=
n><br>
    <br>
    # bluetooth support on the platform:<br>
    # &quot;&quot; if bluetooth is not in DISTRO_FEATURES<br></span><span>
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
    bluez5 in DISTRO_FEATURES).</div></blockquote></div><br></span>My reaso=
ning for backfilling bluez5 is that bluetooth.<span class=3D"il">bbclass</s=
pan> has a defined behaviour in 1.8:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">if bluetooth in DF:</div><div class=3D"gmail=
_extra">=C2=A0 if bluez5 in DF:</div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0return &quot;bluez5&quot;</div><div class=3D"gmail_extra">=C2=A0 else:</=
div><div class=3D"gmail_extra">=C2=A0 =C2=A0 return &quot;bluez4&quot;</div=
><div class=3D"gmail_extra">else:</div><div class=3D"gmail_extra">=C2=A0 re=
turn &quot;&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">There&#39;s no mention of a bluez4 DISTRO_FEATURE, just a &quot=
;bluetooth&quot; value to enable/disable Bluetooth in general, and the togg=
le between BlueZ 4 and 5 is the presence of a &quot;bluez5&quot; DISTRO_FEA=
TURE.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
We don&#39;t need to change the algorithm or create new DISTRO_FEATURE entr=
ies, as we have all the logic and items needed: by backfilling bluez5 into =
DISTRO_FEATURES we get the default switched, and distributions can flip bac=
k to bluez4 when upgrading to 1.9 by adding in meta-connectivity and wiping=
 out bluez5 from DISTRO_FEATURES.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Or am I alone in thinking this is the best appr=
oach going forward?</div></blockquote></div><br>For what it&#39;s worth, I&=
#39;d agree with that. There&#39;s no need to change the logic.<br>-- <br><=
div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br=
>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a114900caa2d6110513b106eb--
