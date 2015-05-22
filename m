Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id DED8A6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:19:08 +0000 (UTC)
Received: by qget53 with SMTP id t53so9817908qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 08:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7E9twPoipz08etjyUnhRw47PV6a/ku+LvIvKCt4NCfY=;
	b=EqtW3Hf7u7k6kAMnQaTFUOGTll690bNalwGn5Yk826U91Fcalv7K80EWz7bR7eNDQ7
	u+X1gABRogEKRdt5ue+yC7nqt6E5L+grqQZPsimbhriN9Ahiq9tFPGCDTDIHCm/7AxHj
	SwxrIh2tBD5jVpB8vvUdtSJiaKo38lUy3dWoPOLAKqWK2I/+DgjrcaYlhDU27FNvGc2m
	hNg+j86AewMrUGKQj+j9XhL6B2x+XL0xXkE9Ffw5UoDWmFLlCsbwI1Urzj6NREOzQtrh
	iQok+JE6Fp8LcIqfL+gh/DwXehhrhcdEWoo4iYi/a3fxlUOH3uIxFbu3NDSUbxVvdQJp
	tOfw==
X-Gm-Message-State: ALoCoQnaxC7FFOA9eeXkoU1Rne22pUtftRXvbBRA3FOAaRPerIMw679f9TB0YnWykgPSuJ+ICPCn
X-Received: by 10.229.185.68 with SMTP id cn4mr680164qcb.12.1432307949342;
	Fri, 22 May 2015 08:19:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 08:18:48 -0700 (PDT)
In-Reply-To: <1432306848.2882.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
	<bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
	<2968009.Jcp0e3iZx0@peggleto-mobl.ger.corp.intel.com>
	<1432306848.2882.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 16:18:48 +0100
Message-ID: <CAJTo0LZWra9U0Xj2fd-0oEL4=96GE9bYRJPNitd_BYjH2=TcSg@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Fri, 22 May 2015 15:19:09 -0000
Content-Type: multipart/alternative; boundary=001a1134a47487a6160516ad2ee9

--001a1134a47487a6160516ad2ee9
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 16:00, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> That sounds like a reasonable approach too. To avoid maintaining a list
> of all modules in the recipe, it would be good to script the
> dependencies:
>
> RDEPENDS_${PN} = "${@get_built_plugin_packages()}"
>
> I'm not experienced with bitbake scripting, so any pointers for
> implementing get_built_plugin_packages() would be helpful.
>

do_split_packages() returns a list of packages that it created, gdk-pixbuf
is a concise example.

Ross

--001a1134a47487a6160516ad2ee9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2015 at 16:00, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:7vf" class=3D"a3s" style=3D"overflow:hidden">That sounds like a reasonable=
 approach too. To avoid maintaining a list<br>
of all modules in the recipe, it would be good to script the<br>
dependencies:<br>
<br>
RDEPENDS_${PN} =3D &quot;${@get_built_plugin_packages()}&quot;<br>
<br>
I&#39;m not experienced with bitbake scripting, so any pointers for<br>
implementing get_built_plugin_packages() would be helpful.</div></blockquot=
e><div><br></div><div>do_split_packages() returns a list of packages that i=
t created, gdk-pixbuf is a concise example.</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a1134a47487a6160516ad2ee9--
