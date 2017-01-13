Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id E881771D82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:43:21 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id l7so49146998qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSgc32NvnBhZ6aIZKW73UvNjmuzWMbLXKhQAoUu3CuY=;
	b=pM8MYsub4nfQNIfrGax6UhH755rTYEmmDl5wXWcpfq3Dcw7DPgS1bCWd1q59LPvcpD
	ZzvkGCm+SHFfDTrDbrOXimKxZ0KoMnhj9BZ2+0TIuqI6swQ2bV8WgALBqXSLVHhNKNNF
	byGFb32MNSQxqt+XfMUtUPoKyhYoxYmOndUuDxPISx6ZB62nlsG+narJ+vAcgGjpZYVQ
	C0O79UfCYt8QPvlUIrZ/Ltc2XRvWV+QffTa13iKNvqEOMS0IfTyvk7ghTUZR+uVj5vLi
	e6WjSiBitiH6yy7AGYe3+xABRD/Nm5n2GVfKNK9osCnp9eLQuJOfAixA6+UQCEXIvmil
	uSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSgc32NvnBhZ6aIZKW73UvNjmuzWMbLXKhQAoUu3CuY=;
	b=skC80V+0e8py6sHAxdKinnes76xsQg6MihRprfSyIdFm9Fwooj6zSYdOufTw2me4Ly
	AVYL7c6uvDwdwsAwqzbv956Sg/FiTTqv+S8OHAlNAhxOJRoBzBkHwD7jIXqhtPxUOER/
	BHDfgzH8oVsfKvtUDocf7iwneeHMuBH84Ka4Okt0HtnhoMNPaAnOuaV9ZFFMlHqmJ+nF
	kX+g14PXmtSjD3o/3KLtloGlV+9WMjA+aDgjlgncojDVcrZMqySJ01R3shM8hhyiceDm
	kKMqV2g1ckgWWgcs+uYZVi8SmqFepkg91BtyDA8eXfAQcktgFEf38FBht5vVnnIskf3J
	MeHw==
X-Gm-Message-State: AIkVDXLpe0zu22KjMdNVMBnGyE0bjMrDF1ZP6TY7je9394whSFFvkfeBxPL5mJ84m3Em3C1G7e/0UekZn3vGCHLA
X-Received: by 10.200.45.247 with SMTP id q52mr19480227qta.197.1484318601689; 
	Fri, 13 Jan 2017 06:43:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 06:43:01 -0800 (PST)
In-Reply-To: <1484317398-25452-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484317398-25452-1-git-send-email-yannick.gicquel@iot.bzh>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 14:43:01 +0000
Message-ID: <CAJTo0LZgBD=9cLcbaxOQ66kC2hxHFtCVC+U-0NdSS0fRS0NOPQ@mail.gmail.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ccache: enable max size setup for ccache dir
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
X-List-Received-Date: Fri, 13 Jan 2017 14:43:22 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf0fcd8ab0545fada37

--001a1139cdf0fcd8ab0545fada37
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 14:23, Yannick Gicquel <yannick.gicquel@iot.bzh>
wrote:

> +def init_ccache():
> +    # dummy python version
> +    return
> +
> +init_ccache() {
> +    if [ -n "${CCACHE}" ]; then
> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
> +    fi
> +}
> +
> +do_compile_prepend() {
> +    init_ccache
> +}
>

That is horrible. :)

Is it not possible to just pass -M[size] to ccache every time it's
invoked?  If it needs to be invoked on its own, then a do_compile[postfunc]
or something to trim the size after a build would be neater.

Ross

--001a1139cdf0fcd8ab0545fada37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 14:23, Yannick Gicquel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:yannick.gicquel@iot.bzh" target=3D"_blank">yannick.gicquel@iot.b=
zh</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">=
+def init_ccache():<br>
+=C2=A0 =C2=A0 # dummy python version<br>
+=C2=A0 =C2=A0 return<br>
+<br>
+init_ccache() {<br>
+=C2=A0 =C2=A0 if [ -n &quot;${CCACHE}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CCACHE} -M ${CCACHE_MAX_SIZE}<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+do_compile_prepend() {<br>
+=C2=A0 =C2=A0 init_ccache<br>
+}</div></blockquote></div><br>That is horrible. :)</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Is it not possible to just pa=
ss -M[size] to ccache every time it&#39;s invoked?=C2=A0 If it needs to be =
invoked on its own, then a do_compile[postfunc] or something to trim the si=
ze after a build would be neater.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1139cdf0fcd8ab0545fada37--
