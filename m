Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 41C7273D17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:45:57 +0000 (UTC)
Received: by iofh134 with SMTP id h134so117696594iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iECeC1IpocnuC7xSBTOQBhvhqC32zifeVThzNa5mDsk=;
	b=zuVCcEg3p8RfvCldnziZ5d8TUlxq90l8QYrSnsgDJss7eMKtQLLg/3gySgF1oAXpHa
	N8fN/7OJ2xwtAu0hDnSVv9pJs7ieMQiHgLJwRZiBn3iUaFUV2QFXL4Vvpzjcrh95fX20
	iEH7MSXPcK+1dh5M3Ya+n1iqNNNofbFHyGJl6c93V3LSYnMN+iNnGmwkuVqdwCk1LiqF
	2H0cZfqJlK1cCqS/Pam4EX9SFw0sIeLLMv0OU8G3nG2FLjgffK53G1TUzSz/NgfTgedP
	5Fu1C64s+/Or+WPB2AvNME9Nukhyr8OG3azK3bGRms5IPRO5r6mPdmiiJQ5RU1cfZEbx
	tqNQ==
MIME-Version: 1.0
X-Received: by 10.107.31.135 with SMTP id f129mr30884498iof.8.1442839557685;
	Mon, 21 Sep 2015 05:45:57 -0700 (PDT)
Received: by 10.107.200.67 with HTTP; Mon, 21 Sep 2015 05:45:57 -0700 (PDT)
In-Reply-To: <55FFF8A7.1090809@gmail.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
	<CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com>
	<55FFF8A7.1090809@gmail.com>
Date: Mon, 21 Sep 2015 14:45:57 +0200
Message-ID: <CAB3asfgbPBqEJ9YWmGahb7U28ZNrAJf+8MA7WxQictFxVdqgfw@mail.gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 12:45:59 -0000
Content-Type: multipart/alternative; boundary=001a1140a2d04dc8fa0520414348

--001a1140a2d04dc8fa0520414348
Content-Type: text/plain; charset=UTF-8

Hi,

On Beaglebone-black Systemd 215 does not boot if compiled with -O2.
Compiling with -O1 works.

Regards,
Adrian

2015-09-21 14:31 GMT+02:00 Jonathan Liu <net147@gmail.com>:

> On 21/09/2015 10:23 PM, Burton, Ross wrote:
>
>
> On 21 September 2015 at 12:23, Jonathan Liu <net147@gmail.com> wrote:
>
>> +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
>>
>
> Are these bugs with the gcc optimisations or the systemd source code, and
> if its gcc's fault are the problematic optimisations specific to a
> particular architecture (such as ARM)?  Just wondering if we can use
> overrides to only change the optimisations where they're a problem.
>
> Ross
>
> I am not sure how to isolate if it's an issue in the systemd source code
> but the issue is not present when using GCC 4.9.
> Haven't checked if this is occuring on other architectures. Any feedback
> whether this occurs on other platforms (Raspberry Pi 2 is ARMv7) is welcome.
>
> Regards,
> Jonathan
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1140a2d04dc8fa0520414348
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br>On Beaglebone-black Systemd 215 does =
not boot if compiled with -O2. Compiling with -O1 works.<br></div><br>Regar=
ds,<br></div>Adrian<br></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">2015-09-21 14:31 GMT+02:00 Jonathan Liu <span dir=3D"ltr">&lt;<=
a href=3D"mailto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&g=
t;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div>On 21/09/2015 10:23 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On 21 September 2015 at 12:23,
            Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:net147@gma=
il.com" target=3D"_blank">net147@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div style=3D"overflow:hidden">+FULL_OPTIMIZATION
                +=3D &quot;-fno-schedule-insns -fno-schedule-insns2&quot;<b=
r>
              </div>
            </blockquote>
          </div>
          <br>
          Are these bugs with the gcc optimisations or the systemd
          source code, and if its gcc&#39;s fault are the problematic
          optimisations specific to a particular architecture (such as
          ARM)?=C2=A0 Just wondering if we can use overrides to only change
          the optimisations where they&#39;re a problem.</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">Ross</div>
      </div>
    </blockquote>
    I am not sure how to isolate if it&#39;s an issue in the systemd source
    code but the issue is not present when using GCC 4.9.<br>
    Haven&#39;t checked if this is occuring on other architectures. Any
    feedback whether this occurs on other platforms (Raspberry Pi 2 is
    ARMv7) is welcome.<br>
    <br>
    Regards,<br>
    Jonathan<br>
  </div>

<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a1140a2d04dc8fa0520414348--
