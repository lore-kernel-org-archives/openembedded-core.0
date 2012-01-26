Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqRrv-0002Bg-Rf
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 17:08:12 +0100
Received: by qcha6 with SMTP id a6so355070qch.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=6c2Ts64mNR+FjPZqwsSHNKK7Rglb2I7gjhmMAlxUbug=;
	b=bH4oHLcdPP4KeMA0TFFH2MWzuIDjwAgDtW4yJhhnB7Z9nLR7YEUdSFuXIyIlaoLyus
	HuQVpJ48HVFyhphFl6Vf8JU0aGnP/oRj6ADvJPqLsnwuUFP1FClbteUWbzse/KLsAdaN
	u6pxnkEBm4ZeUXgYLqj1lZ+KxXPNcSrk/VBuw=
Received: by 10.229.78.215 with SMTP id m23mr969257qck.93.1327593228475; Thu,
	26 Jan 2012 07:53:48 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.235.211 with HTTP; Thu, 26 Jan 2012 07:53:28 -0800 (PST)
In-Reply-To: <4F216723.3040302@ts.fujitsu.com>
References: <4F216723.3040302@ts.fujitsu.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Jan 2012 08:53:28 -0700
X-Google-Sender-Auth: jibicTCmvyuo8K97N161UiffYIY
Message-ID: <CABcZAN=Nh0gCPCaQvpjQLqfSiTjKskdoNoaHN3m1coocAEENEg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Confused by the xorg recipes
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
X-List-Received-Date: Thu, 26 Jan 2012 16:08:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2012 at 7:45 AM, Rainer Koenig
<Rainer.Koenig@ts.fujitsu.com> wrote:
> Other extensions like xorg-xserver-extension-dri exist als ipk packages, =
but
> =C2=A0are not in the image and when I try to build them
> manually with "bitbake xorg-xserver-extension-dri" I get an
> error that says "nothing PROVIDES 'xserver-xorg-extension-dri'".

First of all, you're mixing up the notions of binary packages with
recipes. You don't bitbake a package, you bitbake a recipe.
--=20
Christopher Larson


