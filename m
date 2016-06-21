Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF32601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 18:35:49 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id h190so21649094ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LbzErXZDYn+jaZmyiybkwclZMkDn3KN5Ec23QOMeRnw=;
	b=LrqB2VQTCHwhk2VnQpQB396qulZcLDleiW3eQ6ETtxtUNWkC5DXmVbodhdLCwR3eVF
	PFAr4F4evACw9/7z2X7sVfKXWPlL/0gsGGHn7UERJJOFYS8VWGXUOm9bLBmW94cf1swI
	RZBcZHDzYJr/5InY8hl5RYUDHKzQAs7fLjZC1GVbTL+/1zOENoIj54vMPSVHxnkVW/gC
	o6Bc4jvl7KhkCbHspaV/Tr2XjC9RUwCGCdDnEGkYl7aiHGaq8KYaPoYdsc5S7gIH26k7
	tw0lU2k+rqEril+PG6PfWh/SBJ9osffaWeehj7+c3+RXjR8W442zHtmGCSiqkIHvIyYV
	g8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LbzErXZDYn+jaZmyiybkwclZMkDn3KN5Ec23QOMeRnw=;
	b=KEbE61t6AjfJ0W7HnJSzJoltezMCfG77juJbIxlvn28j6vYp/lKXyjR31wIEAqwA6S
	ycaGpruwal6X1+tUkoAH5SAzZNoxCGhsuhDDxfb/y5QvmvSBk6SbzmvKey5430pOays7
	KBK5HQhV+zjZQV4quTJxE6UWxgqyEjJl4n37p45d9QHA8OskgD64YsXtuhuFznWljLEs
	uK5rEEvIYoormdqRTz/7hFPn/+1PabaW/OeaxDMmUlgE7pKSMMO9g1S0ib6rFkgXLBYX
	z7JGwxsrKvBSi9Ug0lX/mXeT52sfCB0jyegOSWMogEXLDfVi7sf6k6MUE+t/u7kAAMMN
	N14g==
X-Gm-Message-State: ALyK8tI7UTcJLDtyy9dMxvff2X+qTp05sd0SFFSUe2PeiyESFtl6xWkhqjrbvIELUtGxnsD39AqgZoyRyEiGltJd
X-Received: by 10.36.2.71 with SMTP id 68mr8447194itu.38.1466534149876; Tue,
	21 Jun 2016 11:35:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 21 Jun 2016 11:35:30 -0700 (PDT)
In-Reply-To: <CALDxG5gA6Jv3+bmWtoQvJ0kbVyPJYhSk-csvPEnGOBhRmrq+PA@mail.gmail.com>
References: <CALDxG5gA6Jv3+bmWtoQvJ0kbVyPJYhSk-csvPEnGOBhRmrq+PA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jun 2016 19:35:30 +0100
Message-ID: <CAJTo0LbK+YT2FDytJi6PWUOg2oxrBiLqRrN-QQTrLNP+zneXOQ@mail.gmail.com>
To: srikanth krishnakar <skrishnakar@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: core-image-sato: puzzles binary conflicts with samba binary
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
X-List-Received-Date: Tue, 21 Jun 2016 18:35:51 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d00e07060535ce179f

--001a1144b1d00e07060535ce179f
Content-Type: text/plain; charset=UTF-8

On 21 June 2016 at 19:09, srikanth krishnakar <skrishnakar@gmail.com> wrote:

> I have noticed latest OE core build of sato image fails to build If the
> image is installing "puzzles" and "samba" simultaneously. The below error
> is seen during build of core-image-sato:
>

Sigh...  I'll send a quick patch to rename that binary.

Ross

--001a1144b1d00e07060535ce179f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 June 2016 at 19:09, srikanth krishnakar <span dir=3D"ltr">&lt;<a href=
=3D"mailto:skrishnakar@gmail.com" target=3D"_blank">skrishnakar@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I have noticed =
latest OE=20
core build of sato image fails to build If the image is installing=20
&quot;puzzles&quot; and &quot;samba&quot; simultaneously. The below error i=
s seen during=20
build of core-image-sato:<br></div></blockquote></div><br>Sigh...=C2=A0 I&#=
39;ll send a quick patch to rename that binary.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1144b1d00e07060535ce179f--
