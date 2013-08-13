Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B12C36A994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:32:20 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp13so8515070pab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 00:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=YKAd+uaan9XtJjRJ7BGMvGct3SZ9bq2hx6lPkKLDh6M=;
	b=cHQkakyrPzKXW0epWDUvyCESmZNzCRWXMw9dxlZY69UebRY5wuzuTG/IDKh0IJgQtX
	La95P0JbZ6V6gf7iwvptasUegL9S6azFmvIYlZV7278amctE1Jq4EROcjliM+cCpZ3wx
	TFA2uoKYMqxmwZ3IcGQ4f5SmXQKgIG38MwPgaauLYmeEnHiOphKpsZDleQDRVdE2RulG
	udnlxdtypmFJpJE6ROlvzT0DS1QvymksCZprgTYeqTTPgCd5xlflLC1LuHHPB+EX+PMG
	vTfkHemzitMywVQEni3GJC1nFHwbGJ9K77dNK5X0cjNwivY6mCzDmAXM4R3FbuHFv13M
	EILA==
X-Gm-Message-State: ALoCoQnwiwdMm2+WX9JiI97kJyxoOvBgks34Vx4WHJK/N9R9y7z1e+TlUgJ8PFCD2GKXMYIPa5zh
MIME-Version: 1.0
X-Received: by 10.66.154.1 with SMTP id vk1mr3116858pab.85.1376379141550; Tue,
	13 Aug 2013 00:32:21 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 00:32:21 -0700 (PDT)
In-Reply-To: <CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
Date: Tue, 13 Aug 2013 08:32:21 +0100
X-Google-Sender-Auth: fi5wLvwPBOojjFL54IGRWQWb-aM
Message-ID: <CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 07:32:20 -0000
Content-Type: multipart/alternative; boundary=047d7b6d908acf086104e3cf3d83

--047d7b6d908acf086104e3cf3d83
Content-Type: text/plain; charset=ISO-8859-1

So, everyone suggested PACKAGECONFIG in here on the mailing list except
Khem whose reply I did not get.

Yet, 4964 got closed by the "team". Could anyone please give a sane
description why and what would block the end users other than fork?


On Tue, Aug 6, 2013 at 8:36 AM, Laszlo Papp <lpapp@kde.org> wrote:

> What do you mean?
>
>
> On Wed, Jul 31, 2013 at 11:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> On Jul 29, 2013, at 12:16 AM, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> > This is necessary to get the build going, for instance with older Code
>> Sourcery
>> > compilers.
>> >
>> > It is also disabled in upstream due to this very reason. The details
>> can be
>> > found on the following links:
>> >
>> > http://comments.gmane.org/gmane.linux.busybox/30999
>> >
>> http://git.busybox.net/busybox/commit/?h=1_21_stable&id=1cd769a154b04f4b058beed482a5dd7192437cdc
>> >
>> > [YOCTO #4932]
>>
>> while we use relatively newer toolchain and kernel headers as default.
>> this patch is not as appealing
>> to me. However since busy box now uses same config fragment management
>> infra like linux-yocto you could
>> convert this into a config fragment and then not use it by default. This
>> patch as such will be a regression
>> for normal users.
>>
>> >
>> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
>> > ---
>> > meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
>> > meta/recipes-core/busybox/busybox.inc              | 2 --
>> > 2 files changed, 1 insertion(+), 3 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
>> b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
>> > index bdfdadf..e77a817 100644
>> > --- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
>> > +++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
>> > @@ -705,7 +705,7 @@ CONFIG_MICROCOM=y
>> > # CONFIG_MT is not set
>> > # CONFIG_RAIDAUTORUN is not set
>> > # CONFIG_READAHEAD is not set
>> > -CONFIG_RFKILL=y
>> > +# CONFIG_RFKILL is not set
>> > # CONFIG_RUNLEVEL is not set
>> > # CONFIG_RX is not set
>> > # CONFIG_SETSID is not set
>> > diff --git a/meta/recipes-core/busybox/busybox.inc
>> b/meta/recipes-core/busybox/busybox.inc
>> > index acd2bfb..0e84f4c 100644
>> > --- a/meta/recipes-core/busybox/busybox.inc
>> > +++ b/meta/recipes-core/busybox/busybox.inc
>> > @@ -66,8 +66,6 @@ def features_to_busybox_settings(d):
>> >       busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT',
>> cnf, rem)
>> >       busybox_cfg('ipv4', distro_features,
>> 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>> >       busybox_cfg('ipv6', distro_features,
>> 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>> > -     busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
>> > -     busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf,
>> rem)
>> >       return "\n".join(cnf), "\n".join(rem)
>> >
>> > # X, Y = ${@features_to_uclibc_settings(d)}
>> > --
>> > 1.8.3.4
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--047d7b6d908acf086104e3cf3d83
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So, everyone suggested PACKAGECONFIG in here on the mailin=
g list except Khem whose reply I did not get.<div><br></div><div>Yet, 4964 =
got closed by the &quot;team&quot;. Could anyone please give a sane descrip=
tion why and what would block the end users other than fork?</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue,=
 Aug 6, 2013 at 8:36 AM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<div dir=3D"ltr">What do you mean?</div><div class=3D"HOEnZb"><div class=3D=
"h5"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, =
Jul 31, 2013 at 11:36 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><br>
On Jul 29, 2013, at 12:16 AM, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.o=
rg" target=3D"_blank">lpapp@kde.org</a>&gt; wrote:<br>
<br>
&gt; This is necessary to get the build going, for instance with older Code=
 Sourcery<br>
&gt; compilers.<br>
&gt;<br>
&gt; It is also disabled in upstream due to this very reason. The details c=
an be<br>
&gt; found on the following links:<br>
&gt;<br>
&gt; <a href=3D"http://comments.gmane.org/gmane.linux.busybox/30999" target=
=3D"_blank">http://comments.gmane.org/gmane.linux.busybox/30999</a><br>
&gt; <a href=3D"http://git.busybox.net/busybox/commit/?h=3D1_21_stable&amp;=
id=3D1cd769a154b04f4b058beed482a5dd7192437cdc" target=3D"_blank">http://git=
.busybox.net/busybox/commit/?h=3D1_21_stable&amp;id=3D1cd769a154b04f4b058be=
ed482a5dd7192437cdc</a><br>


&gt;<br>
&gt; [YOCTO #4932]<br>
<br>
</div>while we use relatively newer toolchain and kernel headers as default=
. this patch is not as appealing<br>
to me. However since busy box now uses same config fragment management infr=
a like linux-yocto you could<br>
convert this into a config fragment and then not use it by default. This pa=
tch as such will be a regression<br>
for normal users.<br>
<div><div><br>
&gt;<br>
&gt; Signed-off-by: Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org" target=
=3D"_blank">lpapp@kde.org</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-<br>
&gt; meta/recipes-core/busybox/busybox.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| 2 -=
-<br>
&gt; 2 files changed, 1 insertion(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta=
/recipes-core/busybox/busybox-1.21.1/defconfig<br>
&gt; index bdfdadf..e77a817 100644<br>
&gt; --- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig<br>
&gt; +++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig<br>
&gt; @@ -705,7 +705,7 @@ CONFIG_MICROCOM=3Dy<br>
&gt; # CONFIG_MT is not set<br>
&gt; # CONFIG_RAIDAUTORUN is not set<br>
&gt; # CONFIG_READAHEAD is not set<br>
&gt; -CONFIG_RFKILL=3Dy<br>
&gt; +# CONFIG_RFKILL is not set<br>
&gt; # CONFIG_RUNLEVEL is not set<br>
&gt; # CONFIG_RX is not set<br>
&gt; # CONFIG_SETSID is not set<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core=
/busybox/busybox.inc<br>
&gt; index acd2bfb..0e84f4c 100644<br>
&gt; --- a/meta/recipes-core/busybox/busybox.inc<br>
&gt; +++ b/meta/recipes-core/busybox/busybox.inc<br>
&gt; @@ -66,8 +66,6 @@ def features_to_busybox_settings(d):<br>
&gt; =A0 =A0 =A0 busybox_cfg(&#39;nls&#39;, =A0distro_features, &#39;CONFIG=
_LOCALE_SUPPORT&#39;, cnf, rem)<br>
&gt; =A0 =A0 =A0 busybox_cfg(&#39;ipv4&#39;, distro_features, &#39;CONFIG_F=
EATURE_IFUPDOWN_IPV4&#39;, cnf, rem)<br>
&gt; =A0 =A0 =A0 busybox_cfg(&#39;ipv6&#39;, distro_features, &#39;CONFIG_F=
EATURE_IFUPDOWN_IPV6&#39;, cnf, rem)<br>
&gt; - =A0 =A0 busybox_cfg(&#39;wifi&#39;, distro_features, &#39;CONFIG_RFK=
ILL&#39;, cnf, rem)<br>
&gt; - =A0 =A0 busybox_cfg(&#39;bluetooth&#39;, distro_features, &#39;CONFI=
G_RFKILL&#39;, cnf, rem)<br>
&gt; =A0 =A0 =A0 return &quot;\n&quot;.join(cnf), &quot;\n&quot;.join(rem)<=
br>
&gt;<br>
&gt; # X, Y =3D ${@features_to_uclibc_settings(d)}<br>
&gt; --<br>
&gt; 1.8.3.4<br>
&gt;<br>
</div></div><div><div>&gt; _______________________________________________<=
br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b6d908acf086104e3cf3d83--
