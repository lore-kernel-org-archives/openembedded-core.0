Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 191CB771CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 22:12:35 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id 9so195092675iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 14:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=glduWdTuHoNUMFlOnICcYaEGKVk5niSdDcq3s3mTQgw=;
	b=yw8JSeyWPcR24DkrtXj2Tm89AKtqxwhPT1sRM+a43FE97KOstESNiVuI9mlDt4yonr
	jsK6Ujxzjn+Ma0sl+Z6GYeiQrYTqvjkXcPTOsOd+LDCOZVDTfoiyjOnsoYdCIV6cZMEG
	bs45YqXXiQtWnD4gwr5JRklyJpuMvuDCyXL4EiY2NuIkjAJtlShwdi6mhtUmZikrXmkQ
	QP1Ke1GrVcoiZWZvO18muy5nNKlL4pq8iJ+59wl96fI6ShDQmiTBuraDN3xPifJw1CfK
	w+ltZ9+eMolmjfXrAcHzYFMaDwK0V3QrtIbLuMHGEon36X4HzjXugwTaC7wpXCR2Uuwx
	ItbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=glduWdTuHoNUMFlOnICcYaEGKVk5niSdDcq3s3mTQgw=;
	b=PiZghhFkLp/Dwx+XbF9DB8SifLpefvUlpOYvp8GHXMfdId/4QUrMATJhJSI5yvILRN
	JllQXxLRYZbDjLyEviQAQuOzLLFBtfBqOaJxApGNqEGo5l4jUgCzTZIfqHnF4KEn7UtL
	DXZp2FMYSlHKuaW1c8lzRQBiDpgk3/yCoIb/Crk2z8Xrvr6mWDnYvJA8EgT2ypmFKWze
	SZoyO89/1FVUoJQKiZdQBkr5o1Sf56HxP71/SVd+j5WijJF1hdG9ub2M+eguzeoARA5y
	1jO9sQiSrlKyL2YqSBhr5huoHlGv0RQvS2YJc9z7mB/En2TQBkkxQrG1vaSHYmjxWZJO
	1pSg==
X-Gm-Message-State: AG10YORpnMb6QZ3t4+71hn6bgeO1FPD2YraLKF/4Ow3Hx5LPlPexYFK/4P0XWRiTnCVuKz1iVQX9Yl1/dtC3JQ==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr28050519ioe.148.1456179156213; 
	Mon, 22 Feb 2016 14:12:36 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 22 Feb 2016 14:12:36 -0800 (PST)
In-Reply-To: <CAJTo0LYvmBojBtx=57ktQ5ej-FRhMoAGhDPOqJtMS+2he-e6uQ@mail.gmail.com>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
	<20160222211740.GG6329@jama>
	<CALbNGRQSdagG5HZ7c5uxGLo5z64SrA4RRKW6gu62ypXuAxHXSA@mail.gmail.com>
	<CAJTo0LYvmBojBtx=57ktQ5ej-FRhMoAGhDPOqJtMS+2he-e6uQ@mail.gmail.com>
Date: Mon, 22 Feb 2016 23:12:36 +0100
Message-ID: <CALbNGRSnVzcePkgjpd6Ao7Tm5Jx+L=tqs_6B1KFrfYAyoYRH2A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Mon, 22 Feb 2016 22:12:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 10:35 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 22 February 2016 at 21:19, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> > Did the following re-try download it with different (correct)
>> > checksum? Then it would be correct behavior if you had some
>> > e.g. incomplete flex-2.6.0.tar.bz2 tarball laying around in downloads
>> > directory.
>> >
>> I did a -ccleanall and repeated -> same behaviour
>
>
> Can you download the tarball manually and see what happens?
>
> $ wget http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2
> --2016-02-22 21:27:27--
> http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2
> Resolving downloads.sourceforge.net... 216.34.181.59
> Connecting to downloads.sourceforge.net|216.34.181.59|:80... connected.
> HTTP request sent, awaiting response... 302 Found
> Location:
> http://netcologne.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2
> [following]
> --2016-02-22 21:27:28--
> http://netcologne.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2
> Resolving netcologne.dl.sourceforge.net... 78.35.24.46, 2001:4dd0:1234:6:=
:5f
> Connecting to netcologne.dl.sourceforge.net|78.35.24.46|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1634276 (1.6M) [application/octet-stream]
> Saving to: 'flex-2.6.0.tar.bz2'
>
> flex-2.6.0.tar.bz2                 59%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> ] 942.21K  66.6KB/s    eta 7s     5flex-2.6.0.tar.bz2
> 59%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>                         ] 954.15K
> 64.2KB/s    eta 7s     fflex-2.6.0.tar.bz2
> 60%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>                        ] 972.44K
> 66.1KB/s    eta 6s
> flex-2.6.0.tar.bz2
> 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>]   1.56M
> 31.5KB/s    in 24s
>
> 2016-02-22 21:27:53 (65.8 KB/s) - 'flex-2.6.0.tar.bz2' saved
> [1634276/1634276]
>
> ~
> $ md5 flex-2.6.0.tar.bz2
> MD5 (flex-2.6.0.tar.bz2) =3D 266270f13c48ed043d95648075084d59
>
> (don't laugh at my download speed, it's not fun working on 3G)
>
> So that md5 matches what the recipe says (26627... and 24e611... for md5 =
and
> sha) and I've just verified that it builds fine after a cleanall.    You
> definitely need to compare what you're downloading with everyone else.
>
[superandy@localhost openembedded-core]$ wget
http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2
--2016-02-22 22:45:44--
http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.1=
81.59
Connecting to downloads.sourceforge.net
(downloads.sourceforge.net)|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://netix.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2
[following]
--2016-02-22 22:45:45--
http://netix.dl.sourceforge.net/project/flex/flex-2.6.0.tar.bz2
Resolving netix.dl.sourceforge.net (netix.dl.sourceforge.net)... 87.121.121=
.2
Connecting to netix.dl.sourceforge.net
(netix.dl.sourceforge.net)|87.121.121.2|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1634276 (1.6M) [application/octet-stream]
Saving to: =E2=80=98flex-2.6.0.tar.bz2=E2=80=99

flex-2.6.0.tar.bz2
100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>]
  1.56M  1.55MB/s    in 1.0s

2016-02-22 22:45:47 (1.55 MB/s) - =E2=80=98flex-2.6.0.tar.bz2=E2=80=99 save=
d [1634276/1634276]

[superandy@localhost openembedded-core]$ md5sum flex-2.6.0.tar.bz2
266270f13c48ed043d95648075084d59  flex-2.6.0.tar.bz2

So download seems fine.

I also checked in oe download dir and get

[superandy@localhost download]$ md5sum flex-2.6.0.tar.bz2
266270f13c48ed043d95648075084d59  flex-2.6.0.tar.bz2

Also fine.

So I did again: -ccleanall / rebuild -> error is gone

Seems there was an automatic (re)download when I saw the first
warnings. With older sources of bitbake I have not seen such thing: In
case a checksum error was detected, the build was aborted and the new
checksums were logged to insert in the recipe. So I would now consider
this as solved and I saw a new feature in action - thanks for support.

Andreas

