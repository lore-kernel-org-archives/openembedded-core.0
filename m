Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9F971BA0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 16:55:17 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id l138so2430227ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9DVjC6jcm51w0moKBelO02/LuUsC6GjWdX8ox5PhRXA=;
	b=A0KLVV7VcccfZeNXF9lsLgbKeS9vSOLNO4YcuYqfqXLPNwgVJePHzLGlqLdq1mm+tQ
	45UHNut/S8muoHbEoSm1lvcMwiO6rGBeU5LluECJcAeE7cywxr1RC/3ZhP3R7d76D0j9
	nw0tcH029ZD7J+pfyUSkvJA0ubtNVKUMU6DijAsBlGXVkbucOCU4MRTr5Q2Io2Vx+0gX
	9x7hS+Cot8UzwI4cQpzzfP+57vJ4svqD4C5mtfdMSYHtzROzn+jDaRu9ZrAyqqoEWNu0
	tBUoG7TXQITeG7MZlO0LMmPI4eFI1jDzLD6W8rsfmLVTfuWZAZEw9MWVfW1SueF3WP2j
	ifaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9DVjC6jcm51w0moKBelO02/LuUsC6GjWdX8ox5PhRXA=;
	b=ZtLAcqBs0fKEWJCT7CFjoHTQdrvYysIjlh3UZ5gwWpdp7eJL+sIlJxat6GTJks9gva
	T144xvxAKAGPfqn2p8pixMljEHpVhegjd1qnNjWhzmr3cuyVZQHgP2Q4py1IjMi7bQJa
	D0gZuTA8pFZzLIIFrnr7AT7pwpVAi7hutjkC6Mh2Tqc9s//n+B1gvrzoTy8B9WkrOJwP
	3xmUtGZhol4Z9uxPH94pNwRWKp7sEJoQUT5pgI1xnKbGUHKvtO+9zK/bgUCGlFVRG/RN
	rzthpbfU1tJrJ4yTagiAJPvuiSAuEHBaNayqSzqp6ZUibPX9nRp8J1Si7fyXDk7Om90u
	c3AA==
X-Gm-Message-State: AMke39lMFtzk+l1F9VwgEDIbIGs+hUAu9sSuKFuySA3gNIRFxnAy8kzwuCWe6uXHn7715nTBfb3kBzZZmwHSt7Fr
X-Received: by 10.129.111.194 with SMTP id k185mr9559711ywc.328.1488128119003; 
	Sun, 26 Feb 2017 08:55:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Sun, 26 Feb 2017 08:54:48 -0800 (PST)
In-Reply-To: <cover.1488125460.git.jussi.kukkonen@intel.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sun, 26 Feb 2017 18:54:48 +0200
Message-ID: <CAHiDW_FOR+oFFFCbK=LX_3dJVpCs22V-RhwiRTDFBhd9404zig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] wayland, mesa upgrades + bonus vulkan
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
X-List-Received-Date: Sun, 26 Feb 2017 16:55:18 -0000
Content-Type: multipart/alternative; boundary=001a1147194aea2357054971d334

--001a1147194aea2357054971d334
Content-Type: text/plain; charset=UTF-8

On 26 February 2017 at 18:50, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> These patches are in one set because the vulkan bits need both new
> weston and mesa


Maybe I should be more specific here: vkcube needs a very recent weston,
and I had a hard time getting vulkan demos to run properly with mesa 13
when I tried that last year.

Jussi

--001a1147194aea2357054971d334
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
6 February 2017 at 18:50, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">These patches are i=
n one set because the vulkan bits need both new<br>
weston and mesa</blockquote><div><br></div><div>Maybe I should be more spec=
ific here: vkcube needs a very recent weston, and I had a hard time getting=
 vulkan demos to run properly with mesa 13 when I tried that last year.</di=
v><div><br></div><div>Jussi</div></div></div></div>

--001a1147194aea2357054971d334--
