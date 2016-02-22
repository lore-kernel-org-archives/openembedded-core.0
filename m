Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 55DCE71951
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:36:07 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id z135so192760450iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7huSnqTSLLhImuZxZrdSsE/xPsYmb0y6mas72sLh0t0=;
	b=PpMC3DQQSeSYTwgG2DCSzuHoiUWz8Nqhvwj28VTMlG1FrR2i5wyMKtWE5tEXqTWH6S
	XRxsXXoxOmm0JoOzOLfCvhnODyYAPDsv5F36Nyp9P2z34XCRSXCj0H++Gnv1+CzQeVKp
	9MJ+R2jF+HTaLxOZvaPYXTtqBk9l3FPGOSp1mPdwX0rhDwSI2l1UMjqUBQDSnDM3FQcQ
	Iv+Wpdgi3ymIxbQXHYZpRY0gRuacHqYSaJwmSQaI94PBYGmHnrm6pYoigYSTWfYvibV0
	clHgR90muemWiqtIbWHpqm36nXGCFbBdcNpC7EkwIkx4IMQDflmNGxLrsGgu1qYplJVn
	chlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7huSnqTSLLhImuZxZrdSsE/xPsYmb0y6mas72sLh0t0=;
	b=IobhpF6JbXjNuKeKD1HgyACD9Yoe/V1e55ikjQUgLZO50lCbJgy3m3fCJp0GUwza+b
	Ae8DB4AZzcPaScnrYNLhbyNF2o9EsK01FehBNpd3YI+TjUsbfpRDmD+LZ6KZsm5XKYmc
	B91x9U0R+nHPQjbuX64f30tYCA8ZnWOVcrwjS8YtoKdBST42q+HaYhJ5VYpgYUZK+zbs
	6WabqVrmWvmiNMtOxrKaJJrQzmkP9PtMdPfqZwPmN/Z/axdIPsRqT0MS0uNwRBX0+3e6
	Ihk0kuVu35mcjyM3Lh5SaJI/5D0wIcpLVNYHKbsuB/5Sm5CaOUFNHoc2oHrej31FM8wS
	C3cw==
X-Gm-Message-State: AG10YOSogZ0yBOROamU3xuWS4Vq0sLKmFJ/qyIkPakGqi+PXHzNR2nBBEPU2Z6DCdjqkSqnjq0QMmUwEJNXhWUeU
X-Received: by 10.107.3.220 with SMTP id e89mr28655505ioi.99.1456176968721;
	Mon, 22 Feb 2016 13:36:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 22 Feb 2016 13:35:49 -0800 (PST)
In-Reply-To: <CALbNGRQSdagG5HZ7c5uxGLo5z64SrA4RRKW6gu62ypXuAxHXSA@mail.gmail.com>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
	<20160222211740.GG6329@jama>
	<CALbNGRQSdagG5HZ7c5uxGLo5z64SrA4RRKW6gu62ypXuAxHXSA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Feb 2016 21:35:49 +0000
Message-ID: <CAJTo0LYvmBojBtx=57ktQ5ej-FRhMoAGhDPOqJtMS+2he-e6uQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetcher broken?
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
X-List-Received-Date: Mon, 22 Feb 2016 21:36:08 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cf37613052c629e2b

--001a113f0e7cf37613052c629e2b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 February 2016 at 21:19, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> > Did the following re-try download it with different (correct)
> > checksum? Then it would be correct behavior if you had some
> > e.g. incomplete flex-2.6.0.tar.bz2 tarball laying around in downloads
> > directory.
> >
> I did a -ccleanall and repeated -> same behaviour
>

Can you download the tarball manually and see what happens?

$ wget http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2
--2016-02-22 21:27:27--
http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2
Resolving downloads.sourceforge.net... 216.34.181.59
Connecting to downloads.sourceforge.net|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location:
http://netcologne.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2
[following]
--2016-02-22 21:27:28--
http://netcologne.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2
Resolving netcologne.dl.sourceforge.net... 78.35.24.46, 2001:4dd0:1234:6::5=
f
Connecting to netcologne.dl.sourceforge.net|78.35.24.46|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1634276 (1.6M) [application/octet-stream]
Saving to: 'flex-2.6.0.tar.bz2'

flex-2.6.0.tar.bz2                 59%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
                        ] 942.21K  66.6KB/s    eta 7s
5flex-2.6.0.tar.bz2
59%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>                         ] 954.15K
 64.2KB/s    eta 7s     fflex-2.6.0.tar.bz2
60%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>                        ] 972.44K
 66.1KB/s    eta 6s
flex-2.6.0.tar.bz2
 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>]
1.56M  31.5KB/s    in 24s

2016-02-22 21:27:53 (65.8 KB/s) - 'flex-2.6.0.tar.bz2' saved
[1634276/1634276]

~
$ md5 flex-2.6.0.tar.bz2
MD5 (flex-2.6.0.tar.bz2) =3D 266270f13c48ed043d95648075084d59

(don't laugh at my download speed, it's not fun working on 3G)

So that md5 matches what the recipe says (26627... and 24e611... for md5
and sha) and I've just verified that it builds fine after a cleanall.
 You definitely need to compare what you're downloading with everyone else.

Ross

--001a113f0e7cf37613052c629e2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2016 at 21:19, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span class=3D""=
>&gt; Did the following re-try download it with different (correct)<br>
&gt; checksum? Then it would be correct behavior if you had some<br>
&gt; e.g. incomplete flex-2.6.0.tar.bz2 tarball laying around in downloads<=
br>
&gt; directory.<br>
&gt;<br>
</span>I did a -ccleanall and repeated -&gt; same behaviour<br></blockquote=
><div><br></div><div>Can you download the tarball manually and see what hap=
pens?</div><div><br></div><div>$ wget <a href=3D"http://downloads.sourcefor=
ge.net/flex/flex-2.6.0.tar.bz2">http://downloads.sourceforge.net/flex/flex-=
2.6.0.tar.bz2</a></div><div>--2016-02-22 21:27:27-- =C2=A0<a href=3D"http:/=
/downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2">http://downloads.source=
forge.net/flex/flex-2.6.0.tar.bz2</a></div><div>Resolving downloads.sourcef=
orge.net... 216.34.181.59</div><div>Connecting to <a href=3D"http://downloa=
ds.sourceforge.net">downloads.sourceforge.net</a>|216.34.181.59|:80... conn=
ected.</div><div>HTTP request sent, awaiting response... 302 Found</div><di=
v>Location: <a href=3D"http://netcologne.dl.sourceforge.net/project/flex/fl=
ex-2.6.0.tar.bz2">http://netcologne.dl.sourceforge.net/project/flex/flex-2.=
6.0.tar.bz2</a> [following]</div><div>--2016-02-22 21:27:28-- =C2=A0<a href=
=3D"http://netcologne.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2">h=
ttp://netcologne.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2</a></di=
v><div>Resolving netcologne.dl.sourceforge.net... 78.35.24.46, 2001:4dd0:12=
34:6::5f</div><div>Connecting to <a href=3D"http://netcologne.dl.sourceforg=
e.net">netcologne.dl.sourceforge.net</a>|78.35.24.46|:80... connected.</div=
><div>HTTP request sent, awaiting response... 200 OK</div><div>Length: 1634=
276 (1.6M) [application/octet-stream]</div><div>Saving to: &#39;flex-2.6.0.=
tar.bz2&#39;</div><div><br></div><div>flex-2.6.0.tar.bz2 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 59%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ] 942.21K =C2=A066.6KB/s =C2=A0 =C2=A0eta 7s =C2=A0 =C2=A0 5f=
lex-2.6.0.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5=
9%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 954.15K =C2=A064.2KB/s =
=C2=A0 =C2=A0eta 7s =C2=A0 =C2=A0 fflex-2.6.0.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 60%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0] 972.44K =C2=A066.1KB/s =C2=A0 =C2=A0eta 6s</div><div>flex-2.6.0=
.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100%[=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D&gt;] =C2=A0 1.56M =C2=A031.5KB/s =C2=A0 =C2=A0in 2=
4s</div><div><br></div><div>2016-02-22 21:27:53 (65.8 KB/s) - &#39;flex-2.6=
.0.tar.bz2&#39; saved [1634276/1634276]</div><div><br></div><div>~</div><di=
v>$ md5 flex-2.6.0.tar.bz2</div><div>MD5 (flex-2.6.0.tar.bz2) =3D 266270f13=
c48ed043d95648075084d59=C2=A0</div></div><br></div><div class=3D"gmail_extr=
a">(don&#39;t laugh at my download speed, it&#39;s not fun working on 3G)</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So that=
 md5 matches what the recipe says (26627... and 24e611... for md5 and sha) =
and I&#39;ve just verified that it builds fine after a cleanall. =C2=A0 =C2=
=A0You definitely need to compare what you&#39;re downloading with everyone=
 else.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113f0e7cf37613052c629e2b--
