Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDD561526
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 18:44:59 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d18so12733170qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 10:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zFZN+q4F9lZQhd0vsD29EyqD4Z3AluRMIMi/s3fvZ0U=;
	b=YgJfFNjOwIS9Sfu6hkvcexlzNy4dLQitXXWbPC++BYCOOWMXDt3UJd9se7LXr+6Bbc
	oG3o1Lp7XQgVnzXnWxDTteGjH+8cMFl0X5tpTLNCe4ga9k7RXDzWOa+S/WIEzJb4Rt34
	vusHlP6bfQ1YQravLDxKw5nWu+ShVNDIZbYFKfq+GFVxoOIkndyXfCXKBwN+u0jvipu1
	AuAzSodZ4HeCjBX16R+0E3GdseeT/VpP7yNsH+r9A0DKMum1emhqnxg9IcthSpSQn0tx
	J4EqKbM8Lh5LrzC8Q7/aPn+gbuddB6eDKOEptrrVF6tS2M0SwkuVGkXIwJdtpaQSlKTl
	BeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zFZN+q4F9lZQhd0vsD29EyqD4Z3AluRMIMi/s3fvZ0U=;
	b=Ejvdyc8bJNHw/3ljBfKFvetMeDO14nzXZ4VG7f8W8xEyFgthPFG47TUVV1/n366bXW
	p3MLk4saHmMEVl0AG84z+Q72EgtlQVWDZA5z1z0+mTCq9SgB+36FkmvlvrkOe8I4YnuU
	geqpdZIVd0ul56QneRHJby/OdzXiZZqDZUFv143PB8uYQYF3jpQHfYwJbkspNF9FJav/
	8AbCvM17emorJFgdWlIAxSBjMdnBq1dhG8L17287og92XY27d4H/ZqECFPiN/ZzW0FpS
	Ykm/T325lC6/+HVCY1fCUvT/MzFEpJ8yNZCGC/nCAoCw8OLc0piUPTUctMD0dkHPD0mJ
	ErFw==
X-Gm-Message-State: APjAAAXPX06c7GPVv2LowNi86Ul8PfdvrlsxPLESOUWV9kgo5SPWIsru
	nVTPu5/JXuQiZ9KfWBOVj6UUlWfH9UQI+dW43gg=
X-Google-Smtp-Source: APXvYqw5JuG/oN/6MkyJPEKFKIkLmEM16l/W5My/7rKVi4KStsZFisFOoHpVzWsuP03i5HpNQnLW73lGNxZspQJZcuc=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr14338191qtn.378.1581965099725;
	Mon, 17 Feb 2020 10:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
	<CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
	<CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
In-Reply-To: <CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2020 10:44:33 -0800
Message-ID: <CAMKF1srMfa-0ADdKErgwXhQa6ypDL7RGznsBQ0ET7cZ29ErzXA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Mon, 17 Feb 2020 18:44:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 5:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 17 Feb 2020 at 09:22, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>>>
>>> \perhaps then make this chage such thst it only affects the
>>> architecture you have tested.
>>
>>
>> Fbdev backend is not documented, and there is no guarantee by upstream t=
hat it will work. You wouldn=E2=80=99t want to use it on actual targets eit=
her as it has no hw acceleration support. I think the change should apply t=
o all, we should test standard drm/kms code paths everywhere and fix/report=
 issues as needed.

hw acceleration is not going to work for non-x86 qemus, while other
qemus should be fixed but not
by breaking them first. As suggested limit this change to tested
architectures and it would be fine.
then if interested to fix it globally make changes to fix rest of
qemus and then instrument global change
after that

>
>
> The issue with qemumips in particular is that it is still using cirrus fo=
r the graphics card, which has been superseded by '-vga std' for a long tim=
e:
> https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
>
> If that is switched, then fbdev backend should be no longer necessary jus=
t like in qemux86_64.
>

this is interesting, I will try it out on mips.

> Alex

