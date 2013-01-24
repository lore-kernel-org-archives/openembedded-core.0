Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyIY1-0000eQ-Cc
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 09:53:08 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so6984169vbi.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=rO6rb+zxjvHg+1YJoQbQxOHvEp5U2mS6ShBvp5LGFC8=;
	b=M8xQLM61VPLmIEtsqaBZlo9Z0VkYsscyOXqX1zPL5gzSermNUGj3DygIkupXSqIjoj
	Cfp96nDEeKWKGAfZaYJtyjDRNNGBY5Ht/dGLz5uqeGsvlJ7uuCXEJCc8VYp+AxAWDnCu
	RebcTIUoJm8CDZhTozzVlD4ipCSAZBx0rsFfK192z2caFuDr44VOIZhZDUnJ3HHeLGxO
	x1mVZoTpY7UoAyW9ZjFyz0qC9W5CwZU8YYbvx3JobNZxW9ecbcygznbamjFx3kbcTfML
	7EBcMx1HNoNjScwgXJCDOJiWf1jy89crLuXO8KbKv4rdS29OJSHyDehP898dmpA4cpm3
	AYFg==
MIME-Version: 1.0
X-Received: by 10.52.76.170 with SMTP id l10mr918752vdw.83.1359016624565; Thu,
	24 Jan 2013 00:37:04 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 24 Jan 2013 00:37:04 -0800 (PST)
In-Reply-To: <1358512909-14714-3-git-send-email-schnitzeltony@googlemail.com>
References: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
	<1358512909-14714-3-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 24 Jan 2013 09:37:04 +0100
Message-ID: <CALbNGRTiQBAc-YwTRdKQz0oG3HxTHNuDhftOK+a4LUdtCn_KCw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/2] package.bbclass: remove RRECOMMENDS on base packages for locale packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 08:53:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 1:41 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> As long as we support only one locale package per recipe this leads to un=
wanted
> packages in images. This patch was motivated by samba (meta-oe): only wan=
ting
> libsmbclient one gets full samba server into the image. For my standard i=
mage
> the follwing package were removed by this patch:
>
I am using this now for a while without issues (except reduced image
size) - so ping

Andreas


