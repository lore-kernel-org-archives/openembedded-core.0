Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id E2C5760112
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:09:12 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id z14so57203358igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VGzFQX3BNT1VLMcQF0qaxZWURZ3n/Gw8YSgF11YJcwU=;
	b=hOPlgHvMO2rjpNxqliEbXFMNUjIHCdlM26quPIybI5n/z384GNT0B7na1Pn1VJOq2i
	CKUtYcTjXpH/nyWLM9scwZBe5pcIh16WO/H6daXOhVPw/v2bBN05ak2W1BmtxzeqAQ/1
	Nq5mlqFOfB9q0ttMuMHcb8W4BezDrm3fwKxuXvVVdRz5U101SNY5yqtz53Z1eV93ypRe
	PE/9OO8Pqvt9ipDdGl4C4NBlKnnDB8y8w7u7qgKln7IhMGZqlMTgK2w7cqbSlZ+DkpTy
	2LEmIv9xCrmPDAI/mivWO58nEL2FbNImRIY1X3Le6tdNXY2vgAIvn8IIShmSQ/IrfJG7
	E9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VGzFQX3BNT1VLMcQF0qaxZWURZ3n/Gw8YSgF11YJcwU=;
	b=QZLVKew+4AyHQtg9ImKItEbRWLh5tVPD0xhtc7A7thPHQlpazc6h0mh/D6v3osUZDU
	hgOauLS5dnPybvsIBLq/s0S23n6YTP+BwEQLCQ2Al8v3LCFaxJZHlx+fp1o84elR30/M
	bauvZIyhOQ6lp1Yz0ej7kxKJdUBnkUIsATEz8T+9Wf93pPqn+mwmk6wj1A57hzYly8hH
	e/JSBV0JStFBbakDFFP0w6lV+JdSz7r8sZcO0y3K1IFw4v9BCwVoWmnLICy0QxGk9ry0
	VeDW7OWPVMNDYYD93rgt4sCkFRem7bJlQBSbZM3Ow4S42aSH2xmQtMa2p94oPMAOGRee
	UyEg==
X-Gm-Message-State: AG10YOSHj4YW03qZUdxHdvKGFNPBT6535yz3Aty4E5xHunG4FKQh8NohSKG1CJNKbPUsp5RcQfDtemOjiJpmgAoa
X-Received: by 10.50.13.100 with SMTP id g4mr10358667igc.64.1453129753145;
	Mon, 18 Jan 2016 07:09:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 07:08:53 -0800 (PST)
In-Reply-To: <1453109582-25485-14-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
	<1453109582-25485-14-git-send-email-b54851@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 15:08:53 +0000
Message-ID: <CAJTo0LZZD+BHZThgUAuHWzRg=vjY4pVec-6xvym0=tjQ4FY4qQ@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 13/13] gstreamer1.0-plugins-bad: Fix loop test hang in glimagesink
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
X-List-Received-Date: Mon, 18 Jan 2016 15:09:14 -0000
Content-Type: multipart/alternative; boundary=089e013c6614bfca3305299d22dc

--089e013c6614bfca3305299d22dc
Content-Type: text/plain; charset=UTF-8

On 18 January 2016 at 09:33, Yuqing Zhu <b54851@freescale.com> wrote:

> +Upstream-Status: Pending
> +
> +bugzilla URL: https://bugzilla.gnome.org/show_bug.cgi?id=758984
>

So this would be Upstream-Status: Submitted.

Most of the patches are actually submitted upstream but in Pending state,
can you fix them please.

Ross

--089e013c6614bfca3305299d22dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2016 at 09:33, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:b54851@freescale.com" target=3D"_blank">b54851@freescale.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidde=
n">+Upstream-Status: Pending<br>
+<br>
+bugzilla URL: <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D7589=
84" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bu=
g.cgi?id=3D758984</a></div></blockquote></div><br>So this would be Upstream=
-Status: Submitted.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Most of the patches are actually submitted upstream but in Pe=
nding state, can you fix them please.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--089e013c6614bfca3305299d22dc--
