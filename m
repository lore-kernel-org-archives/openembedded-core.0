Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1D75565CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 13:04:13 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so124865261igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HUtuBO0e75G6/I0hyPrM7LFmLYizTGNQEcBuCCn/0ZQ=;
	b=o3o3SziE5AkiFaaCL6KELH9/dXOqTJBPEg7CNFSrWT3qWwVWyWVMws8aCRbHvO9wD0
	QkoOUwt4iNbhFGOkAbNvJq5j8rYq4F4BVGHac2teiHNUTJfS9zQuCzpf5GO1kWkZyHC9
	dtCA07LXnRriDRRJn1NpOaqx3cAmX+iZmoqqRnKcK+Wvl7mMSms1q417kLbr82tcChuy
	bbzfcLiR9rgcZ7ZRsj2uU1+k1dvFe0OO7HBN7Z/WZHtb/WpCHEdDzwGoQRGFQ1EPPa9L
	HiBLIavFOOySyK8TuH8hY2pYYYlhzL8joPmZAKG7bY8tZj/QWovWUKDf7ft2knrjdS9U
	GU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HUtuBO0e75G6/I0hyPrM7LFmLYizTGNQEcBuCCn/0ZQ=;
	b=dW56bePwjp88e9BGWA1dEJSzp2PgGnvVVdVroi7iiPM2+3N/POSg89nJkxOWqg6lXE
	fbYYDVs9ADp6VhGLCp15tXYIAxGsFqAzUAIRvg+3seT6jn0QhJaA0Smpt2gXuhMCTSWQ
	tLfDW31xq3jETJBYCuuMELt66BZtpwDNkC56d/CKaXRXWS3o4uH6Tg8TDAnGtVyPjXBE
	tlSDDf0toJVs5uAtKORbRXdAwOaXJQwExChXujum27ppQlhfuCjMeatK1ivgkl2W/uGX
	zUA9aDZ/oD+slMM9DMnBmq2rFcvF1mteM3bWJXhljMsbawSDq91MJj6Tym92TxmxG1vn
	SIdA==
X-Gm-Message-State: AG10YOSIuThvrLby+xVl58+X1J80V9QZT07/m9VY094a6jDkM3LjXxKnzK/gBkpBdsW5UGPhfdICPurUc+GzaFfC
X-Received: by 10.50.13.100 with SMTP id g4mr8780578igc.64.1453381454703; Thu,
	21 Jan 2016 05:04:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 05:03:55 -0800 (PST)
In-Reply-To: <1453255296-6863-1-git-send-email-rongqing.li@windriver.com>
References: <1453255296-6863-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 13:03:55 +0000
Message-ID: <CAJTo0LZh7JTWokWbZzwiZK6=8EV_zLjd0d+1gt5U2uoJ3axdpA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: enable systemd support
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
X-List-Received-Date: Thu, 21 Jan 2016 13:04:15 -0000
Content-Type: multipart/alternative; boundary=089e013c661454ca950529d7bdc4

--089e013c661454ca950529d7bdc4
Content-Type: text/plain; charset=UTF-8

On 20 January 2016 at 02:01, <rongqing.li@windriver.com> wrote:

> +ExecStart=/usr/sbin/watchdog
>

Use SBINDIR and sed the right path in at install time, please.

Ross

--089e013c661454ca950529d7bdc4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2016 at 02:01,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongq=
ing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":njh" class=3D"a3=
s" style=3D"overflow:hidden">+ExecStart=3D/usr/sbin/watchdog<br></div></blo=
ckquote></div><br></div><div class=3D"gmail_extra">Use SBINDIR and sed the =
right path in at install time, please.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--089e013c661454ca950529d7bdc4--
