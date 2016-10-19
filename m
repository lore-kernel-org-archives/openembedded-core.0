Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D40E6FF69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:08:20 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id s49so23350043qta.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LF6uulb1YdQvJVA8MNSJDGQFd2UOXKrYve31DrAmz6w=;
	b=KY1rLEYVmDEwjgpS1L4BMt18R+bjizNX9/LvH4fs9wVZ2iNtxFS1RSWQD3f1txFfbl
	KYEZuKVDLs398GzRSKEM2TUwc3/HzOnkq6SFlxhIxUTo9qu5PYOv2KkLpn8VQ7Z1zO0P
	F0MhQTPRcN73kDJjZ1VKb//0HH91M/UYlNsQt/UpTuEWr285jeunssEPRVeUFjPgwkMc
	xRW5E3jUUTOLc9E3XCzk9DKFTcl8kqpn2TNXuM4JsZnaih+DCbOZQPSkIXYZ+MiAybfR
	WcBcTibqwl3PjIpQ29sx3qPjrl1YajBZRTKjEfWGlt880uRRgws0dM+I+0GuIay4j6LA
	v+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LF6uulb1YdQvJVA8MNSJDGQFd2UOXKrYve31DrAmz6w=;
	b=KEt+hoRt++a/9cgKBSEjowaI8o1hJQr2NIZgQHhxI6XdFRboVfcNp8R02yRF0LwIKx
	4klPkUHnRSuUvKb7AFHP8Itrrgcc3PydlHRMx4S62K+hB/zQ/f3zxCIkrTCc/PxVOfXD
	dbEmF/ky+93Euy6muBaB0+VTNubEJL7X/nBPstZesC3CQ6eOHikxVMY+QrjLId4f823e
	XYptOdMojg3mmZoNASBVufvyX5tBRHG5ecfGqL0bdwYUnI/Z3mpTCyllyFdxJWJTU0Ef
	/AIPBwKKE0FvO4/OoTcQ86brnhJfKL+q0XWlm6no/1pxwurwaDAAT+Amnb8V6sfTxHx6
	Otig==
X-Gm-Message-State: AA6/9Rn//MGKej934+pJzmB5fXAPCc67ojBo5QJklLjeq87enHIO6qlSvUAL5vfczwaMQgKrii+gvD/3Au0nb4fY
X-Received: by 10.55.32.195 with SMTP id g186mr5607750qkg.77.1476889701272;
	Wed, 19 Oct 2016 08:08:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 19 Oct 2016 08:08:00 -0700 (PDT)
In-Reply-To: <c80b8055-3c0c-4047-ebfd-4c94f41f95ba@topic.nl>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
	<0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
	<1570516.F2oa9eZtAN@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ=q+030y70h7=sq9c-9_mOm5K6sNRcV7xhBO1PEYAhow@mail.gmail.com>
	<c80b8055-3c0c-4047-ebfd-4c94f41f95ba@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Oct 2016 16:08:00 +0100
Message-ID: <CAJTo0LYda+-f0qRAbmJbReezk4Xp_znBH+QMMRr-1JJh0FK6Fg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Wed, 19 Oct 2016 15:08:23 -0000
Content-Type: multipart/alternative; boundary=001a11470c3a047065053f392eb7

--001a11470c3a047065053f392eb7
Content-Type: text/plain; charset=UTF-8

On 19 October 2016 at 15:02, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> busybox could RRPOVIDE tar?
>>
>
> If we go down that road, we'd end up with a busybox that RPROVIDES a
> hundred and one utilities. I doubt anyone will be happy with that...
>

Well, only for the utilities which are separately packaged and generally
swapped around. ie it wouldn't need to RPROVIDE "ls".

Ross

--001a11470c3a047065053f392eb7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2016 at 15:02, Mike Looijmans <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.=
nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><span class=3D"">busybox could RRPOVIDE tar?<br>
</span></blockquote>
<br>
If we go down that road, we&#39;d end up with a busybox that RPROVIDES a hu=
ndred and one utilities. I doubt anyone will be happy with that...<br></blo=
ckquote></div><br>Well, only for the utilities which are separately package=
d and generally swapped around. ie it wouldn&#39;t need to RPROVIDE &quot;l=
s&quot;.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11470c3a047065053f392eb7--
