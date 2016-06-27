Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id CACFA6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:39:33 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id f30so146469766ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TFZ/iBHmTzb23OTx9oclENJxKYC+8hdZnN1yNL+liw4=;
	b=UfyYHAUirsq0PFGKG1ATI/4RMm71dfvP8GFeY0xGsVU2vpfErab+uwPcralz6Uc7H3
	r3IZvF3mly13U74zhXEk3TUB8PHgw+Iqca1gTlgzcWFWblVamTCB/G73vnJpRpldNFe9
	doePmYDTTGUgfTqpIWbtd6i2igdaVoIDv/GgPaao+BCgvl9Fpg2McXLWvWHpRF7pnyKG
	9ifVAyLC/3SL2xwXys1Rg6DnJAGT8VXZqc8TMcQgsrbSqJbDVXtSpRJQBUq+0S9nsHt0
	rDtcnfdi4goGcnrq+yaNshvSA+Nt/TzbcLbsmn98/3Frm+bB/yw9Goxh5gzB1v/Vv5Gh
	+Kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TFZ/iBHmTzb23OTx9oclENJxKYC+8hdZnN1yNL+liw4=;
	b=CjvbSJ92qWmoJITpcCEQtvivZpCmXJBeAkTWON5Tht3r/4ISEe25CvNZyyU5worPC8
	x0XxrgrYSw6HXOuC+OORluXQSxSH9dXlcB+p2Za0PZ9krlT3nWztUrHcQ7nBloLh6m4F
	TgHJNEHuI0KM79G+1MvUTUYwlvGPu/Hi6+T40Z0Ic7Gen8NfnC7ZZB7klgNW0Cgymb1u
	Io77ZUq68U/T5Jn4a7wjwGo+x86RH1Yl9p+uT8hZrjV/zdpwHKrlFxgRcjH7lqyJ8JKJ
	dNMWJ6FwZhSq4vIXUpG2NYhg4V4svwiwMrHDH3FDh2zdQXn5U3RosncmYVQnLsW7MHpX
	1NkQ==
X-Gm-Message-State: ALyK8tJeNr5AQAwyvgIK4m5wacSorrD74MazwVm5bfAS0VtfV6H44KFeWuUREi1W9HE+8bau7Pvg2EV/w/4zTot/
X-Received: by 10.107.135.137 with SMTP id r9mr16977083ioi.133.1467016774138; 
	Mon, 27 Jun 2016 01:39:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 27 Jun 2016 01:39:14 -0700 (PDT)
In-Reply-To: <1467015833-11686-1-git-send-email-dmitry.rozhkov@linux.intel.com>
References: <1467015833-11686-1-git-send-email-dmitry.rozhkov@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jun 2016 09:39:14 +0100
Message-ID: <CAJTo0LYLxkfDWQpH02-5nHg5gXFRd-Ark4KtJm_67sD7bFUNBg@mail.gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libxfce4ui: Use native intltool for building the lib
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
X-List-Received-Date: Mon, 27 Jun 2016 08:39:35 -0000
Content-Type: multipart/alternative; boundary=001a113ec842b3d61e05363e753a

--001a113ec842b3d61e05363e753a
Content-Type: text/plain; charset=UTF-8

On 27 June 2016 at 09:23, Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
wrote:

>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb | 2 +-
>

Wrong list, you meant openembedded-devel@.

Ross

--001a113ec842b3d61e05363e753a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 June 2016 at 09:23, Dmitry Rozhkov <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:dmitry.rozhkov@linux.intel.com" target=3D"_blank">dmitry.rozhkov@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":6ed" class=3D"a3s aXjCH m15590f695a65e902">=C2=A0meta-xfce/recipes-xfc=
e/libxfce4ui/<a href=3D"http://libxfce4ui_4.12.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libxfce4ui_4.12.1.bb</a> | 2 +-<br></div></blockquote></div>=
<br>Wrong list, you meant openembedded-devel@.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec842b3d61e05363e753a--
