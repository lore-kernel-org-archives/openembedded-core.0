Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 90C00782F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:01:15 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id l132so1314922vke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V3d0JwJ0cfLUIIRTmw9pW0y9diaxWvbUNQheRfpJRws=;
	b=jUdMXoW/LDp9wfqxVKyXYjy6v4j8cuHFNCuyi73DSUxgZMMhAMDeSd/F8IfxHF7aiy
	/Y99z66VjzRFqzJvJK/Dd/z2rgDkGJ8+O6bqeHDEcnvqxKuiNypycDRLV6ObCAYxVAqm
	L64riExN93J5QSpDmW3Y43YKxHqcb+K/h2YkzRUssYADw2lxcrxpM5Yt8F+mUAVRcfNX
	ncVWtklswuWacwaZfdUMZfm9RcT+AJlEVq5loIZt/Mv67dLjeXco1oRIxa8Zb/TtATzl
	3HQ4JaDc5cfHTk6swQtWsZjWMod2b5938g5Tinduto7cNczEctuVuwt2keMpoB4oaNyU
	ymOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V3d0JwJ0cfLUIIRTmw9pW0y9diaxWvbUNQheRfpJRws=;
	b=Yd1WtH8SDHs+qkkcDLEd7cerSrTk/P2xC/ZZKEgXzJFzvhkyb5YjAm0Wc+mI8JM0fH
	Sb6uNJf81zEdAdtyqBg6G1sTCLVEgwvDcU0v4JlJLZgqDeZGnIR1mKFsOCdUjK27zw88
	pJvFehZMFgE4CAAXVptQoV22d5IJpvcIUCM2tCeTKNVsUXpZNbuFF2iRrMVMlqeDfN3u
	GTIYKluR8Wi1AXN//aHCuKePcEH+hXoqD6/J/GQrH8EWgBXOt4cyQ4OaE3iKrEfyXOBn
	X73LPWiU0/+T2Cj82yIql8F2rXNSAwyR6CDcNt2sYWG4MTImYGZ8YAc3FB2GeUS/UYO9
	bOsg==
X-Gm-Message-State: AHYfb5joJ6av+2DL/Qja4DVTf9qYFgfEaxBoPd0gLZNtRy79ENd7worK
	NcrEls5PQncpwDIqyiXmooLCpHmXxFcp
X-Received: by 10.31.160.18 with SMTP id j18mr10831485vke.130.1503298876385;
	Mon, 21 Aug 2017 00:01:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 00:01:15 -0700 (PDT)
In-Reply-To: <20170821065633.27570-1-Martin.Jansa@gmail.com>
References: <20170821065633.27570-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 09:01:15 +0200
Message-ID: <CA+chaQd7RdQuwFuEwRPK6qGPW0vwsSTjXBt_JKHoA_aTJv7Fdw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: write QA issues to log file only when thei are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 07:01:15 -0000
Content-Type: multipart/alternative; boundary="001a1143195284b25905573e0b89"

--001a1143195284b25905573e0b89
Content-Type: text/plain; charset="UTF-8"

Just notice typo in subject s/thei/they/g, will resend soon, in the
meantime is there some feedback on this?

Alternatively we can write them with NOTE: WARN: ERROR: prefix like with
the logger, so that the qa.log can be filtered by severity of the issue.

TL;DR; version:
In my jenkins builds I'm printing content of qa.log at the end of usually
very long build log, so that they are easier to spot in one place and
because I get a lot of "version-going-backwards" warnings which I'm not
interested in anymore at all, I've removed them from ERROR_QA - but then I
was wondering why I still see very long list of "version-going-backwards"
warnings, but those were from qa.log. It would work for me fine to just
"grep -v ^NOTE: qa.log" at the end of jenkins build if the alternative
solution is more acceptable.

On Mon, Aug 21, 2017 at 8:56 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * QA check which aren't included in WARN_QA and ERROR_QA are shown
>   during the build only as NOTE message (not shown at all with default
>   knotty setting), so it might be surprising to see them later in qa.log
>   file
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/insane.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b7177c9b32..44e4a01c92 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -184,12 +184,13 @@ def package_qa_write_error(type, error, d):
>              f.write("%s: %s [%s]\n" % (p, error, type))
>
>  def package_qa_handle_error(error_class, error_msg, d):
> -    package_qa_write_error(error_class, error_msg, d)
>      if error_class in (d.getVar("ERROR_QA") or "").split():
> +        package_qa_write_error(error_class, error_msg, d)
>          bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
>          d.setVar("QA_SANE", False)
>          return False
>      elif error_class in (d.getVar("WARN_QA") or "").split():
> +        package_qa_write_error(error_class, error_msg, d)
>          bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
>      else:
>          bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
> --
> 2.14.0
>
>

--001a1143195284b25905573e0b89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just notice typo in subject s/thei/they/g, will resend soo=
n, in the meantime is there some feedback on this?<div><br></div><div>Alter=
natively we can write them with NOTE: WARN: ERROR: prefix like with the log=
ger, so that the qa.log can be filtered by severity of the issue.</div><div=
><br></div><div>TL;DR; version:</div><div>In my jenkins builds I&#39;m prin=
ting content of qa.log at the end of usually very long build log, so that t=
hey are easier to spot in one place and because I get a lot of &quot;versio=
n-going-backwards&quot; warnings which I&#39;m not interested in anymore at=
 all, I&#39;ve removed them from ERROR_QA - but then I was wondering why I =
still see very long list of &quot;version-going-backwards&quot; warnings, b=
ut those were from qa.log. It would work for me fine to just &quot;grep -v =
^NOTE: qa.log&quot; at the end of jenkins build if the alternative solution=
 is more acceptable.</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Aug 21, 2017 at 8:56 AM, Martin Jansa <span dir=3D=
"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">marti=
n.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">*=
 QA check which aren&#39;t included in WARN_QA and ERROR_QA are shown<br>
=C2=A0 during the build only as NOTE message (not shown at all with default=
<br>
=C2=A0 knotty setting), so it might be surprising to see them later in qa.l=
og<br>
=C2=A0 file<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index b7177c9b32..44e4a01c92 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -184,12 +184,13 @@ def package_qa_write_error(type, error, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;%s: %s [%s]\n=
&quot; % (p, error, type))<br>
<br>
=C2=A0def package_qa_handle_error(error_<wbr>class, error_msg, d):<br>
-=C2=A0 =C2=A0 package_qa_write_error(error_<wbr>class, error_msg, d)<br>
=C2=A0 =C2=A0 =C2=A0if error_class in (d.getVar(&quot;ERROR_QA&quot;) or &q=
uot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_write_error(error_<wbr>class, error=
_msg, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;QA Issue: %s [%s]&quot; % =
(error_msg, error_class))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;QA_SANE&quot;, False)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
=C2=A0 =C2=A0 =C2=A0elif error_class in (d.getVar(&quot;WARN_QA&quot;) or &=
quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_write_error(error_<wbr>class, error=
_msg, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;QA Issue: %s [%s]&quot; % (=
error_msg, error_class))<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;QA Issue: %s [%s]&quot; % (=
error_msg, error_class))<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.0<br>
<br>
</font></span></blockquote></div><br></div>

--001a1143195284b25905573e0b89--
