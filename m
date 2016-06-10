Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8926B6F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:33:38 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m62so68849771iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4WQ7jjOcZjMPQK2mdIi/aH6AOe3fWwLhbiVX1DJtoJ0=;
	b=bQA84dOhGM+TkZ6S7O+UhWV47HCaea0YQnbI+TpDpndTjQhGtZ/gPYb5HRl0qaRK+q
	2K6EiB+uGOpjWU0bColi/5HNhsP5elIxVw7wSyUd9z578GCW6MRa524n4I3xXrVa7SOz
	7Z46VtCoyL3jXdgzHtF2RReLNFYu8S9Eek8Lu+fkDwtWy9mq6QLrqjVMllLXunAvArZ0
	X0lJ4uMaunUhkRS7Y1qu8x4k9GNmEAgjZyufr3uFNa2qvwK3iqd3cWwBRGs1IA6KGMJR
	QrS0wDPsFeQKLUYFtNvNHdZ0QXBvZwTHaLKTMWm7XYUOPWZ5UlxYPujgggMV0GJLd5iT
	zSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4WQ7jjOcZjMPQK2mdIi/aH6AOe3fWwLhbiVX1DJtoJ0=;
	b=j/CzRt9Y+Rr6kPf5r8jpiyiYV6IVrty8+P98EG5i50SkHkgtU7SEfp2YuVQBzyYpwL
	KyGjkIlUBvAL6zOGCHxdvD3insNJdRnkpVGyR1snJo13bSqBdDcAx+Pyzg4xKqWIdJsQ
	RSY/44LpppryVY0XfZWrTFTMZDrGP8oovMB+D9TMG1/g+N1K+N26374kXlljW3xL2gTX
	AgNeXc1ErkLr/L8iKr3lucfkPUMAwhWwTOWQttkX0VnO9VG/gRQaUZCL3evI8kF8Zejx
	gR0qgKdE+00JACnmjl6lLUnKYbfnmNUs68cK1TA+XYQmMYZT6bLfPKxpPh2yKkqXX8UP
	0xJA==
X-Gm-Message-State: ALyK8tJ5rajeK4GZvOEKinDsCgvOJ85yQ2runpUJWRxY24dhQIs2WVCGbmq9CWfflEcOd4hBNJGWbGjkcvc9mvRa
X-Received: by 10.107.135.137 with SMTP id r9mr5245238ioi.133.1465572818518;
	Fri, 10 Jun 2016 08:33:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 10 Jun 2016 08:33:19 -0700 (PDT)
In-Reply-To: <575683F2.2050200@collabora.co.uk>
References: <1464357493-8652-1-git-send-email-andrew.shadura@collabora.co.uk>
	<CAP9ODKrhu4+XFZY5BeghTstiq4F2FeW52Yox0VqUusuq+p6tuA@mail.gmail.com>
	<575683F2.2050200@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jun 2016 16:33:19 +0100
Message-ID: <CAJTo0LZoFWfxU8D4bGW3gmXtQDT1hMCbhjcCBaYtrwzgDS0JYg@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Fri, 10 Jun 2016 15:33:39 -0000
Content-Type: multipart/alternative; boundary=001a113ec8423d968e0534ee438a

--001a113ec8423d968e0534ee438a
Content-Type: text/plain; charset=UTF-8

On 7 June 2016 at 09:21, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> Any news on this? It still hasn't been merged, even though the other
> patch has been.
>

It's broken on hosts where the library loader doesn't  match where the OE
distro puts it:

| cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
| tools/bin2header license_gzip > ./include/license.h
| /bin/sh: 2: tools/bin2header: not found

$ ./bin2header
-bash: ./bin2header: No such file or directory

Classic symptom of target compiler flags being used in a build using
CC_FOR_BUILD.

Ross

--001a113ec8423d968e0534ee438a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 June 2016 at 09:21, Andrew Shadura <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura@colla=
bora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":7w" class=
=3D"">Any news on this? It still hasn&#39;t been merged, even though the ot=
her<br>
patch has been.<br></div></blockquote><div><br></div><div>It&#39;s broken o=
n hosts where the library loader doesn&#39;t =C2=A0match where the OE distr=
o puts it:</div><div><br></div><div><div>| cat ./Licenses/gpl-2.0.txt | gzi=
p -9 -c | \</div><div>| <span class=3D"" style=3D"white-space:pre">	</span>=
tools/bin2header license_gzip &gt; ./include/license.h</div><div>| /bin/sh:=
 2: tools/bin2header: not found</div></div><div><br></div><div><div>$ ./bin=
2header</div><div>-bash: ./bin2header: No such file or directory</div></div=
><div><br></div><div>Classic symptom of target compiler flags being used in=
 a build using CC_FOR_BUILD.</div><div><br></div><div>Ross</div></div></div=
></div>

--001a113ec8423d968e0534ee438a--
