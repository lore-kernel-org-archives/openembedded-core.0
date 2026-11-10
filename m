Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1189.1794340345243625504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 11:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Wn/kG/yd;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ef011e338so14468006d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 11:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794340344; cv=none;
        d=google.com; s=arc-20260327;
        b=U6emFcVpPJPUPmtfRd7+FjpnDfzohxqUL+AbGSUv/GNbPmWuDAa85RqNA1GKV47Aai
         KCgzM5VxDjdT19neDsiFyHBlqF04CgsbHwby9cUayyI4J/QDjyslRRWTB53ggwxpV0hm
         pJFKU2030TBiUTyg1w05XRjNrfLUDXMp1CbPm7OPx2eh87DWhKH2he1RCg11ecFsvY2s
         hcCRgGajuvbK8j8DQhCJ9l+ZVGza3LlxlX/g5ht1yg4lzM1gMkBM9+attX+cIG/kb60N
         f3PvmGQOprbR4uuFjVZL7WSN6nvY3a+pAbUc0trEgGz/lddDLm6rVQeLpkyzcblIRv+g
         /lqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7XII1ro2eZ6Vmi/w183kuRmI7M7wZD14j4/T49df1qE=;
        fh=u4AhVPk7rxAv3b/o9FwSkah9tvaol20sZG10FPZH3SY=;
        b=KnlYcBQibqFAPbmQ2WetkFyYza7OBAf4Uk6LkjsCatbfSGKjCysX0cPX6pIRF8LJiU
         yu1iF6uK19diuCQSkuX2qnyWOP/xKcEiX3u9xWOtXyDek5hITVryiTSqm7rxvGXDZ/96
         RCMOzS6j9S8k+aRr1rR0mRAqfyV77ROkqf1PkrepCjn1GM/dmkeM3cJJ8g77VazJRKW1
         c61OwrgZ3ayrwYR4WBdGxKMQKTWmPGr7zalJ82of5O4GQghL4dS9G2/r+O7NHyVkoTbm
         iS55XHKlgEJ5R+ZPGPf6Fwo31fAnIJ0u2qKt/El57rIi7roWtrJRT44+YbHjWCjPTTu3
         q1Lg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340344; x=1794945144; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XII1ro2eZ6Vmi/w183kuRmI7M7wZD14j4/T49df1qE=;
        b=Wn/kG/ydBiOWgWcjEojEnGRc8eHgT6VyvFLworpI4lf11BbKVg7H9vpz8Uwe1Fh/cP
         i72J4K7HAt1vFpo9cTsFmmHNbVH3tICZA/R6Ew2TDHxOvSQmm5UjQw4jZSXPf6DmraFA
         2rysjNwEkDVX+RKeQDEw/ipGInFQNfLFpcm3vZoBcDRdZgPQ8SecTYy2La4YvPyEsPic
         XmxuuzTRfPzaudXvAC0vpZuUpvwKAOXbyhsq646VD8dJAtDhHVAer5yx3vj8l8QJZnAx
         2V10L5biDAtxoG7L9v/MVK13OTN7KbJpEHd75Pidmnj1x9j+WxpPYVkLzpe1OQDx5JQc
         I7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340344; x=1794945144;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7XII1ro2eZ6Vmi/w183kuRmI7M7wZD14j4/T49df1qE=;
        b=K+vxL/yjJE+JwnhYZmTVNhcZcaaW6GUgMeb6keQw4QhvocmvfxvVkWyOBdnu4j2UFO
         dns89xJ1iZeoZ/2t4GkkI+dTRH0gGqKjZxoOIAw7t8ufqs+S4pJTa6AGwMn5oUOZXjiX
         SwGaVy3gLkZF06jVjy7rSdDLzPuAUWhsrAvGgb7TNx2lGK9xeYilnfKBDTJeG+/2fhoh
         p9DqlAkbjXrIXuMFjwiHwLUCex26veGguowzmDp1Wh/ultsBw057Y2EgfnObi7klSey0
         vQFPayTFDyNpvEKli/Bf3KBIfqh8LtrzE7hfFdP/wn0/ob1RLwctrpjVDua6Hj9z3JwL
         assg==
X-Forwarded-Encrypted: i=1; AL+hErHlW0JNB75sO8crJlJjErElsGcXA1ryrEgjA7dzEdz1xzbyOB9sKvkqEfgy1KLTFlT9lCx/3e8O44kmFSKDwwr/gQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8hUR4Q6gJUxYj6YvblnejYM6AJ9GW4EK1WUWXBbBFrtfdQWiJO
	qq/DMAdMRCaAhj9AxBcb2CZNYjR84FGSop6/jPYZG9mNKre+vTYFq81kCopdcVcKYdfDznCujxE
	aUGfOO9oKGEE0MZ7Uxg21JL/uZQACCvY=
X-Gm-Gg: AYBFou0JYg78OaKQjLTAA5K66q7M5OMebeuVoHU/k//eJiGkBC8hfHqm5SzGSxNREo1
	eIVdu0i3+5Oyn8Wd497tWjan9hxi9rU+uq8Mn7sUCY+kXO045nD9iJR7+doJq3SH7LudjjgBcei
	m4jRZwTKrFnH5BHTVIo96Y9MGHE7aa/vwf2VFQ8YYOTLwgwJeCuvKj+fv5Mm649Uk2jttUgzfsr
	5o3UwkYCvotZGYxuVmvgmo4Vomg/dC+w5rBPBieTSpqi/Z7GZuSB5cBODu0VZzbrXKc9pbw3QbZ
	LMI0tkeEBKNUJyfntbGeDjY+uYYSX6blvsrC69xy46NM/aEVzzkURW2Yttol3Ry44FOqelF8jH/
	d3y5LU9OiZl9aLb5FwLgT07WEDKxEOj03s6eBNvgeqsGaPAmYh+m3DIMfMzh9SWIoO84JzOcmLp
	0fLj6N5yVr7RRMXyfm
X-Received: by 2002:a05:6214:5d91:b0:91e:92b0:5828 with SMTP id
 6a1803df08f44-91f04024690mr6819036d6.20.1794340343882; Tue, 10 Nov 2026
 11:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20261029093738.1507-2-jose.quaresma@oss.qualcomm.com>
 <1905cd5a-760f-4f3e-99af-4aea68136154@windriver.com> <CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZD-mZrQ4B5G_4Sfxcvxow@mail.gmail.com>
 <1cd5c40a-0ce2-439c-9591-0a2826419e6c@windriver.com>
In-Reply-To: <1cd5c40a-0ce2-439c-9591-0a2826419e6c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Nov 2026 20:52:12 +0100
X-Gm-Features: AclHuK9OB47_K5RhTwhVIel5PpSXXN4fE7WmV71AA3K7BOSbh7DU6v9Fwr5mvw0
Message-ID: <CANNYZj8ofVme7N90hVVCr2irOySqTxL-CdgMNG+eeTdNuWxPPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] igt-gpu-tools: fix build on non-x86 platforms
To: randy.macleod@windriver.com
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>, 
	"Mahajan, Ajay" <Ajay.Mahajan@windriver.com>, openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000cda9f6065ff16a37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 19:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249932

--000000000000cda9f6065ff16a37
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 20:43, Randy MacLeod via openembedded-core
<randy.macleod=windriver.com@lists.openembedded.org> wrote:

> Thanks for the fix. When people were discussing it on the YP patch review
>> call today,
>> the question arose: Why didn't the YP autobuilder catch this error and
>> are there more
>> inline assembly issues that we are not testing and catching at build time
>> ?
>>
>
> Taking a quick look at the layer, I observe that this tool is not a
> dependency of any other
> package, nor is it included in any image.
>
> However, it should be included in the bitbake world building.
> I don't know if it will be excluded due to some setting.
>
>
> Yeah, that's a bit odd.
>
If I remember right world builds are only targeting x86 and 32 bit x86. Arm
(or risc-v) builds only build particular images, and that's perhaps why
this fail wasn't exposed by the AB.

Alex

--000000000000cda9f6065ff16a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 10 Nov 2026 at 20:43, Randy MacLe=
od via openembedded-core &lt;randy.macleod=3D<a href=3D"mailto:windriver.co=
m@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrot=
e:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><u></u>

 =20
 =20

   =20
 =20
  <div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Thanks for th=
e fix. When people were discussing it on
                the YP patch review call today,=C2=A0</div>
              <div>the question arose: Why didn&#39;t the YP autobuilder
                catch this error and are there more<br>
                inline assembly issues that we are not testing and
                catching at build time ?<br>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div><span style=3D"background-color:transparent">Taking a quick
              look at the layer, I observe=C2=A0</span><span style=3D"backg=
round-color:transparent">that this tool is not
              a dependency of any other</span></div>
          <div><span style=3D"background-color:transparent">package</span><=
span style=3D"background-color:transparent">, nor is it included
              in any image.</span></div>
          <div><br>
          </div>
          <div>However, it should be included in the bitbake world
            building.</div>
          <div>I don&#39;t know if it will be excluded due to some setting.=
</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Yeah, that&#39;s a bit odd.</p></div></blockquote><div>If I remember=
 right world builds are only targeting x86 and 32 bit x86. Arm (or risc-v) =
builds only build particular images, and that&#39;s perhaps why this fail w=
asn&#39;t exposed by the AB.</div><div><br></div><div>Alex=C2=A0</div></div=
></div>

--000000000000cda9f6065ff16a37--
