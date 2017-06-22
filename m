Return-Path: <carlon.luca@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id B065471AB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:31:59 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id 95so20892491ott.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eUUuOmiJ76pYhLY2Cf8bpT9hY2oZ7VeZYRwF2qr7B24=;
	b=oCxUOTsASUE9gmsIRE2B7UCs10XrMF1OFot6RFz9VsuXfCw2UXyMPUtWuQ6ZnE9ie0
	WevpxEyD+m1xy8MYZk1ceMdHvLs52nOO3y7dev4TqHvSj7L30FFwcuu7e6USBYWCZI42
	7F3XgJiU5xr70MJE6HLmKCYL8Ep/VgWJKJWjkUmetuXXbtwxVj26THwi/ptaYW52qmht
	n5OBsZzP0WxMHPha6fIHSlw9hOo+hT3sFJsh8U5VRtNvHANYsRZgrs+LTD3QP4xQJrt9
	YJPizlKTZAEWslpi4dxyzlfSlxdtJLghbqQuQQifJkNL4flZ3s/czR6eWAgHlYiiK0+n
	zUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eUUuOmiJ76pYhLY2Cf8bpT9hY2oZ7VeZYRwF2qr7B24=;
	b=cqZ7bGz0gQbYs6gESSL7BdnQuEdDq5iFb+CyXps2TapndGPk4iwvDLrJMw+TZmQEY7
	ULMgZTuMhz3Y1I4lWtYnMf0TliYVmZA8NYZn5/q1qGqw4+CQjuvDWb404TJF9HvAfzgM
	pygeulidbB2fgauYgBSBf9UVTzGpkr5DsF/ayDMM9GIv9A0qxMt/To3wzKL3BPeVth7/
	rbGOlMu7vCr23jVmSD05b3Pl73AlOFlCLU9EoiDVeEd6WQMsVk5d/wR5JsYp/pv0AzV7
	hNu0QR7iKt2Qqa2aFCXRo9OpTU9LgkjHK8YKVM1Q5nh3CtrJWpru77CuT2/qj8TcrXaw
	PDDA==
X-Gm-Message-State: AKS2vOzhCjRIAJq9zu2TxvFO5EtJrSHJcyu5J6qdlYSd0VLcgZ3wuGZj
	O4CGXCvLjP9zijmqgWH7z/oscw/ROQ==
X-Received: by 10.157.89.137 with SMTP id u9mr1663845oth.79.1498170720198;
	Thu, 22 Jun 2017 15:32:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.67 with HTTP; Thu, 22 Jun 2017 15:31:59 -0700 (PDT)
Received: by 10.202.106.67 with HTTP; Thu, 22 Jun 2017 15:31:59 -0700 (PDT)
In-Reply-To: <CAMC=D=uLt6mBCs=j=4vXDCOgFXLCS-2c-dqKauL5nKZ9uMw6TQ@mail.gmail.com>
References: <CAMC=D=sR6i-TCufBgP=zCGgniC122pgX=349H4eGk7r4dv7BLg@mail.gmail.com>
	<CAMC=D=uLt6mBCs=j=4vXDCOgFXLCS-2c-dqKauL5nKZ9uMw6TQ@mail.gmail.com>
From: Luca Carlon <carlon.luca@gmail.com>
Date: Fri, 23 Jun 2017 00:31:59 +0200
Message-ID: <CAMC=D=t=A7fZQban6qpLarfyMEAOmNSXASKUUiQKpqiwoUJz-w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Tune Cortex-A53 for 32bit armv8
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
X-List-Received-Date: Thu, 22 Jun 2017 22:32:00 -0000
Content-Type: multipart/alternative; boundary="f40304353f649725af0552940d22"

--f40304353f649725af0552940d22
Content-Type: text/plain; charset="UTF-8"

Hello! I see there is a patch to include the arch armv8 32bit and tunes for
Cortex-A53 here: https://patchwork.openembedded.org/series/4000. According
to the comments it seems it is not far from being usable: what do you think
it is needed to integrate it?
I would be interested in having it available as Raspberry Pi 3, which
should be pretty widespread now, is a cortexa53.
Regards.

Luca

--f40304353f649725af0552940d22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr">Hello! I see there is a patch to include=
 the arch armv8 32bit and tunes for Cortex-A53 here:=C2=A0<a href=3D"https:=
//patchwork.openembedded.org/series/4000" target=3D"_blank">https://patchwo=
rk.openem<wbr>bedded.org/series/4000</a>. According to the comments it seem=
s it is not far from being usable: what do you think it is needed to integr=
ate it?<div>I would be interested in having it available as Raspberry Pi 3,=
 which should be pretty widespread now, is a cortexa53.</div><div dir=3D"au=
to">Regards.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Luca</div><=
/div></div>

--f40304353f649725af0552940d22--
