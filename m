Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3RkZ-0007uW-IL
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:38:19 +0100
Received: by lagw12 with SMTP id w12so2058260lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 04:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.112.100 as permitted sender)
	client-ip=10.152.112.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.112.100 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.112.100])
	by 10.152.112.100 with SMTP id ip4mr8732867lab.1.1330691388202
	(num_hops = 1); Fri, 02 Mar 2012 04:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zACv/nZPhS2gFgy8jOoWafOJygdb+bpxVB8h/AJ+TaM=;
	b=FpAfefKRmGpI86lih7/ZiQE0yNWUn/AFFSlxpR4zL+bkw6YqqFUL0Ga0qjx5tt6tHN
	oN2oavRalO8GXnUd92QrV81dHg8QMHwqufKgdiu9fmiYybo5xpVpKnuTNscattj7/Ut/
	UtC9GVxNVuIhRS4YrfnNXTfXNBZrFQPXPFQzA6SPMioCKUAoDEKWyFqSZ7hIQgmce894
	w0V1DPhwCA6PRcafYNRQd8Cewg6Q7SlLLDNFDmXCvq8Oha0PUpeoiriPe7Vyjs1jCaW0
	6y55WeTj2ePVDyRhX6jbdugTnhrkR4blzrgkgewnbRGsrXrZFdP0ekdYUhmL4cngp9rx
	Qz2Q==
MIME-Version: 1.0
Received: by 10.152.112.100 with SMTP id ip4mr7152813lab.1.1330691388054; Fri,
	02 Mar 2012 04:29:48 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Fri, 2 Mar 2012 04:29:47 -0800 (PST)
In-Reply-To: <1330617040.31767.25.camel@ted>
References: <1330547595-11631-1-git-send-email-ynezz@true.cz>
	<1330617040.31767.25.camel@ted>
Date: Fri, 2 Mar 2012 13:29:47 +0100
Message-ID: <CALbNGRRKMKQx1ZSzJruX26J2NGYFBYS+Cgp3W2Pk9ETCRtfY+g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: fix link creation failure if the target already exists
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 12:38:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2012 at 4:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-02-29 at 21:33 +0100, Petr =C5=A0tetiar wrote:
>> | ln: failed to create symbolic link `beagleboard/systemd-image-beaglebo=
ard.tar.bz2': File exists
>> NOTE: package systemd-image-1.0-r0: task do_rootfs: Failed
>>
>> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
>> ---
>> =C2=A0meta/classes/image_types.bbclass | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> Is this still necessary after the recent image_types.bbclass fixes?
>
I pulled ~3-4 hours ago and the error persists. I don't know if it is
important for this problem but I am using opkg and get:

| ln: failed to create symbolic link
`/home/andreas/tmp/oe-core-eglibc/deploy/images/overo/xfce-base-image-overo=
.tar.bz2':
File exists
NOTE: package xfce-base-image-1.0-r0: task do_rootfs: Failed

Cheers

Andreas


