Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12550.1795502166393534455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F7zH5JsF;
 spf=pass (domain: mvista.com, ip: 209.85.218.48, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c515319dd89so480813566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 22:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795502164; cv=none;
        d=google.com; s=arc-20260327;
        b=PSOJ4QR/9e452HQ1/m/IMWkbe2d8N/QKrKfzFDPhDJLYzLtz98Eb40bicOEDrQYB0V
         vGGLSWzLn5/NuPUULPB1AOL07PEBazdKoiO20+75r9GvAmwR8SCyRMhMwu/uyhcBmyv+
         c/UQTRDYeUqHvl7tpbtviJCS4AzY4kIUy7OOQpneU5Us4nYG5vlB4iL8mxJozSR/Qk0m
         uGpwBeiDk1tVO86c+dF9/lx46RA9yPTaXc9C2nuuaEEUioZV4X6s7uFptONyksoEbDKe
         WXHMZHLrh+9LyclIFSvhAQfRRDhjW7779WPdKSqPnJvL8udFsQdevvZh+W4OVxBsvnsO
         7X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vdsfNrYRJcufhszbs219jU1XhOgqq5/jfzv6vJNDX0c=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=FFtlcUIfHRc1Nnh0N/WidyTaptbjcWBLgm0GcseVNPuBqiiOkryLvKEVXuQSu+0NbH
         0Z96HFtHHkMeETRPK6b7Qio/I79T9k0wEZIWosPL1uIc1qqk781Wj+lbmblTCaPoLpIS
         xU2+Ebdp6bHxNVVCSlxzUmCwxrmte25LOEwD1c8qxVH9qb8bsK5wVL6oMfLD8iTPxqOY
         3GxfFnhvlmF4C+TfFu2B4UPeYDYfFwsrAyTUEzX9z6J1cPrX9bYanx5e2vrDKZBGHimw
         IoTKY3jWIuWs5+d7zNw90NJ6XvFkgpwmfPTt3lfGsB+htcCBzJ+ALzu9CsCpTiNJ8Kvt
         7t2Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795502164; x=1796106964; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdsfNrYRJcufhszbs219jU1XhOgqq5/jfzv6vJNDX0c=;
        b=F7zH5JsFNtrsnO9R+9I57hqhwHFxH3L1nzMmDlsJfpkFJBP5tefn2hmHukTf3x7FxS
         n/YiPYNxdW0OpJ624/KnBSCvSpVx9HWOBVSgPikBBYxduAY17FArWTd4opioZTlzynEm
         E8w3Or0eWUnC5jSyVgC2SLrixjOR4SCwC0GqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502164; x=1796106964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdsfNrYRJcufhszbs219jU1XhOgqq5/jfzv6vJNDX0c=;
        b=yChNcS9gHBASIAh0i5V4oaNWxgO0JsvuGkxto1H+biJjiyWKrLFpGR5JUfHXUJnZt3
         5bQvZ4wx3cvQmcWzddTvLr4Thyx5Tg8bCFVTbmll49gnYVymoR6v0jqsNdPvQsmilOLg
         +t6UzxvRHIGvM31RwTDyPi/lQT4licbWN7cQszl+wrnCAGocomwO6WNecQsZ4mMET1FQ
         Z62nj9fIYyhOxZrMIluAlqaE1Pv5cqW6phzPhibHx80uDjMK13XX92W61HQzWi3n5oGk
         LBgTZjyTYE7EfuuyYMV98S41zANiFfSP55PD6yw3MorjkoQAzt3R1eZsOHr+9FUCeUgv
         hqTQ==
X-Gm-Message-State: APuU4Z/dKto0g7aL7rI9zbHl2akgBkNxebUUghzTLskEWtI0WM9eNHU8
	Jl4FNACI+iJbzxeFpId2Im3tSsg4xoaWlQJT/fF34FzI2TN09xAuCAxAN4ZfEiPtxDuMzaXQDNW
	/SSXF7QwwAyyqBETFzkFfOiV/RoAKjNFJIuikSqt21O3GXHZ5Bz+bsJ0M8w==
X-Gm-Gg: AZFdTZeCddlQD7APapF3Hf4Yd6B6qg0GvRCEmpfPGqqhqHyzQlNpAW1NEuZ3JlCl+rT
	Y9x8qDleyrBApGg7aYwEiLbZL9P+aMoUvkYXRhchRl/NEbJkD2WjvHXkg9lUy1uVZ81xd/AUVXR
	z3LCtEjYbGVnDOPRhhcdl8aoKPjreHS3DrMNeWEYXT9+dykA3HBKg5C376Yrb5aS79FVs198ugV
	2W81z8LOVIQcgA1SmKVIFH8nObwJ6vckvboAAiivPEjzeLdTs0jxlp5zpzQ5mVgAJAjr8VZgWgS
	QwLVg8Lj1PjUR8GCfvHjteVBHmiB0deXuGXpc6TaDmOATyaakOm7CtOtj6VownGxZR3elozLxF9
	9GX1K4xpxqwrAGlvDHcC+0jkWz4dFgRnUcy6F5InjnkU9/94iQnuVfUkSeKeL24PBrJlfyA==
X-Received: by 2002:a17:906:d328:b0:c3f:153a:865f with SMTP id
 a640c23a62f3a-c513ab0350cmr841490766b.40.1795502164646; Mon, 23 Nov 2026
 22:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 24 Nov 2026 12:05:52 +0530
X-Gm-Features: Aa3M54r80w_jMYEXu-oYszqCjysnOECk55htoVBHXLIA6_QP2BVC5YG85bcfbmw
Message-ID: <CANQUz181W42zk=FgG142-nOqgjt-FNRT5_i_9oKQGn_kApCCwg@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH v3 0/8] Systemd 259.10 upgrade
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7b2e90660ffec3a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250960

--000000000000b7b2e90660ffec3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on Wrynose with QEMU (qemux86-64).

Build completed successfully, and OEQA runtime testing reported:

RESULTS:
RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.78s)
RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.59s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.20s)
RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (1.10s)
RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.60s=
)
RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.77s)
RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo:
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED
(0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro:
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED
(0.00s)
SUMMARY:
core-image-minimal () - Ran 12 tests in 5.091s
core-image-minimal - OK - All required tests passed (successes=3D7,
skipped=3D5, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1341 tasks of which 1339 didn't need to be
rerun and all succeeded.

The skipped tests were due to unmet prerequisites.

Tested-by: Vijay Anusuri <vanusuri@mvista.com>


Thanks & Regards,

Vijay




On Tue, Nov 17, 2026 at 5:21=E2=80=AFPM Jaipaul Cheernam via openembedded-c=
ore
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

> - Drop systemd-systemctl-native rename patches from v1
>
>
> Jaipaul Cheernam (1):
>   systemd: Upgrade 259.5 -> 259.10
>
> Ross Burton (7):
>   keymaps: remove obsolete systemd masking
>   initscripts: remove obsolete systemd masking
>   modutils-initscripts: remove obsolete systemd masking
>   systemd: move systemd-systemctl-native PACKAGE_WRITE_DEPS to
>     systemd.bb
>   classes/systemd: remove obsolete DEPENDS
>   systemd-systemctl-native: add systemd-hwdb
>   systemd: no need to use qemu for hwdb update
>
>  meta/classes-recipe/systemd.bbclass           |  2 -
>  meta/recipes-bsp/keymaps/keymaps_1.0.bb       | 17 -----
>  .../initscripts/initscripts_1.0.bb            | 26 --------
>  ...259.5.bb =3D> systemd-boot-native_259.10.bb} |  0
>  ...d-boot_259.5.bb =3D> systemd-boot_259.10.bb} |  0
>  .../systemd-systemctl-native_259.10.bb        | 39 ++++++++++++
>  .../systemd/systemd-systemctl-native_259.5.bb | 29 ---------
>  meta/recipes-core/systemd/systemd.inc         |  2 +-
>  ...use-traffic-from-the-local-host-only.patch | 61 ------------------
>  ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 -------------------
>  .../{systemd_259.5.bb =3D> systemd_259.10.bb}   | 12 ++--
>  .../modutils-initscripts.bb                   | 10 ---
>  scripts/postinst-intercepts/update_udev_hwdb  | 18 +++---
>  13 files changed, 55 insertions(+), 223 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D>
> systemd-boot-native_259.10.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D>
> systemd-boot_259.10.bb} (100%)
>  create mode 100644 meta/recipes-core/systemd/
> systemd-systemctl-native_259.10.bb
>  delete mode 100644 meta/recipes-core/systemd/
> systemd-systemctl-native_259.5.bb
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from=
-the-local-host-only.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessing-wi=
thout-EFI.patch
>  rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_259.10.b=
b}
> (99%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250424):
> https://lists.openembedded.org/g/openembedded-core/message/250424
> Mute This Topic: https://lists.openembedded.org/mt/122311943/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b7b2e90660ffec3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"auto"><span>Tested on Wrynose with QEMU (qemux86=
-64).</span></p><p dir=3D"auto"><span>Build completed successfully, and OEQ=
A runtime testing reported:<br><br></span>RESULTS:<br>RESULTS - ping.PingTe=
st.test_ping: PASSED (0.04s)<br>RESULTS - ssh.SSHTest.test_ssh: PASSED (0.7=
8s)<br>RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.59=
s)<br>RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.20=
s)<br>RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (1.10s)=
<br>RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0=
.60s)<br>RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED=
 (0.77s)<br>RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_min=
idebuginfo:<br>SKIPPED (0.00s)<br>RESULTS - systemd.SystemdServiceTests.tes=
t_systemd_disable_enable: SKIPPED<br>(0.00s)<br>RESULTS - systemd.SystemdSe=
rviceTests.test_systemd_disable_enable_ro:<br>SKIPPED (0.00s)<br>RESULTS - =
systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)<br>RESULTS=
 - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED<br>(0.00s)<=
br>SUMMARY:<br>core-image-minimal () - Ran 12 tests in 5.091s<br>core-image=
-minimal - OK - All required tests passed (successes=3D7,<br>skipped=3D5, f=
ailures=3D0, errors=3D0)<br>NOTE: Tasks Summary: Attempted 1341 tasks of wh=
ich 1339 didn&#39;t need to be<br>rerun and all succeeded.<br><br></p><p><s=
pan>The skipped tests were due to unmet prerequisites.</span></p><p><span>T=
ested-by: Vijay Anusuri </span><span>&lt;<a href=3D"mailto:vanusuri@mvista.=
com">vanusuri@mvista.com</a>&gt;<br><br><br></span></p><p><span>Thanks &amp=
; Regards,<br></span></p><p><span>Vijay</span></p><p dir=3D"auto"><br></p><=
br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Nov 17, 2026 at 5:21=E2=80=AFPM Jaipaul Ch=
eernam via openembedded-core &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.t=
ech@lists.openembedded.org">est.tech@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Drop systemd-s=
ystemctl-native rename patches from v1<br>
<br>
<br>
Jaipaul Cheernam (1):<br>
=C2=A0 systemd: Upgrade 259.5 -&gt; 259.10<br>
<br>
Ross Burton (7):<br>
=C2=A0 keymaps: remove obsolete systemd masking<br>
=C2=A0 initscripts: remove obsolete systemd masking<br>
=C2=A0 modutils-initscripts: remove obsolete systemd masking<br>
=C2=A0 systemd: move systemd-systemctl-native PACKAGE_WRITE_DEPS to<br>
=C2=A0 =C2=A0 <a href=3D"http://systemd.bb" rel=3D"noreferrer" target=3D"_b=
lank">systemd.bb</a><br>
=C2=A0 classes/systemd: remove obsolete DEPENDS<br>
=C2=A0 systemd-systemctl-native: add systemd-hwdb<br>
=C2=A0 systemd: no need to use qemu for hwdb update<br>
<br>
=C2=A0meta/classes-recipe/systemd.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 -<br>
=C2=A0meta/recipes-bsp/keymaps/<a href=3D"http://keymaps_1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">keymaps_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
7 -----<br>
=C2=A0.../initscripts/<a href=3D"http://initscripts_1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">initscripts_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 26 --------<br>
=C2=A0...<a href=3D"http://259.5.bb" rel=3D"noreferrer" target=3D"_blank">2=
59.5.bb</a> =3D&gt; <a href=3D"http://systemd-boot-native_259.10.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd-boot-native_259.10.bb</a>} |=C2=A0 0=
<br>
=C2=A0...<a href=3D"http://d-boot_259.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">d-boot_259.5.bb</a> =3D&gt; <a href=3D"http://systemd-boot_259.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_259.10.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../<a href=3D"http://systemd-systemctl-native_259.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">systemd-systemctl-native_259.10.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 39 ++++++++++++<br>
=C2=A0.../systemd/<a href=3D"http://systemd-systemctl-native_259.5.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_259.5.bb</a> | 2=
9 ---------<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0...use-traffic-from-the-local-host-only.patch | 61 ------------------=
<br>
=C2=A0...il-fix-PCR-bank-guessing-without-EFI.patch | 62 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://systemd_259.5.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_259.5.bb</a> =3D&gt; <a href=3D"http://systemd_259.10.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_259.10.bb</a>}=C2=A0 =C2=A0| 1=
2 ++--<br>
=C2=A0.../<a href=3D"http://modutils-initscripts.bb" rel=3D"noreferrer" tar=
get=3D"_blank">modutils-initscripts.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ---<br>
=C2=A0scripts/postinst-intercepts/update_udev_hwdb=C2=A0 | 18 +++---<br>
=C2=A013 files changed, 55 insertions(+), 223 deletions(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot-nati=
ve_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_259.5=
.bb</a> =3D&gt; <a href=3D"http://systemd-boot-native_259.10.bb" rel=3D"nor=
eferrer" target=3D"_blank">systemd-boot-native_259.10.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_259.=
5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_259.5.bb</a> =3D&gt=
; <a href=3D"http://systemd-boot_259.10.bb" rel=3D"noreferrer" target=3D"_b=
lank">systemd-boot_259.10.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-systemctl-native_259.10.bb" rel=3D"noreferrer" target=3D"_blank">systemd-=
systemctl-native_259.10.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-systemctl-native_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-s=
ystemctl-native_259.5.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-reso=
lve-refuse-traffic-from-the-local-host-only.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-f=
ix-PCR-bank-guessing-without-EFI.patch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_259.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_259.5.bb</a> =3D&gt; <a href=
=3D"http://systemd_259.10.bb" rel=3D"noreferrer" target=3D"_blank">systemd_=
259.10.bb</a>} (99%)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#250424): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/250424" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/250424</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122311943/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122311943/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b7b2e90660ffec3a--
