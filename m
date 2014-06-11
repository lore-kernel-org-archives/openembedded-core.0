Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id CF7C465D34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 20:54:58 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so178208lab.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=35lMfzhbKpGfV5ddWhhyAVYN3JTsZlBQV6kUCeKkZT0=;
	b=WPZj2W8naUgkaZFBtmNgkT9qVuzITH5BtouR6npLShdVYaPzyIR13ei2GxlKmGSKx5
	ljqPireil2GDoi5eQONULqJYgsx17GKdaGUffUzPJpWSggVDCdJSPCHUfZOOW5McEJ5k
	4NkoIZyAi8iG27DAiGSIrChoe1FcuGAkqnF6gT/niBx7JyV/6QxqTI7eqTH7Q16WEseb
	qlgMkPajuTxk0Huxad6pCD6kEvunTjv0GYLICNLO4ROlbWUY5MIJji6A3qn70k+eG1R9
	0w/lr69J2Hc4O5rIG7CVHUx0iKnJycMEOOl6yJ0tThzPDZ1AaR7kicyWHHPpn9CxKe89
	XEpw==
X-Received: by 10.152.4.137 with SMTP id k9mr8907036lak.46.1402520098530; Wed,
	11 Jun 2014 13:54:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Wed, 11 Jun 2014 13:54:38 -0700 (PDT)
In-Reply-To: <1402082874-12187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1402082874-12187-1-git-send-email-Martin.Jansa@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 11 Jun 2014 13:54:38 -0700
X-Google-Sender-Auth: RCZXzLmNCo7aBfThhlvNYr5fSTo
Message-ID: <CABcZANnJG8eMJu__kPstQXajFzHDVkBrRSVLfCqPfOEj5omeKw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildstats-summary.bbclass: Import useful bbclass from meta-mentor
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
X-List-Received-Date: Wed, 11 Jun 2014 20:55:06 -0000
Content-Type: multipart/alternative; boundary=089e013d1cf8436b2f04fb95a8e4

--089e013d1cf8436b2f04fb95a8e4
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 6, 2014 at 12:27 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/buildstats-summary.bbclass | 43
> +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta/classes/buildstats-summary.bbclass
>
> diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/
> buildstats-summary.bbclass
> new file mode 100644
> index 0000000..3c02724
> --- /dev/null
> +++ b/meta/classes/buildstats-summary.bbclass
> @@ -0,0 +1,43 @@
> +# Imported from meta-mentor
> +# http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/log/classes/
> buildstats-summary.bbclass
> +# with following modifications
> +# 1) when both setscene and normal tasks were executed, count it as
> no_sstate
> +# 2) count do_populate_sysroot and do_packagedata tasks, because often we
> invalidate only runtime deps
>

Looks like useful improvements, nicely done. Have you thought about not
hardcoding the task list, if we're going to display it this way? See
https://gist.github.com/kergoth/2519927f59712282e9e8 for a version which
obeys SSTATETASKS.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d1cf8436b2f04fb95a8e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jun 6, 2014 at 12:27 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D":se" class=3D"=
" style=3D"overflow:hidden">Signed-off-by: Martin Jansa &lt;<a href=3D"mail=
to:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>


---<br>
=C2=A0meta/classes/<span class=3D"">buildstats</span>-summary.bbclass | 43 =
+++++++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/<span class=3D"">buildstats</span>-su=
mmary.bbclass<br>
<br>
diff --git a/meta/classes/<span class=3D"">buildstats</span>-summary.bbclas=
s b/meta/classes/<span class=3D"">buildstats</span>-summary.bbclass<br>
new file mode 100644<br>
index 0000000..3c02724<br>
--- /dev/null<br>
+++ b/meta/classes/<span class=3D"">buildstats</span>-summary.bbclass<br>
@@ -0,0 +1,43 @@<br>
+# Imported from meta-mentor<br>
+# <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/log/cla=
sses/buildstats-summary.bbclass" target=3D"_blank">http://git.yoctoproject.=
org/cgit/cgit.cgi/meta-mentor/log/classes/<span class=3D"">buildstats</span=
>-summary.bbclass</a><br>


+# with following modifications<br>
+# 1) when both setscene and normal tasks were executed, count it as no_sst=
ate<br>
+# 2) count do_populate_sysroot and do_packagedata tasks, because often we =
invalidate only runtime deps</div></blockquote></div><br></div><div class=
=3D"gmail_extra">Looks like useful improvements, nicely done. Have you thou=
ght about not hardcoding the task list, if we&#39;re going to display it th=
is way? See <a href=3D"https://gist.github.com/kergoth/2519927f59712282e9e8=
">https://gist.github.com/kergoth/2519927f59712282e9e8</a> for a version wh=
ich obeys SSTATETASKS.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e013d1cf8436b2f04fb95a8e4--
