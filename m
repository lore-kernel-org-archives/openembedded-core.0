Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id E17A36A622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:58:31 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o17so6542159oag.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=yLrRt+KWH+HfaReGdApRAiffLPAgkKRDEI2LQhELLKo=;
	b=lnEusr8YDqf0B8xaCVCLHd5vKrdgdqxTQoiaO3e+1KhJza6Ru17s2J4d/PzHWgW4rx
	r7cn95taa5KkbnqmJ8hj3/hwHq8ZZtRAW9URsA4iwTbfUIN0AUeBVApssr+GD072twOU
	29eHOMHtMAM7T2hW+d3A8chO5mxuuKSgiz3D3XBS96RigJPZxvXBsGUcYbc1T86PI+x1
	SdWFkq9ypZh9U0fE6ScoePQyJ8Yt6LK3XmC3p1W7Jy3iJbAnz9dx9Wn9nls4UPwZrI4c
	/10TGBQG+0650PovmpQ6o+rRzs8I0OkIIGMASnGKC/btctJY9bA/pww6TMVWOD7kTdCU
	aUEw==
MIME-Version: 1.0
X-Received: by 10.182.135.161 with SMTP id pt1mr9624773obb.3.1370897912806;
	Mon, 10 Jun 2013 13:58:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 13:58:32 -0700 (PDT)
In-Reply-To: <41516af35242f86839c1afe0e9735061a2bdf5b0.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
	<41516af35242f86839c1afe0e9735061a2bdf5b0.1370896985.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 17:58:32 -0300
X-Google-Sender-Auth: pLwjFFfomZF12JNngSA7osiAQE4
Message-ID: <CAP9ODKoRd6nB4P4Zxed9+HbfA9qu8JM+=+i7RqGB30=Yja5acQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] avahi: inherit python classes, use PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Jun 2013 20:58:32 -0000
Content-Type: multipart/alternative; boundary=089e013c6c3e1dc7f804ded30bb8

--089e013c6c3e1dc7f804ded30bb8
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Without using our python classes and having appropriate dependencies, the
> build is nondeterministic, and whether a python-avahi package is produced
> will
> vary depending on the host environment, yet avahi-discover is always
> produced,
> and it depends on python-avahi.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

This could be backported for 1.4.2 I think; Paul?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013c6c3e1dc7f804ded30bb8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com">chris_larson@mentor.com</a>&gt;<br>

<br>
Without using our python classes and having appropriate dependencies, the<b=
r>
build is nondeterministic, and whether a python-avahi package is produced w=
ill<br>
vary depending on the host environment, yet avahi-discover is always produc=
ed,<br>
and it depends on python-avahi.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div>R=
eviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">=
otavio@ossystems.com.br</a>&gt;</div>
<div><br></div><div style>This could be backported for 1.4.2 I think; Paul?=
</div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =
=A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://pr=
ojetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e013c6c3e1dc7f804ded30bb8--
