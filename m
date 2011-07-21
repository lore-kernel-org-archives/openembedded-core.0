Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qjlyz-0006mM-NV
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 07:39:37 +0200
Received: by gyd12 with SMTP id 12so481530gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 22:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Z2t4OYxQhfFVkWS7NepqeZH5TDhioj+zSQ/R+Gc8Gy8=;
	b=N1QH+xgDJwr9gF/P8YR/Og8kzL4tOTEDwD8cpKkl+WlM/yDbRrDWJHW+MOgfj/OpEm
	UZGTJ0aXAmBsO/Wb8wTAcCcE+OKvXvj8s1Zg8HGy2nRVwBaUz0qBC+OSnBZg43T8bO/r
	ISoAWlSFj9txk/zl7YHr2ISfhR8Nvfsm8chQc=
MIME-Version: 1.0
Received: by 10.90.22.32 with SMTP id 32mr152831agv.183.1311226530038; Wed, 20
	Jul 2011 22:35:30 -0700 (PDT)
Received: by 10.90.223.19 with HTTP; Wed, 20 Jul 2011 22:35:29 -0700 (PDT)
In-Reply-To: <53e99ac545b7ee871abe9f814e7ea3cc45b5a87f.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
	<7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
	<53e99ac545b7ee871abe9f814e7ea3cc45b5a87f.1311195893.git.Martin.Jansa@gmail.com>
Date: Thu, 21 Jul 2011 07:35:29 +0200
Message-ID: <CACW_hTZ1XODVOPOrxzCnFCEmsT87PD_t+bFs0_nZdXCpDWTXGA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] intltool: inherit perlnative
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
X-List-Received-Date: Thu, 21 Jul 2011 05:39:37 -0000
Content-Type: multipart/alternative; boundary=001636283cbc8b04a504a88db713

--001636283cbc8b04a504a88db713
Content-Type: text/plain; charset=ISO-8859-1

General remark:

I suspect lots of recipes depend on perl if only in their configure scripts.
I guess doing per-patckage staging could improve the visibility of this.

Also wrt /usr/bin/env perl:
I haven't peeked into the source of env, but ideally non-native recipes
should maybe not rely on host packages, only on the ones we build.
E.g. no /usr/bin in PATH wehn building these (and yes, I know that is not
trivial and will trigger some bugs and it also does not help against hard
coded paths, and probalby some progs will cause a pain (e.g. /bin/sh)).
Maybe a chrooted system would be better, but I vaguely recall that this was
once discussed (and presumably rejected).

Another thing we could do is have  our own env program which (in this case)
does not return a path to perl if the native package is not there (and
thereby causing things to fail instead of silently using the host perl).

Have fun!
Frans.

--001636283cbc8b04a504a88db713
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

General remark:<br><br>I suspect lots of recipes depend on perl if only in =
their configure scripts.<br>I guess doing per-patckage staging could improv=
e the visibility of this.<br><br>Also wrt /usr/bin/env perl:<br>I haven&#39=
;t peeked into the source of env, but ideally non-native recipes should may=
be not rely on host packages, only on the ones we build.<br>
E.g. no /usr/bin in PATH wehn building these (and yes, I know that is not t=
rivial and will trigger some bugs and it also does not help against hard co=
ded paths, and probalby some progs will cause a pain (e.g. /bin/sh)).<br>
Maybe a chrooted system would be better, but I vaguely recall that this was=
 once discussed (and presumably rejected).<br><br>Another thing we could do=
 is have=A0 our own env program which (in this case) does not return a path=
 to perl if the native package is not there (and thereby causing things to =
fail instead of silently using the host perl).<br>
<br>Have fun! <br>Frans.<br>

--001636283cbc8b04a504a88db713--
