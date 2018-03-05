Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 92ECE7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 12:51:03 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g21so17826030ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 04:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dx9PlaKFS4xPjHir63ZJBDnEWaz2ezCvnRSG9Hw1kYQ=;
	b=i3RG+AA2DsxX7Vip4j9CQkHApZVJ/CLguLL0B8bQRrt0iynURdCO12nOKpgRMZFU8+
	0yBI2+HfALqnN29ASA7/YTcSGBNTjpU62HUbso/4gJhg4GVtvnertrvIZWdHuwJOJkKI
	sjv36D0Qh3noiBRwjD+/9vciycrXCOffCIKCUlBqU3tWLdr+cSUFTurgx9VX+rJNafnI
	GckTsFumG+tNTPPp5khMK9/22ykTaqMuICkNOFjSVd8jQmI8cwHRD84fjJ5TBtWnqhsD
	8huxSA/XtjXdFP2rjqasYnPLIDvEq0lam98lTgyoYtBoPxYQNaRiCqF1JQxuIxP43/U4
	1I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dx9PlaKFS4xPjHir63ZJBDnEWaz2ezCvnRSG9Hw1kYQ=;
	b=RnPFyOYwxllTZYi4OvxkZqMp44aPZ/Iu+0VqmQaXhICVRnb82icO3V8LQCnZrF3OH7
	Pqw8uH/EVRqvfbHL/W5Jwnj49pMkujJN6DY2/40hwM7klmcWJNxDMHMe2KCqbcdlkN8R
	gDHOk/agDxAzQ87Ei6jp/aQpaYpK2XKng5thyk0ZZaUt6e+Kfrj/uE2lye3JmDN6MpYS
	d7aTV3HeT6nRn9g4US9wtQ1pUXpj6vuk3Zvu3cHHA5dgN3UFjVMq6ofKr3Vq2JKbPzvm
	yxIHkGiCekD1do0vtVlVhgfeqZucoCwZq2tiAOpguk2JMJN8/MTe2hZ978JBy5vC+OP/
	SHJQ==
X-Gm-Message-State: APf1xPDwlQZpkb66tBSf6gjGeYEheEXbma9cWyDSNnFRjxsObJpYB63Y
	4T894A2O14SnjZTML3BlPigYQ7awYSLF22lnd47thg==
X-Google-Smtp-Source: AG47ELt9Yybdp7UVUu03+iZaxpu8F+aa1zDjwPsQRfKjL83GL8ij6IkO0zMw8QHdyhmMvF5AS5aJZRlysowY2T336Yg=
X-Received: by 10.107.6.139 with SMTP id f11mr17935628ioi.23.1520254264945;
	Mon, 05 Mar 2018 04:51:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.212.6 with HTTP; Mon, 5 Mar 2018 04:50:42 -0800 (PST)
In-Reply-To: <20180301021518.29564-8-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
	<20180301021518.29564-8-california.l.sullivan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Mar 2018 12:50:42 +0000
Message-ID: <CAJTo0LZH136aQ6jL2G=QcYeOvxjrc9mfisrAkEYgD4dVz1G59A@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/21] grub-efi*.bbclass: don't reference vmlinuz
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
X-List-Received-Date: Mon, 05 Mar 2018 12:51:03 -0000
Content-Type: multipart/alternative; boundary="001a113eeaea6e465b0566a9c7e6"

--001a113eeaea6e465b0566a9c7e6
Content-Type: text/plain; charset="UTF-8"

On 1 March 2018 at 02:15, California Sullivan <
california.l.sullivan@intel.com> wrote:

> +KERNEL_IMAGETYPE ??= "bzImage"
>

You repeat this line in several classes, can we just move the default to
default-distrovars or similar?

Ross

--001a113eeaea6e465b0566a9c7e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 March 2018 at 02:15, California Sullivan <span dir=3D=
"ltr">&lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=3D"_bla=
nk">california.l.sullivan@intel.com</a>&gt;</span> wrote:<br><div class=3D"=
gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+KER=
NEL_IMAGETYPE ??=3D &quot;bzImage&quot;<br></blockquote><div><br></div><div=
>You repeat this line in several classes, can we just move the default to d=
efault-distrovars or similar?</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a113eeaea6e465b0566a9c7e6--
