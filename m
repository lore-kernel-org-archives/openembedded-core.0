Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19863.1793110872668453044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 07:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CAgwk8OI;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6798af41644so2854795d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 07:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793110872; cv=none;
        d=google.com; s=arc-20260327;
        b=odzAaHT3CAfFJqJCBDzwJWkawP2fV6EEbiXW6xdOXOoSCsvLfsoMJmp5M7vuoVakFp
         Y0+t8/6o24Sq3808OHIKb+Gdb49x2nytcrPQic8s8LuzeJpoUzCjGN9ef9WzFCTmBo8x
         r82Ia/e3n+R6BE3+8C0GQRdZPJv45J4NLrRjhOX2yHsONwSV8mraGr6F/LavQRsv+nCb
         Y64xAx7fW+BebX3uVEJ0oJwyoF84qOZFf/ZaEWwg5keMjq1hOTLXMxswPGQINUHrZQyX
         +hkdIoGhAf5sq68J47YdTJx3brQ0b5Ly6MVAMmPOzmnKSqvbcIrd6AID5w6RiMcWG9ZO
         RjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DLmOe0DJ+6bB8/A7zic550cNgaVR95GYb8lFJWRPNZQ=;
        fh=ZnbCn4tju4GffNAZBrxjoOyYgysXbyM6jsp9/JTS04M=;
        b=pKyZzhl7nXjEV+API9A/ISB1DphZ4RhKYlAyyfma7B+YnGN2wSjr0nq+VKDsyIVXaL
         QMXUxn4Vq9VCB6/UYAyKWqHS1n1JV6ux8g1zPz+wIRAcfn2Gd/2aaZOCkxcR7LRQ7bhX
         qzgccW4sJXCRdtmMvkfcHc+HQJ5ebLO8cbXlKDSUmWATmo1/K09dwGiO8FW3K+Ycgc5I
         GNVhublQcimILIsWicNsxL5UE2mjMbeINiLmFBfgxqLFJfW6yw45dl2EDoNUVvN0OUyi
         FYP8nzKL7aeN7T5V0S18TXEH49xj4Skzoja0LHWs0E+mKE/USq9hL6d+qj56LqVrKnVc
         9A7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793110872; x=1793715672; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLmOe0DJ+6bB8/A7zic550cNgaVR95GYb8lFJWRPNZQ=;
        b=CAgwk8OIjuPB5/05Y4ve+g/noLrouxqZZDISg5RlAPGlvTKh7EISEwf/Q8tLq3F6Cc
         Pu5imGwwzyNmB/IP8IWvDcxpnxyeN0tUfrzstE919WLwYk2LH8ir1b430wr3Ygrwc+I9
         o/45gCHuPQUrMsHTbmPqt6fEoSA1JqztHB46OxOjAlmwGJjCdv74Pq43Amf5pvOqDqbs
         VqdgfG0NcvrmYKxDSLOq/ZCaFABSuUuwQdbQcN8KEkjasNFRJyCI1kOlPRaZWHThULde
         bY7htDNVRLB9GeLO2FkxQtIif3bv7LCZplHztYRHJJsiJV6QeUO9T7kITSW/XEz/AGxl
         gFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110872; x=1793715672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DLmOe0DJ+6bB8/A7zic550cNgaVR95GYb8lFJWRPNZQ=;
        b=czlMQKgMLondEGQ50UXP90cREK+ul+EA2cJsqrujad+xoEBikUAiF94RSKdGuB50eE
         ZpDCJEllMb4F22cv3GVuLbcjkAoLUnZ9GeVM6ZZ6Fr2t80bE492+yoYx+jyroNQkzfDj
         RJPGfAQJzQOAqs0g1tc56n7zxHnhqdB+ikadbrQ/1ksXWO2edEOThPW79gxjoLqYxXB6
         pkj9RRYNd+dCSVNjk/aWZFenayV0SSdmF+D3t8vw0nC+eqpF9uanoGmk8Oa27EQBSlbE
         DX/Kdr545LKOxg03A2DIRViC9lPQmqTYNyu6NcbYhNcPGuikFLBXVg1d80FN8AaJYYWo
         fEww==
X-Forwarded-Encrypted: i=1; AKwUvByUXAQXRjm+PCBygZy8G41RNTC99gnk5U8rt98sbAmTEEq3tdGRZajAG/wKO7sPSuWhtW15LzwxqC/40RuuwG9gEg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL54RcgiVL71jOkKNFP/kh1t3ezZNjF9SEsa7R9u26LgcyWxVEW
	rTgXp1mWpAJJSb73NcXDS1ExGH1wl0yFo2pOlht/+Z2Alv+ieTLDU3SLP40AYNWihrjyIOvopGy
	aJJc8dksvOUYu74djTw+I483q80BYi8A=
X-Gm-Gg: AYBFou33/7QZkLo8uLEI3uvfc+2+1cGFkNXN+clxKtulbv0i8mFQ90QYm1SqR0tqVWY
	r54YTNxe0lWfb4xqH/Kc9mLHsA7XV1E/hYfs2aBU/eDyv/xQUfviSP8FOtVdUerSmRB1hmuC37i
	rpDmYsx6aLPXL6rb+kWYVa3JqU9FJiCOPUEeQNBj9UZT1WdVgtDR2FR5dRSHyxY334TMG4UxnBf
	j3EDFWQyoB2xqRmowVyUX/9eE9wqkuLtnOZtBRdhhX5g9Lu69eTqGQjoyKXCUxMaSK3/Ji2pD65
	JgErT4BtUaxxjP3uC6Qv9B96qUq6ddQIJ5rd+O2tvA+qE4aj8OWIUUeCAR00t6lp3q9fogB2zr0
	oXMfHcuiLMLoIWaGVAbpOJxdPJrI1CP335o/X3yiFrQq9tMA16Ao=
X-Received: by 2002:a53:c290:0:b0:671:1c5e:9977 with SMTP id
 956f58d0204a3-67a4549f3dcmr5595520d50.97.1793110871287; Tue, 27 Oct 2026
 07:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com> <20261026214627.2388650-6-JPEWhacker@gmail.com>
 <auBRnwhMKmTkFpQB@nuoska> <CADWMC-ZECNTJQ8MZBB+=2sNPj1qJUZrx2tZ8HmEDNiAAnG0LSw@mail.gmail.com>
In-Reply-To: <CADWMC-ZECNTJQ8MZBB+=2sNPj1qJUZrx2tZ8HmEDNiAAnG0LSw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 27 Oct 2026 08:20:58 -0600
X-Gm-Features: AclHuK_WMCtiouEWOmTe6vACZ16qaTUjS8UxWD9hPQ_v__HqzSGs5dubHmTn9CM
Message-ID: <CAJdd5GY3w+9HvxKO6zxcOMxUgt_Qyr9eydBai_D6CdNL17Ozsw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 5/6] Add SPDX deploy tasks to various recipes
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000086ad41065ed32841"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 14:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248749

--00000000000086ad41065ed32841
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 6:03=E2=80=AFAM Jose Quaresma <
jose.quaresma@oss.qualcomm.com> wrote:

>
>
> On Tue, Oct 27, 2026 at 7:24=E2=80=AFAM Mikko Rapeli via lists.openembedd=
ed.org
> <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
>> On Mon, Oct 26, 2026 at 03:45:25PM -0600, Joshua Watt via
>> lists.openembedded.org wrote:
>> > Adds SPDX deploy tasks to many recipes to record their output when
>> > consumed in an SBoM
>>
>> I think this should be the default in deploy.bbclass.
>>
>
> I also think that would be preferable, rather than having to spread the
> SPDX_DEPLOY_TASKS all over the place.
> Everything that will use SPDX_DEPLOY_TASKS must already be using
> the deploy.bbclass.
>

I'm fine with that. I will make that change


>
> Jose
>
>
>> The class is used to deploy files to "build output". A lot of BSP etc
>> recipes use the class for this purpose and they are currently missing in
>> SPDX
>> output unless some output packages go to image rootfs.
>>
>> I think capturing too much data in SPDX is less of a problem than not
>> capturing
>> enough. Thus deploy.bbclass should support SPDX output by default, when
>> SPDX
>> is enabled.
>>
>> If there are other very good reasons for not enabling this by default,
>> then
>> I think the commit message should say that.
>>
>> Cheers,
>>
>> -Mikko
>>
>> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> > ---
>> >  meta/classes-recipe/barebox.bbclass           | 1 +
>> >  meta/classes-recipe/devicetree.bbclass        | 1 +
>> >  meta/classes-recipe/kernel-fit-image.bbclass  | 1 +
>> >  meta/classes-recipe/kernel.bbclass            | 1 +
>> >  meta/recipes-bsp/grub/grub-efi_2.14.bb        | 1 +
>> >  meta/recipes-bsp/opensbi/opensbi_1.9.bb       | 1 +
>> >  meta/recipes-bsp/u-boot/u-boot.inc            | 1 +
>> >  meta/recipes-core/systemd/systemd-boot_262.bb | 2 +-
>> >  8 files changed, 8 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes-recipe/barebox.bbclass
>> b/meta/classes-recipe/barebox.bbclass
>> > index 3980849b53..252e97fa65 100644
>> > --- a/meta/classes-recipe/barebox.bbclass
>> > +++ b/meta/classes-recipe/barebox.bbclass
>> > @@ -165,5 +165,6 @@ barebox_do_deploy () {
>> >          fi
>> >  }
>> >  addtask deploy after do_compile
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> >
>> >  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
>> > diff --git a/meta/classes-recipe/devicetree.bbclass
>> b/meta/classes-recipe/devicetree.bbclass
>> > index 4fe389bed8..affbf115c2 100644
>> > --- a/meta/classes-recipe/devicetree.bbclass
>> > +++ b/meta/classes-recipe/devicetree.bbclass
>> > @@ -166,6 +166,7 @@ devicetree_do_deploy() {
>> >      done
>> >  }
>> >  addtask deploy before do_build after do_install
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> >
>> >  EXPORT_FUNCTIONS do_compile do_install do_deploy
>> >
>> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
>> b/meta/classes-recipe/kernel-fit-image.bbclass
>> > index 7b2bcd4673..d0f7274e70 100644
>> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
>> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
>> > @@ -260,3 +260,4 @@ do_deploy() {
>> >      fi
>> >  }
>> >  addtask deploy after do_compile before do_build
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> > diff --git a/meta/classes-recipe/kernel.bbclass
>> b/meta/classes-recipe/kernel.bbclass
>> > index 0a6d754108..14c71dec54 100644
>> > --- a/meta/classes-recipe/kernel.bbclass
>> > +++ b/meta/classes-recipe/kernel.bbclass
>> > @@ -840,6 +840,7 @@ kernel_do_deploy() {
>> >  do_deploy[prefuncs] +=3D "read_subpackage_metadata"
>> >
>> >  addtask deploy after do_install do_populate_sysroot do_packagedata
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> >
>> >  EXPORT_FUNCTIONS do_deploy
>> >
>> > diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb
>> b/meta/recipes-bsp/grub/grub-efi_2.14.bb
>> > index d19b33b504..8d8671614a 100644
>> > --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
>> > +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
>> > @@ -99,6 +99,7 @@ do_deploy() {
>> >  }
>> >
>> >  addtask deploy after do_install before do_build
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> >
>> >  FILES:${PN} =3D "${libdir}/grub/${GRUB_TARGET}-efi \
>> >                 ${datadir}/grub \
>> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
>> b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
>> > index 96167f7c73..bb35f906b2 100644
>> > --- a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
>> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
>> > @@ -49,6 +49,7 @@ do_deploy () {
>> >  }
>> >
>> >  addtask deploy before do_build after do_install
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> >
>> >  FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump=
.*"
>> >  FILES:${PN} +=3D
>> "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
>> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>> b/meta/recipes-bsp/u-boot/u-boot.inc
>> > index b9f61a185c..1c9911ff6e 100644
>> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> > @@ -474,3 +474,4 @@ uboot_deploy_spl () {
>> >  }
>> >
>> >  addtask deploy before do_build after do_compile
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> > diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb
>> b/meta/recipes-core/systemd/systemd-boot_262.bb
>> > index bab2e7ae27..c9bc3e2a91 100644
>> > --- a/meta/recipes-core/systemd/systemd-boot_262.bb
>> > +++ b/meta/recipes-core/systemd/systemd-boot_262.bb
>> > @@ -71,4 +71,4 @@ do_deploy () {
>> >  }
>> >
>> >  addtask deploy before do_build after do_compile
>> > -
>> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
>> > --
>> > 2.56.0
>> >
>>
>> >
>> >
>> >
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#248711):
>> https://lists.openembedded.org/g/openembedded-core/message/248711
>> Mute This Topic: https://lists.openembedded.org/mt/121950655/10043485
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> jose.quaresma@oss.qualcomm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000086ad41065ed32841
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27,=
 2026 at 6:03=E2=80=AFAM Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@=
oss.qualcomm.com">jose.quaresma@oss.qualcomm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Oct 27, 2026 at 7:24=E2=80=AFAM Mikko Rapeli via <a hr=
ef=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.o=
rg</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembedded.o=
rg" target=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Oct 26, 2026=
 at 03:45:25PM -0600, Joshua Watt via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; Adds SPDX deploy tasks to many recipes to record their output when<br>
&gt; consumed in an SBoM<br>
<br>
I think this should be the default in deploy.bbclass.<br></blockquote><div>=
<br></div><div>I also think that would be preferable, rather than having to=
 spread the</div><div>SPDX_DEPLOY_TASKS=C2=A0all over the place.</div><div>=
Everything that will use SPDX_DEPLOY_TASKS=C2=A0must already be using</div>=
<div>the deploy.bbclass.</div></div></div></blockquote><div><br></div><div>=
I&#39;m fine with that. I will make that change</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div><br></div><div>Jose</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
The class is used to deploy files to &quot;build output&quot;. A lot of BSP=
 etc<br>
recipes use the class for this purpose and they are currently missing in SP=
DX<br>
output unless some output packages go to image rootfs.<br>
<br>
I think capturing too much data in SPDX is less of a problem than not captu=
ring<br>
enough. Thus deploy.bbclass should support SPDX output by default, when SPD=
X<br>
is enabled.<br>
<br>
If there are other very good reasons for not enabling this by default, then=
<br>
I think the commit message should say that.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/barebox.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 meta/classes-recipe/devicetree.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 meta/classes-recipe/kernel-fit-image.bbclass=C2=A0 | 1 +<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a> | 2 +-<br>
&gt;=C2=A0 8 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe=
/barebox.bbclass<br>
&gt; index 3980849b53..252e97fa65 100644<br>
&gt; --- a/meta/classes-recipe/barebox.bbclass<br>
&gt; +++ b/meta/classes-recipe/barebox.bbclass<br>
&gt; @@ -165,5 +165,6 @@ barebox_do_deploy () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 addtask deploy after do_compile<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy<br=
>
&gt; diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-rec=
ipe/devicetree.bbclass<br>
&gt; index 4fe389bed8..affbf115c2 100644<br>
&gt; --- a/meta/classes-recipe/devicetree.bbclass<br>
&gt; +++ b/meta/classes-recipe/devicetree.bbclass<br>
&gt; @@ -166,6 +166,7 @@ devicetree_do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 addtask deploy before do_build after do_install<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_compile do_install do_deploy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/class=
es-recipe/kernel-fit-image.bbclass<br>
&gt; index 7b2bcd4673..d0f7274e70 100644<br>
&gt; --- a/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; @@ -260,3 +260,4 @@ do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 addtask deploy after do_compile before do_build<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index 0a6d754108..14c71dec54 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -840,6 +840,7 @@ kernel_do_deploy() {<br>
&gt;=C2=A0 do_deploy[prefuncs] +=3D &quot;read_subpackage_metadata&quot;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy after do_install do_populate_sysroot do_packageda=
ta<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_deploy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a> b/meta/recipes-b=
sp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D"noreferrer" target=3D"_b=
lank">grub-efi_2.14.bb</a><br>
&gt; index d19b33b504..8d8671614a 100644<br>
&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a><br>
&gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a><br>
&gt; @@ -99,6 +99,7 @@ do_deploy() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy after do_install before do_build<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN} =3D &quot;${libdir}/grub/${GRUB_TARGET}-efi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir=
}/grub \<br>
&gt; diff --git a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb=
" rel=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a> b/meta/recipes-bs=
p/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=3D"noreferrer" target=3D"_b=
lank">opensbi_1.9.bb</a><br>
&gt; index 96167f7c73..bb35f906b2 100644<br>
&gt; --- a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a><br>
&gt; +++ b/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a><br>
&gt; @@ -49,6 +49,7 @@ do_deploy () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_install<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN} +=3D &quot;/share/opensbi/*/${RISCV_SBI_PLAT}/firmwa=
re/fw_jump.*&quot;<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot;/share/opensbi/*/${RISCV_SBI_PLAT}/firmwa=
re/fw_payload.*&quot;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-b=
oot/u-boot.inc<br>
&gt; index b9f61a185c..1c9911ff6e 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; +++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; @@ -474,3 +474,4 @@ uboot_deploy_spl () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_compile<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_=
262.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-boot_262.bb</a><br>
&gt; index bab2e7ae27..c9bc3e2a91 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a><br>
&gt; @@ -71,4 +71,4 @@ do_deploy () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_compile<br>
&gt; -<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt; -- <br>
&gt; 2.56.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248711): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248711" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248711</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121950655/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121950655/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000086ad41065ed32841--
