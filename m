Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.22876.1631491692357606447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 17:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id DD7FA368F;
	Mon, 13 Sep 2021 02:07:27 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.99]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mPZVN-26Hbeb0; Mon, 13 Sep 2021 02:07:26 +0200
Subject: Re: [oe-core][PATCH] util-linux: disable raw
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20210912171919.3090505-1-f_l_k@t-online.de>
 <CAMKF1soU-jZ1d=--NS+=f_Z72FwzL85VyHvoxpnXGdeZY4nsoA@mail.gmail.com>
From: "Markus Volk" <f_l_k@t-online.de>
Message-ID: <f2b3bfb3-d200-c06c-84f9-7620883acc99@t-online.de>
Date: Mon, 13 Sep 2021 02:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soU-jZ1d=--NS+=f_Z72FwzL85VyHvoxpnXGdeZY4nsoA@mail.gmail.com>
X-TOI-EXPURGATEID: 150726::1631491646-000010EC-EFD89B0F/0/0 CLEAN NORMAL
X-TOI-MSGID: d69e4770-1d75-43f7-99d4-7c0fec3dd6ae
Content-Type: multipart/alternative;
 boundary="------------A71115D32EB7AF30F8812DF6"
Content-Language: en-US

--------------A71115D32EB7AF30F8812DF6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Looks like this is the plan

https://bugzilla.redhat.com/show_bug.cgi?id=3D1981729#c3


Am 13.09.21 um 00:18 schrieb Khem Raj:
>
>
> On Sun, Sep 12, 2021 at 10:20 AM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>
>     raw.h has been dropped in linux-libc-headers-5.14 leading to:
>
>     configure: error: raw selected, but required raw.h header file not
>     available
>     WARNING: exit code 1 from a shell command.
>
>
> Overall this is a fine change however I wonder what=E2=80=99s the way to =
get=20
> this fixed upstream is it that it should now be removed from=20
> util-Linux in future ?
>
>
>
>     Signed-off-by: MarkusVolk <f_l_k@t-online.de
>     <mailto:f_l_k@t-online.de>>
>     ---
>     =C2=A0meta/recipes-core/util-linux/util-linux_2.37.2.bb
>     <http://util-linux_2.37.2.bb> | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
>     <http://util-linux_2.37.2.bb>
>     b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
>     <http://util-linux_2.37.2.bb>
>     index 9351595144..6f2808cc44 100644
>     --- a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
>     <http://util-linux_2.37.2.bb>
>     +++ b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
>     <http://util-linux_2.37.2.bb>
>     @@ -73,7 +73,7 @@ EXTRA_OECONF =3D "\
>     =C2=A0 =C2=A0 =C2=A0\
>     =C2=A0 =C2=A0 =C2=A0--disable-bfs --disable-login \
>     =C2=A0 =C2=A0 =C2=A0--disable-makeinstall-chown --disable-minix --dis=
able-newgrp \
>     -=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw \
>     +=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw --disable-raw \
>     =C2=A0 =C2=A0 =C2=A0\
>     =C2=A0 =C2=A0 =C2=A0--without-udev \
>     =C2=A0 =C2=A0 =C2=A0\
>     --=20
>     2.25.1
>
>
>    =20
>

--------------A71115D32EB7AF30F8812DF6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Looks like this is the plan</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.redhat.c=
om/show_bug.cgi?id=3D1981729#c3">https://bugzilla.redhat.com/show_bug.cgi?i=
d=3D1981729#c3</a><br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">Am 13.09.21 um 00:18 schrieb Khem Raj:<b=
r>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAMKF1soU-jZ1d=3D--NS+=3Df_Z72FwzL85VyHvoxpnXGdeZY4nsoA@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 12, 2021 at
            10:20 AM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"
              moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">raw.h has
            been dropped in linux-libc-headers-5.14 leading to:<br>
            <br>
            configure: error: raw selected, but required raw.h header
            file not available<br>
            WARNING: exit code 1 from a shell command.</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Overall this is a fine change however I wonder
            what=E2=80=99s the way to get this fixed upstream is it that it
            should now be removed from util-Linux in future ?</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">=
<br>
            <br>
            Signed-off-by: MarkusVolk &lt;<a
              href=3D"mailto:f_l_k@t-online.de" target=3D"_blank"
              moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt;<br>
            ---<br>
            =C2=A0meta/recipes-core/util-linux/<a
              href=3D"http://util-linux_2.37.2.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">util-linux_2.37.2.=
bb</a>
            | 2 +-<br>
            =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/meta/recipes-core/util-linux/<a
              href=3D"http://util-linux_2.37.2.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">util-linux_2.37.2.=
bb</a>
            b/meta/recipes-core/util-linux/<a
              href=3D"http://util-linux_2.37.2.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">util-linux_2.37.2.=
bb</a><br>
            index 9351595144..6f2808cc44 100644<br>
            --- a/meta/recipes-core/util-linux/<a
              href=3D"http://util-linux_2.37.2.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">util-linux_2.37.2.=
bb</a><br>
            +++ b/meta/recipes-core/util-linux/<a
              href=3D"http://util-linux_2.37.2.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">util-linux_2.37.2.=
bb</a><br>
            @@ -73,7 +73,7 @@ EXTRA_OECONF =3D "\<br>
            =C2=A0 =C2=A0 =C2=A0\<br>
            =C2=A0 =C2=A0 =C2=A0--disable-bfs --disable-login \<br>
            =C2=A0 =C2=A0 =C2=A0--disable-makeinstall-chown --disable-minix
            --disable-newgrp \<br>
            -=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw \<br>
            +=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw --disable=
-raw \<br>
            =C2=A0 =C2=A0 =C2=A0\<br>
            =C2=A0 =C2=A0 =C2=A0--without-udev \<br>
            =C2=A0 =C2=A0 =C2=A0\<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------A71115D32EB7AF30F8812DF6--
