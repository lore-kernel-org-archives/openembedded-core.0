Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8vv-00015L-VF
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:01:44 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:46:01 -0700
Received: by lahj13 with SMTP id j13so2485028lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Eamlz3m7AT4RozivIXmHkoJkFPySoKW2CsSkNc7z18w=;
	b=CGayFCLgDUZo8BZJFvVlE2a2T3svN89O7aArhJ+JbU/Sn7Syb5SStAJSq6umUhU3M6
	+GTdIYdLPrDvupd420Suu4HKz06i9ocQHZqUMNRRDdvEIC208ZmZ94eOVdTsV3xk99EE
	qtAickxCYt9RuCOvB/yqa9SnE6Hx+5fOwVFctojScaZ3F+B4hhWxPGFumjBuUOFhtgwv
	At+9ufFlLd3EcEu4xXrv5/1k/3AQvM1b+xKj4bWqfIpYpiO7RNTO+RHXxPwIJnOFIDfI
	a4PykBMd7nKyvEPjkox9kme4iM32t61mcdJ6mXeU2f+HVOTrGMlryrracyEgv0/spfBK
	3GvQ==
MIME-Version: 1.0
Received: by 10.152.108.38 with SMTP id hh6mr17919420lab.28.1339436759987;
	Mon, 11 Jun 2012 10:45:59 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:45:59 -0700 (PDT)
In-Reply-To: <cover.1338591147.git.chris_larson@mentor.com>
References: <cover.1338591147.git.chris_larson@mentor.com>
Date: Mon, 11 Jun 2012 10:45:59 -0700
Message-ID: <CAPhnLPAookHqPY-kv3sAZ5How-oZwt56rr7Vi7bNEDCaD70sGA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmbwDya9DR3bhBC1HydzAtsiPrBI3vU88kqf4MgJAC9fP5arpQ2tdcjbjv3d2hXvWp6WlpO
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2 0/3] More external toolchain fixes/improvements
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
X-List-Received-Date: Mon, 11 Jun 2012 18:01:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 3:53 PM, Christopher Larson <kergoth@gmail.com> wrot=
e:
> From: Christopher Larson <chris_larson@mentor.com>
>
> The following changes since commit e3113827810e98eb1b012f0b280fb917199704=
c1:
>
> =A0webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-0=
5-30 17:37:58 +0100)
>
> are available in the git repository at:
> =A0https://github.com/kergoth/oe-core toolchain
>
> Christopher Larson (3):
> =A0external-sourcery: extract src and dest sysroot paths from gcc
> =A0tcmode-external-sourcery: pass -msgxx-glibc for x86
> =A0external-sourcery-toolchain: forcibly create usr/lib
>
> =A0.../distro/include/tcmode-external-sourcery.inc =A0 =A0| =A0 48 ++++++=
++++++-------
> =A0.../meta/external-sourcery-toolchain.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 2=
5 +++++------
> =A02 files changed, 41 insertions(+), 32 deletions(-)
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b


--=20
Elizabeth Flanagan
Yocto Project
Build and Release


