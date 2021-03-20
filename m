Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web09.1570.1616231627868438718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 02:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gf9lz7EB;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id w63so2644474vkf.11
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mx91PvtRBDNK6QjpR3k8WXXOOE1oHwklCsbl8/pXMuc=;
        b=Gf9lz7EBVjlWsuk5jNm7ISfc/QJ8q/tyq9egmgDT29tInxUgKo2giX7BlkP9T1Q07O
         bIblADSVGy10HhsHjS+Dn40LkHC5leidJtTCdw4YZdH9A0ulIrv+bhC3zO2tCFcR3Afj
         JDBNOnvU7lKGA9Ls+P3MJZFWEjTIRgXqAVdGHhFQ1FQcujBh6O6dEh30eavPIrW+BfCs
         MS2OT6EhEXJE2UJrFGo541+vbVnU3mUZ2IfyB2RVEiPltbuJmYC04yJzroPCcDK/YVal
         potGfmbDdk7GvRg/erNE6fqk8OV9KqfgsWEjgSTuMLwHuphe1RiqFLcjZBFVbrMDwS2i
         K6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mx91PvtRBDNK6QjpR3k8WXXOOE1oHwklCsbl8/pXMuc=;
        b=VvMrJ5NpfY+NZa0k/P4knsokwsLs/vOlTAEJl7iq8hpUdd0otTPc2yPVmwpta8YuGF
         UMsjPhuqBPRiJWjicU9jTvZDq8KEhShPo5/aUHJzEEzql3CgqzlPiMQo/6iNbVlw2N7Y
         U/8/1y9uB5wptaHbJljZCbA6zMeN3U86+018lrqg2W1psJHfrJADyZmF/XbTOZnozOyL
         RKMLor7AESiknBCLmqt/2P4CBex/ChrTERqJ0OwVQNFDdMearYUEr3nEA5SGqCFmyrtX
         ByRx28F3efOIRdbmDH/ruFfYN9sA9G9xatI9s786cNfNTGK4wulWoKrK8PIaXDVzptRy
         aITw==
X-Gm-Message-State: AOAM533RXYxK8JEgOCEYzEnOZ8aFIQsEQ9QWVu9yiUnPup1XiYzncufk
	sAU3cDDCCvTaVs/4Nj8rllwN/UZh9khflg1Zo5k=
X-Google-Smtp-Source: ABdhPJxpNbplDwFCwbV6jkTgjHgBTx0gnPDNtUo0vuTGwssUgFEeKgWXq05VyEvLRzrX8qieypRatnssYYT+71p4iXQ=
X-Received: by 2002:a1f:a4d5:: with SMTP id n204mr5069365vke.0.1616231626705;
 Sat, 20 Mar 2021 02:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
 <20210319084401.576728-15-alex.kanavin@gmail.com> <722122d5-7fa8-56b2-116d-10169ada8051@gmail.com>
In-Reply-To: <722122d5-7fa8-56b2-116d-10169ada8051@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 20 Mar 2021 10:13:35 +0100
Message-ID: <CANNYZj9shi535X8emj0uYof5ysabLJ9PpHEHyeqhFM=yr=N=sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] apt: mark as incompatible with musl
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc0e9f05bdf43f4f"

--000000000000fc0e9f05bdf43f4f
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Mar 2021 at 17:58, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 3/19/21 1:44 AM, Alexander Kanavin wrote:
> > There are multiple failures with the new version; unless
>
> Can you share details of failures ?
> it would be better to not regress whats working
>

For example, here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3213/steps/11/logs/stdio

home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:
In function 'bool GetSrvRecords(std::string, std::vector<SrvRec>&)':
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:67:8:
error: 'res_ninit' was not declared in this scope; did you mean
'res_init'?
   67 |    if (res_ninit(&res) != 0)
      |        ^~~~~~~~~
      |        res_init
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:71:38:
error: 'res_nclose' was not declared in this scope
   71 |    std::shared_ptr<void> guard(&res, res_nclose);
      |                                      ^~~~~~~~~~
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:73:17:
error: 'res_nquery' was not declared in this scope; did you mean
'res_query'?
   73 |    answer_len = res_nquery(&res, name.c_str(), C_IN, T_SRV,
answer, sizeof(answer));
      |                 ^~~~~~~~~~
      |                 res_query

/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/recipe-sysroot/usr/include/locale.h:53:7:
error: declaration of 'char* setlocale(int, const char*)' has a
different exception specifier
   53 | char *setlocale (int, const char *);
      |       ^~~~~~~~~
In file included from
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/netrc.cc:14:
include/apti18n.h:25:25: note: from previous declaration 'char*
setlocale(int, const char*) throw ()'
   25 | extern "C" inline char* setlocale(int, const char*) throw() {
return nullptr; }
      |                         ^~~~~~~~~

Alex

--000000000000fc0e9f05bdf43f4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 19 Mar 2021 at 17:58, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
On 3/19/21 1:44 AM, Alexander Kanavin wrote:<br>
&gt; There are multiple failures with the new version; unless<br>
<br>
Can you share details of failures ?<br>
it would be better to not regress whats working<br></blockquote><div><br></=
div><div>For example, here:</div><div><a href=3D"https://autobuilder.yoctop=
roject.org/typhoon/#/builders/45/builds/3213/steps/11/logs/stdio">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3213/steps/11/logs=
/stdio</a></div><div><pre class=3D"gmail-row gmail-log" style=3D"height:992=
.15px;overflow-y:auto;display:block"><span class=3D"gmail-ng-scope"><div st=
yle=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bindi=
ng"><span class=3D"gmail-">home/pokybuild/yocto-worker/musl-qemux86-64/buil=
d/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/co=
ntrib/srvrec.cc: In function &#39;bool GetSrvRecords(std::string, std::vect=
or&lt;SrvRec&gt;&amp;)&#39;:</span></span></div><div style=3D"height:18px">=
<span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"g=
mail-">/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/co=
re2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:67:=
8: error: &#39;res_ninit&#39; was not declared in this scope; did you mean =
&#39;res_init&#39;?</span></span></div><div style=3D"height:18px"><span cla=
ss=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">  =
 67 |    if (res_ninit(&amp;res) !=3D 0)</span></span></div><div style=3D"h=
eight:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><spa=
n class=3D"gmail-">      |        ^~~~~~~~~</span></span></div><div style=
=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"=
><span class=3D"gmail-">      |        res_init</span></span></div><div sty=
le=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bindin=
g"><span class=3D"gmail-">/home/pokybuild/yocto-worker/musl-qemux86-64/buil=
d/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/co=
ntrib/srvrec.cc:71:38: error: &#39;res_nclose&#39; was not declared in this=
 scope</span></span></div><div style=3D"height:18px"><span class=3D"gmail-n=
o-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">   71 |    std:=
:shared_ptr&lt;void&gt; guard(&amp;res, res_nclose);</span></span></div><di=
v style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-b=
inding"><span class=3D"gmail-">      |                                     =
 ^~~~~~~~~~</span></span></div><div style=3D"height:18px"><span class=3D"gm=
ail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">/home/poky=
build/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux=
-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:73:17: error: &#39;r=
es_nquery&#39; was not declared in this scope; did you mean &#39;res_query&=
#39;?</span></span></div><div style=3D"height:18px"><span class=3D"gmail-no=
-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">   73 |    answe=
r_len =3D res_nquery(&amp;res, name.c_str(), C_IN, T_SRV, answer, sizeof(an=
swer));</span></span></div><div style=3D"height:18px"><span class=3D"gmail-=
no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">      |       =
          ^~~~~~~~~~</span></span></div><div style=3D"height:18px"><span cl=
ass=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-"> =
     |                 res_query</span></span></div><div style=3D"height:18=
px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=
=3D"gmail-"><br></span></span></div><div style=3D"height:18px"><pre class=
=3D"gmail-row gmail-log" style=3D"height:992.15px;overflow-y:auto;display:b=
lock"><span class=3D"gmail-ng-scope"><div style=3D"height:18px"><span class=
=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">/hom=
e/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky=
-linux-musl/apt/2.2.2-r0/recipe-sysroot/usr/include/locale.h:53:7: error: d=
eclaration of &#39;char* setlocale(int, const char*)&#39; has a different e=
xception specifier</span></span></div><div style=3D"height:18px"><span clas=
s=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">   =
53 | char *setlocale (int, const char *);</span></span></div><div style=3D"=
height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><sp=
an class=3D"gmail-">      |       ^~~~~~~~~</span></span></div><div style=
=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"=
><span class=3D"gmail-">In file included from /home/pokybuild/yocto-worker/=
musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/=
apt-2.2.2/apt-pkg/contrib/netrc.cc:14:</span></span></div><div style=3D"hei=
ght:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span =
class=3D"gmail-">include/apti18n.h:25:25: note: from previous declaration &=
#39;char* setlocale(int, const char*) throw ()&#39;</span></span></div><div=
 style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bi=
nding"><span class=3D"gmail-">   25 | extern &quot;C&quot; inline char* set=
locale(int, const char*) throw() { return nullptr; }</span></span></div><di=
v style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-b=
inding"><span class=3D"gmail-">      |                         ^~~~~~~~~</s=
pan></span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gm=
ail-log_o gmail-ng-binding"><span class=3D"gmail-"><br></span></span></div>=
<div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-n=
g-binding"><span class=3D"gmail-">Alex<br></span></span></div></span></pre>=
<span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"g=
mail-"></span></span></div></span></pre> </div></div></div>

--000000000000fc0e9f05bdf43f4f--
