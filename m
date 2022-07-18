Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3103C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 18:00:03 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.30629.1658167202192497012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3HWVSht;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id w2so14562351ljj.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zSMkrDq0F0VIS2h1fA+la5QcUcqQ3tE6Z5GwFUhiqLM=;
        b=g3HWVShtQK5YNhGjHIlEsefLT31EuizqYQyy2PmyUKtNHle3ECsSKV6P1btT4ed9DR
         kL5ukZxLibZLQYyprRYx9YWMvV4lmowH8L/VtfSV/37HJhZDYgbDi5VlV5ynqsDfpzeF
         LANC1eGJwvwU3YSGEJHiWO/FdbRweUIPd9rYXnPr9GbSzq+tgACRiUzSDVbVtWcbbvHs
         QafVVS4ScqM01Spu9sywSZ27MbrjXpKYrTz4IjPYlXrPQuu3oA9PMRlWvTklryno0AjA
         Cvewtu5JAaY/0SSrgVWTQMtUMEB+b1zfklGE0tdIus5tmnM4dca3kzriyAvLX2v964Lu
         s+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zSMkrDq0F0VIS2h1fA+la5QcUcqQ3tE6Z5GwFUhiqLM=;
        b=jCNqE5a8gLOu+HBx5d70J6xODEKxzNRpgE101CfzX+516Oe7DA785gjLEIDMOP4nZ1
         lx32RTV+nFIvaHwqllrgCsn6Oe9S5wfeYYgTgloWmpsCGYz7ny453V6wnP4x8cLOMwEw
         OeGCc0X2cbB4YbwFtqUKVL+96sHMuBftLwkXOSSHrlGmMgHHXnE3EFMvM3DZ2l0wP+80
         4DYYRQhjamfM7G0VyA6u3DnGj3gnXOVFwPi4SX7VnmEzmEhdqWaaq2w9CxAnurwZSKpS
         WIiOqzkVNbdSIUyPU4IgpH0sY5MBIbQl44w5blTVz/yw1KQ4aMEp+anA518M3ESMctEs
         bZuw==
X-Gm-Message-State: AJIora+aVyLYxefzJ4TsKI03TU6IzZp3kJbtQKD8OkPxg7V60SEi0F78
	Stt94ec640fv0QAeHRRQUWHTGX2M4zZXKighBk0=
X-Google-Smtp-Source: 
 AGRyM1st3nMfMJHO8tD3pIkN0RTthUPLOzuOZiehhvX7SPFri5lo7ICZxa7POCmC9QXhjRhGTxnn39DJ5FWhoI1P9VA=
X-Received: by 2002:a2e:b6d2:0:b0:25d:6849:f7f9 with SMTP id
 m18-20020a2eb6d2000000b0025d6849f7f9mr13472690ljo.41.1658167200335; Mon, 18
 Jul 2022 11:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
 <c26547d12783ebb94f1d2222403c11cc7c9633d8.camel@linuxfoundation.org>
 <CANNYZj9vT+YqW6qHqCLMoxzfc9G=ZdJzYW03qsQBF=eP6+d0yQ@mail.gmail.com>
 <OSBPR01MB18451275E728D4DE026351A3DC8C9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB18451275E728D4DE026351A3DC8C9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Jul 2022 19:59:49 +0200
Message-ID: 
 <CANNYZj8Y=6GUjQe6r=dy352XbX3qKKUY7Y6mPG481PNQOfU4rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 18:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168246

If you upgrade the package with 'devtool upgrade python3-docutils',
then devtool will write a diff of the license into the new recipe:

# --- COPYING.txt
# +++ COPYING.txt
# @@ -4,8 +4,8 @@
#
#  :Author: David Goodger
#  :Contact: goodger@python.org
# -:Date: $Date: 2021-11-19 13:46:38 +0100 (Fr, 19. Nov 2021) $
# -:Web site: http://docutils.sourceforge.net/
# +:Date: $Date: 2022-05-30 18:54:46 +0200 (Mo, 30. Mai 2022) $
# +:Web site: https://docutils.sourceforge.io/
#  :Copyright: This document has been placed in the public domain.
#
#  Most of the files included in this project have been placed in the
# @@ -26,11 +26,11 @@
#  below (the "Work") to the public domain.
#
#  The primary repository for the Work is the Internet World Wide Web
# -site <http://docutils.sourceforge.net/>.  The Work consists of the
# +site <https://docutils.sourceforge.io/>.  The Work consists of the
#  files within the "docutils" module of the Docutils project Subversion
# -repository (Internet host docutils.svn.sourceforge.net, filesystem path
# -/svnroot/docutils), whose Internet web interface is located at
# -<http://docutils.svn.sourceforge.net/viewvc/docutils/>.  Files
dedicated to the
# +repository (http://svn.code.sf.net/p/docutils/code/),
# +whose Internet web interface is located at
# +<https://sourceforge.net/p/docutils/code>.  Files dedicated to the
#  public domain may be identified by the inclusion, near the beginning
#  of each file, of a declaration of the form::
#
# @@ -99,13 +99,18 @@
#
#    .. _eLyXer: https://github.com/alexfernandez/elyxer
#
# -* docutils/parsers/recommonmark_wrapper.py,
# +* docutils/__main__.py,
# +  docutils/parsers/commonmark_wrapper.py,
# +  docutils/parsers/recommonmark_wrapper.py,
#    docutils/utils/error_reporting.py,
#    docutils/utils/math/__init__.py,
#    docutils/utils/math/latex2mathml.py,
#    docutils/utils/math/tex2mathml_extern.py,
#    docutils/utils/punctuation_chars.py,
# +  docutils/utils/smartquotes.py,
#    docutils/writers/html5_polyglot/__init__.py,
# +  docutils/writers/html5_polyglot/*.css,
# +  docutils/writers/latex2e/docutils.sty,
#    docutils/writers/xetex/__init__.py,
#    test/test_parsers/test_recommonmark/\*.py,
#    test/test_parsers/test_rst/test_directives/test__init__.py,
# @@ -141,12 +146,12 @@
#  Plaintext versions of all the linked-to licenses are provided in the
#  licenses_ directory.
#
# -.. _sandbox: http://docutils.sourceforge.net/sandbox/README.html
# +.. _sandbox: https://docutils.sourceforge.io/sandbox/README.html
#  .. _licenses: licenses/
# -.. _Python 2.1.1 license: http://www.python.org/2.1.1/license.html
# -.. _GNU General Public License: http://www.gnu.org/copyleft/gpl.html
# +.. _Python 2.1.1 license: https://docs.python.org/3/license.html
# +.. _GNU General Public License: https://www.gnu.org/copyleft/gpl.html
#  .. _BSD 2-Clause License: http://opensource.org/licenses/BSD-2-Clause
#  .. _BSD 3-Clause License: https://opensource.org/licenses/BSD-3-Clause
#  .. _OSI-approved: http://opensource.org/licenses/
#  .. _license-list:
# -.. _GPL-compatible: http://www.gnu.org/licenses/license-list.html
# +.. _GPL-compatible: https://www.gnu.org/licenses/license-list.html
#
#

Then it's easy to see that the changes are dates, URLs and file lists
only. You can also
go through the version history, but it's subversion on sourceforge, so
not that simple:

https://sourceforge.net/p/docutils/code/9110/log/?path=3D/trunk/docutils/CO=
PYING.txt
(e.g. you need to check the top three commits only)

Alex

On Mon, 18 Jul 2022 at 02:25, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:
>
> The relevant updates of COPYING.txt are the following:
>
> Command line=E2=80=9Centry point=E2=80=9Dto the docutils package. Part 2/=
2.
> Support ``python -m docutils`` with new module `docutils.__ main__`.
> Support ``docutils`` CLI command via=E2=80=9Centry point=E2=80=9Din setup=
. py.
> Keep tools/docutils-cli. py for backwards compatibility and manual instal=
lation.
> Calls `docutils.__ main__. main=EF=BC=88=EF=BC=89`.
>
> But the above content can be regarded as the change of COPYING.txt?
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Saturday, July 16, 2022 12:45 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>; Richard Purdie
> > <richard.purdie@linuxfoundation.org>
> > Subject: Re: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
> >
> > On Fri, 15 Jul 2022 at 18:41, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > > License-Update:
> > > >  year updated to 2022
> > > >  url of some reposity and license changed  exceptions of BSD
> > > > 2-Clause License changed
> > >
> > > This last bit sounds a little worrying. Is the code still under BSD-2=
-
> > > Clause? How did the exceptions change? Were new ones added or removed=
?
> > > Does it change the license?
> >
> > In cases like this it usually helps to include a link to the commit on =
the web (e.g.
> > github) where the changes are. If there are several commits between the=
 two
> > releases, then include all of them, there's usually a way to browse his=
tory
> > per-file.
> >
> > Alex

