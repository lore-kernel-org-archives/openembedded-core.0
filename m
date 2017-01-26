Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 915F471E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:27:20 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id x49so71177244qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 04:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7A0jhR4fhrl/0598tPcPKoLnWrHO/ewMDXYQ042QYdo=;
	b=zyVLl9TzUQe/hDsW+R5/Qi7plprWibhjITj4eQ4rwe+TGPASVHWj7zC2SC/f/AIDrt
	i+a/fp9jnkrl7vCK2LB1BR3ciLW1mpmOgBbME+Fslsb6//2whLZHqA/5YNk6iJG/stkz
	Jr/XK02u9+rKFizIldyPWNo/fbaD37dJDBwK8eCYZTW+mtzb+qdbWtHVtAQDZya6Faa7
	cNN1LLRA5If1UtRINKHkArx1QFnf5aSy75ZVX4aHtmxkyPg/q/fXjUX+u9K9LhJ5iu4M
	0LC0GOPrTSFFCsAOPm4Sco0a68QphH/QC8YCtNGCZLR7ZC1q8wg3fFIFWvjU0GqBae7K
	XN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7A0jhR4fhrl/0598tPcPKoLnWrHO/ewMDXYQ042QYdo=;
	b=p/Xrb6VJRAPcZycCRsi6vT+Jxaikk5A2OyaANertVez5MQhRAi4J621PcLM35DpECI
	/iUdFIz5VMLOaKREyu47AAFiy2IDQOS5oSqV9NxGSgeU936AKA3N1upe460SIAkfu+5u
	W4psOv+9CtTyM17MlTPB7S8gDx5EvewFKD9k9GnekctGjoY26/zgeN13Eki/5o3xAFnq
	qgrr5u+VLPnqJiXshb+9aXgLg3hd1t3KAz6zn84GIZVZRnLVge7m7g9HUoW1SUrZnUnA
	OYerJRt+AOaPl5llvUqNQWzyDNsbBpg6EDPxq63CBJ9bN4lEKIyA1b4Zl/Z2XVfPbXur
	KFRg==
X-Gm-Message-State: AIkVDXJw+UgUFgIbD5tTNViwKuQGdT4DUy/zbtcXwLKVZSCKSBU8s1rjwoenGWI+ZbVcNlIGMkKNuqINjKfGkOlz
X-Received: by 10.200.45.247 with SMTP id q52mr2268271qta.197.1485433641362;
	Thu, 26 Jan 2017 04:27:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 26 Jan 2017 04:27:00 -0800 (PST)
In-Reply-To: <1485425724-4927-1-git-send-email-d.schultz@phytec.de>
References: <1485425724-4927-1-git-send-email-d.schultz@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jan 2017 12:27:00 +0000
Message-ID: <CAJTo0LYTr7X4wrgusQuBOuE4O2c-qoj3-RBPEJJ9gs9OiNG4ZA@mail.gmail.com>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cryptodev: Fix changed mm interface in Kernel 4.9
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
X-List-Received-Date: Thu, 26 Jan 2017 12:27:21 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf08809ab0546fe78e4

--001a1139cdf08809ab0546fe78e4
Content-Type: text/plain; charset=UTF-8

On 26 January 2017 at 10:15, Daniel Schultz <d.schultz@phytec.de> wrote:

> Upstream-Status: Backport
>

This needs to go in the header of the patch you apply, not the commit
message.

Ross

--001a1139cdf08809ab0546fe78e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2017 at 10:15, Daniel Schultz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:d.schultz@phytec.de" target=3D"_blank">d.schultz@phytec.de</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50c" class=
=3D"a3s aXjCH m159da45ff693ea75">Upstream-Status: Backport<br></div></block=
quote></div><br>This needs to go in the header of the patch you apply, not =
the commit message.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a1139cdf08809ab0546fe78e4--
