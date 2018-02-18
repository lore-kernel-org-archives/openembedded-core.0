Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 490A3784A2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 00:19:25 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 18so5839128itj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+DNhOXALcsgd9EEt4C/Q3FlhN9ts9zCaoj3/U0iOASo=;
	b=iO5pcn0q2xEQW2wdH6f954WjnfMIYfKAvoQUGKFxc+6uLcIrO3dLGyiTp4oTaIhTsr
	E9wb85ZbTjo99A/VOnSnNO9p1cy8oSYNk/zuOy5VjV64EGrlUvR6RqmJrTD+fYsBa8Ei
	OdiqjRSH1x2kjsPOStvUFhYbQqPsQRV4G+CBzCxril8wR5KPHzR2ZF9G0S7Gdi5vfjbx
	LdKL54y7/mQYwipL7B2zvVtp8xMd4/zB57l7luabQtvB5e0duvOvsmxyhbNxy5rIQQ/N
	lx03EFTYm+603YTPntpkor98CC9VAXSRGklSwuW6hSGKi9oX9VLM++1Vf1NfOVrGcO0U
	r2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+DNhOXALcsgd9EEt4C/Q3FlhN9ts9zCaoj3/U0iOASo=;
	b=VezYfB4NQc6YpTPR+M1mux32myZta5ml/Esqrf+ej1keUBSESRQYz0p2sqQTDcN47c
	sPGsc5lJkLnYcKKNBfrySctIcwFgQ8PjeFuzhlk9JS28NMDFhMsL/4AxV4geihdw0ZPa
	I29UafUt3aGiPtoUn3vhUD8HA3CnumshNndnFhqfczAcPIWgSRTIP9Sg0RCXBIFfiKhg
	26popXlZ71I6o7o01bapz/Fay/+YCQE0MetPe6aNfqX8RPYuKb08s+ewQQRRgRuCdSsf
	QR8E745qoyxwCZQig2x94b93HS/N4CbvsOG4QvWU2+IVO+/em26keOLIIm4p1bM11MmC
	1SJg==
X-Gm-Message-State: APf1xPCGCmyAS0jSdiwiFklvAIwutnXjxV4ciluboZhFWsbq97f4bCI5
	MTJ7R3WRygN4bK4jkkQipcluZoOXlr5c5YBQk5COlA==
X-Google-Smtp-Source: AH8x2260Y+FmIPPw5m1ygXG1JVGVVk4TgUehB++LTwbBpr/sjdYCOiRY8CvUhUJVCdhwnL9g1WDUMue9RzndyjOFLrI=
X-Received: by 10.36.36.5 with SMTP id f5mr13434564ita.131.1518913167363; Sat,
	17 Feb 2018 16:19:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Sat, 17 Feb 2018 16:19:06 -0800 (PST)
In-Reply-To: <e00b10c7-fb10-ecb1-920a-a44219a840c8@linux.intel.com>
References: <20180208230914.19368-1-ross.burton@intel.com>
	<e00b10c7-fb10-ecb1-920a-a44219a840c8@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 18 Feb 2018 00:19:06 +0000
Message-ID: <CAJTo0LZs6VXZuH-ieaTLetYoYcAehW-knngkD8kB+5L+YWFCTA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cve-check: put log in T so it doesn't get deleted by rm_work
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
X-List-Received-Date: Sun, 18 Feb 2018 00:19:26 -0000
Content-Type: multipart/alternative; boundary="001a1146f2c0c92667056571877c"

--001a1146f2c0c92667056571877c
Content-Type: text/plain; charset="UTF-8"

Because I failed to post them to the list and Richard merged a chunk of MUT
on my approval, forgetting that I hadn't posted them.  My mistake,
apologies.

Ross

On 17 February 2018 at 14:38, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 02/09/2018 01:09 AM, Ross Burton wrote:
>
>> This is where the other task logs go, so it's a sensible place to put it.
>>
>
> There is a bunch of other cve-check related commits in master now that
> were never posted here, why is that?
>
> Alex
>

--001a1146f2c0c92667056571877c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Because I failed to post them to the list and Richard merg=
ed a chunk of MUT on my approval, forgetting that I hadn&#39;t posted them.=
=C2=A0 My mistake, apologies.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 February 2018 at 14:3=
8, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kana=
vin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 0=
2/09/2018 01:09 AM, Ross Burton wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This is where the other task logs go, so it&#39;s a sensible place to put i=
t.<br>
</blockquote>
<br></span>
There is a bunch of other cve-check related commits in master now that were=
 never posted here, why is that?<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a1146f2c0c92667056571877c--
