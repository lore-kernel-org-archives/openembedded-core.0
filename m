Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD7460132
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:28:41 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id f6so3425870ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=WH+qw6D1Z2eoTlnomWbF5h3JGQYaFxX5DLTUZbqINzc=;
	b=H8AK1zPk1NO1o9vgt5NfxgowF8DzKl0qXTEIycMtxNsOzqI6CnkJ3Y2aKqsh72yeB3
	QvtafmqqDPIl0OwJWhz869bsEGd/jxkWM8H+z0tlw7zyHgUCU0kTcZ+wlQpRVIipCc5H
	7xqPVFKAUpEZS/hCcFJ9KSdy+PkXDqjC+GNeadAaUawSyfhFgBoa/dkoj85r0FzuxnGR
	/utAsDQ7omPkz08oPxCPCcIsoAh8YglBtgiTpqUsxGRzbFitwG7+mSVOJaiNIj9lVckz
	OQ/QuspSvvUDN5l0cbQ0F3hHaLHHp/YiIc00YZG5PQrSv6v2Hm/mGo40cPOvfZqbMl00
	Oypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=WH+qw6D1Z2eoTlnomWbF5h3JGQYaFxX5DLTUZbqINzc=;
	b=gRx9hMCgsyhSYuB+OofhW7KV6nzAJB8e7LPs7VD0kObFcGp74+padFrE4fQBHaAjjs
	h1TRBlSWtz/VCl9Wwel8/Y+jpob60e6z1B9CCUkzNlH5THK/vEF+TcjSPuQjyY2UakCY
	gUvmXUhsYWjS4riNf3CpLZ8Vrjng5OALL2cYLan0/rOztb0SLJK/d/y2wAgOhbgUW8Hs
	adWRm9ycxORRTy4qJAUwqocpYbilfowWYXG1a3rPVmg+Zx4woQtwzHHuUn9LSRa49j9h
	ORAFF3TdT37OzUeHuO0PAI4oNF1IqqqyOmRRiSohQlNyeQg6Pgs2mQMLZfhd3oEExwMS
	meFA==
X-Gm-Message-State: ALyK8tL3E7lmyFu9jyHmZHuIVbiIppzd+96uHI4p9qSaWwN9zIFQO8F6kmzMtrLx9tc1eIGGwYZREglSl4vjZA==
X-Received: by 10.36.43.216 with SMTP id h207mr316744ita.66.1467408522446;
	Fri, 01 Jul 2016 14:28:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Fri, 1 Jul 2016 14:28:23 -0700 (PDT)
In-Reply-To: <cover.1467408317.git.chris_larson@mentor.com>
References: <cover.1467408317.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 1 Jul 2016 14:28:23 -0700
X-Google-Sender-Auth: 7_sdhOJLbjjgg9LrB8XryE9uWpc
Message-ID: <CABcZANkQD=2s9xqtqZYa0jeG=nSmRAakxxnB+NJ88k+n1Rrw8w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2 0/2] Support template files for wic
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
X-List-Received-Date: Fri, 01 Jul 2016 21:28:42 -0000
Content-Type: multipart/alternative; boundary=001a114748a2b88db2053699abab

--001a114748a2b88db2053699abab
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 2:27 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This adds support for .wks.in files as WKS_FILE.
>
> This is a re-send of the RFC PATCH series as a regular PATCH series, to
> attempt to get the feature merged. There's a clear value-add, there were no
> major objections to the RFC series, and further improvements can be added
> on
> from here.
>
> These files are treated as the contents of a bitbake variable, so usual
> bitbake variable references are supported. I considered using another
> templating mechanism, for example the one used by yocto-layer, but then
> we'd
> end up largely mapping metadata variables to template fields anyway, which
> is
> a pointless indirection. Let bitbake expand the variables directly instead.
>
> This feature lets us, for example, reference ${APPEND} in --append, and
> avoid
> hardcoding the serial console tty in the wks file, and let the user's
> changes
> to APPEND affect wic the way they do the other image construction
> mechanisms.
>
> The template is read in and set in a variable at parse time, so changes to
> the
> variables referenced by the template will result in rebuilding the image.
>

v2 changes: simplified by dropping the prefuncs bits.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114748a2b88db2053699abab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 1, 2016 at 2:27 PM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":11s" class=
=3D"a3s aXjCH m155a85b9ecb28c46">From: Christopher Larson &lt;<a href=3D"ma=
ilto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
This adds support for .<a href=3D"http://wks.in" rel=3D"noreferrer" target=
=3D"_blank">wks.in</a> files as WKS_FILE.<br>
<br>
This is a re-send of the RFC PATCH series as a regular PATCH series, to<br>
attempt to get the feature merged. There&#39;s a clear value-add, there wer=
e no<br>
major objections to the RFC series, and further improvements can be added o=
n<br>
from here.<br>
<br>
These files are treated as the contents of a bitbake variable, so usual<br>
bitbake variable references are supported. I considered using another<br>
templating mechanism, for example the one used by yocto-layer, but then we&=
#39;d<br>
end up largely mapping metadata variables to template fields anyway, which =
is<br>
a pointless indirection. Let bitbake expand the variables directly instead.=
<br>
<br>
This feature lets us, for example, reference ${APPEND} in --append, and avo=
id<br>
hardcoding the serial console tty in the wks file, and let the user&#39;s c=
hanges<br>
to APPEND affect wic the way they do the other image construction mechanism=
s.<br>
<br>
The template is read in and set in a variable at parse time, so changes to =
the<br>
variables referenced by the template will result in rebuilding the image.<b=
r></div></blockquote></div><br>v2 changes: simplified by dropping the prefu=
ncs bits.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a114748a2b88db2053699abab--
