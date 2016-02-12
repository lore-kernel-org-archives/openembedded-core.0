Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7C63565CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 10:50:06 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 9so87937443iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 02:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+gqGDXk735SNOf0GyPdLX7PNWL0wvt64M8ZngQPJFm0=;
	b=iiX2ZpXKViA/xsCHbKk+KuHjty7+sWtMYbj8J7tuTKwv2V7XQcNNOkWPfyFOfBNerH
	H3VRQtjyoL8B4REzbVk8vYNtW+872fEx6644cZCc1ihPG6Ly3bqo9Yc84t54UIgPuLnm
	Gq0DawWoYg1ASJj7ebQzi0Q41eJIalR7QbtLcey3Y0VJX0L89X+YdKU2YKO37XdkbgKA
	GVKz6WALsDZCA6sBzSpp+2tiF4V8hfry2Wie4WgMJlOS4R9NAJLvvFORyQ/V4MdM+30o
	W6KGQlZe6GTN1DPZF09esGZCrJLng1eXCXm4/bjIvWBkI1PeGbsiAgNV4iWCG/+AQmU7
	9oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+gqGDXk735SNOf0GyPdLX7PNWL0wvt64M8ZngQPJFm0=;
	b=ilfy5YooQmjhBArDvfjRaHMXteweWpz8QjqXtSlyAPcHxftZ7cRA4srK/JSFEw6xQn
	0Tmxb3hZ+pLpeZYAuoiJGvqC5qmzxrUnQie0vzS72O79rYWqedBoMz26zC0jMqFsJr+9
	pQ3eSrbo+xpVXkxzvJO/lXyTlvrHqDqCAn46Wv2Tzy/4kXjLId/UQtEidQsUcENol2s4
	XRJWaByiicJceK2jjMZ2ydWOYZu9pbugdTgoSqdn+HrpSzobIqD7/crbhMszGL5zwxAm
	geHa1M9P6/rjUjuKD4WGRqvfjtDBkZ3j6sDrEQE60hpeV+WALhZ9Olx/08sSgKOLeU0p
	L+jA==
X-Gm-Message-State: AG10YOQ/tx/DmMdK50mqKxhwGSctST3zoPALfduxQ3bPUfdkdL09fkK7wM9tFNmfQkijVPt/lgw16M3ZpaOu+asJ
X-Received: by 10.107.3.220 with SMTP id e89mr2013167ioi.99.1455274207176;
	Fri, 12 Feb 2016 02:50:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 12 Feb 2016 02:49:47 -0800 (PST)
In-Reply-To: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Feb 2016 10:49:47 +0000
Message-ID: <CAJTo0LaveuPmPrhLf9bc4H0PkyEz-cVGfiH+fjxqk=ynxJkhew@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 10:50:06 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c2b786f052b906e64

--001a113f0e7c2b786f052b906e64
Content-Type: text/plain; charset=UTF-8

On 12 February 2016 at 03:58, Gary Thomas <gary@mlbassoc.com> wrote:

> Improve the packaging of the libraries built by this recipe.  These
> are created using special code in the recipe and the debug (-dbg)
> packages were not being created.  Adding these packages allow the
> libraries in question to be debugged using GDB.
>

oe-pkgdata-utils says:

ffmpeg-dbg:
        /usr/bin/.debug/ffmpeg
        /usr/bin/.debug/ffprobe
        /usr/bin/.debug/ffserver
        /usr/lib/.debug/libavcodec.so.56.60.100
        /usr/lib/.debug/libavdevice.so.56.4.100
        /usr/lib/.debug/libavfilter.so.5.40.101
        /usr/lib/.debug/libavformat.so.56.40.101
        /usr/lib/.debug/libavutil.so.54.31.100
        /usr/lib/.debug/libpostproc.so.53.3.100
        /usr/lib/.debug/libswresample.so.1.2.101
        /usr/lib/.debug/libswscale.so.3.1.101

So I'm not sure why this would be needed.

Ross

--001a113f0e7c2b786f052b906e64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2016 at 03:58, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex"><div id=3D":av" class=3D"" style=3D"overflow:h=
idden">Improve the packaging of the libraries built by this recipe.=C2=A0 T=
hese<br>
are created using special code in the recipe and the debug (-dbg)<br>
packages were not being created.=C2=A0 Adding these packages allow the<br>
libraries in question to be debugged using GDB.</div></blockquote></div><br=
>oe-pkgdata-utils says:</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra"><div class=3D"gmail_extra">ffmpeg-dbg:</div><div class=3D=
"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/.debug/ffmpeg</div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/.debug/ffprobe</=
div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/.debug/=
ffserver</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/l=
ib/.debug/libavcodec.so.56.60.100</div><div class=3D"gmail_extra">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /usr/lib/.debug/libavdevice.so.56.4.100</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/.debug/libavfilter.s=
o.5.40.101</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr=
/lib/.debug/libavformat.so.56.40.101</div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /usr/lib/.debug/libavutil.so.54.31.100</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/.debug/libpostproc.s=
o.53.3.100</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr=
/lib/.debug/libswresample.so.1.2.101</div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /usr/lib/.debug/libswscale.so.3.1.101</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So I&#39;m not sure w=
hy this would be needed.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div></div>

--001a113f0e7c2b786f052b906e64--
