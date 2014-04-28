Return-Path: <drew@moseleynet.net>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id D325060703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 17:34:49 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so6040977pab.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LLCE+IJU504Gbcyw+pC3FzAeD+Owp3GkMaahelEZ/Q8=;
	b=UK1J+nqW1RR77B83JtuM2E8GPLWFql4HOsw3Il09a0d6i47F6GxEyXuYo2vq8TpMuv
	Y+An7tf3sBsYRAMjDExyCPKnoKODP3cqgEIiDkaSuPwjMR/IcqCNQaPG8//vJ36MfkHE
	ldG39uSmKtdwOtk/NQY7lGJJIqvqYfqnCyhzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=LLCE+IJU504Gbcyw+pC3FzAeD+Owp3GkMaahelEZ/Q8=;
	b=Z4vTe0dqL6gLEJMxgnvFetmU27qHYvzvx90XIvaKmy5mq+eStgTVWFFYuCSQCpt8Md
	DZ2ugvU9JSjJnfgGiQ+wIiUX3VSii7r+sdqFk7mOL2+7oKtix0Eu9FSWh4ljyJkqNggN
	6WlGM4WArhNWq+86YbKaUOG7BJ4RyTwtzpKkj4J7opoKtYy6ZyexSN5AS2FGv66voC+1
	DEK8n9EYpgpm0fseK3m/H6vP+TmSrLXYmjXM17j75zqqMzUU/iRe0p9mpOTywq6cqwpY
	KHwZIWADYHVqqsFT9dBt3TFES1Ok3MYQCl6LzmMOzVNOoUfU1l19hPnnsULeNdjMH6ir
	4ubw==
X-Gm-Message-State: ALoCoQlD4QSY8b3Tv7srg13A+Xc/HE6JxmNJ9J4DNye5wCI/QOH3wAb+KXjBKeE2p0yn6J3j9E//
X-Received: by 10.68.239.137 with SMTP id vs9mr30660122pbc.84.1398706490180;
	Mon, 28 Apr 2014 10:34:50 -0700 (PDT)
Received: from [192.168.1.33] (cpe-174-096-222-251.carolina.res.rr.com.
	[174.96.222.251]) by mx.google.com with ESMTPSA id
	ph1sm94900124pac.14.2014.04.28.10.34.47 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 10:34:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Drew Moseley <drew@moseleynet.net>
In-Reply-To: <CAMKF1sq49NF+qyQ7nEO4yzedFiB9i+Z7oOQR_UHAvQ=ouAkAhA@mail.gmail.com>
Date: Mon, 28 Apr 2014 13:34:45 -0400
Message-Id: <7579DF88-C41A-40BF-8354-E39C937CBF45@moseleynet.net>
References: <1398699537-28100-1-git-send-email-drew@moseleynet.net>
	<CAMKF1sq49NF+qyQ7nEO4yzedFiB9i+Z7oOQR_UHAvQ=ouAkAhA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1874)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Check for HAVE_POSIX_FALLOCATE
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
X-List-Received-Date: Mon, 28 Apr 2014 17:34:53 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E65845FA-7643-4248-89C4-CF8873DC5282"

--Apple-Mail=_E65845FA-7643-4248-89C4-CF8873DC5282
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On Apr 28, 2014, at 1:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Apr 28, 2014 at 8:38 AM, Drew Moseley <drew@moseleynet.net> wrote:
>> From: Drew Moseley <drew_moseley@mentor.com>
>> 
>> The check for the config variable is using the wrong define
>> resulting in the #else always being used.
>> 
> 
> good catch. Looks good to me Thanks for the patch.

Hi Khem,

I'm curious about the safety of using alloca() here. In my
particular config, without the fix to use posix_fallocate(), it was
attempting to allocate 8MB on the stack, evidently failing, and
then segfaulting.  And there is evidently no error return value
from alloca so any time it fails a segfault is the likely result.

Thoughts?

Drew

--Apple-Mail=_E65845FA-7643-4248-89C4-CF8873DC5282
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">On Apr =
28, 2014, at 1:10 PM, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; =
wrote:<div><blockquote type=3D"cite"><span style=3D"font-family: Monaco; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">On Mon, Apr 28, 2014 at 8:38 =
AM, Drew Moseley &lt;</span><a href=3D"mailto:drew@moseleynet.net" =
style=3D"font-family: Monaco; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;">drew@moseleynet.net</a><span =
style=3D"font-family: Monaco; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;">&gt; wrote:</span><br style=3D"font-family: Monaco; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><blockquote type=3D"cite" style=3D"font-family: Monaco; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;">From: =
Drew Moseley &lt;<a =
href=3D"mailto:drew_moseley@mentor.com">drew_moseley@mentor.com</a>&gt;<br=
><br>The check for the config variable is using the wrong =
define<br>resulting in the #else always being =
used.<br><br></blockquote><br style=3D"font-family: Monaco; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span =
style=3D"font-family: Monaco; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;">good catch. Looks good to me Thanks for the =
patch.</span></blockquote></div><br><div>Hi =
Khem,</div><div><br></div><div><div>I'm curious about the safety of =
using alloca() here. In my</div><div>particular config, without the fix =
to use posix_fallocate(), it was</div><div>attempting to allocate 8MB on =
the stack, evidently failing, and</div><div>then segfaulting. &nbsp;And =
there is evidently no error return value</div><div>from alloca so any =
time it fails a segfault is the likely =
result.</div></div><div><br></div><div>Thoughts?</div><div><br></div><div>=
Drew</div></body></html>=

--Apple-Mail=_E65845FA-7643-4248-89C4-CF8873DC5282--
