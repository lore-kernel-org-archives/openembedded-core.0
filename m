Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4sCy-0005wy-OQ
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 13:10:31 +0100
Received: by mail-vb0-f42.google.com with SMTP id ff1so3698962vbb.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 03:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=prBZpYxvRz0P8UHS3P+xSwZsYmEFgfDzBBfL82h64cY=;
	b=RON2RK7khdwbi58ZwyxWauv78RoZ9zjP1sNSPNG3V3YvTQl/+GREQqdnWM7rWD2wbM
	9uWV6rpnG1OJpRaNAblSOtMlha8HMYj+9m2PgD/dBZ4y2I3X7yVZ/BPGr0dru+OuiXh0
	4eqR8RYEtTDFK5prNn6uUDxtlP/RwSFsAvDKOFJqoHLGbKn/W42XtVys+y3zWSaLp5vR
	ZxFWTJMQbCqVKQAfnGnQsnCTmCEvX6Y+o+xHOHskDh/GHGfbNBUVSmVVu9AQQVVJZh+o
	AqHdmHXrdeg/kfKJP7Wp5K7D17JKLvuvhzqwB9iCfWONJFgn3uBa1QlMTD6wAyJzzcyw
	6mfg==
X-Received: by 10.220.119.147 with SMTP id z19mr18397679vcq.69.1360583646464; 
	Mon, 11 Feb 2013 03:54:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Mon, 11 Feb 2013 03:53:46 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAK18fxHp-rb4JOjK3A6OTjEPUUnhnqvp2mmRzv8EMaPCSSReqA@mail.gmail.com>
References: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
	<1360581039.6793.3.camel@ted>
	<CAK18fxHKRNBWXuY+p7R1uxsQwJVFh-aKLG=WMQNqtxT5bCeh+Q@mail.gmail.com>
	<7962536.2U1dKqZXgW@helios>
	<CAK18fxHp-rb4JOjK3A6OTjEPUUnhnqvp2mmRzv8EMaPCSSReqA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 13:53:46 +0200
Message-ID: <CAK18fxFNsU_Vri=XiU+b5_=ujYWz_3NKjbh==_Y=3S6XqYcftQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmj8IFuMPlg/wv56P4MNID5Klx4dYBf1Jfh2rLitU82KsOr0nBVOmSMsEaHgYWhHCohsCxA
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [denzil] qt 4.8.0 is not available from source anymore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 12:10:31 -0000
Content-Type: multipart/alternative; boundary=bcaec54d4cfcef49d704d57190bb

--bcaec54d4cfcef49d704d57190bb
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 1:47 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Mon, Feb 11, 2013 at 1:39 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> On Monday 11 February 2013 13:33:19 Andrei Gherzan wrote:
>> > On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie <
>> >
>> > richard.purdie@linuxfoundation.org> wrote:
>> > > On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:
>> > > > In denzil SRC_URI for qt4.8.0 uses:
>> > >
>> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g
>> > > z
>> > >
>> > > > This source seems to be outdated and replaced
>> > > > by: http://releases.qt-project.org/qt4/source/
>> > > >
>> > > > The problem is that the new location doesn't include the 4.8.0
>> > > > release.
>> > > > qt-everywhere-opensource-src-4.6.4.tar.gz
>> > > > qt-everywhere-opensource-src-4.8.1.tar.gz
>> > > > qt-everywhere-opensource-src-4.8.2.tar.gz
>> > > > qt-everywhere-opensource-src-4.8.3.tar.gz
>> > > > qt-everywhere-opensource-src-4.8.4.tar.gz
>> > > >
>> > > > So right now qt4 in denzil is not fetch-able anymore.
>> > >
>> > > It should be fetchable from the source mirror at least. Isn't the
>> build
>> > > falling back to that?
>> >
>> > Seems not. Hm. The real problem is not picking up the mirror as other
>> > packages fail in the same way too: connman, kmod etc.
>>
>> Can you check to make sure MIRRORS are still set in your configuration?
>>
>
>
> Found the problem. meta-ivi is not using poky distro and this is why I had
> no mirrors. Thank you for (obvious) hint.
> Cheers!
>
>
>
But still qt 4.8.0 is not here
http://downloads.yoctoproject.org/mirror/sources/:

qt-everywhere-opensource-src-4.6.3.tar.gz 08-May-2012 17:58 154M
 qt-everywhere-opensource-src-4.7.1.tar.gz 08-May-2012 17:57 202M
 qt-everywhere-opensource-src-4.7.2.tar.gz 08-May-2012 18:09 204M
 qt-everywhere-opensource-src-4.7.3.tar.gz 08-May-2012 19:39 204M
 qt-everywhere-opensource-src-4.7.4.tar.gz 08-May-2012 19:39 210M
 qt-everywhere-opensource-src-4.8.1.tar.gz 08-May-2012 19:32 229M
 qt-everywhere-opensource-src-4.8.3.tar.gz 13-Sep-2012 08:54 223M
 qt-everywhere-opensource-src-4.8.4.tar.gz 28-Nov-2012 11:32 226M

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--bcaec54d4cfcef49d704d57190bb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Feb 11, 2013 at 1:47 PM, Andrei Gherzan <span dir=
=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@=
gherzan.ro</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div><div class=3D"h5">On Mon, Feb 11, 20=
13 at 1:39 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.e=
ggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a=
>&gt;</span> wrote:<br>

</div></div><div class=3D"gmail_extra"><div><div class=3D"h5">
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div><div>On Monday 11 February=
 2013 13:33:19 Andrei Gherzan wrote:<br>



&gt; On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie &lt;<br>
&gt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:<br>
&gt; &gt; &gt; In denzil SRC_URI for qt4.8.0 uses:<br>
&gt; &gt; <a href=3D"http://get.qt.nokia.com/qt/source/qt-everywhere-openso=
urce-src-$%7BPV%7D.tar.g" target=3D"_blank">http://get.qt.nokia.com/qt/sour=
ce/qt-everywhere-opensource-src-${PV}.tar.g</a><br>
&gt; &gt; z<br>
&gt; &gt;<br>
&gt; &gt; &gt; This source seems to be outdated and replaced<br>
&gt; &gt; &gt; by: <a href=3D"http://releases.qt-project.org/qt4/source/" t=
arget=3D"_blank">http://releases.qt-project.org/qt4/source/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The problem is that the new location doesn&#39;t include the=
 4.8.0<br>
&gt; &gt; &gt; release.<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.6.4.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.1.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.2.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.3.tar.gz<br>
&gt; &gt; &gt; qt-everywhere-opensource-src-4.8.4.tar.gz<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So right now qt4 in denzil is not fetch-able anymore.<br>
&gt; &gt;<br>
&gt; &gt; It should be fetchable from the source mirror at least. Isn&#39;t=
 the build<br>
&gt; &gt; falling back to that?<br>
&gt;<br>
&gt; Seems not. Hm. The real problem is not picking up the mirror as other<=
br>
&gt; packages fail in the same way too: connman, kmod etc.<br>
<br>
</div></div>Can you check to make sure MIRRORS are still set in your config=
uration?<br></blockquote><div><br></div><div>=A0</div></div></div></div>Fou=
nd the problem. meta-ivi is not using poky distro and this is why I had no =
mirrors. Thank you for (obvious) hint.=A0</div>


<div class=3D"gmail_extra">Cheers!<div class=3D"im"><br clear=3D"all"><div>=
<br></div></div></div></div></blockquote><div><br></div><div style>But stil=
l qt 4.8.0 is not here =A0<a href=3D"http://downloads.yoctoproject.org/mirr=
or/sources/">http://downloads.yoctoproject.org/mirror/sources/</a>:</div>

<div style><div><span class=3D"" style=3D"white-space:pre"><br></span></div=
><div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere-open=
source-src-4.6.3.tar.gz<span class=3D"" style=3D"white-space:pre">	</span>0=
8-May-2012 17:58<span class=3D"" style=3D"white-space:pre">	</span>154M<spa=
n class=3D"" style=3D"white-space:pre">	</span>=A0</div>

<div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere-opens=
ource-src-4.7.1.tar.gz<span class=3D"" style=3D"white-space:pre">	</span>08=
-May-2012 17:57<span class=3D"" style=3D"white-space:pre">	</span>202M<span=
 class=3D"" style=3D"white-space:pre">	</span>=A0</div>

<div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere-opens=
ource-src-4.7.2.tar.gz<span class=3D"" style=3D"white-space:pre">	</span>08=
-May-2012 18:09<span class=3D"" style=3D"white-space:pre">	</span>204M<span=
 class=3D"" style=3D"white-space:pre">	</span>=A0<br>

</div><div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere=
-opensource-src-4.7.3.tar.gz<span class=3D"" style=3D"white-space:pre">	</s=
pan>08-May-2012 19:39<span class=3D"" style=3D"white-space:pre">	</span>204=
M<span class=3D"" style=3D"white-space:pre">	</span>=A0<br>

</div><div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere=
-opensource-src-4.7.4.tar.gz<span class=3D"" style=3D"white-space:pre">	</s=
pan>08-May-2012 19:39<span class=3D"" style=3D"white-space:pre">	</span>210=
M<span class=3D"" style=3D"white-space:pre">	</span>=A0<br>

</div><div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere=
-opensource-src-4.8.1.tar.gz<span class=3D"" style=3D"white-space:pre">	</s=
pan>08-May-2012 19:32<span class=3D"" style=3D"white-space:pre">	</span>229=
M<span class=3D"" style=3D"white-space:pre">	</span>=A0<br>

</div><div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere=
-opensource-src-4.8.3.tar.gz<span class=3D"" style=3D"white-space:pre">	</s=
pan>13-Sep-2012 08:54<span class=3D"" style=3D"white-space:pre">	</span>223=
M<span class=3D"" style=3D"white-space:pre">	</span>=A0<br>

</div><div><span class=3D"" style=3D"white-space:pre">	</span>qt-everywhere=
-opensource-src-4.8.4.tar.gz<span class=3D"" style=3D"white-space:pre">	</s=
pan>28-Nov-2012 11:32<span class=3D"" style=3D"white-space:pre">	</span>226=
M<span class=3D"" style=3D"white-space:pre">	</span>=A0<br>

</div><div>=A0<br></div></div></div>-- <br><div dir=3D"ltr"><div style=3D"t=
ext-align:center"></div><div style=3D"text-align:center"><div align=3D"left=
" style=3D"font-family:&#39;Times New Roman&#39;;font-size:medium"><b style=
=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;text-align:center=
">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.744.478.41=
4 | =A0f: +40.31.816.28.12</font><br></div></div></div>
</div></div>

--bcaec54d4cfcef49d704d57190bb--
