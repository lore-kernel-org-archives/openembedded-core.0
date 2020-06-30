Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4444.1593542801581953855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 11:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Vd3rzbgk;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=16614; q=dns/txt; s=axis-central1;
  t=1593542802; x=1625078802;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=J8UlTr1gPOc10nwrL+lCWNTzq06VLXh63rRTEXAUFgM=;
  b=Vd3rzbgkNSE/VH4wJ6J9CWV1ogh57X06tATQlzmu0gh+U+zB9i2DeZFt
   mMwuXsCmSqCaXbhIxlo00Rp8G7TVD7wt/006RhYLninuZZMCQ1S0soTJC
   Ty0le51pnKbMT4p7nY4JS1+f6658Xj64IvG2Loy6A69vFLJ0HWwcCJ8mJ
   SDaCR9bGwvQGqApn4UjclsMVwRwddJ4rmcyP7ud1sBQTJX5YzUVjKAY8l
   XxhM6bSENxdOABLqyPbbSMWVHJedFHPX2xmh2FQRuhcqR6XXE4lm4dQGz
   /uNUwXVmU+a2D0cOd5pVHCvalKr1PF95l6AdV4a0Wflf1MvcHU2Fd97mZ
   g==;
IronPort-SDR: 7aYV6SXEXuVgS2B0C2soZqTxNASTudBWyZeeyqqbIi0VCSC7t8vsonWRHQqmRFgFzD4GR03cS7
 r/Oaq94nvIJPqhQz4aoueLkmMRSkiXRMUUhNG6H0m2TUfcXNev+j19ANnBICb4zSnwyD0n8w7E
 7J/VHZBGma8O3lJo5q+n0P/zSi4bXFbAAnV/+txbSSshx0rTjAAO+Qk5N7btiyQTiTZhZV+9Qq
 DShrZsnTT+JrOnWm4tgzC40Wp/rgHZdPUkCFRBbfK0XHYylxxhyEuvMYFskFiOMlWolFEaQsmB
 SNw=
X-IronPort-AV: E=Sophos;i="5.75,298,1589234400"; 
   d="scan'208,217";a="10060545"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWStlhmROMe50x8EKtBnMpvXTtHajo/muAgAAzAiCACAHYAIAAU5Zs
Date: Tue, 30 Jun 2020 18:46:37 +0000
Message-ID: <1593542797508.95041@axis.com>
References: <20200625101413.2783-1-fredrigu@axis.com>
 <CANNYZj--txtppAq4o1bjmRQiZ2Oehaftx4WR-ewx7VmYHRPxmQ@mail.gmail.com>
 <1593529480451.52800@axis.com>,<CANNYZj80rO=41_Gh+WCueVCwHooC5jtwDsxhyZdHD87YqvfqOQ@mail.gmail.com>
In-Reply-To: <CANNYZj80rO=41_Gh+WCueVCwHooC5jtwDsxhyZdHD87YqvfqOQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_159354279750895041axiscom_"

--_000_159354279750895041axiscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

now I see what you mean. I got a script from Alex Stewart, here's the resu=
lts for core-image-sato-sdk-ptest:

out.apk.1: 1:13.35
out.apk.2: 1:13.51
out.apk.3: 1:13.23
out.apk.4: 1:14.07
out.apk.5: 1:13.00
out.deb.1: 3:49.37
out.deb.2: 3:50.77
out.deb.3: 3:51.39
out.deb.4: 3:53.40
out.deb.5: 3:53.99
out.ipk.1: 2:38.99
out.ipk.2: 2:39.07
out.ipk.3: 2:35.34
out.ipk.4: 2:36.15
out.ipk.5: 2:34.55
out.rpm.1: 1:58.61
out.rpm.2: 1:59.42
out.rpm.3: 1:59.70
out.rpm.4: 1:58.96
out.rpm.5: 1:58.11


BR

Fredrik

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, June 30, 2020 5:43 PM
To: Fredrik Gustafsson
Cc: OE-core; tools-cfpbuild-internal; Hugo Cedervall
Subject: Re: [OE-core] Add package managers as a plugin

What I meant is that 15s vs 20s on a small image could have been 5 min vs =
5min5s on a bigger image, so I wanted to see that the difference does scale=
 up with image size.

Can you to provide sdk-ptest numbers for deb and ipk as well?

Alex

On Tue, 30 Jun 2020 at 17:04, Fredrik Gustafsson <Fredrik.Gustafsson@axis.=
com<mailto:Fredrik.Gustafsson@axis.com>> wrote:

Hi Alexander,

what are you finding strange with the numbers? Too fast or to big of a dif=
ference? Note that it's only the do_rootfs task that i measured.

I've tried the core-image-sato-sdk-ptest as you suggested. I run the follo=
wing command multiple times:
bitbake core-image-sato-sdk-ptest -c cleansstate &&

bitbake core-image-sato-sdk-ptest -c clean &&
time bitbake core-image-sato-sdk-ptest -f -c do_rootfs

APK
=3D=3D=3D=3D
0,85s user 0,16s system 0% cpu 1:13,66 total
0,87s user 0,14s system 0% cpu 1:13,28 total
0,89s user 0,11s system 0% cpu 1:13,10 total

RPM
=3D=3D=3D

0,67s user 0,12s system 0% cpu 2:02,48 total
0,68s user 0,11s system 0% cpu 2:03,39 total
0,73s user 0,09s system 0% cpu 1:59,87 total

5 seconds doesn't sound that much but it's 25% speedup. Since building is =
mostly cached but generating rootfs isn't this is a huge time consumption f=
or our use case and our image takes around 4 minutes to build. Saving one m=
inutes times the many builds we do is a huge win.

(Excuse my late reply, running core-image-sato-sdk-ptest uncovered a few b=
ugs in the implementation of apk in OE. So thanks for having me testing thi=
s image)


/Fredrik


________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.=
com>>
Sent: Thursday, June 25, 2020 12:24 PM
To: Fredrik Gustafsson
Cc: OE-core; tools-cfpbuild-internal; Hugo Cedervall
Subject: Re: [OE-core] Add package managers as a plugin

Apologies, but these metrics do not look particularly convincing - 15s vs =
20s? Can you try it with an image several gigabytes in size? Core-image-sat=
o-sdk-ptest is a good option.

Alex

On Thu, 25 Jun 2020 at 12:14, Fredrik Gustafsson <fredrik.gustafsson@axis.=
com<mailto:fredrik.gustafsson@axis.com>> wrote:
Poky today has three different package managers, the well-known formats de=
b
and rpm is supported as well as ipkg that is good for embedded devices.

When building and having a good cache hit, a significant amount of time is
spent in the phase of generating a rootfs, which is really about the
performance of the package manager. ipkg is way slower than deb or rpm. To
save build time and also get a package manager that is suitanle for use on
targets where flash memory is a concern, support for apk is suggested.

However, it might or might not be what's wanted for Poky since it increase=
s
the test matrix. Therefore this patch series refactors the package
management code so that it's possible to add more package managers in othe=
r
own layer. I will send another patch serie that will add apk.

Perfomance metrics below, (note that this includes build times).

APK
=3D=3D=3D
bitbake core-image-minimal
15.84s user 2.60s system 0% cpu 1:26:19.21 total
16.01s user 2.58s system 0% cpu 1:26:03.72 total
15.69s user 2.61s system 0% cpu 1:26:45.45 total

bitbake core-image-minimal -c cleansstate
bitbake core-image-minimal -c clean
bitbake core-image-minimal -f -c do_rootfs
0.55s user 0.06s system 4% cpu 14.236 total
0.54s user 0.08s system 4% cpu 15.247 total
0.52s user 0.15s system 4% cpu 15.143 total

RPM
=3D=3D=3D
bitbake core-image-minimal
18.57s user 3.09s system 0% cpu 1:31:29.09 total
18.58s user 3.08s system 0% cpu 1:30:53.80 total
18.20s user 3.31s system 0% cpu 1:31:06.69 total

bitbake core-image-minimal -c cleansstate
bitbake core-image-minimal -c clean
bitbake core-image-minimal -c do_rootfs -f
0.58s user 0.10s system 3% cpu 19.470 total
0.57s user 0.09s system 3% cpu 19.480 total
0.60s user 0.07s system 3% cpu 20.381 total


--_000_159354279750895041axiscom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859=
-1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-=
bottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#=
FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi Alex,</p>
<p>now I see what you mean. I got a script from Alex Stewart, here's the r=
esults for core-image-sato-sdk-ptest:</p>
<p><font size=3D"2"><span style=3D"font-size:10pt;">out.apk.1: 1:13.35<br>
out.apk.2: 1:13.51<br>
out.apk.3: 1:13.23<br>
out.apk.4: 1:14.07<br>
out.apk.5: 1:13.00<br>
out.deb.1: 3:49.37<br>
out.deb.2: 3:50.77<br>
out.deb.3: 3:51.39<br>
out.deb.4: 3:53.40<br>
out.deb.5: 3:53.99<br>
out.ipk.1: 2:38.99<br>
out.ipk.2: 2:39.07<br>
out.ipk.3: 2:35.34<br>
out.ipk.4: 2:36.15<br>
out.ipk.5: 2:34.55<br>
out.rpm.1: 1:58.61<br>
out.rpm.2: 1:59.42<br>
out.rpm.3: 1:59.70<br>
out.rpm.4: 1:58.96<br>
out.rpm.5: 1:58.11</span></font></p>
<p><br>
</p>
<p>BR</p>
<p>Fredrik<br>
</p>
<div style=3D"color: rgb(33, 33, 33);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Alexander Kanavin =
&lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, June 30, 2020 5:43 PM<br>
<b>To:</b> Fredrik Gustafsson<br>
<b>Cc:</b> OE-core; tools-cfpbuild-internal; Hugo Cedervall<br>
<b>Subject:</b> Re: [OE-core] Add package managers as a plugin</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>What I meant is that 15s vs 20s on a small image could have been 5 mi=
n vs 5min5s on a bigger image, so I wanted to see that the difference does =
scale up with image size.</div>
<div><br>
</div>
<div>Can you to provide sdk-ptest numbers for deb and ipk as well?<br>
</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Jun 2020 at 17:04, Fredri=
k Gustafsson &lt;<a href=3D"mailto:Fredrik.Gustafsson@axis.com">Fredrik.Gus=
tafsson@axis.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; borde=
r-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr" style=3D"font-size:12pt; color:rgb(0,0,0); background-col=
or:rgb(255,255,255); font-family:Calibri,Arial,Helvetica,sans-serif">
<p>Hi Alexander,<br>
</p>
<p>what are you finding strange with the numbers? Too fast or to big of a =
difference? Note that it's only the do_rootfs task that i measured.<br>
<br>
I've tried the core-image-sato-sdk-ptest as you suggested. I run the follo=
wing command multiple times:<br>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">bitbake core-i=
mage-sato-sdk-ptest&nbsp;-c cleansstate &amp;&amp;</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica=
,sans-serif; font-size:16px; background-color:rgb(255,255,255)"></span><spa=
n style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sans-se=
rif; font-size:16px; background-color:rgb(255,255,255)">bitbake
 core-image-sato-sdk-ptest&nbsp;-c clean &amp;&amp;</span><br style=3D"col=
or:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sans-serif; font-size=
:16px; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">time bitbake c=
ore-image-sato-sdk-ptest&nbsp;-f -c do_rootfs</span><br>
</p>
<p><span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica=
,sans-serif; font-size:16px; background-color:rgb(255,255,255)"><br>
APK<br>
=3D=3D=3D=3D<br>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">0,85s user 0,1=
6s system 0% cpu 1:13,66 total</span><br>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">0,87s user 0,1=
4s system 0% cpu 1:13,28 total</span><br>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">0,89s user 0,1=
1s system 0% cpu 1:13,10 total</span><br>
<br>
RPM<br>
=3D=3D=3D</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica=
,sans-serif; font-size:16px; background-color:rgb(255,255,255)">0,67s user =
0,12s system 0% cpu 2:02,48 total<br>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">0,68s user 0,1=
1s system 0% cpu 2:03,39&nbsp;total</span><br>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sa=
ns-serif; font-size:16px; background-color:rgb(255,255,255)">0,73s user 0,0=
9s system 0% cpu 1:59,87&nbsp;total<br>
<br>
5 seconds doesn't sound that much but it's 25% speedup. Since building is =
mostly cached but generating rootfs isn't this is a huge time consumption f=
or our use case and our image takes around 4 minutes to build. Saving one m=
inutes times the many builds we do
 is a huge win.<br>
<br>
(Excuse my late reply, running core-image-sato-sdk-ptest uncovered a few b=
ugs in the implementation of apk in OE. So thanks for having me testing thi=
s image)<br>
</span></span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica=
,sans-serif; font-size:16px; background-color:rgb(255,255,255)"><span style=
=
=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:16px; background-color:rgb(255,255,255)"><br>
</span></span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica=
,sans-serif; font-size:16px; background-color:rgb(255,255,255)"><span style=
=
=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:16px; background-color:rgb(255,255,255)">/Fredrik<br>
</span></span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica=
,sans-serif; font-size:16px; background-color:rgb(255,255,255)"><span style=
=
=3D"color:rgb(33,33,33); font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:16px; background-color:rgb(255,255,255)"></span><br>
</span></p>
<div style=3D"color:rgb(33,33,33)">
<hr style=3D"display:inline-block; width:98%">
<div id=3D"gmail-m_6264142412457880117divRplyFwdMsg" dir=3D"ltr"><font sty=
le=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fro=
m:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, June 25, 2020 12:24 PM<br>
<b>To:</b> Fredrik Gustafsson<br>
<b>Cc:</b> OE-core; tools-cfpbuild-internal; Hugo Cedervall<br>
<b>Subject:</b> Re: [OE-core] Add package managers as a plugin</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>Apologies, but these metrics do not look particularly convincing - 15=
s vs 20s? Can you try it with an image several gigabytes in size? Core-imag=
e-sato-sdk-ptest is a good option.<br>
</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Jun 2020 at 12:14, Fredri=
k Gustafsson &lt;<a href=3D"mailto:fredrik.gustafsson@axis.com" target=3D"_=
blank">fredrik.gustafsson@axis.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; borde=
r-left:1px solid rgb(204,204,204); padding-left:1ex">
Poky today has three different package managers, the well-known formats de=
b<br>
and rpm is supported as well as ipkg that is good for embedded devices.<br=
>
<br>
When building and having a good cache hit, a significant amount of time is=
<br>
spent in the phase of generating a rootfs, which is really about the<br>
performance of the package manager. ipkg is way slower than deb or rpm. To=
<br>
save build time and also get a package manager that is suitanle for use on=
<br>
targets where flash memory is a concern, support for apk is suggested.<br>
<br>
However, it might or might not be what's wanted for Poky since it increase=
s<br>
the test matrix. Therefore this patch series refactors the package<br>
management code so that it's possible to add more package managers in othe=
r<br>
own layer. I will send another patch serie that will add apk.<br>
<br>
Perfomance metrics below, (note that this includes build times).<br>
<br>
APK<br>
=3D=3D=3D<br>
bitbake core-image-minimal<br>
15.84s user 2.60s system 0% cpu 1:26:19.21 total<br>
16.01s user 2.58s system 0% cpu 1:26:03.72 total<br>
15.69s user 2.61s system 0% cpu 1:26:45.45 total<br>
<br>
bitbake core-image-minimal -c cleansstate<br>
bitbake core-image-minimal -c clean<br>
bitbake core-image-minimal -f -c do_rootfs<br>
0.55s user 0.06s system 4% cpu 14.236 total<br>
0.54s user 0.08s system 4% cpu 15.247 total<br>
0.52s user 0.15s system 4% cpu 15.143 total<br>
<br>
RPM<br>
=3D=3D=3D<br>
bitbake core-image-minimal<br>
18.57s user 3.09s system 0% cpu 1:31:29.09 total<br>
18.58s user 3.08s system 0% cpu 1:30:53.80 total<br>
18.20s user 3.31s system 0% cpu 1:31:06.69 total<br>
<br>
bitbake core-image-minimal -c cleansstate<br>
bitbake core-image-minimal -c clean<br>
bitbake core-image-minimal -c do_rootfs -f<br>
0.58s user 0.10s system 3% cpu 19.470 total<br>
0.57s user 0.09s system 3% cpu 19.480 total<br>
0.60s user 0.07s system 3% cpu 20.381 total<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_159354279750895041axiscom_--
