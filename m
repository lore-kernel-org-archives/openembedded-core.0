Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A779A77A1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 11:12:14 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id m36so109997244qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qQbTcCIv3/f/t1/KHIuZB7MIPvf3Q6Hd3V8BLylp5xU=;
	b=1R3YgZm79bvXb1SIEOSBOhrv5q8x22s4zN64h9FJ97tQWmeFinKdNpuT7y87WI5lsS
	ESZbBvRG81EKWgYvny3HHHOV7zRKRZ1UED29FnhJAU5va2iObiQColvIxK0hPZIUo1sR
	WYsiof1pimgHrllC2zkrvMMMRqMKbn/qxqY60vV6CPTqBaI2BD4Qgrr4wkZC2V9KxuCv
	buTZsCmGLm/pxXHgdd5bXRY8W8lhVZH5uuDdARizsAp+8qV4Xvrfa6nmhV4jWD0YXXpM
	1vP5BNLvnqrIWNKc+ncRK55pH3XQHgEYAhc/gWiOvUMRo1XGScENmAau51xumP4qnq+A
	+lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qQbTcCIv3/f/t1/KHIuZB7MIPvf3Q6Hd3V8BLylp5xU=;
	b=H7qViZ8W6pfVM9yDJqgkXPmj/YnzuHpa7j0/Glyxl26mpaq7bSu1tT/w9/g8Xn9Vof
	3cL8ZwA88oeuC2TxrO0IupvpuLowLNyGRGg1XFvNwAfpAxY5dROyC6zbB+M4YENNRU36
	8nbQirJxntQVEhJmd+/1PmsW2AKVAdvBP0H13BAX1Xp0QCyqCsCY7nS/avD7Wk8LUg6k
	GGhUR4N6HG51EwicoCX+WDCPcN9nbOKR5popn/zRGd4hJBqgpjZDSBBpXFlzvKoTkDks
	+CiBdC2gOP0f2L3pO+MaxgEdQayiLCPblGnHL6qyPw01BTKln1aWhOW+vw8kQBGneIho
	Hmng==
X-Gm-Message-State: AN3rC/4x5Rez9n15DQ5mhPLW33MSGTXvrvyA+NKc3wEtt7HAKPGBy6qc
	uZCU/FUMHm10nqDyVS7kJdsEmH8HZroq
X-Received: by 10.200.34.242 with SMTP id g47mr24441015qta.109.1493032336251; 
	Mon, 24 Apr 2017 04:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 04:11:55 -0700 (PDT)
In-Reply-To: <CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
	<CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 12:11:55 +0100
Message-ID: <CAJTo0LZxsyHC7zjc7Z=wdS5_7NizgnCh=qkPM5munBkGWOmyGg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 11:12:15 -0000
Content-Type: multipart/alternative; boundary=001a114037d40a7980054de7aeb2

--001a114037d40a7980054de7aeb2
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 11:29, Burton, Ross <ross.burton@intel.com> wrote:

> I'm getting that with 4.9.15 from meta-intel, should I be telling Saul to
> update the BSP with some fixes you've made?
>

Or ideally telling myself to update meta-intel for the fixes that Saul has
already merged...

Ross

--001a114037d40a7980054de7aeb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 11:29, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>I&#39;m getting that with 4.9.15 from meta-intel, should I be telling Saul=
 to update the BSP with some fixes you&#39;ve made?</div></blockquote><div>=
<br></div><div>Or ideally telling myself to update meta-intel for the fixes=
 that Saul has already merged...</div><div><br></div><div>Ross=C2=A0</div><=
/div><br></div></div>

--001a114037d40a7980054de7aeb2--
