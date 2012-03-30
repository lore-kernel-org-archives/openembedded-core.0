Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDkqy-0000rO-E7
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 01:03:32 +0200
Received: by qafl39 with SMTP id l39so970594qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=aTL7fp14aFJ7qb1O02GZS/ogpfjdr4xRa7urVjf3IHo=;
	b=FjdWzCP42mxj/Y8NGdR6O8TALXy5AnTW8uDwFOvoREqMy3by9go3yfBRnZNK3+eQe5
	4nMLSjYnUW6/kvph+ir15brJmTV4NkYwFXhVK0IPKDWYjsYel51WnPxpiZz4W9Qveqot
	Z4Z6qRxYRrRzBV9fnPu3SMfC2tF/rpMV7q+dxQbAYSYi5oKZWsdqJWR0TBRhfz2d5hdF
	E0ricV4vQMKz7sGsRVj2XALNy5CghGpnpxaKREs6AuhxDj4RyldjFoLjM1mHofGYe8Uz
	IwxkfzVkiTiFAXwkztkHOU1sJsRHhiso0eKXcnJr6rIMWbtiQNSuNS0upg+uVFzhkb5e
	uZZw==
Received: by 10.224.182.201 with SMTP id cd9mr701075qab.92.1333148067169; Fri,
	30 Mar 2012 15:54:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 15:54:06 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203301541110.1720@oneiric>
References: <alpine.DEB.2.02.1203301541110.1720@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 15:54:06 -0700
X-Google-Sender-Auth: Mg8aMcafSzXqYYUf6GV9rZNsVR0
Message-ID: <CABcZANmzTAM6AtdcBpebsahAq7jkN15VKht66m0XK2xPTL364Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: wanting to clarify bitbake parsing of all .conf files
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
X-List-Received-Date: Fri, 30 Mar 2012 23:03:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 12:47 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> =C2=A0first, i'm assuming those conf files are processed in exactly that
> order, right? =C2=A0and second, all of that parsing and including is done
> and completed before reading the first line of the task or recipe file
> that's the bitbake target, right?

Yes, and yes. bitbake.conf is parsed, which becomes the configuration
metadata. From there, base.bbclass and the classes in INHERIT get
parsed and added to that, as well. Finally, that configuration
metadata flows down into the recipes when they're parsed.
--=20
Christopher Larson


