Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4YHR-0001Td-EX
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:16:33 +0200
Received: by wyh21 with SMTP id 21so3803152wyh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=e8HTgzsrUOSb8NuYomWCfYCIZmKHbh9/FuhHCR+qS+o=;
	b=stHFLyLPs8cFPBo6rjjeJccYnhd39sofGDf+9XfKoQgerOOfFJMImoIn5cEzXBNnDM
	GpnAqF+H9EJMm/5xUc3NakgiL/j3WScf47yYIYtsNHFv4QHifs31m4ABrEMP7WyAGZpi
	lCUXmLYr7vAySM2uH5XY+TRFq0RcbZH/UOJTo=
MIME-Version: 1.0
Received: by 10.216.161.198 with SMTP id w48mr809097wek.15.1316178679523; Fri,
	16 Sep 2011 06:11:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Fri, 16 Sep 2011 06:11:19 -0700 (PDT)
In-Reply-To: <4E733F7D.6090109@eukrea.com>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
Date: Fri, 16 Sep 2011 10:11:19 -0300
X-Google-Sender-Auth: VAufmsLkLyOZN1QTucTL8a6hreA
Message-ID: <CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Fri, 16 Sep 2011 13:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 09:22, Eric B=E9nard <eric@eukrea.com> wrote:
> We could also say that qt 4.7.4 fix many qt 4.7.3 bugs and integrate the
> patch fixing this one and in the end get an improvement.

It has a patch available that fixes the issue, so seems fine for me to
merge it and put this patch too.

Personally I also agree that getting this into the release ought to be
better; specially since it has the fix available on the bug tracking
already.

> I don't understand why oe-core's development has to be stopped by yocto's
> releases process but I may not have found the right page on the wiki
> explaining all the details : may you please give me some links concerning
> this policy ?
>
> Maybe yocto could consider oe-core as an incubator instead of a follower
> else I don't really see why we need to have the same project managed by t=
he
> same peoples with 2 different names.

Personally I don't see it as a problem at least for now. This won't
hurt to have a stabilization work being done from time to time. Maybe
we can even use this to make oe-core releases too and get it more
widely used.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


