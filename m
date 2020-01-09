Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id F0AF77FE5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:54:26 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id b129so1979030vka.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 05:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FQ3dsr/mb/VTlFwFTGVdHk8UPd/9Dviiv/FlH3+g5k4=;
	b=DDnzR4vc7uuDv/tGql2nXtI2grMP9eReK5n5jH5Oyw8T3QMn9NzuKBYqszkSlp64Mp
	b/4lInF7G+4mRDP3sy6fORdq5JO/bQyHVeDbngH5wxv4/nhlwJqKjvATifUrmy0u272i
	Lv2jINfx6Xb4dmVXtwQz782Rl7ZxCV1f+3a0EKsh8kwe/G1dX/L9OqcNAK1GLjMg/eyf
	YIOFcrS6/55vo1n5v0uhRZeZW5YvZJ8z/HIcCAV6DwY242WCrAHkFyTFJTb62VPQiFT2
	aeg1PauZ2IdjG7Aer2sklUWfhj0+8oBsBPh2+rFzh0Txm8Ui1GmVJVx7zDZPD60g4Bbe
	GpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FQ3dsr/mb/VTlFwFTGVdHk8UPd/9Dviiv/FlH3+g5k4=;
	b=IkQoyMQ6LhN7CCbyrVxac3KKGVRoaZtazl3cuas/lun0w78ok8+bUn75aEJBpdO1jm
	2uy7ZrFBmEZbzVjYdJStoBYWAklCEIprY4yNvPsWDz5XJV+UcaRZzPlrBTcMdYRoZ4UF
	achxhRKje1DZAJn7GWWluIOHMvSXKgoefUc1Ee33Rk/dMy7pB/0kFHOKIFvVgsCuH/f4
	yTVpIgJU0hOnnxsTa8PYbpG+QbV1XMqnWMJ5X+e3Ekw09cl73hFo2I/+7YliyqmeGGhy
	KiuyxFbHJMEJcwq+r2S15IB+gaDkO9crM/fHO+ryJdpexvlVQCw5CH4IOQ28XVuxS9md
	HnJw==
X-Gm-Message-State: APjAAAVNnhllusSlXWQXbwIbm62jKkQ3pVMgDEqzPCGaYfCN6IsGNcyk
	b2aF6RuJ+Q5BZSAzJLhtCQCWfsTLZvZCqSDDKSniotZh
X-Google-Smtp-Source: APXvYqyZhYMs4FESZkXRDHZJ2yDj7Zfa84S2sm1qW2zg4NaLK0QQKZ/rKhGS1/uZm2VT6R1xTXugWfuQybf2ksPn944=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr6790629vkn.0.1578578067857;
	Thu, 09 Jan 2020 05:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
In-Reply-To: <CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 14:54:17 +0100
Message-ID: <CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 13:54:27 -0000
Content-Type: multipart/alternative; boundary="000000000000fc26ca059bb5589c"

--000000000000fc26ca059bb5589c
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 14:47, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

>
> I had a closer look at how and where ifupdown recipe is used, and from
> what I see it isn't:
> every configuration is relying on busybox to provide the same utilities.
> That's why the failure is seen only in world builds :)
>
> Should we drop the ifupdown recipe?
>

A followup: there is a busybox-free set put together in
meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
which includes ifupdown only if systemd is not in use.

However that packagegroup is not used in any images, and the only test for
it is in lib/oeqa/selftest/cases/imagefeatures.py
which does enable systemd, so that doesn't pull in ifupdown either.

This means ifupdown isn't runtime-tested now, and probably hasn't been
tested for a while.

Alex

--000000000000fc26ca059bb5589c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 14:47, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><br><div>I had a closer look at how and where ifupdown recipe =
is used, and from what I see it isn&#39;t:</div>every configuration is rely=
ing on busybox to provide the same utilities. That&#39;s why the failure is=
 seen only in world builds :)<br></div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">Should we drop the ifupdown recipe?</div></div>=
</blockquote><div><br></div><div>A followup: there is a busybox-free set pu=
t together in meta/recipes-extended/packagegroups/<a href=3D"http://package=
group-core-base-utils.bb" target=3D"_blank">packagegroup-core-base-utils.bb=
</a></div><div>which includes ifupdown only if systemd is not in use.<br></=
div><div><br></div><div>However that packagegroup is not used in any images=
, and the only test for it is in lib/oeqa/selftest/cases/imagefeatures.py</=
div><div>which does enable systemd, so that doesn&#39;t pull in ifupdown ei=
ther.<br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">This means ifupdown isn&#39;t runtime-tested now, and probably ha=
sn&#39;t been tested for a while.<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000fc26ca059bb5589c--
