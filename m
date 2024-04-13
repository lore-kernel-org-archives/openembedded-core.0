Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108E9C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 00:12:25 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.1526.1712967135721605363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 17:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfV+MFdj;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a50880ce2aso863729eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 17:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712967135; x=1713571935; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWcTI+IJCtQvhk/Fdtxf3eHE1neg3daV4jzgopr3xfI=;
        b=cfV+MFdjAb19bx6HDI0r1ftxBREiBqBqdHp5uvmW8Gy5SQMbuvELCpnDuEgfTEUhqz
         HCYcd/xswx4UgrxBjyy57StXjbpVibN40Mb7TKuNcdxnsyaSqYrftD8C30/9i4rYlN5B
         7CiuW8iAErAEzhD/wCcXMzn2geasrTiSZ2V1A+cGM0Hi66ggHTvkK+bK+zpz1mjjp65m
         eKw7y2wqEq37sDh4XKId5tlEWZg1+Bt05j3DkakvLY0aaK4qskTWMjKAqLrvChPvb2O/
         zzQxjLaHUkRDc1leTuJUw+bgBnEZa8fxxbnFC+tr5jXpj/Js4KqJ1P+rZnM5q+nf9AAU
         H0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967135; x=1713571935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWcTI+IJCtQvhk/Fdtxf3eHE1neg3daV4jzgopr3xfI=;
        b=SvH/BAmCpMQDTdxiBLEXnVEv01YyFtQW7ZC+nQgbQ7/DMWxobZNkhJXHWKIIFOpUnb
         K1Pf0q2nIVOdRyP2v8yosSVbTgsR/Y3+5iCorK4ZvjXOVPBYf3urwH0OLYGAnLzDE4cf
         WqqUm5sNF7Hf/OYxuGzdoJau0RgOAVz0qrC+Ekbwhfrc7RrThr0j0+gpMRM9qAK4iUnY
         64z7Y/2e+0P02reYMlzoROIAnkgz0ORDRkwarFr4DFdXdJRK6dVCw++fVx+qPAVjVv15
         jJ1MmZKTEP95WwpiUvfr8mIdTwoDhknSa/1FYZTxcKV3riTMu7zodTypQzN52ocfLu+S
         mZFQ==
X-Gm-Message-State: AOJu0YzDKC4oqPPMmkABFqpCE4GLu+2c3ULn43s6f136w9gOLPyxvMZM
	0veItmiDHu7h74HKH5/vkzdgxlxVP8ew0g9Apspi2YwxUKBR4VYwlCiNSLJ8XGzYer2hQB+geRX
	NaI5AE2YQvmDB/cX0uXBRxVq5gYk=
X-Google-Smtp-Source: AGHT+IH8aLH0u4csnnjNV0YX5uI2rhovOIjXzGpR4aekHOIz6QPownGhQb9629YB21NugF6ls94x3E+s8avibdEG2oE=
X-Received: by 2002:a05:6870:1587:b0:22a:6d7f:6171 with SMTP id
 j7-20020a056870158700b0022a6d7f6171mr4817305oab.36.1712967134609; Fri, 12 Apr
 2024 17:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240412165714.8951-1-peter.marko@siemens.com> <20240412165714.8951-3-peter.marko@siemens.com>
In-Reply-To: <20240412165714.8951-3-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Apr 2024 17:11:48 -0700
Message-ID: <CAMKF1sq2rFfTEMfDUcfDu5fYiWcVBSfM_Y+wpUt7eHUrdHeqGg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] kbd: remove non-free Agafari fonts
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 00:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198189

ERROR: Logfile of failure stored in:
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/kbd/2.6.4/temp/log.do_p=
atch.613
ERROR: Task (/mnt/b/yoe/master/sources/poky/meta/recipes-core/kbd/kbd_2.6.4=
.bb:do_patch)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1114 tasks of which 1108 didn't need to
be rerun and 1 failed.

On Fri, Apr 12, 2024 at 9:58=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Its license makes it impossible to distribute kbd
> in any commercial products.
> Backport commit which removes it.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../0001-Remove-non-free-Agafari-fonts.patch  | 336 ++++++++++++++++++
>  meta/recipes-core/kbd/kbd_2.6.4.bb            |   3 +
>  2 files changed, 339 insertions(+)
>  create mode 100644 meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafar=
i-fonts.patch
>
> diff --git a/meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts=
.patch b/meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch
> new file mode 100644
> index 0000000000..99a8fec9d8
> --- /dev/null
> +++ b/meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch
> @@ -0,0 +1,336 @@
> +From b757e6842f9631757f0d1a6b3833aabffa9ffeee Mon Sep 17 00:00:00 2001
> +From: Alexey Gladkov <legion@kernel.org>
> +Date: Thu, 29 Feb 2024 17:38:37 +0100
> +Subject: [PATCH] Remove non-free Agafari fonts
> +
> +Based on legal analysis, we are removing non-free fonts for now. If we
> +can change the license of these fonts, we will return them back.
> +
> +From: Stanislav Brabec <sbrabec@suse.com>
> +Date: Wed, 28 Feb 2024 16:47:54 +0100
> +Subject: kbd: Legal problems of Agafari fonts
> +
> +    The data/consolefonts/README.Ethiopic contains a notice:
> +    Agafari:
> +      Donated by the Ethiopian Science and Technology Commission
> +      <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redist=
ributed
> +      for non-commercial use under Unix environments only.
> +
> +    According to our legal review, it makes impossible to distribute the=
se
> +    fonts as part of any commercial products, and even makes it impossib=
le to
> +    distribute kbd sources as part of any commercial product services.
> +
> +    Additionally, it makes the whole kbd package incompatible with GPL, =
so the
> +    COPYING file (created during build of the tarball) cannot declare GP=
L
> +    version 2. It also violates section 6 of GPL (no further restriction=
s).
> +
> +    That is why several GNU/Linux distributions exclude Agafari from the
> +    release. To be on a safe side, SUSE even decided to repack any sourc=
e
> +    tarballs before putting it to their servers.
> +
> +    This was probably reported to the former kbd maintainer about 20 yea=
rs ago,
> +    but nothing changed over years.
> +
> +    That is why I recommend removing Agafari fonts and removing the refe=
rence
> +    to them from README.Ethiopic. Alternatively, you can ask the Ethiopi=
an
> +    Science and Technology Commission for re-licensing.
> +
> +Signed-off-by: Alexey Gladkov <legion@kernel.org>
> +
> +Upstream-Status: Backport [https://github.com/legionus/kbd/commit/b757e6=
842f9631757f0d1a6b3833aabffa9ffeee]
> +
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + data/consolefonts/Agafari-12.psfu | Bin 7989 -> 0 bytes
> + data/consolefonts/Agafari-14.psfu | Bin 9013 -> 0 bytes
> + data/consolefonts/Agafari-16.psfu | Bin 10037 -> 0 bytes
> + data/consolefonts/README.Ethiopic |   5 -----
> + 4 files changed, 5 deletions(-)
> + delete mode 100644 data/consolefonts/Agafari-12.psfu
> + delete mode 100644 data/consolefonts/Agafari-14.psfu
> + delete mode 100644 data/consolefonts/Agafari-16.psfu
> +
> +diff --git a/data/consolefonts/Agafari-12.psfu b/data/consolefonts/Agafa=
ri-12.psfu
> +deleted file mode 100644
> +index 3c8e796b19e676b2d9addc540e1d9507da620c02..000000000000000000000000=
0000000000000000
> +GIT binary patch
> +literal 0
> +HcmV?d00001
> +
> +literal 7989
> +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
> +V!!zpj=3DTBiTVxnKdzK*@D{uc?@c;5g3
> +
> +diff --git a/data/consolefonts/Agafari-14.psfu b/data/consolefonts/Agafa=
ri-14.psfu
> +deleted file mode 100644
> +index fb14184855a9ae874d0bbe7f16feb4154e2f15e7..000000000000000000000000=
0000000000000000
> +GIT binary patch
> +literal 0
> +HcmV?d00001
> +
> +literal 9013
> +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
W7^y
> +z3r-uMWZJ&Fikh0F3o}n$Ik~p)u6?{1-uCtR`TD$;EDH5(zPz5~n-Or{L~YMkn>6HV
> +z5Y*>oN3mL?v5Sq#dbW8Ro}pthTd?=3Dmotfv_`oi37(Cdkf9wG`;iF&-OyQrdSJ`&E7
> +z)<wa!Mumc=3D{aNrV6>Qp{MAQ^Dnp?2F*4OMjl$e8rgOezXULhY{UC3v(EMMkn^JSjg
> +z-N<JIDbHtZSw0s<@{KDpw=3D&OMQ@&i&d<Ct{FMe4)<rD4fnQw|RklxKbm5<q~M~odm
> +zax<rIkS&>>R}BO2=3D)5hdCv$UVU7}?5>{;Bt{M2PR?rap615vH&qHrH7#LUkswK`|d
> +z1|`VMe47lKoePnzr#A?RuPw8hZK%7ks7>0bH;=3DrXdA-^^ht=3D4VmS!#6kUq;}deu9R
> +zWQDe<cI>D;$uzYd<3-1LUQe0WjvYOE46XeD#TQe-)}>55G1cG9`@=3DorO8L^4u&MUo
> +zHJaLn*gDp06U9Y&_OnkPIif%JlJARO+)79}|1`>@kCIKss8Daqx3f#p(frgUf8~t<
> +z_Cc%C(wUWOI<pF%rHN--XO?)LJwrWe%g&d_3?`n~WNV+;$md;?FV{3*K@$e&Y4eFT
> +z$(Py4(3^PLeC0Yndg)G^@8!DFy1jgZ_kLy%6GY~2hxdM_f%F-*)mEv`*YmxcIBqY;
> +zGuz8`_VHWR+L~EV&q}b!_c__mGTU%y_`OavwPkl&?oqg&`!CK-?nGQZ*4AF%FDHq&
> +zYtI*6MI+9=3DayKp3b5~Y^iKo@%);iJTyPSW{)17KrJ$wF%#!rb_tfzbV?dA0(%z+i|
> +zS^5TljJI;;nR|!r**9UQty@0Y{SAdSDUN;2+2ej}^-7(fV9PW<#nbog16vEfEqN4M
> +z$;I^jm7zaeaoV^q7uhe%J2_v?N^R-##>Mthjj!^cE$39Q=3D#3Ad@gEgZs@9WX>GXSp
> +zj(GB~-7NdFx6})o&m6Ee?L_x=3Dg%g(<@$RbFIt|*WMZU^|+bg=3DJtn=3DM+!5H4_q6~+x
> +z5AU6ta+<6^nR71ekYPEn;IumPKz>TV2E$kmS-Md9TFvWc_|E~~dXnp{x+iLs#`5w}
> +zmf}Ecp1-_%$8fk~_p(eZ=3D}DR?|J`G|SO2;$^rq*VYt4CHQnkoe9$2Nmu%Ox0^{cO(
> +zGNVU6hrDb?%TFRtA)iJbGo$X~X7unQNQ^A=3D>^`K697UcUEk8rGlV<eL3!{gK@NjqZ
> +z@cm|V=3Do3^tX->ajPJad)K8KDVA448Q9zZ^7Mu$H&N{D#q<G4JBoHW}{KQ`)iN8N*?
> +z?tP=3D~2S?reN8JyNx`#&H50AQsN8NDLjYi#P&3BtOo41%9=3D6lRd=3D6lV}=3DKIX|n;$=
T5
> +zH9u&6$o#OWm>)5>m^t&K=3D51!)>@-#LW9IGV$4$-LYU*Z}xy}59*=3D>H({FM1=3D^E2jW
> +z&Ci*iH}5dNVBTroWq#58lKExxE9O_tubE#rzhQpU{FeD`^E>8t^SkEv%<r2&Fn?$Q
> +z^GD_mvtZtB_Lzp*Ywk3EY~EwuYntXRbGO-N7R{fSd(6G&edbTilKC^!GVeEkZuXnD
> +z`GDz|QF0&uv-!W4ONYDW(&2;1eaHuq`;iYJhmgZah(t(?BuI+<1@aN(qsYgQ2apGm
> +zk0YNz9zq^Q9zm9ozeFBIK8gGl^4G|xkjId}K^{jwjXZ%oi9CgT204QKEpilj8hHl!
> +zEOHEa7CDam9r7IV_s9w4dE^D;MdT&qACS)>FC!<BQ^@C$SIngl_7L_E_7L_E_7L_E
> +z_7L_E?hx(}?hx(}-Vojp-Vojp-Vojp-VoLh&JfNJ&JfNJz7W0;z7W0;z7W0;z7W0;
> +zz7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0$z6ibu
> +zz6ibuz6ibuz6ibuz6ibuz6ibuz6ibuz6ibuz6ibuzKHRRV2l{g2+j!32+j!3i1CaV
> +z&j{WK-U!|Z-U!|Z-U!|Z-U!|Z-U!|Z-U!|Z-U!|Z)(FlB&Iry3&IrB;z6ibuz6ibu
> +zz6ib;wivD$t{AQut{A46`5MC&!xh67!xb}MW7uNYV%TEXV%TEXV%TE1Vz^?sVz^?s
> +zVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sV#YCsEoK~J_+t2C_+t2C
> +z#xZ6bV>n|tV>n|tV>n|tW8q{R6Ic_*k>z|Tfj5CSfj40slMf?sCvYclCvYclCvYcl
> +zCvYb)Com^4Com`QvK?MZ;7#C7;7#C7;7wpnU`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U=
`=3D36
> +zU`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D67V=
NGF8VNGF8VNGF8
> +z;Y{I7;Y{I7;Y{I7;Y>e*z?w3~DZDAXDZDAXDPx>6e^a<qxKp@OI8!)NI8!)NI8!)N
> +zI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!*&ljf^09!FkA
> +N<ohY)^T;dazX7esFwg)1
> +
> +diff --git a/data/consolefonts/Agafari-16.psfu b/data/consolefonts/Agafa=
ri-16.psfu
> +deleted file mode 100644
> +index a9f9395ac423f6887c102a1278d4be5a7657388e..000000000000000000000000=
0000000000000000
> +GIT binary patch
> +literal 0
> +HcmV?d00001
> +
> +literal 10037
> +zcmeI1>ysSURlpkw#-=3DinL{UX`yqnP`5yn7(!An*{7>|Sq5Q2HX&8xBEkx9nZVuxjd
> +zCZm<2Y}Btj?8NqBLyTiPLUv?f<Oi`7Pie`xpjOt06sxU_kfotY$_L8Xs!&89mbv`S
> +zeRTIIuHp}XTXkmV^f~vO`@8R+z2~|2EqIhE<U8cc2G85VACc=3Dt|F+US@Wg=3Dwrxp(!
> +z=3Do(X34U}5CqLkG=3DuQj4{Y7#=3D1EwxTj_3QO3SFZSe-J1P+m&&=3D$V_bY=3DRk~bRk=
_1xp
> +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
o6U1
> +zQnVjCdi0pqJNHq1F^}2jDMf$Gjkn8##ywJj^0lvNyVmc&M%VU%ws(#128!0DJ<ojc
> +zsUt`1e?-Xt)vs<Lym{Z%@gIJe>}Gtuy#D6zCV(DKexPNDni7xSHJQKdYTK^YOt<T$
> +z;9n~GckFr<|FdVPZ`W(VKPdWR*9R8=3Dk0NuP-@7J%rrZ1lUDgW?Htlu!MK9)ecD#B;
> +zf0w`9m^1r%@qE(fMRq=3D|^ZOC=3DO)nRjzTIX+7J%tr;%IxdG1HLv%*;AlDtk(HKH;CA
> +zPkQO`%k1i^+HL)-!7SRe*?*mVFi`p*OrmRh{(iyTlnUqmTka3cpC(tf)z#Pbnf>0|
> +zamQC)K_}w9VwT?ziuLWQ17VH7(dF%-sEcOKf9s!}=3DdQjx|3&8~b6q5#=3D<<UH_oklH
> +zB^qV_5)b+#{R_}Be$UbK*Z#iIbHA5Zea-PpjB5)mwXnv*Nox;V^inq%vpb!?#@qMJ
> +zBcsWPd7BIIOyw-T?=3DKDf!IINQeR(7Ky8M{KS8$i=3DbC=3DgIcIN7QMdx9s#nBwhdZPuc
> +z^Z!CAHRn(Fbo;&KuJNZ*r&abVH#f#~pUI@-@u7QM{z`m4^yGSf&FI}GP1nWatG0J<
> +ztLnw<{O^_<+2G!+{$TLh;NFcJGhLRSOlIe=3D28`$a-I?BCLdmaD+72K8>5<}i+O6v+
> +z`FEV}{K@@Jy_ws1&Beu|>;=3DolPIoWv+BO($+qI})7j^g3e)%UY&CiSLaL=3D2VX|1+q
> +z<i`tBMB$NB8@qSw^rpf$UOuIU4}A%FNevgDK%PWCk36b|^N*?FgAXAwvdFW8$UJfs
> +zd1|=3D$G}TV3;RDYPA0Wbm^TP)Zso}zBsd!SIeqNpa0ycaWjv${#?nmxJKBb0-KQ~N>
> +zxbPWVo<&Zosnd@R=3DjVs>2Zr+phw~pD&L0}ie{49vFr5GRaQ^UcJ{-<R!}({_+tl0D
> +zJJdGy{pv>b1L`LAgX)LW536^oA5lN5eoR%>kE@&2wE7A4E;XaJtD5>r^=3D|c3s;+KP
> +z4Yfn<R6nhDsh?5rQ9rAGPW`-kulfb`KJ|<0R`pBjm({PRUsb=3DReqH^B`c3s)>bKSJ
> +zsNYq;r*2cful_*&q532B$0|^NqHb5a)%(>Qs;Ty<JJp}652z2Smby#bt@f%}^=3DIlH
> +zb+7u6`g1j>{zA3Yht*%IeX65AqPl9B98~{Hxpa75T{?UKIf#4|IfQ%+SwIdWArc`m
> +zk{~Ja3FMQ=3Dr;tx0_aXNqpFuv0Jb*liJcKMFe}z1ZJc9f+@;AumkVlcfMIJ*wk35b%
> +zfjo(P0Xc&F9dZ<T3V9m&B619Q204!WJ@PE_56B7RIplfd1>{BKACWI1FCiz9Q^=3DQ*
> +zm(`^Z_7L_E_7L_E_7L_E_7L_E?hx(}?hx(}-Vojp-Vojp-Vojp-VoLh&JfNJ&JfNJ
> +zz7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;z7W0;
> +zz7W0;z7W0;z7W0$z6ibuz6ibuz6ibuz6ibuz6ibuz6ibuz6ibuz6ibuz6ibuzKHRR
> +zV2l{g2+j!32+j!3i1CaV&j{WK-U!|Z-U!|Z-U!|Z-U!|Z-U!|Z-U!|Z-U!|Z)(FlB
> +z&Iry3&IrB;z6ibuz6ibuz6ib;wivD$t{AQut{A46`5MC&!xh67!xb}MW7uNYV%TEX
> +zV%TEXV%TE1Vz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?sVz^?s
> +zV#YCsEoK~J_+t2C_+t2C#xZ6bV>n|tV>n|tV>n|tW8q{R6Ic_*k>z|Tfj5CSfj40s
> +zlaC{CCvYclCvYclCvYclCvYb)Com^4Com`QvK?MZ;7#C7;7#C7;7wpnU`=3D36U`=3D36
> +zU`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U`=3D36U=
`=3D36U`=3D36U`=3D36
> +zU`=3D67VNGF8VNGF8VNGF8;Y{I7;Y{I7;Y{I7;Y>e?z?w3~DZDAXDZDAXDPx>6e^a<q
> +zxKp@OI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)NI8!)N
> +dI8!)NI8!*&lj<8U97kS4<ohY)%gD>>e*j()bEN<P
> +
> +diff --git a/data/consolefonts/README.Ethiopic b/data/consolefonts/READM=
E.Ethiopic
> +index 7502722..2810797 100644
> +--- a/data/consolefonts/README.Ethiopic
> ++++ b/data/consolefonts/README.Ethiopic
> +@@ -14,11 +14,6 @@ Ethiopic fonts:
> +      restrictions below:
> +
> +
> +-Agafari:
> +-  Donated by the Ethiopian Science and Technology Commission
> +-  <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistrib=
uted
> +-  for non-commercial use under Unix environments only.
> +-
> + Goha and GohaClassic:
> +   Donated by Yitna Firdyiwek <ybf2u@virgina.edu> of GohaTibeb Associate=
s
> +   and may be redistributed without restriction under the GNU GPL 2.0.
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-core/kbd/kbd_2.6.4.bb b/meta/recipes-core/kbd/k=
bd_2.6.4.bb
> index 1a7b6b552b..3bc7d1c6b4 100644
> --- a/meta/recipes-core/kbd/kbd_2.6.4.bb
> +++ b/meta/recipes-core/kbd/kbd_2.6.4.bb
> @@ -14,7 +14,10 @@ RPROVIDES:${PN} =3D "console-tools"
>  RCONFLICTS:${PN} =3D "console-tools"
>
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> +           file://0001-Remove-non-free-Agafari-fonts.patch \
>             "
> +#required for binary patch 0001-Remove-non-free-Agafari-fonts.patch
> +PATCHTOOL =3D "git"
>
>  SRC_URI[sha256sum] =3D "519f8d087aecca7e0a33cd084bef92c066eb19731666653d=
cc70c9d71aa40926"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198181): https://lists.openembedded.org/g/openembedde=
d-core/message/198181
> Mute This Topic: https://lists.openembedded.org/mt/105486424/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

