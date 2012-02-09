Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvaDO-0006Wr-Gn
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 21:03:34 +0100
Received: by lahc1 with SMTP id c1so1874080lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=EhLT2+4AWtwG37TfGrTYpbJV1Tswf7c0Kh3NYLWxcnI=;
	b=Anx4BnatXanpP7YLTjuWKaYFYgy/hl4tqPSOb56Tz5XqnPFN3kmZjbQLORpdr1jqqC
	0Qrddnr/NxiakNryiynuG43YKmIBlAsE2qLO7SbfkTvpPHa8RrWo6kaEhctW2r2Fzcjv
	uRj8tWPQlcbz7vKHLwkV9Y1KbXfeBFi+gvxAA=
Received: by 10.112.86.67 with SMTP id n3mr1080027lbz.29.1328817329311; Thu,
	09 Feb 2012 11:55:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 11:54:59 -0800 (PST)
In-Reply-To: <1328812424.14363.74.camel@phil-desktop>
References: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
	<1328812424.14363.74.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 11:54:59 -0800
Message-ID: <CAMKF1spd_cGhVtd-_ebgUgyMKHFzsB8JhfF0gdByJBeyvr6_9w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 20:03:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 9, 2012 at 10:33 AM, Phil Blundell <philb@gnu.org> wrote:
>
> Do you really want to put the development files in ${base_libdir}
> anyway? =C2=A0I would have thought that even the most enthusiastic propon=
ents
> of a standalone / would not expect to be able to use the compiler
> without /usr mounted.

eventually I think we will end up with everything being in ${base_libdir} :=
)
or we have to make sure that stripped out debug files and standard dev
libs and headers
go into /usr

this should be made an option before we go on making these changes IMOs
I like stuff in /usr and I don't so much care about / and /usr being
on different partitions


