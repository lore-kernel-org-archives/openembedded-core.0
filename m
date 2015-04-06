Return-Path: <kergoth@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 500DD72A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 21:40:12 +0000 (UTC)
Received: by qcbii10 with SMTP id ii10so16488651qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ZUV2toG/MGSe71ZYG3BNzMaoMqzSFlmWfrCEcx2fs94=;
	b=PpzO6lYSFMMtrOzyNAjmg+QSDAhPmjeDLXeVZcAv/rsLDstiAOa5yuadFM47ri69h3
	/bO0tDOzlnvp9Lo6tybooGaVZeck9gMe0f1jblNOTIPoYqyjHRToFpcRP1VWbRJcmhQU
	Et0PYahK7UThRvu6O2lDAiSwPR0w0iZzTI9Zs4EIe+s2Y2ohqiEOD0B1oGQzTQlH6vue
	73SfjFpf47wZA/jrq10Y+ubxrLQVYirS1nzkzZbJx1041U8QfKNX3s1rs5mzdDtJIKfM
	vY/f16pHCsO9KGzlQe2jNgOh/ciCan1OTJhBZ0TjC4GD4tPRqGp3sqcO0wGlKOGzHIp+
	d15g==
X-Received: by 10.140.39.179 with SMTP id v48mr19764967qgv.105.1428356413548; 
	Mon, 06 Apr 2015 14:40:13 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Mon, 6 Apr 2015 14:39:53 -0700 (PDT)
In-Reply-To: <5522F8D7.3050007@pabigot.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
	<5522F8D7.3050007@pabigot.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 6 Apr 2015 14:39:53 -0700
X-Google-Sender-Auth: fZKk8RLVNfcoqlBl4fGIIk98InU
Message-ID: <CABcZANmh-o58Z5iHW++S30_JP6r3q-8+3-g5hegiwV1_2_OP1Q@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
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
X-List-Received-Date: Mon, 06 Apr 2015 21:40:13 -0000
Content-Type: multipart/alternative; boundary=001a11c131f6a470600513152455

--001a11c131f6a470600513152455
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 6, 2015 at 2:21 PM, Peter A. Bigot <pab@pabigot.com> wrote:

> On 04/06/2015 09:32 AM, Iorga, Cristian wrote:
>
>> Well,
>>
>> 1. Peter, Otavio: There is not a single doubt about moving to BlueZ 5 as
>> default in 1.9;
>> 2. The requested feedback was about the actual implementation;
>> 3. Peter: " I do think it's a bit abrupt to make it the default in the
>> first stable release that provides a usable bluez5."; The change is
>> intended for 1.9,the release that will come in October 2015. Do you think
>> that it is still abrupt? BlueZ5 is present in YP as an alternative BT stack
>> from 1.7, it will still be a fully supported alternative in the
>> (unreleased) 1.8 (as far as upstream goes as "fully supported", of course),
>> it will the default BT stack in 1.9 (coming October 2015), while BlueZ 4
>> will still be supported as an obsolete, but still functional alternative;
>> for 2.0 (why 1.10??), if that will be the name, all mechanisms for having
>> BlueZ alternatives will be removed, and BlueZ 5 will be the only official
>> supported BT stack. That's more than two years for a transition, is that
>> too soon??
>>
>
> Sorry; I got confused about which numbers were which and where things are
> in the release cycle.  I didn't consider bluez5 to be generally usable
> until the patches that were merged in February for what will be 1.8.  Since
> both bluez4 and bluez5 will be available in 1.8, making the default bluez5
> in 1.9 is fine, and removing bluez4 in what follows is fine.  (I have no
> idea what version is intended to follow 1.9, but if it isn't some huge
> backwards-incompatible change I would expect it to be 1.10 rather than
> 2.0.  That's just from the way I normally manage versioning myself.)
>
> I have no objections to the technical approach in the patch (it's
> consistent with what I had in mind when I created that bbclass) but I'm not
> familiar with how DISTRO_FEATURES_BACKFILL is supposed to work so abstain
> from further comment.


Backfill lets you add features which become default in DISTRO_FEATURES even
when a distro overrides DISTRO_FEATURES, unless they explicitly add them to
DISTRO_FEATURES_BACKFILL_CONSIDERED.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c131f6a470600513152455
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Apr 6, 2015 at 2:21 PM, Peter A. Bigot <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 04/06/2015 =
09:32 AM, Iorga, Cristian wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Well,<br>
<br>
1. Peter, Otavio: There is not a single doubt about moving to BlueZ 5 as de=
fault in 1.9;<br>
2. The requested feedback was about the actual implementation;<br>
3. Peter: &quot; I do think it&#39;s a bit abrupt to make it the default in=
 the first stable release that provides a usable bluez5.&quot;; The change =
is intended for 1.9,the release that will come in October 2015. Do you thin=
k that it is still abrupt? BlueZ5 is present in YP as an alternative BT sta=
ck from 1.7, it will still be a fully supported alternative in the (unrelea=
sed) 1.8 (as far as upstream goes as &quot;fully supported&quot;, of course=
), it will the default BT stack in 1.9 (coming October 2015), while BlueZ 4=
 will still be supported as an obsolete, but still functional alternative; =
for 2.0 (why 1.10??), if that will be the name, all mechanisms for having B=
lueZ alternatives will be removed, and BlueZ 5 will be the only official su=
pported BT stack. That&#39;s more than two years for a transition, is that =
too soon??<br>
</blockquote>
<br></span>
Sorry; I got confused about which numbers were which and where things are i=
n the release cycle.=C2=A0 I didn&#39;t consider bluez5 to be generally usa=
ble until the patches that were merged in February for what will be 1.8.=C2=
=A0 Since both bluez4 and bluez5 will be available in 1.8, making the defau=
lt bluez5 in 1.9 is fine, and removing bluez4 in what follows is fine.=C2=
=A0 (I have no idea what version is intended to follow 1.9, but if it isn&#=
39;t some huge backwards-incompatible change I would expect it to be 1.10 r=
ather than 2.0.=C2=A0 That&#39;s just from the way I normally manage versio=
ning myself.)<br>
<br>
I have no objections to the technical approach in the patch (it&#39;s consi=
stent with what I had in mind when I created that bbclass) but I&#39;m not =
familiar with how DISTRO_FEATURES_BACKFILL is supposed to work so abstain f=
rom further comment.</blockquote></div><br>Backfill lets you add features w=
hich become default in DISTRO_FEATURES even when a distro overrides DISTRO_=
FEATURES, unless they explicitly add them to DISTRO_FEATURES_BACKFILL_CONSI=
DERED.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clars=
on at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mai=
ntainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c131f6a470600513152455--
