Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53A60232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 17:13:04 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id b13so2249010qcw.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DHawJ73mJVJiSnGi4rMalUcnDOSUUXIKvkI9tPx/YC0=;
	b=at7IOx7WvNQD/zpbdQqz3SUJgpaD95fLAPRgrDnt4Vj3gb6yYr8gY6c3zS15t06vFs
	cyGzLdIDX66GyGqcGpLIyn7vyWfbW5CRIS1ihXJFo84MnL7Ut+m1xqHMUEaBBcks+R/X
	ib0OPh9MKQUeo4jpv6h89xnt7FBxWxxVv5mqE+H1RqqaID8XOU5vryUvjkDNRX6E9e5w
	JTH0vewPdGeynJI8S4hkc8DValI1nYVioAqRYElX+C7k9HiFp6Wri8zJYOklschyDs7K
	eLxSUgXRTZ9A09QJAFyHEpN6MyrNVnUyqMfhL23/PDLjVhVf/KoWlSpGCX0A9Yj1g4CQ
	2AJQ==
X-Gm-Message-State: ALoCoQlNSigKG3CK60gcSjrGKrJ9+v1FwE9wd7KOT2z3+adjoqTohTpUQPXcX65XZhY5JVEhl1W1
X-Received: by 10.140.92.138 with SMTP id b10mr16699926qge.59.1421341984074;
	Thu, 15 Jan 2015 09:13:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 15 Jan 2015 09:12:43 -0800 (PST)
In-Reply-To: <b2280f670f4a05a6872ecdf0ea25b14d744c5148.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
	<b2280f670f4a05a6872ecdf0ea25b14d744c5148.1421225218.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jan 2015 17:12:43 +0000
Message-ID: <CAJTo0LapunGdo3rZfvcSTw-LRzseh9=eZdsdR2haOmegTJ4vKA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/27] neard: fix B != S
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
X-List-Received-Date: Thu, 15 Jan 2015 17:13:14 -0000
Content-Type: multipart/alternative; boundary=001a113a5d5e10cd28050cb3f831

--001a113a5d5e10cd28050cb3f831
Content-Type: text/plain; charset=UTF-8

On 14 January 2015 at 08:47, Robert Yang <liezhi.yang@windriver.com> wrote:

> And bump PR to avoid:
> configure: error: source directory already configured; run "make
> distclean" there first
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

The autobuilder is hitting this:

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/mips32r2-poky-linux/neard/0.14-r1/neard-0.14/src/genbuiltin
nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
/bin/sh: src/builtin.h: No such file or directory

Ross

--001a113a5d5e10cd28050cb3f831
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 January 2015 at 08:47, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":2kl" class=3D"" sty=
le=3D"overflow:hidden">And bump PR to avoid:<br>
configure: error: source directory already configured; run &quot;make distc=
lean&quot; there first<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><div class=3D"gm=
ail_extra"><br></div>The autobuilder is hitting this:</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_extra">/home/pokybuild/yocto-autobuilder=
/yocto-worker/nightly-mips-lsb/build/build/tmp/work/mips32r2-poky-linux/nea=
rd/0.14-r1/neard-0.14/src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2=
p &gt; src/builtin.h</div><div class=3D"gmail_extra">/bin/sh: src/builtin.h=
: No such file or directory</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div></div>

--001a113a5d5e10cd28050cb3f831--
