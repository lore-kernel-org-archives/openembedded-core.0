Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0D010719D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:54:05 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170220155404765_0684;
	Mon, 20 Feb 2017 15:54:04 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=58076 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cfqHl-00082Q-QJ; Mon, 20 Feb 2017 10:53:57 -0500
Date: Mon, 20 Feb 2017 10:53:55 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <kergoth@gmail.com>
In-Reply-To: <CABcZANkGtd+ikiFq+gL3d1m8_usPGfLZP9uaCKzarfXObEGO-w@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1702201052360.3945@localhost.localdomain>
References: <alpine.LFD.2.20.1702200935010.377@localhost.localdomain>
	<CABcZANkGtd+ikiFq+gL3d1m8_usPGfLZP9uaCKzarfXObEGO-w@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: dbus seems to be given debian naming convention, breaking another recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 15:54:07 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1738490545-1487606037=:3945"

--8323328-1738490545-1487606037=:3945
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Feb 2017, Christopher Larson wrote:

>
> On Mon, Feb 20, 2017 at 7:40 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         moving on, i whipped together a recipe for libnet-dbus-perl, tried
>       to build, and:
>
>         ...
>         DBus >= 1.3.0 is required
>         ...
>
>       which is weird since oe-core contains the recipe:
>
>         meta/recipes-core/dbus/dbus_1.10.14.bb
>
>       but when i examined the deployed rpms:
>
>       -rw-r--r--. 3 rpjday rpjday  163963 Feb 20 06:04 dbus-1-1.10.14-r0.ppc7400.rpm
>       -rw-r--r--. 3 rpjday rpjday 1393445 Feb 20 06:04 dbus-dbg-1.10.14-r0.ppc7400.rpm
>       -rw-r--r--. 3 rpjday rpjday   36372 Feb 20 06:04 dbus-dev-1.10.14-r0.ppc7400.rpm
>       -rw-r--r--. 3 rpjday rpjday   92124 Feb 20 06:04 dbus-doc-1.10.14-r0.ppc7400.rpm
>       -rw-r--r--. 3 rpjday rpjday    2960 Feb 20 06:04 dbus-ptest-1.10.14-r0.ppc7400.rpm
>       -rw-r--r--. 3 rpjday rpjday  135131 Feb 20 06:04 libdbus-1-3-1.10.14-r0.ppc7400.rpm
>
>         uh, what's with the "dbus-1-1.10.14-r0.ppc7400.rpm"?
>                                  ^^^^
>       oh, wait, here's a line from the dbus recipe:
>
>         DEBIANNAME_${PN} = "dbus-1"
>
>       it would seem that that is getting in the way, or am i doing something
>       silly?
>
>
> debian.bbclass handles this, but package naming is irrelevent. Your
> buildsystem isn’t running out and trying to find a binary rpm, at
> least I’d certainly hope not.

  i'm still confused, then ... what is libnet-dbus-perl complaining
about?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1738490545-1487606037=:3945--
