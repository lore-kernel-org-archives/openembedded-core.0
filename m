Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TFV79-0005b1-4v
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 21:11:43 +0200
Received: by lbky2 with SMTP id y2so1891159lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 11:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=lne8yIiKcfqWcQHhjaT+l2YIzOxa4fiTURCF15QrFZs=;
	b=ONKXGDdgKAl0O+Unk7U5dR8//R4mYgKpNfsbtob6C3sG/lGe5VSqLGj/cMH0QpXpAH
	OFqUJpQ0fdz/dd0YsjLY0ZpS2ePg3ondoqsrgLU18keCj7jTtrliegIbIMziZTM8eW6d
	ZApoRLbMt0TabC8RTp9tRJXqPEyPHkVxxar2m7FxkE9+E/eGrpuFznuA1AlIpiQ2l0nE
	SCsyB/DTgNt62VskVQkf6Qd+fhFP4hXyW6r9sNW+dhPHL/5RzSCIOPcijvVEJY87Osac
	1Wp1PlUQpEyRoIUWMksxo/sRdhksNUEmXRaOEDI53Hr0XZMokxk/PWTBRwai683FkRk7
	A5Kw==
Received: by 10.152.123.103 with SMTP id lz7mr7023578lab.21.1348340337472;
	Sat, 22 Sep 2012 11:58:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Sat, 22 Sep 2012 11:58:37 -0700 (PDT)
In-Reply-To: <1348330688.4444.217.camel@x121e.pbcl.net>
References: <1348330688.4444.217.camel@x121e.pbcl.net>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 22 Sep 2012 11:58:37 -0700
X-Google-Sender-Auth: 0ilTZuaEtmjmUq_dGXU4LXF84bQ
Message-ID: <CABcZAN=w-=PVRR6Yj9sF+b-w4pFTb7opd+0wwKWXsJCA1kswyA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools: Remove special handling for autoconf* and automake*
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
X-List-Received-Date: Sat, 22 Sep 2012 19:11:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 22, 2012 at 9:18 AM, Phil Blundell <philb@gnu.org> wrote:
> For reasons that are now shrouded in obscurity, autotools.bbclass
> has long contained a special heuristic to avoid attempting to run
> autoreconf when building autoconf or automake themselves.  However,
> the wildcard test against PN which is used there is problematic when
> trying to build another package whose name happens to start with
> "autoconf", and in any case it is silly to do this test at runtime
> for every package.  The individual recipes for autoconf and automake
> can just as easily suppress the behaviour that they don't want by
> providing a custom do_configure() method which just runs configure.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>

Nice.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-- 
Christopher Larson


