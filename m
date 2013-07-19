Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 964A76B0F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 15:02:52 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id fh20so1764539lab.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=3rwP37dq4KW1nCB9pLdV2OrRewUyczwzBPNz6qN8ulA=;
	b=KBRgOTI6mtMWFVPdsvWDTK6Lucs/9o4PdcV+jKKTqBBcMBDSoTa+oHHe72H3pJsm/J
	0dN4PippW+l3Lwu4Wv9FAJiy1kTHP30jylwraP9DjB+BW6WPH+0i4o+/477hXqWV9pUU
	bcTb2KWttCSNDKZ3r7E9qXw2uTUsvBBW0H71F9Qx15gj7FnPl7GL+jsAN3Xpauw/eJMZ
	0DMkuDjAEOhdJPKJ89qdiszX9CDenqRfHUoBsiRsP2CcC8Tcn5P6ePEAl8ejP5Xw5VSc
	bNmtsBxS1MokdRK9AKPWW5XpAW+xTKAW67p89HJ4I5OB/2C8zmwOgUeHKk1oFOxT2Euw
	gPyA==
X-Received: by 10.152.1.134 with SMTP id 6mr7680469lam.16.1374246172383; Fri,
	19 Jul 2013 08:02:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.18.100 with HTTP; Fri, 19 Jul 2013 08:02:32 -0700 (PDT)
In-Reply-To: <1374234806-31680-2-git-send-email-muhammad_shakeel@mentor.com>
References: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
	<1374234806-31680-2-git-send-email-muhammad_shakeel@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Jul 2013 08:02:32 -0700
X-Google-Sender-Auth: VC46YMl_Bc-1lJQwh_t6qX36xas
Message-ID: <CABcZAN=z2JMb9XzkCfwFSYwezY7otMGxbYfQr_RboUxkSHcNPg@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] update-rc.d: Remove init.d dir if sysvinit is not in distro features
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
X-List-Received-Date: Fri, 19 Jul 2013 15:02:53 -0000
Content-Type: multipart/alternative; boundary=e89a8f234e85f05cc404e1de9e4b

--e89a8f234e85f05cc404e1de9e4b
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 19, 2013 at 4:53 AM, Shakeel, Muhammad <
muhammad_shakeel@mentor.com> wrote:

> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> If sysvinit is not supported DISTRO_FEATURE than there is no need to
> package related initialization scripts.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>

If we stop shipping init.d for non-sysvinit distros, which makes sense, we
should also consider automatically enabling/disabling sysv compat support
in the systems build based on that distro feature also. So, I support this
commit, but am proposing adding another for consistency :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--e89a8f234e85f05cc404e1de9e4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 19, 2013 at 4:53 AM, Shakeel, Muhammad <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:muhammad_shakeel@mentor.com" target=3D"_blank">muhammad_sha=
keel@mentor.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":13d" style=3D"overflow:hidden">F=
rom: Muhammad Shakeel &lt;<a href=3D"mailto:muhammad_shakeel@mentor.com">mu=
hammad_shakeel@mentor.com</a>&gt;<br>


<br>
If sysvinit is not supported DISTRO_FEATURE than there is no need to<br>
package related initialization scripts.<br>
<br>
Signed-off-by: Muhammad Shakeel &lt;<a href=3D"mailto:muhammad_shakeel@ment=
or.com">muhammad_shakeel@mentor.com</a>&gt;</div></blockquote></div><br>If =
we stop shipping init.d for non-sysvinit distros, which makes sense, we sho=
uld also consider automatically enabling/disabling sysv compat support in t=
he systems build based on that distro feature also. So, I support this comm=
it, but am proposing adding another for consistency :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--e89a8f234e85f05cc404e1de9e4b--
