Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1QK0N7-0000gw-9L; Wed, 11 May 2011 05:46:01 +0200
Received: by ewy5 with SMTP id 5so31836ewy.6
	for <multiple recipients>; Tue, 10 May 2011 20:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=+x1eKY2YugAHegdTTYyuByjFXq22+5Z+C8Sh+6XpRbo=;
	b=T9cWWEWD864QUjuJI+52NJlCWfUFytEXeqfwcEcyG1iY0KopMmnlG36LcdQ4lo6/Ct
	IBVYE1l6qgdX51EV4jBmjozOiBiR9I05yReTsADzCSBT/ST2XHga+4jR88O1EDrmll51
	tqX1G3rZWkdjeI6/wAk5GArQyCviUpI21hVnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YvndthH3BCAIu+TheVyEZ0WcgM2Q/jG9fIszUL06HwJBwnCQqp91yDu0nQyic1rnyT
	n4saX6nhVAbdSWGxCbMpmuojEQnc991fRyk7t9ePDpEptEotAuuTGh6XK6XICRss83CA
	NNP9gDt9UPNmm+D1JxK+uuDBosWN/z8gH0T3k=
Received: by 10.14.15.20 with SMTP id e20mr4282400eee.16.1305085395133; Tue,
	10 May 2011 20:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Tue, 10 May 2011 20:42:45 -0700 (PDT)
In-Reply-To: <BANLkTi=uvN8_u6SQhKfs2BwOnSOCQApKSQ@mail.gmail.com>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<BANLkTim0hVFjUd+8j5jTR5dv7TwSMk=4qA@mail.gmail.com>
	<1305036525.30391.275.camel@rex>
	<BANLkTi=uvN8_u6SQhKfs2BwOnSOCQApKSQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2011 20:42:45 -0700
Message-ID: <BANLkTinJV3eAmnfx+-dcKkhu3aQy2xEkMQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Wed, 11 May 2011 03:46:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ----------
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, May 10, 2011 at 8:35 PM
Subject: Re: [OE-core] [PATCH 0/6] RFC Distro config changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>


On Tue, May 10, 2011 at 7:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> THere is something wrong with git.
>> If I browse to the 2nd url I get:
>> Bad object id: rpurdie/distro
>> going to git and navigating to the branch gives the same result.
>>
>> =C2=A0Anyway, although I am not able to review the changes on git, a thu=
mbs up
>> for the initiative.
>
> I've noticed this happening with branches on that repository for the
> past couple of days, its not just this branch.
>
> Khem/Cliff/Tom: Who might be able to look into and help fix this?

Hi

This was a url rewrite problem when I tried to redirect gitweb traffic to c=
git
the regexp was too liberal. I have rewritten the rewrite rules and now
everything should be hunky dory

Let me know if you run into problems

Sorry for inconvenience

-Khem


