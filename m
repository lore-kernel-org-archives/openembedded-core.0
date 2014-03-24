Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id C26096B72B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:35:19 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id mc6so3830817lab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GDadqHXZ/Aas4TQAzlg/5h08BXUXQwFhT5duabbwXm8=;
	b=0vCMFZnW24XKGn4GEJN7QNzbfjkxfdpSmmIS2RntWHNMqjQxe0di0sqPRI7L+j3tBx
	pzTAdEMoqeQz4GOahHQ3CTvxSxVo+AJ9HHzgPxNGoD9onYfoTX2D6YSYOl2QZ2n1rvXd
	dk41y4+X0PEtLz7NEr+Ic4S2SrBV1QV7OpTkPkoiP3lFQ1i2WoCFKYbgFFMoOaZulTp4
	CJqQteIG+XTobLCJDh1iaCYBLk7xyRXsPm5cIoDK50r83UiJpFTaG62pP+5TlrYLQH2R
	sLEv3mXZOgwihAiMQBnnbDofmhGQG0LaSKi3BuA72rcwX4xnubCz4qCxfrpKNTAuoGMG
	VEgA==
X-Received: by 10.112.254.163 with SMTP id aj3mr43809210lbd.20.1395675319133; 
	Mon, 24 Mar 2014 08:35:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.35.194 with HTTP; Mon, 24 Mar 2014 08:34:59 -0700 (PDT)
In-Reply-To: <c4b687132dcd976635a375f994f66b3a6b9242f9.1395639299.git.liezhi.yang@windriver.com>
References: <cover.1395639298.git.liezhi.yang@windriver.com>
	<c4b687132dcd976635a375f994f66b3a6b9242f9.1395639299.git.liezhi.yang@windriver.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 24 Mar 2014 08:34:59 -0700
Message-ID: <CABcZANma6KPgomjHwW=Lc2_VSiHrWiE624=cNWN3FaiNEbfPZQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] local.conf.sample.extended: update it for the archiver
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
X-List-Received-Date: Mon, 24 Mar 2014 15:35:22 -0000
Content-Type: multipart/alternative; boundary=001a113471889e6b8e04f55bfb52

--001a113471889e6b8e04f55bfb52
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 23, 2014 at 10:39 PM, Robert Yang <liezhi.yang@windriver.com>wrote:

> +# 9) The recipe type that will be archived:
> +#    COPYLEFT_RECIPE_TYPES = '<type1> <type2> ...'
> +#    The type can be: target native nativesdk cross crosssdk
> cross-canadian.
>

Hmm, I wonder if we should note that the default is to archive all types,
here.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113471889e6b8e04f55bfb52
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Mar 23, 2014 at 10:39 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":d4" class=3D"a3s" style=3D"overf=
low:hidden">+# 9) The recipe type that will be archived:<br>
+# =C2=A0 =C2=A0COPYLEFT_RECIPE_TYPES =3D &#39;&lt;type1&gt; &lt;type2&gt; =
...&#39;<br>
+# =C2=A0 =C2=A0The type can be: target native nativesdk cross crosssdk cro=
ss-canadian.</div></blockquote></div><br>Hmm, I wonder if we should note th=
at the default is to archive all types, here.<br>-- <br>Christopher Larson<=
br>clarson at kergoth dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--001a113471889e6b8e04f55bfb52--
