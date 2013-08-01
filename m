Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5711C6ADE5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 01:16:03 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so2528491oah.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 18:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OC4ralKVsnBIhebr1b98oVxx22/x6DEa0zv2aZ6Jrik=;
	b=EHOi6aAr5mkALCJldj4hp6PqM6y1UWdyHSJv34sZIj9W0vXYMeC4U6ZandWqrR9SH/
	t2MVUC2D7MwxI3l0d5X3h+HOYXEdHB4qrkLoTJz86xFVKofMk7oZ8XNONcxKUUU5Mh7r
	5BsR9MeoBnl8YauPEZjB2aL2KBcMMKh5p0zYeEWK0sGywshsiGtYHBhnkFhHSCb6qbAK
	bWMYPLnMIh0pjcP7FuV8fLg4VJ7YWc8VxNGkZA1jqJgPS69EN5zNW6nTsj4QCb/TIDbg
	fipIF3QMVSfFhd0MMtj9eTTCHrdTGzw5qjMZmjggzQmmzo2Surwc9bIkS22WRUV+2bob
	IXnA==
MIME-Version: 1.0
X-Received: by 10.60.43.226 with SMTP id z2mr70083751oel.76.1375319763286;
	Wed, 31 Jul 2013 18:16:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 31 Jul 2013 18:16:03 -0700 (PDT)
In-Reply-To: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
References: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
Date: Wed, 31 Jul 2013 22:16:03 -0300
X-Google-Sender-Auth: TFBVuMyvZxmVoWxzldEnd5XwJKQ
Message-ID: <CAP9ODKrhpqmZYY+hK4Qubr+seVYCoemyZr0nk=cgF7JuznHK-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Rogerio Nunes <ronunes@gmail.com>
Cc: Rogerio Nunes <rogerio.nunes@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master, dylan][PATCH] packagegroup-core-tools-testapps: isolate x11 dependent tools
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
X-List-Received-Date: Thu, 01 Aug 2013 01:16:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 31, 2013 at 6:15 PM,  <ronunes@gmail.com> wrote:
> From: Rogerio Nunes <rogerio.nunes@freescale.com>
>
> This patch groups x11 dependent tools in a separete variable,
> and when DISTRO_FEATURES does not contain x11, this group is
> not included in the package RDEPENDS.
>
> Signed-off-by: Rogerio Nunes <rogerio.nunes@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

