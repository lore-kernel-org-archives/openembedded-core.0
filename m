Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7B9C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:16:17 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com
 [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web11.8496.1645172174096825985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 00:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=NyvYADRX;
 spf=pass (domain: bmw.de, ip: 207.54.71.126,
 mailfrom: prvs=041686c5e=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1645172174; x=1676708174;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Xxcs7288YmJWyq+4ET0ZpBOj6hhXcN7hFSlAfe2hnCE=;
  b=NyvYADRXdU1YFPeya72tojQf6RsqA1Je+pzjyG5qQjh4DILyHBOawSW9
   Nj09C3P746pmd7QLqva5j4tVsjoVN/utpbMPWzWONaTPP6R+heBSMT/u2
   uUsNwXE7dqQ/JXjfSTWLkXKP6zt5tDcxpLlJmnYKM+M3yPHChgp/fChnP
   M=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 18 Feb 2022 09:16:11 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
 18 Feb 2022 09:16:11 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb5.muc with ESMTP/TLS; 18 Feb 2022 09:16:11 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Fri, 18 Feb 2022 09:16:11 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Fri,
 18 Feb 2022 09:16:10 +0100
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
CC: <armccurdy@gmail.com>, <Saul.Wold@windriver.com>,
	<openembedded-architecture@lists.openembedded.org>,
	<openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [oe] INCOMPATIBLE_LICENSES and
 WHITELIST_<license> usage
Thread-Topic: [Openembedded-architecture] [oe] INCOMPATIBLE_LICENSES and
 WHITELIST_<license> usage
Thread-Index: AQHYJFJIMBbHPIrqo02bAwte8TOHNayYYSGAgACAowCAAAD3gIAAA22A
Date: Fri, 18 Feb 2022 08:16:10 +0000
Message-ID: <Yg9VyQM8LrfUotvf@korppu>
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
 <CAJ86T=VF+6J3UBJ-=rYt=rODkdP=H73cWFXyE0YfJCaYJfb1oQ@mail.gmail.com>
 <Yg9SGkkOMwoPVcP1@korppu>
 <CANNYZj9SjKwzhBrpphqLkNCLOieZUs_Z+r-80yriWJV3xAzErQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9SjKwzhBrpphqLkNCLOieZUs_Z+r-80yriWJV3xAzErQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <154E77F249A9354390626A9A3A870115@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 08:16:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161886

Hi,

On Fri, Feb 18, 2022 at 09:03:53AM +0100, Alexander Kanavin wrote:
> You should really try per-image INCOMPATIBLE_LICENSE :) Maintaining
> those whitelists/excludes is awkward, as developers constantly want
> more of them.

Hmm, this rings a bell. Likely yes then :)

But on the other hand this way we're quite explicit about what GPLv3 things
we allow to compile. Compiling too much also hurts with compilation times t=
oo and for
many use cases developers are better off working with Debian or Ubuntu tool=
ing than
compiling every bell and whistle with yocto.

My list of GPLv3 recipes enabled for compilation is quite stable at:

autoconf
bash
bc
binutils
bison
cairo
ccache
coreutils
diffutils
elfutils
findutils
gawk
gcc
gdb
gdbm
gettext
gnutls
grep
libevent
libmpc
libpipeline
libunistring
m4
make
mpfr
python-rfc3987
python-strict-rfc3339
readline
rsync
sed
tcpreplay
which

Cheers,

-Mikko=

