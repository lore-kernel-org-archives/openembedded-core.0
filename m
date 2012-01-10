Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rkgxc-0008W5-Fd
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:02:16 +0100
Received: by qcqw6 with SMTP id w6so2700125qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 10:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=87pzb2ToqNaolcpemLA1kjmMhQ2YM64iX66RN5ZPEF4=;
	b=dytvbeMhGEHQst/JZvr891RgPslzaDbHtKNUvdAZS76J2yy8BnE1OlgN3gLlw3Vsgb
	s8hkIaIYYZTM//QrZNsZu870+gjXVhGYmPd8XAG3kPHx/6HayZ8vJhZqJHaIQ9vF5gmh
	0Vjxh0cZhLopMbT60WJohyj1xvqlqoOu9dHZI=
Received: by 10.229.78.211 with SMTP id m19mr7917926qck.156.1326221682241;
	Tue, 10 Jan 2012 10:54:42 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Tue, 10 Jan 2012 10:54:21 -0800 (PST)
In-Reply-To: <CAK18fxF_iQADUWaASY=O4JcFfjrd3MRYHw+ooSOyXWNydV16XA@mail.gmail.com>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
	<CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
	<4F0C637E.8050704@gherzan.ro>
	<CABcZANnXksgwqbgU_mhD4ptgEx_0=M9MUHV2uagi3owEU2yrrg@mail.gmail.com>
	<CAK18fxF_iQADUWaASY=O4JcFfjrd3MRYHw+ooSOyXWNydV16XA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Jan 2012 11:54:21 -0700
X-Google-Sender-Auth: -40RmvoPFphtmwqq35H_mwp8TbU
Message-ID: <CABcZANn5ChCcuT2SkQy-xSNWJC4B30P3vMS9roNdi-j4YVKsDg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 19:02:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 11:13 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Christopher's=C2=A0solution crossed my mind as well. Actually i tried som=
ething
> like this but i didn't want to modify more from this patch and i didn't
> really know how to define those expansions.
> Another problem here that i faced and dropped the idea for, was the the
> scenario where a developer wants to exclude only GPLv3+. This case needed=
 a
> another couple of "if"s and so on.
>
> So my solution seemed to deal most of the situations even if it looks a
> little... childish.

I wouldn't put it that way. It's just something we may want to improve
in the longer term to cover more cases.
--=20
Christopher Larson


