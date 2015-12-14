Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B9FD76067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:07:13 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so81830982igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 04:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tYLSlj3gttURFx2vyrzO+XVX6sketx6rIEjXRcmYnZ0=;
	b=0MKJR2dbx9ZZP2vfC8rl7G++7PfrB1a7zjkxvSEN6HMp9pBxQrwK2fo+OJ5/AJgxtc
	n7BfyjlPhjbfwEK36fYniwcXoJSX2wypxkIncTYYJ+GyLn9KiNSkdxY5YwWnRKQSVPwk
	kPg578ifx7twLKTki+O2eW04Qklrhqz4SlRJQmvvXmKvaRIvAgyDfNEW6XvBpgYMGOTg
	8FRjngKcIZb/xWKfhu+bcZOU2HrmYUUKVA8K+y575WDpSGEZsv+Akcf4Fe+f6JiaLXSz
	qDT23JE0tfjkIevXVrRLse0ZIp5Dloby0tUDef2ehRZZUM0cqYDUy0SxH2YripiUwzwq
	O6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tYLSlj3gttURFx2vyrzO+XVX6sketx6rIEjXRcmYnZ0=;
	b=WbvzYv44B0KUqs5LVDmC4eU7xbvU6rhg7dufYPuR8d31B5tykMcu2HtgsNbURa+MZj
	EKBuMaMdaCCvXkpe2SE0AsVJo9OliaEXbrGTQsekABfPt3fekx1TooYAvWe1TRFs/Qcx
	Wfo5yRU8uNBLAH15bB+9ior/QvpftDDTWqiegMWAY0ICuJfeE4JBRb0jLXJvhgiOllsx
	5eFfe9VMs4OwPzrxdnR9edvhlQahN2uXl4WnGkPtDg5UgFZ6jgfYpUHNZ0gIujMIcqr1
	ASDDKOQpyqCBrPFKYx4uuIzNxVZ3tzB6pD1btJ82c4aKLJl9L5NqSnkV5PFPgdN3x1fk
	yXaw==
X-Gm-Message-State: ALoCoQnnuttTo57Ole/zFqn6sjEoa2IN8rlp/QXtzIFpvcnJO+arTHp4rtfqVqQrSx1FhBYtOtO/rDaknNC7qupPYMS058i4AX5SEAUKYqhERzTDTPXKGaY=
X-Received: by 10.50.126.8 with SMTP id mu8mr16429354igb.52.1450094833740;
	Mon, 14 Dec 2015 04:07:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 14 Dec 2015 04:06:54 -0800 (PST)
In-Reply-To: <cover.1443032533.git.chris_larson@mentor.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Dec 2015 12:06:54 +0000
Message-ID: <CAJTo0La2XQ6JOt5Qt3eS+80LVKGEktVOKVe=pe=KpbC8X-TYAQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] recipetool/devtool: send errors to stderr
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
X-List-Received-Date: Mon, 14 Dec 2015 12:07:14 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf74cdf60526da8339

--047d7b1635bf74cdf60526da8339
Content-Type: text/plain; charset=UTF-8

Hi Chris,

On 23 September 2015 at 19:24, Christopher Larson <kergoth@gmail.com> wrote:

> are available in the git repository at:
>
>   git://github.com/kergoth/openembedded-core scriptutils-log-improvements
>
> https://github.com/kergoth/openembedded-core/tree/scriptutils-log-improvements
>

There's also a similar scriptutils-log-improvements-2 branch, what branch
is the one you want merged?

Ross

--047d7b1635bf74cdf60526da8339
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Chris,</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">On 23 September 2015 at 19:=
24, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmai=
l.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:h=
idden">are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/kergoth/openembedded-core" rel=3D=
"noreferrer" target=3D"_blank">github.com/kergoth/openembedded-core</a> scr=
iptutils-log-improvements<br>
=C2=A0 <a href=3D"https://github.com/kergoth/openembedded-core/tree/scriptu=
tils-log-improvements" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/kergoth/openembedded-core/tree/scriptutils-log-improvements</a></div></=
blockquote></div><br>There&#39;s also a similar scriptutils-log-improvement=
s-2 branch, what branch is the one you want merged?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bf74cdf60526da8339--
