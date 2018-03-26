Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7782660685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 03:53:11 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id l21so5774920uak.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 20:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3MKD2nSq6ENLuftNPoYTNMHAUd7mxyMmMIkvUn7Iq+E=;
	b=WfBbRZ3Pggga/4g2yDhw62CAjgKCnoWDC99DTLN3DIoFyKrT0AAvDB9MJ6FFl74tOY
	blwrQvkPBR9eXQDKCmfRUEbvwvtx4N9/Q7P4StGzcAyxDVSYVyFEcnsDPotvECSN26ny
	zkB6rV6MAb0NOvEmQPBzaXTjZLaUntMlh9aqhYasJH2VBcC2l1Snugycy4wZAjnFfw4E
	SwuE05AhuHexxrG7xWD9OgLvFVF7R5UXTHIzpMvb/5gtIdGIGxqSkKRFjoWKYs9nY+t5
	Y1038NAG3V74cZd6wZnvj0llJP0GpQumGguwWO1OUTOtsVAwBrPckmC/iM3TWc+GJZp3
	Elpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3MKD2nSq6ENLuftNPoYTNMHAUd7mxyMmMIkvUn7Iq+E=;
	b=JDhV+s6AfEYM75YwwUMa9d3J9HSzm6mpCmwgJzZOcCl/fZG7gZEMKrGfI+rtphmF1B
	RE0fZnpYeB05eB/nUb73qUlz0fkb6C9eRw3zYfWCtxfcwjEy9d/6xLeNvjCPL/Eg/oUE
	qlwH01XXvAfHkKLg/UwtfCGiaixV1sr6VMybs6aH2wYPc9l0EKbTBW7FYPGxj12MNmbl
	0x7cYVoZXuI7tt6cFL0nLcmZORFsMjVnjU4tvZY+5qDEWapBWKcnzGM5wq0cm7AxF9+o
	c3MlvxPfX57JbWZX5WMn6YTghXGlfxKeRkWxFgKMgI8rp/sozIUmVWo6mARaf+HJBvI5
	lDjw==
X-Gm-Message-State: AElRT7Eoe1M+oS3Yf4rJQRynMLycmdKpHfnQOXfPX/h4KZXA44rX0rPD
	k8YFKBTOieEPFcFmElK0uJp/599VnXWRPIewMqk=
X-Google-Smtp-Source: AIpwx4/C/ISw7inu+lOWnIp4xObL28Bu95HjotACLbNyeGpByKKFNS+hRYD8eDZxqPPio7C/4/M/p6ABJZsGfAMmVTY=
X-Received: by 10.176.112.47 with SMTP id u15mr6624095ual.159.1522036393098;
	Sun, 25 Mar 2018 20:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
	<CAJTo0LbL6BA5sNeOi+sH8VCdDBDhvdkztFxbQSkAsau2FRuNUQ@mail.gmail.com>
	<CAPGMVzEA52STvoMh=cAHqxsYc++pmxmhywVM082thHuB_OJ_0w@mail.gmail.com>
	<CAPGMVzE+kKb7OwafERjT6J+iSwWU-4R1gvx0tD5uBTabQ1B-5g@mail.gmail.com>
	<CALbNGRQn-1vmg_pa8VeKM4UwgHyMq82zSJHZ--gaxCiDesgqKw@mail.gmail.com>
In-Reply-To: <CALbNGRQn-1vmg_pa8VeKM4UwgHyMq82zSJHZ--gaxCiDesgqKw@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Mon, 26 Mar 2018 03:53:02 +0000
Message-ID: <CAPGMVzE1ZrnvgeN0CPtoOPNRJWQzNg7u81qOc3QJji=vrp1oow@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-debian] build error
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
X-List-Received-Date: Mon, 26 Mar 2018 03:53:12 -0000
Content-Type: multipart/alternative; boundary="089e0831ad748beb1e056848b6a5"

--089e0831ad748beb1e056848b6a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip! I'll check out the respective links.

On Mon, 26 Mar 2018, 02:48 Andreas M=C3=BCller, <schnitzeltony@gmail.com> w=
rote:

> On Sun, Mar 25, 2018 at 9:58 PM, Rajath C S <rajathcs.1996@gmail.com>
> wrote:
> > Error while building opencv
> >
> > ERROR:
> >
> opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4-r0
> > do_compile: Function failed: do_compile (log file is located at
> >
> /home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87=
c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile=
.7688)
> > ERROR: Logfile of failure stored in:
> >
> /home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87=
c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile=
.7688
> >
> > may i know what this error is precisely referring to  i dint have this
> error
> > when i was trying to build opencv yesterday
> >
> > Thanks
> >
> My opinion: meta-debian is by far the worst layer I've ever seen. It
> overwrites many (and tries to move from many to all) recipes with own
> ones [1].
>
> My suggestion: Remove meta-debian from bblayers.conf and try again.
>
> * If you are fine - open an issue at meta-debian/github (error was
> caused by meta-debian)
> * If build failure persists, it would help to attach the log files the
> error message referrers to.
>
> [1]
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-debia=
n/
>
> Andreas
>

--089e0831ad748beb1e056848b6a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the tip! I&#39;ll check out the respective lin=
ks.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 26 Mar 201=
8, 02:48 Andreas M=C3=BCller, &lt;<a href=3D"mailto:schnitzeltony@gmail.com=
">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Sun, Mar 25, 2018 at 9:58 PM, Rajath C S &lt;<a href=3D"mailto:raj=
athcs.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gm=
ail.com</a>&gt; wrote:<br>
&gt; Error while building opencv<br>
&gt;<br>
&gt; ERROR:<br>
&gt; opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf=
7cd6a4-r0<br>
&gt; do_compile: Function failed: do_compile (log file is located at<br>
&gt; /home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC=
+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_comp=
ile.7688)<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC=
+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_comp=
ile.7688<br>
&gt;<br>
&gt; may i know what this error is precisely referring to=C2=A0 i dint have=
 this error<br>
&gt; when i was trying to build opencv yesterday<br>
&gt;<br>
&gt; Thanks<br>
&gt;<br>
My opinion: meta-debian is by far the worst layer I&#39;ve ever seen. It<br=
>
overwrites many (and tries to move from many to all) recipes with own<br>
ones [1].<br>
<br>
My suggestion: Remove meta-debian from bblayers.conf and try again.<br>
<br>
* If you are fine - open an issue at meta-debian/github (error was<br>
caused by meta-debian)<br>
* If build failure persists, it would help to attach the log files the<br>
error message referrers to.<br>
<br>
[1] <a href=3D"https://layers.openembedded.org/layerindex/branch/master/lay=
er/meta-debian/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://la=
yers.openembedded.org/layerindex/branch/master/layer/meta-debian/</a><br>
<br>
Andreas<br>
</blockquote></div>

--089e0831ad748beb1e056848b6a5--
