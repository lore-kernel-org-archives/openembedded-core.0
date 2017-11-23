Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3BD7016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:00:36 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id i184so19008689ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 04:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HYMst3uUnlHpLKS9jlFYloPC+NhJImWwP01Gt3Ot4+I=;
	b=lNauCm2W7pD6TSyEoF9grAmj5uUMD9XzgSwZWF0Y6xGUFUAN65bvYeIxRVGvLmVXWr
	5P460e4q4CrmmBtdAjbvmY98j62Qx4W4D+Kuxvf+yk2cvy8PhLK5ZJMZhRSCRmVeF8DC
	mYtNT5+vP9O5j829L4SiV6Gn7r4EgGvuC+p2hH8EAV+IF5EqkxZVM6yiZTZV8CmVJyqd
	5Yh6UBwAdW5dfN3YGm9jaAl7lNroV+bvUiPIN4G0J/tvAdg5a3VjvaJBXHSk7soBaNVb
	/0POD6tFI+y5PCakJihgkffrftmYbdk11hQDiIGECMNMi9v7ChLatRytpkjN5KxTxZS0
	h+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HYMst3uUnlHpLKS9jlFYloPC+NhJImWwP01Gt3Ot4+I=;
	b=D0sndlqsEnxNPj/JI8TG2VobTC2sPnLV1FrYOHOWZ/1UgySMVgvkFfkF+8O2jw1r93
	rMKkWxq7Nz+zMGi5axhzbXxWASnh1VL/6XFGn2Cxk6nvOE+k551+uf6fkeEQZGATgpym
	hqjRmlUaOkg9IrQHMIzg0jNRel6ulU7NFh4xQsr1sOmq1i2mytBDv1IQhCcECP3KsbZ8
	CLQObUzy0VqQ1CpuKY5ADcBRXXTvb+KK4Q+8fpT2375y1bOxRrI1GMGIrf6W346MPMEM
	ovuL6Sm2MrrJSeIQ4UEeR2g8h876X0O2i2RruisC0fHbCmb0hCCZWmLeqfOaYDBUo2sI
	JujA==
X-Gm-Message-State: AJaThX7shHhJO9CpnncteO7/1vK+a6fcsI6vXQJs+x/C0+BF3Twpgzb0
	7d+fwWIuY2PUl2/uBIMtWaKFH2z3VoGPSCoKt61ZPjha
X-Google-Smtp-Source: AGs4zMZzSRR8SRr5G9TDY+eGZgVGxvzKfXcvXFPy54S4NKQM8p/uaJPE2M0+Tfvqxqvnqp14+4TxiOba5FI8K5xcH1o=
X-Received: by 10.107.32.18 with SMTP id g18mr25752212iog.227.1511438438322;
	Thu, 23 Nov 2017 04:00:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 04:00:17 -0800 (PST)
In-Reply-To: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
References: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 12:00:17 +0000
Message-ID: <CAJTo0Larccb=6j_AgMpMpxtSDkUCSCLzC3HDJ12rqk=9_ybMdQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Several Glibc security fixes
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
X-List-Received-Date: Thu, 23 Nov 2017 12:00:37 -0000
Content-Type: multipart/alternative; boundary="001a1141b498376e5a055ea52f2a"

--001a1141b498376e5a055ea52f2a
Content-Type: text/plain; charset="UTF-8"

On 23 November 2017 at 03:52, Armin Kuster <akuster808@gmail.com> wrote:

> The pending 2.27 update does not need these. Only apply if that update is
> delayed too long.
>

I don't see a pending 2.27 update, just a 2.26 update (to
77f921dac17c5fa99bd9e926d926c327982895f7).  Is there a patch I'm missing?

Ross

--001a1141b498376e5a055ea52f2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 November 2017 at 03:52, Armin Kuster <span dir=3D"lt=
r">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">The pending 2.27 update does not need the=
se. Only apply if that update is delayed too long.<br></blockquote><div><br=
></div><div>I don&#39;t see a pending 2.27 update, just a 2.26 update (to 7=
7f921dac17c5fa99bd9e926d926c327982895f7).=C2=A0 Is there a patch I&#39;m mi=
ssing?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141b498376e5a055ea52f2a--
