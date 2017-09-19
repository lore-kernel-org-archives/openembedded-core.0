Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0D252780AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 15:55:26 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id w94so111118ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0083bGbJC0eCKQLacpoQcOw2BpT81PmmaYQzBBhqP6Y=;
	b=Fj6T85NMQSC0U/R61ScpD8IMCJTI9Al4sxLHwvl7BvqDFjjTYsdTdKGowwK6woCYh7
	PGLn5sT9PlklInygXRbDJGS/yDxs2lF7pS3rBguQZ6OtmNmEExrlWX/n8xIC2CjtJZOL
	GZ3pG2x8M6YsGxLvdZ+DZjB8x8cBUTBY1VdoXrssMSPn7Gzp+mvDiC7dGm+IVyFLfSQ3
	OGUNpZojkDwCvU5mJbfe2fDj+bruOBAUGBORRe9OAThACQIvuof8z9tZrT0hI9LC2GbP
	avsjlsWVe+IE9oLuEQYFacdcoSrbdUjG+zexrnEG2lKcc8CqkJecT8XFDeEwWfaym1q9
	NOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0083bGbJC0eCKQLacpoQcOw2BpT81PmmaYQzBBhqP6Y=;
	b=Neq41SUhXpx90oZnI/Di5BRQDLW6tHTNnetaXUKU8vrFv6QmHaFEmhsPAvy8SWQQWM
	0ymktogYkknWUEAx/OWu58e3vm9f7nFfxV4+/CDEXkazNsvtcatDMzJiZbDemClRgoeX
	QF5O6wGsybCbZvr9AZ46XbfwnGLJ/PKcQ7YNwnatTzb/MJlBb+GXesKT0HMRUWNGYhrs
	j8wU8sSerY21gT8dtj8rMP2332MLCsDTMMllyucVBvIk6OLanrJbDj4Xv5BNdoT/Uo9u
	Rx9GDz+iz9uTw5ptlD/rc40BwVA0UWp65PbBylitRoD+7/ogr9dm6o6Y6XN/HJUzTCRr
	wB8w==
X-Gm-Message-State: AHPjjUiWzwarJ/zT6HcOaQ3br5BhxaUB2NSZtCQuhUip9WR8neFh9iBy
	ETHGp/s2CSd39uGVfgRozqx0AcwMisyPEXQAVKICDeMe
X-Google-Smtp-Source: AOwi7QAYDFjmhzoRxKsV1qyB7/ZtDawfg9HlAbBodcgoEaPGyMjAoCARlz6US60M5r8GFKbZ/w6gXhZy5MtbXM4QuUc=
X-Received: by 10.107.133.92 with SMTP id h89mr2311077iod.208.1505836527886;
	Tue, 19 Sep 2017 08:55:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 08:55:06 -0700 (PDT)
In-Reply-To: <d2cf577f-a995-9cc2-380b-9a1922926abd@igalia.com>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
	<d2cf577f-a995-9cc2-380b-9a1922926abd@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 16:55:06 +0100
Message-ID: <CAJTo0LYtC2MVYqwz_LkGEAvNuDKCQByH1r5QBv-TZKBi499meQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 15:55:27 -0000
Content-Type: multipart/alternative; boundary="001a113ff7d055e20f05598ce371"

--001a113ff7d055e20f05598ce371
Content-Type: text/plain; charset="UTF-8"

On 19 September 2017 at 15:34, Carlos Alberto Lopez Perez <clopez@igalia.com
> wrote:

> On 19/09/17 10:09, Burton, Ross wrote:
> > Then the tarball for one of Erlang's repositories changed, and was
> noticed
> > by the checksum in the recipe (thanks Gunnar Andersson for reporting
> > this).  The extracted contents are identical, but the tarball itself has
> > changed.  I'm presuming this is due to the old tarball expiring in their
> > cache, and a newly generated tarball using a later version of tar.
>
> I don't think tar is the one to blame, but gzip.
> I have just tested GNU tar (versions 1.29 and 1.26) and BSD tar (from
> OpenBSD 5.8) and the 3 have produced identical archives (same md5sum)
> when invoked like git archive does.
>
> However, the .tar.gz file generated was different in the case of BSD.
> It even had a different file size.
>
> I bet that if you uncompress both files, the .tar will have the same
> checksum in both cases.
>

In the situation that I was talking to Gunnar with, the source is the tar
itself.

https://paste.fedoraproject.org/paste/rP67aSPn1IuYbQcz2UNY3g

They have identical length
> $ wc -c new-OTP-18.2.3.tar
> 159068160 new-OTP-18.2.3.tar
> 159068160 orig-OTP-18.2.3.tar
> ...but different content
> $ cmp new-OTP-18.2.3.tar orig-OTP-18.2.3.tar
> $ new-OTP-18.2.3.tar orig-OTP-18.2.3.tar differ: byte 79122433, line
> 2004431
>

Basically, both tar and gzip can cause problems.

Ross

--001a113ff7d055e20f05598ce371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 September 2017 at 15:34, Carlos Alberto Lopez Perez =
<span dir=3D"ltr">&lt;<a href=3D"mailto:clopez@igalia.com" target=3D"_blank=
">clopez@igalia.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On 19/09/17=
 10:09, Burton, Ross wrote:<br>
&gt; Then the tarball for one of Erlang&#39;s repositories changed, and was=
 noticed<br>
&gt; by the checksum in the recipe (thanks Gunnar Andersson for reporting<b=
r>
&gt; this).=C2=A0 The extracted contents are identical, but the tarball its=
elf has<br>
&gt; changed.=C2=A0 I&#39;m presuming this is due to the old tarball expiri=
ng in their<br>
&gt; cache, and a newly generated tarball using a later version of tar.<br>
<br>
</span>I don&#39;t think tar is the one to blame, but gzip.<br>
I have just tested GNU tar (versions 1.29 and 1.26) and BSD tar (from<br>
OpenBSD 5.8) and the 3 have produced identical archives (same md5sum)<br>
when invoked like git archive does.<br>
<br>
However, the .tar.gz file generated was different in the case of BSD.<br>
It even had a different file size.<br>
<br>
I bet that if you uncompress both files, the .tar will have the same<br>
checksum in both cases.<br></blockquote><div><br></div><div>In the situatio=
n that I was talking to Gunnar with, the source is the tar itself.</div><di=
v><br></div><div><a href=3D"https://paste.fedoraproject.org/paste/rP67aSPn1=
IuYbQcz2UNY3g">https://paste.fedoraproject.org/paste/rP67aSPn1IuYbQcz2UNY3g=
</a></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex">They have identical length<br>$ w=
c -c new-OTP-18.2.3.tar<br>159068160 new-OTP-18.2.3.tar<br>159068160 orig-O=
TP-18.2.3.tar<br>...but different content<br>$ cmp new-OTP-18.2.3.tar orig-=
OTP-18.2.3.tar<br>$ new-OTP-18.2.3.tar orig-OTP-18.2.3.tar differ: byte 791=
22433, line 2004431<br></blockquote><div><br></div><div>Basically, both tar=
 and gzip can cause problems.</div><div><br></div><div>Ross</div></div></di=
v></div>

--001a113ff7d055e20f05598ce371--
