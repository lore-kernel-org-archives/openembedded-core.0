Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RRmQ8-00044G-9O
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 16:01:35 +0100
Received: by bkbzs2 with SMTP id zs2so4527235bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Lt5FYX3hCQyszXTl9qs6fgy3JlC0a9mf/wur9xPJqQ8=;
	b=ehGNzqqRnrjrnq7cecBTUSWQ76bXn6gpA0nW1dnpXyJNEXFT+lc97MDCvp4tVLuucM
	YYnh4SGTGRDbOb4x6S2AYEQNHqRNw1I8GXa2EuowAwfpr6wrttdIdwJm1g9OBW0ivEeb
	BiOPTmtL4ZrTqFVleuQGcS2aS6QmNEaFc+r7k=
MIME-Version: 1.0
Received: by 10.204.141.2 with SMTP id k2mr4372910bku.81.1321714504848; Sat,
	19 Nov 2011 06:55:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Sat, 19 Nov 2011 06:55:04 -0800 (PST)
In-Reply-To: <1707586.L5PGoRtkiK@helios>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
	<dee6ab006094693ede5ec6669fa5616a3a00b067.1321628513.git.paul.eggleton@linux.intel.com>
	<0CB9A931-9EFF-42DB-B83C-9EBAF02962E8@dominion.thruhere.net>
	<1707586.L5PGoRtkiK@helios>
Date: Sat, 19 Nov 2011 12:55:04 -0200
X-Google-Sender-Auth: ESXMx8Xf3Z_fjqRhRE22Xahmcsc
Message-ID: <CAP9ODKqe8r=PH=uRSo019drokB5qwPVHPrdBcnYWSJ82AkPqBQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Sat, 19 Nov 2011 15:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 13:28, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 18 November 2011 16:22:37 Koen Kooi wrote:
>> What follows is a generic question and in no way a criticism or comment =
on
>> your RFC: Have you thought about using git am'able patches for these
>> things?Upstream for QT is using git, so it would be nice to use somethin=
gs
>> as close to the upstream submission as we can get. I've been trying to d=
o
>> this for meta-oe and found it helpfull when coming back to do the actual
>> upstream push later.
>
> I hadn't thought about it, but anything that makes these patches easier t=
o
> upstream sounds like a good idea to me, and I would have thought this
> particular one would definitely be a candidate so I'll do it for this one=
 once
> people have had a chance to comment.

I think this needs to be a distro option, not enforced.

I agree this needs to be explicitly added or removed but I'd like it
to be optional ... many embedded systems now depends on pulseaudio and
if one is using it, phonon ought to use it too.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


