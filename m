Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 374B1763C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 21:28:37 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so35156150ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t/J8/zrJcdrqQ/46jCn4/UiHyuc+QSIRBH9wyBvSA1k=;
	b=EpCLRLmjD/8wgAEiBfyy74PhQY1rAjvuc+WuO5HUy83os16qEHDJGpiOBPLJbREQOa
	P2uKbDwdD07v0PnfWz6GATx7+EEfXWqwtU71pvqIuALsdGTsP8HK+206JO9bp77YtlZo
	NNBDJ9tgKYDY7i4ZUJYwrzTACBnu9FThqpX0Y6OyrV6Nb4+augcK6RbT/npItS8ECU3u
	j218/4eKWFhdJly7pKBs09CgbrGKHGtvz33VGrMJ8NStq1HuRGaTkxNU46H+cWvl59E0
	CS84lxFSfWiYA4BYr/kFK+/5dM9K+9c6Aki8l3wELdFiLxdyaFxK/lTy8XdCRt8WhexN
	o+fA==
X-Received: by 10.107.15.210 with SMTP id 79mr5031437iop.192.1438205317854;
	Wed, 29 Jul 2015 14:28:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.199 with HTTP; Wed, 29 Jul 2015 14:28:18 -0700 (PDT)
In-Reply-To: <CABcZANkCPbUfxhN3FB=k8W4n79sKs73Os+u01H+8TkjOyUuimg@mail.gmail.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
	<34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
	<55B8799D.3050600@windriver.com>
	<2239134.B3utLX50et@peggleto-mobl.ger.corp.intel.com>
	<CABcZANkCPbUfxhN3FB=k8W4n79sKs73Os+u01H+8TkjOyUuimg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 29 Jul 2015 14:28:18 -0700
Message-ID: <CABcZANnUR=W81FOz0+3gr9MdM4hXsx-qm4TeD6ZeEvd7Ac-EzQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 29 Jul 2015 21:28:40 -0000
Content-Type: multipart/alternative; boundary=001a113fe63a15c3b5051c0a455a

--001a113fe63a15c3b5051c0a455a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 9:40 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> On Wed, Jul 29, 2015 at 2:56 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> Hmm, I guess we will have to add a command-line parameter to specify
>> BBPATH
>> (or the full plugin search path) so that tinfoil doesn't have to be
>> instantiated when it's specified.
>>
>
> Indeed, sorry about that, I didn=E2=80=99t even realize populate_sdk_ext =
used
> devtool from a bbclass :)
>

I'll submit patches for this and one other populate_sdk_ext issue shortly.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113fe63a15c3b5051c0a455a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 29, 2015 at 9:40 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Wed, Jul 29, =
2015 at 2:56 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul=
.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overf=
low:hidden">Hmm, I guess we will have to add a command-line parameter to sp=
ecify BBPATH<br>
(or the full plugin search path) so that tinfoil doesn&#39;t have to be<br>
instantiated when it&#39;s specified.<br></div></blockquote><div><br></div>=
</span><div>Indeed, sorry about that, I didn=E2=80=99t even realize populat=
e_sdk_ext used devtool from a bbclass :)</div></blockquote></div><br>I&#39;=
ll submit patches for this and one other populate_sdk_ext issue shortly.<br=
>-- <br><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot co=
m<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>S=
enior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113fe63a15c3b5051c0a455a--
