Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id B2305763F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:04:49 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so26090566qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 08:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gjnumHky9dbrQlI9eWVpeqZrBDF1uI9oEYuZZGXSwk4=;
	b=QYEjkSLS3uT4ZeCzhRX876fpGXtkssVwjlf0UxfsPMpMiw2ahX4hkODaB923j6SabG
	3PAAem69XBGbxkzaUEhHxJ8+hEug18PAFtpLfSJUizCSJYt/jrbe98IBFjWFrC7fSfLW
	qyd5JO7Vvb+vCfB/Q1cxUjW4+AcVJrofUdpDGWFATfuDKwd0IpJM93OiHljZq2vFYEU6
	y9MkUq7+tSK6oabeQStfe4MsJ53FKiSZePmnwMxUz3kQDONgTtcknfPWf6yELEfWANph
	4/Uta7Vr23gYmrFO7HIDVITgvlBzVG5kkQm9vTCaBZOAr3AKLgV+WHGDP/X3rnVH3w/r
	kp9A==
X-Gm-Message-State: ALoCoQnH06P16l7DJS8kFJ4Y4XON4ThkEBWEoE2T6j2doMNoGFRJl9d/yZZdhIFcZ/BpHZAEVVqo
X-Received: by 10.140.235.71 with SMTP id g68mr6136298qhc.22.1438268689316;
	Thu, 30 Jul 2015 08:04:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 08:04:29 -0700 (PDT)
In-Reply-To: <20150730143353.GG2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<85e7e6014242705a3e1e06ec5862358e95641a3a.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143353.GG2457@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 16:04:29 +0100
Message-ID: <CAJTo0LZm7K35eEU5Sp9bnSQwKj4XRMR6_qC9BMCdcM3N-zrrmQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/26] nss: reorder SRC_URI lines to fix upstream version check
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
X-List-Received-Date: Thu, 30 Jul 2015 15:04:49 -0000
Content-Type: multipart/alternative; boundary=001a1135620e51b3c0051c19064a

--001a1135620e51b3c0051c19064a
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 15:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why don't you move this to .inc file and replace "3_17_3_RTM" with some
> variable set in .bb, it would be easier to read than this reorder and
> require .inc later..
>

Joe sent a patch earlier to remove the inc file entirely, so please rebase
on top of that (it's in ross/mut).

Ross

--001a1135620e51b3c0051c19064a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 15:33, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":22l" class=3D=
"a3s" style=3D"overflow:hidden">Why don&#39;t you move this to .inc file an=
d replace &quot;3_17_3_RTM&quot; with some<br>
variable set in .bb, it would be easier to read than this reorder and<br>
require .inc later..</div></blockquote></div><br>Joe sent a patch earlier t=
o remove the inc file entirely, so please rebase on top of that (it&#39;s i=
n ross/mut).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a1135620e51b3c0051c19064a--
