Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SYxmn-0003xv-6B
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 13:06:53 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 28 May 2012 03:55:30 -0700
Received: by qcmv28 with SMTP id v28so1382266qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 03:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=/79TAooL2S9n05UxCdsCGgJn2G4CYGLsULIMZUfRpsw=;
	b=Cc1dbI/9ySSQQe5UKel98Dvbmzg92N7C97VQnRBLROA1SsJswQDgh3IoPKJagCja4+
	WeWRR9zEfOc1dGAf/pC2O5ZF3u2bHB0ds2Lnxv/kyvJr6w/D9bq5DrCpqRTOKCf8xmvj
	21r517iMd52FjkBIJ5R9MJlscu9xBkAJnch7y4YFYeLYXJWZ4rb0/1k3nWAn5vu4CRqd
	fx+3Y3RhEqNfO7UjUBTjzyNecA1LhUIibKtTcUNZnYqEZsuXV9pMlOHh2bNf9iaddRLG
	fWKAt5rdWsrTN54Mbky1u0HsBcDrxFYi4biU8z2lIut5XrUMl6Qp6rrDApQDw4YIPeLc
	2izw==
Received: by 10.229.115.12 with SMTP id g12mr2342271qcq.51.1338202529508; Mon,
	28 May 2012 03:55:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.162.12 with HTTP; Mon, 28 May 2012 03:55:09 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 May 2012 11:55:09 +0100
Message-ID: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmGzkaQnbKRlDGrvvzvukipNrfZEJREhAQQJ4vcc5YWYQ+lbjOA3QIjiR8gQPjC+72d7iJf
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 28 May 2012 11:06:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

First, sorry for the thread breaking, I've just joined this list and I
didn't get this mail.

Koen Kooi wrote:
>> =C2=A0dbus: Update to version 1.5.12
>
> First: how was this tested?
> Second: From the dbus website:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0The current stable branch is D-Bus 1.4.x. This=
 is the recommended
> version for most purposes.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0The current development branch is D-Bus 1.5.x,=
 which will lead to a
> 1.6.x stable branch in future.
>
> Why are you deleting the stable branch based recipe and add one from
> the development branch?

The definition of stable and unstable in DBus isn't as hard and fast
as you'd really like -- the 1.5.x cycle is very slow and mostly stable
from a crashy point of view.

I'd say there is a good rationale for having both 1.4.x (.20, so that
also needs an upgrade) and 1.5.x in oe-core.  The default should be
1.4 for obvious reasons (it's the stable release), and 1.5 should be
there for people who need the improvements.  In particular there has
been a lot of work on performance, so anyone heavily using dbus (i.e.
anything using Telepathy, which is where the improvements came from)
should look at 1.5 because it will give a noticeable improvement on
slower hardware.

Ross


