Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id B423560097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 21:01:39 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ge10so1797958lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=RiTdK0R/ezX8W8l7vy1of9B2AfDzG658J+f6UuTwCSo=;
	b=XsoHHpt0MUIZGLbRIG/ntu5PRTzqEaba7n+ZrD0JZOy43+q0fWGKHEHgpjbFB9TRO+
	ZWUBUojCoBFxYCyIDFrIWUr/dSkbcRepLgJHJ2jH0fnBc2CWBkEvpd/YZdXaf2/Rp8OE
	7LWc+OuNN7EbQzk7+plVrgMHssgkBiGc+MfHTtI2nnx8V26blQ27G8KRDqvsvS2aCJkj
	gKDZZOFjh4V628vDLGJCerFEv1xUkARqueSB+YwQ/vIKDQzISryUflc2aIvsxf3xRkGh
	hSl7vF6pkBCzJPT1yHK6bsAXdWHwqTZEVQWVa0yCAlh60kdyAPQJMYt1VNHPytKxU/j+
	R8Yg==
X-Received: by 10.112.56.171 with SMTP id b11mr37364735lbq.65.1413925298894;
	Tue, 21 Oct 2014 14:01:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.6.234 with HTTP; Tue, 21 Oct 2014 14:01:18 -0700 (PDT)
In-Reply-To: <1413902251-19519-1-git-send-email-ross.burton@intel.com>
References: <1413902251-19519-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 21 Oct 2014 14:01:18 -0700
X-Google-Sender-Auth: q1mU0yoSAjiUvQtuAibyeFmM6iE
Message-ID: <CABcZANmy6jOgugV=EWXqFjOerCCMcBX3ZMoxfpVHuYv3Lqe_Jg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native.bbclass: use BUILD_* variables
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
X-List-Received-Date: Tue, 21 Oct 2014 21:01:47 -0000
Content-Type: multipart/alternative; boundary=001a1133ab822dfb1e0505f523b9

--001a1133ab822dfb1e0505f523b9
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 21, 2014 at 7:37 AM, Ross Burton <ross.burton@intel.com> wrote:

> Instead of replicating the logic for the host compiler naming from bitbake
> .conf,
> use the BUILD_* variables directly.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

This duplication has bugged me for years, but never enough to do something
about it. Nicely done.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1133ab822dfb1e0505f523b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 21, 2014 at 7:37 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":f6" clas=
s=3D"a3s" style=3D"overflow:hidden">Instead of replicating the logic for th=
e host compiler naming from <span class=3D"il">bitbake</span>.<span class=
=3D"il">conf</span>,<br>
use the BUILD_* variables directly.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;</div></blockquote></div><br></div><div class=3D"=
gmail_extra">This duplication has bugged me for years, but never enough to =
do something about it. Nicely done.<br>-- <br>Christopher Larson<br>clarson=
 at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maint=
ainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a1133ab822dfb1e0505f523b9--
