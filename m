Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95508EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 19:56:31 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.23857.1687636586196529319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 12:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a1a12e95b1so1538314b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 12:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687636585; x=1690228585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJyMmag+pt9oWzjpcXxcPvyX9UDSrDkPUkPCBSpCGek=;
        b=a5j+U1YfmA85L1Otb01/FViPO1Cj3zGr6qkqpgS/erpxRI088yLVqvIp+SqplKszs+
         bk+MdewgGAHir2GFKxv7/ZSl/W2J4AmyIpFOILVcwRErtd8WMb9XDHCnm8dAEh2VvAE4
         JzJSk+EpN5ttQ49EoXMyLchG+eWtRM7grvjkRp3LWbjvXJ8tto0JaDAfONuwDxYhZlSS
         RGo/9/Cvu5LWjUurNBRpex5QAAL5mm69EsaHz6Vtq18sJYH+YAJa9EYr3eFti1+k3xFd
         fVnVtYiFsmWOxax/t0bgBwLDH7coRnV1H6XXKpKnQNjA0vL0Pf8ogz9rN45OtPH6cys6
         kTqw==
X-Gm-Message-State: AC+VfDwr1zpbyvnVW/HqBTzNsup8S5AvaVstUkG0UTsgm/pDOpJoJrtb
	5+Jme6CT+17LODPnaf9yw20J1NtkkP+Wqw==
X-Google-Smtp-Source: ACHHUZ61D4CMo3A3dEMM9/0gtUnRYCQB0O9B8b+yOiieyBw6cxpoC3lUYuiSAg7x8k5KXi87h1L1HQ==
X-Received: by 2002:a05:6808:448a:b0:39f:f42c:863 with SMTP id eq10-20020a056808448a00b0039ff42c0863mr9300862oib.6.1687636585048;
        Sat, 24 Jun 2023 12:56:25 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id i23-20020a4adf17000000b00558b60a9d27sm931649oou.25.2023.06.24.12.56.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 12:56:24 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39bcba263efso2070691b6e.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 12:56:24 -0700 (PDT)
X-Received: by 2002:a05:6808:21a7:b0:3a0:5b48:3db0 with SMTP id
 be39-20020a05680821a700b003a05b483db0mr6414944oib.15.1687636584480; Sat, 24
 Jun 2023 12:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230622170946.10082-1-adrian.freihofer@siemens.com> <20230622170946.10082-10-adrian.freihofer@siemens.com>
In-Reply-To: <20230622170946.10082-10-adrian.freihofer@siemens.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sat, 24 Jun 2023 13:56:13 -0600
X-Gmail-Original-Message-ID: <CAHMutrZ5LAk4aoyZ_Z4MukZ_PCQ7+U7hH8xwFANHkdwacMjTbg@mail.gmail.com>
Message-ID: <CAHMutrZ5LAk4aoyZ_Z4MukZ_PCQ7+U7hH8xwFANHkdwacMjTbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] runqemu: configurable tap names
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000020c58c05fee5830c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 19:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183363

--00000000000020c58c05fee5830c
Content-Type: text/plain; charset="UTF-8"

Hello,

I hate to be the bearer of bad news, but I just discovered an issue on my
CI regarding this patch (or this patch series), this happens when trying to
run testimage (with no pre-existing tap devices):

runqemu - INFO - Setting up tap interface under sudo
Traceback (most recent call last):
File "/home/vsts/poky/scripts/runqemu", line 1723, in main
config.setup_network()
File "/home/vsts/poky/scripts/runqemu", line 1242, in setup_network
self.setup_tap()
File "/home/vsts/poky/scripts/runqemu", line 1205, in setup_tap
tapnum = int(tap[len(oe_tap_name):])
ValueError: invalid literal for int() with base 10: 'ning: uid parameter is
ignored. It is no longer needed.\ntap0'
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 768.79

Not quite sure if these are two different issues or one is a consequence of
the other though:

/home/vsts/poky/scripts/runqemu-ifdown: line 59: (Warning: uid parameter is
ignored. It is no longer needed. 0 * 2) + 1 : missing `)' (error token is
": uid parameter is ignored. It is no longer needed. 0 * 2) + 1 ")
/home/vsts/poky/scripts/runqemu-ifdown: line 60: (Warning: uid parameter is
ignored. It is no longer needed. 0 * 2) + 2 : missing `)' (error token is
": uid parameter is ignored. It is no longer needed. 0 * 2) + 2 ")
iptables v1.8.7 (nf_tables): host/network `192.168.7.' not found

Alejandro



On Thu, 22 Jun 2023 at 11:11, Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> Support the new environment variable OE_TAP_NAME.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  scripts/runqemu | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index bd1f8366b63..e1aa5a925c8 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1159,7 +1159,11 @@ to your build configuration.
>          logger.debug('Running %s...' % str(cmd))
>          ip_link = subprocess.check_output(cmd).decode('utf-8')
>          # Matches line like: 6: tap0: <foo>
> -        possibles = re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link,
> re.M)
> +        oe_tap_name = 'tap'
> +        if 'OE_TAP_NAME' in os.environ:
> +            oe_tap_name = os.environ['OE_TAP_NAME']
> +        tap_re = '^[0-9]+: +(' + oe_tap_name + '[0-9]+): <.*'
> +        possibles = re.findall(tap_re, ip_link, re.M)
>          tap = ""
>          for p in possibles:
>              lockfile = os.path.join(lockdir, p)
> @@ -1198,7 +1202,7 @@ to your build configuration.
>              logger.error("Failed to setup tap device. Run
> runqemu-gen-tapdevs to manually create.")
>              sys.exit(1)
>          self.tap = tap
> -        tapnum = int(tap[3:])
> +        tapnum = int(tap[len(oe_tap_name):])
>          gateway = tapnum * 2 + 1
>          client = gateway + 1
>          if self.fstype == 'nfs':
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183286):
> https://lists.openembedded.org/g/openembedded-core/message/183286
> Mute This Topic: https://lists.openembedded.org/mt/99702224/3619605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alejandro@enedino.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000020c58c05fee5830c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><font face=3D"monospace">Hello,</font></div><div class=3D"gma=
il_default" style=3D"font-size:small"><font face=3D"monospace"><br></font><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><font face=3D"m=
onospace">I hate to be the bearer of bad news, but I just discovered an iss=
ue on my CI regarding this patch (or this patch series), this happens when =
trying to run testimage (with no pre-existing tap devices):</font></div><di=
v class=3D"gmail_default" style=3D"font-size:small"><font face=3D"monospace=
"><br></font></div><div class=3D"gmail_default" style=3D"font-size:small"><=
div class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-abs=
olute gmail-focused" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"r=
owContent-88" style=3D"box-sizing:border-box;overflow:hidden;width:1736px;h=
eight:20px"><div class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" st=
yle=3D"box-sizing:border-box;display:flex;padding:0px 12px"><span class=3D"=
gmail-line-area gmail-flex-center gmail-flex-row gmail-flex-grow gmail-just=
ify-start" role=3D"group" style=3D"box-sizing:border-box;display:flex"><spa=
n class=3D"gmail-content" style=3D"box-sizing:border-box;word-break:break-a=
ll;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl-plain" style=
=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box"><span id=
=3D"gmail-rowContent-88" style=3D"box-sizing:border-box"><font face=3D"mono=
space">runqemu - INFO - Setting up tap interface under sudo
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-89" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-89" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">Traceback (most recent call last):
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-90" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-90" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">  File &quot;/home/vsts/poky/scripts/runqemu&quot;, line =
1723, in main
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-91" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-91" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">    config.setup_network()
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-92" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-92" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">  File &quot;/home/vsts/poky/scripts/runqemu&quot;, line =
1242, in setup_network
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-93" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-93" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">    self.setup_tap()
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-94" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-94" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">  File &quot;/home/vsts/poky/scripts/runqemu&quot;, line =
1205, in setup_tap
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-95" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-95" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">    tapnum =3D int(tap[len(oe_tap_name):])
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-96" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-96" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">ValueError: invalid literal for int() with base 10: &#39;=
ning: uid parameter is ignored. It is no longer needed.\ntap0&#39;
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-97" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-97" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">runqemu - INFO - Cleaning up
</font></span></span></span></span><span class=3D"gmail-link" style=3D"box-=
sizing:border-box;height:20px;margin-right:25px"><font face=3D"monospace"><=
span aria-hidden=3D"true" class=3D"gmail-fontSizeM gmail-flex-noshrink gmai=
l-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;font-size=
:0.875rem;display:inline-flex"></span></font></span></span></div></div><div=
 class=3D"gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolu=
te" tabindex=3D"-1" role=3D"treeitem" aria-labelledby=3D"rowContent-98" sty=
le=3D"box-sizing:border-box;overflow:hidden;width:1736px;height:20px"><div =
class=3D"gmail-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing=
:border-box;display:flex;padding:0px 12px"><span class=3D"gmail-line-area g=
mail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start" role=
=3D"group" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmai=
l-flex-noshrink gmail-flex-self-start gmail-line" role=3D"treeitem" style=
=3D"box-sizing:border-box;text-align:right;padding-left:20px;min-width:33px=
"></span><span class=3D"gmail-content" style=3D"box-sizing:border-box;word-=
break:break-all;margin-left:20px;margin-right:12px"><span class=3D"gmail-pl=
-plain" style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x"><span id=3D"gmail-rowContent-98" style=3D"box-sizing:border-box"><font f=
ace=3D"monospace">runqemu - INFO - Host uptime: 768.79
</font></span></span></span></span></span></div></div></div><div class=3D"g=
mail_default" style=3D"font-size:small"><font face=3D"monospace"><br></font=
></div><div class=3D"gmail_default" style=3D"font-size:small"><font face=3D=
"monospace">Not quite sure if these are two different issues or one is a co=
nsequence of the other though:</font></div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><font face=3D"monospace"><br></font></div><div class=
=3D"gmail_default" style=3D"font-size:small"><font face=3D"monospace">/home=
/vsts/poky/scripts/runqemu-ifdown: line 59: (Warning: uid parameter is igno=
red. It is no longer needed. 0 * 2) + 1 : missing `)&#39; (error token is &=
quot;: uid parameter is ignored. It is no longer needed. 0 * 2) + 1 &quot;)=
<br>/home/vsts/poky/scripts/runqemu-ifdown: line 60: (Warning: uid paramete=
r is ignored. It is no longer needed. 0 * 2) + 2 : missing `)&#39; (error t=
oken is &quot;: uid parameter is ignored. It is no longer needed. 0 * 2) + =
2 &quot;)<br>iptables v1.8.7 (nf_tables): host/network `192.168.7.&#39; not=
 found<br></font></div></div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><font face=3D"monospace"><br></font></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><font face=3D"monospace">Alejandro</font></d=
iv><div><br></div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, 22 Jun 2023 at 11:11, Adrian Freihofer &=
lt;<a href=3D"mailto:adrian.freihofer@gmail.com">adrian.freihofer@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Support the new environment variable OE_TAP_NAME.<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index bd1f8366b63..e1aa5a925c8 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -1159,7 +1159,11 @@ to your build configuration.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#39;Running %s...&#39; % st=
r(cmd))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ip_link =3D subprocess.check_output(cmd).=
decode(&#39;utf-8&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Matches line like: 6: tap0: &lt;foo&gt;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 possibles =3D re.findall(&#39;^[0-9]+: +(tap[0=
-9]+): &lt;.*&#39;, ip_link, re.M)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_tap_name =3D &#39;tap&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;OE_TAP_NAME&#39; in os.environ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_tap_name =3D os.environ[&#39;=
OE_TAP_NAME&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_re =3D &#39;^[0-9]+: +(&#39; + oe_tap_name=
 + &#39;[0-9]+): &lt;.*&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 possibles =3D re.findall(tap_re, ip_link, re.M=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for p in possibles:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockfile =3D os.path.join(l=
ockdir, p)<br>
@@ -1198,7 +1202,7 @@ to your build configuration.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;Failed t=
o setup tap device. Run runqemu-gen-tapdevs to manually create.&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tap =3D tap<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tapnum =3D int(tap[3:])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tapnum =3D int(tap[len(oe_tap_name):])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gateway =3D tapnum * 2 + 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client =3D gateway + 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.fstype =3D=3D &#39;nfs&#39;:<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183286): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183286" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183286</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99702224/3619=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99702224/3619605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alejandro@enedino.org" tar=
get=3D"_blank">alejandro@enedino.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000020c58c05fee5830c--

