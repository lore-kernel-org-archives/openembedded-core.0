Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1T6iUZ-00023t-St
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 15:39:35 +0200
Received: by lagv3 with SMTP id v3so540521lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Bep80eCuL9GVHYwDyidKbdiOpoZ50DeC43dWZRwTxZQ=;
	b=m/0kNrX/9qnLAGrdDwviWF4Z7k+H1COwFyORElU10MXjhDdm42oZHGZO/5WSSr3onh
	gtSbjPFuokp+rm1SzvdAjNb3IJp3ilJN49hUIXknOQR8xbdGyYhweUEHr22nyMvM74O0
	os4bp57PlcpJqE1LX7tT89kbDMIUcVkqaM/nssu3ec62z1KrgQ9veU6qn5+kWsUU25Gd
	2T4UP2qENp2YofgWqCAQE1fIu+nvyK46uRyS7haUmM11bTC7PuFcISHmGWRs+gu5rHxt
	/6I40hw4jl9j+nOWgcetEJJQvzCOkK2d+6mCfbsWhJOBUz0U/lwS4miWyK/zMeofieUd
	N1Cw==
MIME-Version: 1.0
Received: by 10.112.39.41 with SMTP id m9mr401758lbk.80.1346246841823; Wed, 29
	Aug 2012 06:27:21 -0700 (PDT)
Received: by 10.112.21.9 with HTTP; Wed, 29 Aug 2012 06:27:21 -0700 (PDT)
In-Reply-To: <897CCE6A-604A-484A-8ACD-452701801FAA@dominion.thruhere.net>
References: <897CCE6A-604A-484A-8ACD-452701801FAA@dominion.thruhere.net>
Date: Wed, 29 Aug 2012 09:27:21 -0400
Message-ID: <CAHUNapRRLtTO_z8e3r06UEvcaPrmnwPyiG7YzJhOxJbRBe3N5w@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: scott.m.rifenbark@intel.com
Subject: Re: Bitbake distro packages: kill them with fire
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
X-List-Received-Date: Wed, 29 Aug 2012 13:39:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, 2012 at 8:49 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> These might not be the appropiate lists, but I might reach a few of the c=
ulprits. Over the years people have been doing 'apt get install bitbake' or=
 'make install' to put bitbake into /usr/bin and after a few minutes to get=
 on irc/email/etc to complain that everything is suddenly broken. There are=
 checks for bitbake versions in the metadata, but it can (and will!) still =
break with due to python path nastiness.
>
> So to every person packaging bitbake for their distro: stop doing that!
>
> If someone has a better suggestion to avoid this problem (more documentat=
ion doesn't work), please speak up.

I certainly agree that documentation doesn't work (for the most part).
But maybe it wouldn't hurt to put in a small note about this issue in
the quick start guide(s)? Perhaps in the section where it is telling
you what packages you need installed before starting, it could include
a note to make sure to not have bitbake installed from your distro?


