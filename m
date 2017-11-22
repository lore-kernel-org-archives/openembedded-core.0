Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4E54B78522
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 15:09:49 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 33so15301089qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 07:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=42h39hyo34BxZEVdkE3DOAw7CSI2Wk+taCB4FgIvxJE=;
	b=Bo17t9Ub3Cx11sdSu7uE9mVWstdrjsQXFoUPD+GoX1/Ing65FrBeBWECS9aL5oEfgE
	eP+qsya2d/TBJJk7N7t/IwT4wET35QhMK3SZcJ1XcFQrRVQrQArcnjbYiMl9MTVscSiD
	7LAiFPzLZavW7N5hwuhRLg10YD7UCuOBojcMrQlMEdpWHlx1Yz8ls2hIeqhWv6Q9KtvW
	E7ZKi4wUpFGpYnk3dutMsV7loEH8P6UbwS391o4MRB/Qrpfo6jirrcqxZy/UUuepizZl
	Zm/K0uNycfUDmsioPWmmdolN8LasxTpc+7ccfXYwUggksj91VJyBexqj9ogWoTV/heUB
	i20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=42h39hyo34BxZEVdkE3DOAw7CSI2Wk+taCB4FgIvxJE=;
	b=kJszDo1CnkSVmX7pANcBWb1spw7Tv7PU1XDEDrDqPiofKT8WIkFXyfzAxHJZSbwMrm
	HsbS1+ZSx27Fdr2NsBCMF8ilGyvD+mLKRUZ+y+kzCykRZIU0+Hb6Gpy6k/hYqnLrxFbE
	gpPhE1WLMB0gC7BXPWg8loI8ZSSzFODgevLVleuGBVqAMW1EHOtjkSc6XF3ky+9Z8eV/
	G0XRDzfAaIbIzQ6j0gLPH24wBLN8v4sgyc4VHPPb6MYFXtPipgwQ6VVcrNYYdqI0GZAI
	/q3ZHQez04lSrOzkTqB1XfgTXmuVdtl90swPfGSKt/iQ82i+E4tbtQWw9d9ijRNQ3/d7
	eIGw==
X-Gm-Message-State: AJaThX5qoTO15szKTbb2wxvHwjmaLlXWA1LUWaCMyEk2tagvnu0EsAmi
	S1boE0szWcDY0Q3I7ygYdlBDQ1DWMc5Tatoe72c=
X-Google-Smtp-Source: AGs4zMaAfXUW/AR1mnSrysGyYB6aDCJsN9dALIOTsNhH/UaD1rmNW1Tguws8rXLP3acnSCwPkj5ml9jEz7RDxCQrj+Q=
X-Received: by 10.200.4.44 with SMTP id v44mr34079680qtg.80.1511363391167;
	Wed, 22 Nov 2017 07:09:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Wed, 22 Nov 2017 07:09:50 -0800 (PST)
In-Reply-To: <f5d2f302-55a0-f48a-7ece-e7b38235f7ea@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
	<CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
	<a738dbce-f217-54a3-c633-7945dafd462e@windriver.com>
	<CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com>
	<f5d2f302-55a0-f48a-7ece-e7b38235f7ea@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Nov 2017 10:09:50 -0500
Message-ID: <CADkTA4OCsE=g3OJL+p1rbXz1ghy6e7G7_8dEdWcdS_s+jxa-_w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Wed, 22 Nov 2017 15:09:50 -0000
Content-Type: multipart/alternative; boundary="f4030435488c0ea118055e93b638"

--f4030435488c0ea118055e93b638
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 10:36 PM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> On 2017=E5=B9=B411=E6=9C=8821=E6=97=A5 19:31, Burton, Ross wrote:
>
> On 21 November 2017 at 07:00, Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
>> 1. Tweak kernel-cache to remove CONFIG_IDE for all available bsp.
>>     It require necessary test to prove it is safe to remove it.
>>     If the test is OK, I will send patch to yocto mailing list.
>>
>
> I know you have your own huge autobuilder framework inside WR but I'll
> happily throw a patch against oe-core at the public autobuilders for extr=
a
> testing.
>
>
> No problem, I would like the public autobuilders.
>
> But there several banners:
>
> 1. I do not have account on public autobuilder
>     https://autobuilder.yocto.io/
>
>     Maybe I should ask Michael or Joshua for help
>
> 2. The fix is on kernel-cache, not directly on oe-core,
>     So it is difficult to use autobuilder
>
>    Maybe I should ask Bruce for help
>


If you send a change for the kernel configuration, I can merge it, but not
activate it (i.e. I won't send SRCREV bumps), so as long as the autobuilder
can build a branch, we can queue this part of the change for testing.

Bruce


>
> 3. Most importantly, how to test, when find a way,
>     the ideally is to add the test case to oe-core's
>     meta-selftest
>
>    I should do some investigation on the storage test.
>
> So I think I should do 3 first, and then 1/2 later
>
> //Hongxu
>
> Ross
>
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f4030435488c0ea118055e93b638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 21, 2017 at 10:36 PM, Hongxu Jia <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <div class=3D"m_1074109284556209376moz-cite-prefix">On 2017=E5=B9=B411=
=E6=9C=8821=E6=97=A5 19:31, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">On 21 November 2017 at 07:00, Hongxu Jia <span dir=
=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">=
hongxu.jia@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span>
                  <div class=3D"m_1074109284556209376m_-1761857646591655639=
moz-cite-prefix">1.
                    Tweak kernel-cache to remove CONFIG_IDE for all
                    available bsp.<br>
                  </div>
                </span> =C2=A0=C2=A0=C2=A0 It require necessary test to pro=
ve it is
                safe to remove it.<br>
                =C2=A0=C2=A0=C2=A0 If the test is OK, I will send patch to =
yocto
                mailing list.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I know you have your own huge autobuilder framework
              inside WR but I&#39;ll happily throw a patch against oe-core
              at the public autobuilders for extra testing.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    No problem, I would like the public autobuilders.<br>
    <br>
    But there several banners:<br>
    <br>
    1. I do not have account on public autobuilder<br>
    =C2=A0=C2=A0=C2=A0 <a class=3D"m_1074109284556209376moz-txt-link-freete=
xt" href=3D"https://autobuilder.yocto.io/" target=3D"_blank">https://autobu=
ilder.yocto.io/</a><br>
    <br>
    =C2=A0=C2=A0=C2=A0 Maybe I should ask Michael or Joshua for help<br>
    <br>
    2. The fix is on kernel-cache, not directly on oe-core,<br>
    =C2=A0=C2=A0=C2=A0 So it is difficult to use autobuilder<br>
    <br>
    =C2=A0=C2=A0 Maybe I should ask Bruce for help<br></div></blockquote><d=
iv><br></div><div><br></div><div>If you send a change for the kernel config=
uration, I can merge it, but not</div><div>activate it (i.e. I won&#39;t se=
nd SRCREV bumps), so as long as the autobuilder</div><div>can build a branc=
h, we can queue this part of the change for testing.</div><div><br></div><d=
iv>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"=
#000000" bgcolor=3D"#FFFFFF">
    <br>
    3. Most importantly, how to test, when find a way,<br>
    =C2=A0=C2=A0=C2=A0 the ideally is to add the test case to oe-core&#39;s=
 <br>
    =C2=A0=C2=A0=C2=A0 meta-selftest<br>
    <br>
    =C2=A0=C2=A0 I should do some investigation on the storage test.<br>
    <br>
    So I think I should do 3 first, and then 1/2 later<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>Ross=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--f4030435488c0ea118055e93b638--
