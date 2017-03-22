Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id AA1FC77B3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:35:15 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id r45so152913722qte.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E/oSiYk1GRvFMBpxzND6Hipvvd9Hz8BNuweBJxWRCUI=;
	b=N/ySeoSguqwEF36aCSKf2Vb0zuqlYyqLA+kRt+nb6Srblgc7A6e3FPxgjwZlLHE4Vn
	jcCYudzBmw9buqNbYAGbiRWm7Cd6c0Gs+sqKyNneEB1iIDMA/NMlxTRQNO4AfojfSg86
	4GqJXYW2Oo6fqKDMxbrYeVhkAfqV9fDz8mYaX3MDBaVqUHu42i/UobvVLfnmLuQagGEF
	nMh1nKq/bTQocAZ4oFgZuqGBafxPo2xhH37UwlW2z2N8z++DPa/jd+ngzeGAFCxRTL3W
	0UxbVSYMg0NUp1Hed0JuSah5h293AXT3lvIEaM8246KFAdEVats8kDFAiQBvPdUfKU4P
	0pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E/oSiYk1GRvFMBpxzND6Hipvvd9Hz8BNuweBJxWRCUI=;
	b=lB6+jdgs+F13Mhveuuejp7pUD9DZdPq2wIBLfrzOkVKF/2xoO65W+twyucJWId2uv9
	epnMrh8drpGypcBd/NALVMXWFWA2n7sx46NPh0105U9WksefM1aeXZflwdsMjnFdL6kf
	jpQz2Yqh/AZ+UiQJ0o4tYpNIJk/sPqEgmpev/3HA0E4STEMmm7dxV7ZodaFLerBZ+RsY
	N0tEt5BypDJ7ijU3ApdqSZF6wgrx7tirfjtpVzAtaXodSas2uBpd/WMY+4MeRFdXIitp
	wG3P+83OL21eUC01cxd21CSJgtXoOvRYN+dJ8PSbT50DMvxZ5mVGhejI5XoU8rXDxhmI
	M0Lg==
X-Gm-Message-State: AFeK/H1cpbATefHW65HcgaN+87jUKEK5oHiyPCtSosXrTqeTCTiSQutYnc3GHSlGEr93DarUHsM9rf/Hojfz3w==
X-Received: by 10.200.55.82 with SMTP id p18mr31155091qtb.285.1490189716338;
	Wed, 22 Mar 2017 06:35:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 22 Mar 2017 06:35:15 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Mar 2017 09:35:15 -0400
Message-ID: <CADkTA4Nkyv=mF7ZmAwPGSZ+bU8LcFaiKwoPLP=9kAUZb88946w@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: another design question -- proper (meaningful) content of recipe patches?
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
X-List-Received-Date: Wed, 22 Mar 2017 13:35:16 -0000
Content-Type: multipart/alternative; boundary=001a1137b488b0ecea054b51d407

--001a1137b488b0ecea054b51d407
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 9:22 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   got into an animated discussion the other day regarding proper
> design of patch files associated with a recipe. as a demo, i can
> actually use part of a recipe file ripped from the meta-digi-arm
> layer, for "kernel-module-qualcomm", whose recipe file contains (in
> part):
>
>   SRC_URI = " \
>     ${CAF_MIRROR};destsuffix=${PV};branch=${SRCBRANCH} \
>     file://qualcomm-pre-up \
>     file://modprobe-qualcomm.conf \
>     file://0001-qcacld-Fix-compiling-errors-when-BUILD_DEBUG_VERSION.patch
> \
>     file://0002-Update-cfg80211_vendor_event_alloc-call-for-newer-ke.patch
> \
>     file://0003-wlan_hdd_main-Update-cfg80211_ap_stopped-to-nl80211_.patch
> \
>     file://0004-qcacld-2.0-remove-unused-code.patch \
>     file://0005-Including-header-file-for-regulatory_hint_user.patch \
>     file://0006-Updating-calls-to-alloc_netdev_mq.patch \
>     file://0007-wlan_hdd_cfg80211-update-cfg80211_inform_bss-params-.patch
> \
>     file://0008-wlan_hdd_p2p-Update-call-to-cfg80211_rx_mgmt-for-dif.patch
> \
>     file://0009-linux_ac-Fix-for-f_dentry.patch \
>     file://0010-native_sdio-src-hif-Do-not-call-to-HIGH-SPEED-functi.patch
> \
>     file://0011-osdep_adf.h-fix-for-undefined-ath_sysctl_pktlog_size.patch
> \
>     file://0012-Kbuild-Add-compilation-flag-based-on-kernel-support.patch
> \
>     file://0013-Kbuild-do-not-compile-the-DEBUG-version-inconditiona.patch
> \
>     file://0014-Kbuild-Group-most-of-the-relevant-DEBUG-options.patch \
>     file://0015-wlan_hdd_cfg80211-fix-missing-ifdef-clause.patch \
>     file://0016-Add-.gitignore-rules.patch \
>     file://0017-wlan_hdd_main-initialize-all-adapter-completion-vari.patch
> \
>     file://0018-qcacld-Indicate-disconnect-event-to-upper-layers.patch \
>     file://0019-wdd_hdd_main-Print-con_mode-to-clearly-see-if-in-FTM.patch
> \
>     file://0020-Makefile-Pass-BUILD_DEBUG_VERSION-to-kbuild-system.patch \
>     file://0021-cosmetic-change-log-level.patch \
>     file://0022-fix-issue-with-_scan_callback.patch \
>   "
>
>   when i was presented with something resembling the above the other
> day, my immediate reaction was , "yuck." at the time, i opined that,
> if the purpose of the above was to simply add a qualcomm module, it
> was silly to do that with a lengthy, numbered series of patches that
> were almost certainly inter-dependent and even numbered to enforce a
> particular processing order.
>
>   i insisted that the above was unnecessarily messy and, if a
> developer tried to examine the patches, it would be next to impossible
> to do that easily, as it would require walking through each patch,
> then mentally adding the next one, and so on and so on.
>
>   i suggested that, in cases like this, adding a well-defined
> functionality should be done with a single all-encompassing patch or,
> at the very worst, a small number of patches that might be applied
> independently. as in, "Add-qualcomm-driver.patch".
>
>   the argument i got coming back was that the above made sense as it
> reflected the *history* of how that driver came to be added. i
> shuddered, and pointed out that if one wanted to see the history,
> that's what version control is for -- there is no reason that the
> information from version control should be used *verbatim* to generate
> the patches for a recipe.
>

If the patches have been posted (or are otherwise public), then tracking
the history
on the same granularity is a good thing. It helps maintenance and
debugging.

By having the functionality in an "upstream acceptable" history, i.e. one
you'd submit
to the mainline kernel, you have a level of bisectability and other debug
techniques
that will work.

If it is tracking development history, that would be squashed for an
upstream
submission .. then yes, you don't need it in the patches either.

But really, if there are a lot of patches, then they should already be in a
repo and
built from that repo directly (versus exporting patches and maintaining them
separately). But perhaps the export is done to save time and the size of the
build, etc, etc.

Bruce


>
>   in any event, i can appreciate the value of sometimes adding
> numbering to patches to enforce a processing order, but when one has a
> numbered series of patches getting up to 20 or 25, that strikes me as
> time to collapse all that into larger and more modular and more
> meaningful patches.
>
>   thoughts?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137b488b0ecea054b51d407
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 22, 2017 at 9:22 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 got into an animated discussion the other day regarding proper<br>
design of patch files associated with a recipe. as a demo, i can<br>
actually use part of a recipe file ripped from the meta-digi-arm<br>
layer, for &quot;kernel-module-qualcomm&quot;, whose recipe file contains (=
in<br>
part):<br>
<br>
=C2=A0 SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 ${CAF_MIRROR};destsuffix=3D${PV}<wbr>;branch=3D${SRCBRANCH} \=
<br>
=C2=A0 =C2=A0 file://qualcomm-pre-up \<br>
=C2=A0 =C2=A0 file://modprobe-qualcomm.conf \<br>
=C2=A0 =C2=A0 file://0001-qcacld-Fix-<wbr>compiling-errors-when-BUILD_<wbr>=
DEBUG_VERSION.patch \<br>
=C2=A0 =C2=A0 file://0002-Update-cfg80211_<wbr>vendor_event_alloc-call-for-=
<wbr>newer-ke.patch \<br>
=C2=A0 =C2=A0 file://0003-wlan_hdd_main-<wbr>Update-cfg80211_ap_stopped-to-=
<wbr>nl80211_.patch \<br>
=C2=A0 =C2=A0 file://0004-qcacld-2.0-remove-<wbr>unused-code.patch \<br>
=C2=A0 =C2=A0 file://0005-Including-header-<wbr>file-for-regulatory_hint_us=
er.<wbr>patch \<br>
=C2=A0 =C2=A0 file://0006-Updating-calls-to-<wbr>alloc_netdev_mq.patch \<br=
>
=C2=A0 =C2=A0 file://0007-wlan_hdd_cfg80211-<wbr>update-cfg80211_inform_bss=
-<wbr>params-.patch \<br>
=C2=A0 =C2=A0 file://0008-wlan_hdd_p2p-<wbr>Update-call-to-cfg80211_rx_<wbr=
>mgmt-for-dif.patch \<br>
=C2=A0 =C2=A0 file://0009-linux_ac-Fix-for-<wbr>f_dentry.patch \<br>
=C2=A0 =C2=A0 file://0010-native_sdio-src-<wbr>hif-Do-not-call-to-HIGH-SPEE=
D-<wbr>functi.patch \<br>
=C2=A0 =C2=A0 file://0011-osdep_adf.h-fix-<wbr>for-undefined-ath_sysctl_<wb=
r>pktlog_size.patch \<br>
=C2=A0 =C2=A0 file://0012-Kbuild-Add-<wbr>compilation-flag-based-on-<wbr>ke=
rnel-support.patch \<br>
=C2=A0 =C2=A0 file://0013-Kbuild-do-not-<wbr>compile-the-DEBUG-version-<wbr=
>inconditiona.patch \<br>
=C2=A0 =C2=A0 file://0014-Kbuild-Group-most-<wbr>of-the-relevant-DEBUG-opti=
ons.<wbr>patch \<br>
=C2=A0 =C2=A0 file://0015-wlan_hdd_cfg80211-<wbr>fix-missing-ifdef-clause.p=
atch \<br>
=C2=A0 =C2=A0 file://0016-Add-.gitignore-<wbr>rules.patch \<br>
=C2=A0 =C2=A0 file://0017-wlan_hdd_main-<wbr>initialize-all-adapter-<wbr>co=
mpletion-vari.patch \<br>
=C2=A0 =C2=A0 file://0018-qcacld-Indicate-<wbr>disconnect-event-to-upper-<w=
br>layers.patch \<br>
=C2=A0 =C2=A0 file://0019-wdd_hdd_main-<wbr>Print-con_mode-to-clearly-see-<=
wbr>if-in-FTM.patch \<br>
=C2=A0 =C2=A0 file://0020-Makefile-Pass-<wbr>BUILD_DEBUG_VERSION-to-kbuild-=
<wbr>system.patch \<br>
=C2=A0 =C2=A0 file://0021-cosmetic-change-<wbr>log-level.patch \<br>
=C2=A0 =C2=A0 file://0022-fix-issue-with-_<wbr>scan_callback.patch \<br>
=C2=A0 &quot;<br>
<br>
=C2=A0 when i was presented with something resembling the above the other<b=
r>
day, my immediate reaction was , &quot;yuck.&quot; at the time, i opined th=
at,<br>
if the purpose of the above was to simply add a qualcomm module, it<br>
was silly to do that with a lengthy, numbered series of patches that<br>
were almost certainly inter-dependent and even numbered to enforce a<br>
particular processing order.<br>
<br>
=C2=A0 i insisted that the above was unnecessarily messy and, if a<br>
developer tried to examine the patches, it would be next to impossible<br>
to do that easily, as it would require walking through each patch,<br>
then mentally adding the next one, and so on and so on.<br>
<br>
=C2=A0 i suggested that, in cases like this, adding a well-defined<br>
functionality should be done with a single all-encompassing patch or,<br>
at the very worst, a small number of patches that might be applied<br>
independently. as in, &quot;Add-qualcomm-driver.patch&quot;.<br>
<br>
=C2=A0 the argument i got coming back was that the above made sense as it<b=
r>
reflected the *history* of how that driver came to be added. i<br>
shuddered, and pointed out that if one wanted to see the history,<br>
that&#39;s what version control is for -- there is no reason that the<br>
information from version control should be used *verbatim* to generate<br>
the patches for a recipe.<br></blockquote><div><br></div><div>If the patche=
s have been posted (or are otherwise public), then tracking the history</di=
v><div>on the same granularity is a good thing. It helps maintenance and de=
bugging.=C2=A0</div><div><br></div><div>By having the functionality in an &=
quot;upstream acceptable&quot; history, i.e. one you&#39;d submit</div><div=
>to the mainline kernel, you have a level of bisectability and other debug =
techniques</div><div>that will work.</div><div><br></div><div>If it is trac=
king development history, that would be squashed for an upstream</div><div>=
submission .. then yes, you don&#39;t need it in the patches either.</div><=
div><br></div><div>But really, if there are a lot of patches, then they sho=
uld already be in a repo and</div><div>built from that repo directly (versu=
s exporting patches and maintaining them</div><div>separately). But perhaps=
 the export is done to save time and the size of the</div><div>build, etc, =
etc.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
=C2=A0 in any event, i can appreciate the value of sometimes adding<br>
numbering to patches to enforce a processing order, but when one has a<br>
numbered series of patches getting up to 20 or 25, that strikes me as<br>
time to collapse all that into larger and more modular and more<br>
meaningful patches.<br>
<br>
=C2=A0 thoughts?<br>
<br>
rday<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1137b488b0ecea054b51d407--
