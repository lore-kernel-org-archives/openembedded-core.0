Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7934F71A32;
	Thu, 18 Jan 2018 06:05:03 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f3so20337528wmc.1;
	Wed, 17 Jan 2018 22:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=foeeyFrzAbA0bGrBWd/LR+oyEu0lRN0WX6PhKCEVV8o=;
	b=u6sRjZ70hJ/RXLPwn7ErG2LFLHzC+iHDao1keVjOYre2MPzxdZA63uBlXa48CAR/LP
	SUmVA19uk3VUk9VflxU3Q7o/JSuAG49uiTZ/+coePzQ4g0NKDaQS2M8PU0VEE9V5EjYN
	Eo2KnXFZb+775djaHVLnIoyBkFJ/FEp1/VOwQur4vq0gjUVHOCvh6SbYcQ7xvGLVNZLg
	6UeWPS21II5kzDU1sq4SrftxN7dYgVLfiv0FAMeOyO653DnxQAp+4u+rcO4f+aDaRKgA
	ywa5BFI2iXgM0gJXzqGcqzhdiyTx05/Iv1B6IaqJzLAW1aTH9/VLR7JOvbTpPL/sFvQN
	nkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=foeeyFrzAbA0bGrBWd/LR+oyEu0lRN0WX6PhKCEVV8o=;
	b=PtkmeI1M01ghk1hcV2lmuJBATo+OhdhoLPchuNYNuIqkbVk7vAd2UeOra4l0Trzqxb
	m2Zbv5eGocSyLfBmPOTjLWr5krMacQaYR7TbJT7RoQ67FvU+Z5eef1wtIAQyaZDUFz7s
	3Pc3svR5t3f560QralLHC0TOYQ8RAYsIqLp7PFYrgyFMsc4WQjRNXgJkCVJZrPlnH5Tj
	oPfr66OYUWxaSg5ZQnuSKTjw5oVVfr5ckv8/c+pvLgBqlCM4jhLjOAlnugWEPzz+mrk5
	/9lnSFvqPgyoiN8TQQuwzijrxooif5Cw9VfRjxBSx2KIDEh7z9g9ILue54rXv4zMUtH4
	R32Q==
X-Gm-Message-State: AKwxytdTq0V5yAiiYRXoq5DK3v3JELXziW9Y6VOgTWm415eN0nhwUQmL
	6ylsvCf3XzzJqVcyO82DS+NUkSUlBgNzhYmA2K8=
X-Google-Smtp-Source: ACJfBovIbJoD/qJT38/Go7qXMn5qzeKb+khmibsYPdqj3GJCaQkWlGykHrgfuQm6mUUsGA2SpcJtEg+yhNmR2lFkq3g=
X-Received: by 10.28.154.67 with SMTP id c64mr4287142wme.125.1516255504235;
	Wed, 17 Jan 2018 22:05:04 -0800 (PST)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.149.145 with HTTP; Wed, 17 Jan 2018 22:04:43 -0800 (PST)
In-Reply-To: <f94fc2c7-032a-651a-a0d2-d5860f133b6c@balister.org>
References: <137d31ae-329e-53ff-f495-259168b787d5@balister.org>
	<CAGAf8Lws8HfvDvMvdpgXyTvKaVpmf5a1UUTbBc2OrTpw=mgPNA@mail.gmail.com>
	<CAHQecY5FEt0jMY97Cfq7tR4KAETqied0t3zfFgXw=J5YBSz53A@mail.gmail.com>
	<f94fc2c7-032a-651a-a0d2-d5860f133b6c@balister.org>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 17 Jan 2018 22:04:43 -0800
X-Google-Sender-Auth: rR4E8ZDRt7Wf5Piywj-vVtMBxU4
Message-ID: <CA+YB3rZ2ZthR+bV0RZR-Af4q4X1OhEWo4oy9YhizVbHDnw+=ug@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
Subject: Re: [oe] [yocto] OpenEmbedded developer meeting Sunday before ELC in Portland
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
X-List-Received-Date: Thu, 18 Jan 2018 06:05:04 -0000
Content-Type: multipart/alternative; boundary="001a114b458eb80258056306bea7"

--001a114b458eb80258056306bea7
Content-Type: text/plain; charset="UTF-8"

> We know. It is painful. YP Dev Day is the Thursday after, and I suspect
> we would lose people waiting until Friday.
>

SCaLE doesn't usually coincide the week before ELC, so this year was just
bad timing from the universe.

I propose we start with the board meeting at 9:30 and plan OEDAM to start
at 10:30 to enable people to get there. We can have lunch late and go until
6 if needed.

--001a114b458eb80258056306bea7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We know. It is=
 painful. YP Dev Day is the Thursday after, and I suspect<br>
we would lose people waiting until Friday.<br></blockquote><div><br></div>S=
CaLE doesn&#39;t usually coincide the week before ELC, so this year was jus=
t bad timing from the universe.=C2=A0<div><br></div><div>I propose we start=
 with the board meeting at 9:30 and plan OEDAM to start at 10:30 to enable =
people to get there. We can have lunch late and go until 6 if needed.=C2=A0=
<br></div><div>=C2=A0</div></div>
</div></div>

--001a114b458eb80258056306bea7--
