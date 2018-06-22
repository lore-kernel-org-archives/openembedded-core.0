Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC379752C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 09:23:58 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id l14-v6so911953wrq.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+tCLTjUIrm/QW4WoEXXATX+Z0WJcnF6Mry/XCAk7FFo=;
	b=oryYSoxPjbnvjzQvwMkwBGGffbe8+Rsp3Cr06cVTqOKSRKuk5dbM1ynArEI2Ju7Uwq
	EXZBHf7xsWbdEly+sJRPMYxfQ/AlCfuehwjwGVsxjwdofbGIcE0LcfTmqrzY57wiEiCf
	U3Ou6o8gyHGRPexEagk7q+hGN0Tj4oqThafp4GhYNMe7m7M9O0peAqmgBEG5m5EF0fK7
	m/XdBPE9SpFDWBtU4Mq3GllES5Aoix1e6Tr0ApDJO/L+FcXrXF3MBpGHiNOD+FUL6Uk/
	beT581UZceuaZH/eHnt+119o1Z/NyLMzAwo6fqqI2fKHE/ACRWq1xjpg38qti7yyo4LM
	7GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+tCLTjUIrm/QW4WoEXXATX+Z0WJcnF6Mry/XCAk7FFo=;
	b=hBjDSz1kKKJyE2NjfURWUTtRjvQo/Rp+BCDgLZY8vQvJqbZpU6OEho9addFmXxWKfK
	8rl6S0LTetrA9pLqpKAyNr1P1cN2oS+YjfoK7hopYCeJ/osb3TbZRHjGbeHygn7XWXlb
	ioDfkvYGPF85VOL9G6RXaQN5YUa1nq9IPEnOJKPRP2XmfHRU9y70adZLHLr+2qlMr8Y2
	KT2AzndW2f75sjHTwmOzEM2s/onZCIfGeT7dnMYEeiOlPYyJ+njxIPp4v01YRHfAcnW2
	9E+NififAeHzFp/4LBoV5/UKoEAUzeeyFRr/YiuOSPD/FBPhTltc5UBhWeNqa/5Resr5
	c9hA==
X-Gm-Message-State: APt69E2PrnLfjbwhZr9TEjnqcCv+ABIWG2jvnAz2Nil+ooJ5kQZGmxob
	xXGaL9yvIj9Yla5Cq+LfnhbBA60P2XyIGyO9CZQ=
X-Google-Smtp-Source: ADUXVKJb0yL90/LPD0Peq7fg6odkdksAMB3RIADAnXK2EzNyBhZrEFkOCpQxHzEGLO6gT1lU6G/pYobv5f11UVQmy3w=
X-Received: by 2002:a5d:408f:: with SMTP id
	o15-v6mr808014wrp.133.1529659439128; 
	Fri, 22 Jun 2018 02:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180619102418.116397-1-zhixiong.chi@windriver.com>
In-Reply-To: <20180619102418.116397-1-zhixiong.chi@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jun 2018 11:23:50 +0200
Message-ID: <CA+chaQfC+a1md3jn3CMe192Rt1Yfj2kgh+rwcPgmVnbtaBDLJA@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] findutils: make -delete honour the -ignore_readdir_race option
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
X-List-Received-Date: Fri, 22 Jun 2018 09:23:59 -0000
Content-Type: multipart/alternative; boundary="0000000000007f2519056f379735"

--0000000000007f2519056f379735
Content-Type: text/plain; charset="UTF-8"

Does it apply cleanly for you? I'm seeing:

WARNING: findutils-4.6.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch
0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
patching file NEWS
Hunk #1 succeeded at 42 with fuzz 2.
patching file doc/find.texi
patching file find/find.1
Hunk #1 succeeded at 479 with fuzz 1.
patching file find/pred.c

Now at patch 0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch

On Tue, Jun 19, 2018 at 12:25 PM Zhixiong Chi <zhixiong.chi@windriver.com>
wrote:

> the '-delete' action no longer complains about disappeared files
> when the '-ignore_readdir_race' option is given, too. That action
> will also returns true in such a case now.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...-honour-the-ignore_readdir_race-opti.patch | 145 ++++++++++++++++++
>  .../findutils/findutils_4.6.0.bb              |   4 +-
>  2 files changed, 148 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>
> diff --git
> a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> new file mode 100644
> index 0000000000..45e499a184
> --- /dev/null
> +++
> b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> @@ -0,0 +1,145 @@
> +From 0afb2efada7e435ae18ef7d3db0758464189f44f Mon Sep 17 00:00:00 2001
> +From: Bernhard Voelker <mail@bernhard-voelker.de>
> +Date: Tue, 30 Jan 2018 23:30:09 +0100
> +Subject: find: make -delete honour the -ignore_readdir_race option
> +
> +* find/pred.c (pred_delete): Return true when the -ignore_readdir_race
> +option is active and unlinkat() came back with ENOENT.
> +* doc/find.texi (Option -ignore_readdir_race): Document the change.
> +(Action -delete): Likewise.
> +* find/find.1: Likewise.
> +* NEWS (Bug Fixes): Mention the fix.
> +
> +For now, it seems a bit hard to add a proper test for this,
> +so the following shell snippet demonstrates the race:
> +
> +  $ seq 10 | xargs touch
> +  $ env time -f 'find exit status: %x\nfind time: %e' \
> +      find -ignore_readdir_race -type f \
> +        -delete \
> +        -exec sh -c 'sleep $(basename {})' \; \
> +        -printf 'find deleted: %p\n' \
> +        & \
> +    sleep 20; \
> +    seq 10 | xargs rm -fv; \
> +    wait $!
> +
> +Reported by Alexander Golubev in
> +https://savannah.gnu.org/bugs/?52981
> +
> +Upstream-Status: Backport
> +Signed-off-by : Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + NEWS          |  4 ++++
> + doc/find.texi | 15 ++++++++++++++-
> + find/find.1   | 22 ++++++++++++++++++++++
> + find/pred.c   |  6 ++++++
> + 4 files changed, 46 insertions(+), 1 deletion(-)
> +
> +diff --git a/NEWS b/NEWS
> +index 88cf17d..9809bf4 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -42,6 +42,10 @@
> +
> + ** Bug Fixes
> +
> ++#52981: find: the '-delete' action no longer complains about disappeared
> files
> ++        when the '-ignore_readdir_race' option is given, too.  That
> action will
> ++        also returns true in such a case now.
> ++
> + Applied patch #8688: Spelling fixes.
> +
> + * Major changes in release 4.5.18, 2015-12-27
> +diff --git a/doc/find.texi b/doc/find.texi
> +index 3580be7..0089193 100644
> +--- a/doc/find.texi
> ++++ b/doc/find.texi
> +@@ -1418,7 +1418,15 @@ gives a significant increase in search speed.
> + If a file disappears after its name has been read from a directory but
> + before @code{find} gets around to examining the file with @code{stat},
> + don't issue an error message.  If you don't specify this option, an
> +-error message will be issued.  This option can be useful in system
> ++error message will be issued.
> ++
> ++Furthermore, @code{find} with the @samp{-ignore_readdir_race} option
> ++will ignore errors of the @samp{-delete} action in the case the file
> ++has disappeared since the parent directory was read: it will not output
> ++an error diagnostic, and the return code of the @samp{-delete} action
> ++will be true.
> ++
> ++This option can be useful in system
> + scripts (cron scripts, for example) that examine areas of the
> + filesystem that change frequently (mail queues, temporary directories,
> + and so forth), because this scenario is common for those sorts of
> +@@ -2779,6 +2787,11 @@ explicitly.
> +
> + If @samp{-delete} fails, @code{find}'s exit status will be nonzero
> + (when it eventually exits).
> ++
> ++Together with the @samp{-ignore_readdir_race} option, @code{find} will
> ++ignore errors of the @samp{-delete} action in the case the file has
> disappeared
> ++since the parent directory was read: it will not output an error
> diagnostic, and
> ++the return code of the @samp{-delete} action will be true.
> + @end deffn
> +
> + @node Adding Tests
> +diff --git a/find/find.1 b/find/find.1
> +index 0437cd8..0d44c37 100644
> +--- a/find/find.1
> ++++ b/find/find.1
> +@@ -479,6 +479,17 @@ this option on and part of it with this option off
> + (if you need to do that, you will need to issue two \fBfind\fR commands
> + instead, one with the option and one without it).
> +
> ++Furthermore,
> ++.B find
> ++with the
> ++.B \-ignore_readdir_race
> ++option will ignore errors of the
> ++.B \-delete
> ++action in the case the file has disappeared since the parent directory
> was read:
> ++it will not output an error diagnostic, and the return code of the
> ++.B \-delete
> ++action will be true.
> ++
> + .IP "\-maxdepth \fIlevels\fR"
> + Descend at most \fIlevels\fR (a non-negative integer) levels of
> + directories below the starting-points.
> +@@ -1030,6 +1041,17 @@ and
> + .B \-delete
> + together.
> +
> ++Together with the
> ++.B \-ignore_readdir_race
> ++option,
> ++.B find
> ++will ignore errors of the
> ++.B \-delete
> ++action in the case the file has disappeared since the parent directory
> was
> ++read: it will not output an error diagnostic, and the return code of the
> ++.B \-delete
> ++action will be true.
> ++
> + .IP "\-exec \fIcommand\fR ;"
> + Execute \fIcommand\fR; true if 0 status is returned.  All following
> + arguments to
> +diff --git a/find/pred.c b/find/pred.c
> +index 7e2a7bd..af3bacb 100644
> +--- a/find/pred.c
> ++++ b/find/pred.c
> +@@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat
> *stat_buf, struct predicate *pred
> +       }
> +       else
> +       {
> ++        if (ENOENT == errno && options.ignore_readdir_race)
> ++          {
> ++            /* Ignore unlink() error for vanished files.  */
> ++            errno = 0;
> ++            return true;
> ++          }
> +         if (EISDIR == errno)
> +           {
> +             if ((flags & AT_REMOVEDIR) == 0)
> +--
> +cgit v1.0-41-gc330
> diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb
> b/meta/recipes-extended/findutils/findutils_4.6.0.bb
> index 072d3b3c05..db03252f54 100644
> --- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
>
>  DEPENDS = "bison-native"
>
> -SRC_URI +=
> "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
> +SRC_URI +=
> "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> +
> file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch \
> +"
>
>  SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
>  SRC_URI[sha256sum] =
> "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007f2519056f379735
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does it apply cleanly for you? I&#39;m seeing:<div><br></d=
iv><div><div>WARNING: findutils-4.6.0-r0 do_patch:=C2=A0</div><div>Some of =
the context lines in patches were ignored. This can lead to incorrectly app=
lied patches.</div><div>The context lines in the patches can be updated wit=
h devtool:</div><div><br></div><div>=C2=A0 =C2=A0 devtool modify &lt;recipe=
&gt;</div><div>=C2=A0 =C2=A0 devtool finish --force-patch-refresh &lt;recip=
e&gt; &lt;layer_path&gt;</div><div><br></div><div>Then the updated patches =
and the source tree (in devtool&#39;s workspace)</div><div>should be review=
ed to make sure the patches apply in the correct place</div><div>and don&#3=
9;t introduce duplicate lines (which can, and does happen</div><div>when so=
me of the context is ignored). Further information:</div><div><a href=3D"ht=
tp://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.h=
tml">http://lists.openembedded.org/pipermail/openembedded-core/2018-March/1=
48675.html</a></div><div><a href=3D"https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D10450">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D104=
50</a></div><div>Details:</div><div>Applying patch 0001-find-make-delete-ho=
nour-the-ignore_readdir_race-opti.patch</div><div>patching file NEWS</div><=
div>Hunk #1 succeeded at 42 with fuzz 2.</div><div>patching file doc/find.t=
exi</div><div>patching file find/find.1</div><div>Hunk #1 succeeded at 479 =
with fuzz 1.</div><div>patching file find/pred.c</div><div><br></div><div>N=
ow at patch 0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch=
</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, J=
un 19, 2018 at 12:25 PM Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@win=
driver.com">zhixiong.chi@windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">the &#39;-delete&#39; action no longer complains about d=
isappeared files<br>
when the &#39;-ignore_readdir_race&#39; option is given, too. That action<b=
r>
will also returns true in such a case now.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-honour-the-ignore_readdir_race-opti.patch | 145 +++++++++++++++++=
+<br>
=C2=A0.../findutils/<a href=3D"http://findutils_4.6.0.bb" rel=3D"noreferrer=
" target=3D"_blank">findutils_4.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A02 files changed, 148 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/findutils/findutils/0001-fin=
d-make-delete-honour-the-ignore_readdir_race-opti.patch<br>
<br>
diff --git a/meta/recipes-extended/findutils/findutils/0001-find-make-delet=
e-honour-the-ignore_readdir_race-opti.patch b/meta/recipes-extended/finduti=
ls/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patc=
h<br>
new file mode 100644<br>
index 0000000000..45e499a184<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honou=
r-the-ignore_readdir_race-opti.patch<br>
@@ -0,0 +1,145 @@<br>
+From 0afb2efada7e435ae18ef7d3db0758464189f44f Mon Sep 17 00:00:00 2001<br>
+From: Bernhard Voelker &lt;<a href=3D"mailto:mail@bernhard-voelker.de" tar=
get=3D"_blank">mail@bernhard-voelker.de</a>&gt;<br>
+Date: Tue, 30 Jan 2018 23:30:09 +0100<br>
+Subject: find: make -delete honour the -ignore_readdir_race option<br>
+<br>
+* find/pred.c (pred_delete): Return true when the -ignore_readdir_race<br>
+option is active and unlinkat() came back with ENOENT.<br>
+* doc/find.texi (Option -ignore_readdir_race): Document the change.<br>
+(Action -delete): Likewise.<br>
+* find/find.1: Likewise.<br>
+* NEWS (Bug Fixes): Mention the fix.<br>
+<br>
+For now, it seems a bit hard to add a proper test for this,<br>
+so the following shell snippet demonstrates the race:<br>
+<br>
+=C2=A0 $ seq 10 | xargs touch<br>
+=C2=A0 $ env time -f &#39;find exit status: %x\nfind time: %e&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 find -ignore_readdir_race -type f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -delete \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec sh -c &#39;sleep $(basename {})&#39; \; =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -printf &#39;find deleted: %p\n&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp; \<br>
+=C2=A0 =C2=A0 sleep 20; \<br>
+=C2=A0 =C2=A0 seq 10 | xargs rm -fv; \<br>
+=C2=A0 =C2=A0 wait $!<br>
+<br>
+Reported by Alexander Golubev in<br>
+<a href=3D"https://savannah.gnu.org/bugs/?52981" rel=3D"noreferrer" target=
=3D"_blank">https://savannah.gnu.org/bugs/?52981</a><br>
+<br>
+Upstream-Status: Backport<br>
+Signed-off-by : Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.=
com" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
+---<br>
+ NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
+ doc/find.texi | 15 ++++++++++++++-<br>
+ find/find.1=C2=A0 =C2=A0| 22 ++++++++++++++++++++++<br>
+ find/pred.c=C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
+ 4 files changed, 46 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/NEWS b/NEWS<br>
+index 88cf17d..9809bf4 100644<br>
+--- a/NEWS<br>
++++ b/NEWS<br>
+@@ -42,6 +42,10 @@<br>
+<br>
+ ** Bug Fixes<br>
+<br>
++#52981: find: the &#39;-delete&#39; action no longer complains about disa=
ppeared files<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 when the &#39;-ignore_readdir_race&#39; optio=
n is given, too.=C2=A0 That action will<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 also returns true in such a case now.<br>
++<br>
+ Applied patch #8688: Spelling fixes.<br>
+<br>
+ * Major changes in release 4.5.18, 2015-12-27<br>
+diff --git a/doc/find.texi b/doc/find.texi<br>
+index 3580be7..0089193 100644<br>
+--- a/doc/find.texi<br>
++++ b/doc/find.texi<br>
+@@ -1418,7 +1418,15 @@ gives a significant increase in search speed.<br>
+ If a file disappears after its name has been read from a directory but<br=
>
+ before @code{find} gets around to examining the file with @code{stat},<br=
>
+ don&#39;t issue an error message.=C2=A0 If you don&#39;t specify this opt=
ion, an<br>
+-error message will be issued.=C2=A0 This option can be useful in system<b=
r>
++error message will be issued.<br>
++<br>
++Furthermore, @code{find} with the @samp{-ignore_readdir_race} option<br>
++will ignore errors of the @samp{-delete} action in the case the file<br>
++has disappeared since the parent directory was read: it will not output<b=
r>
++an error diagnostic, and the return code of the @samp{-delete} action<br>
++will be true.<br>
++<br>
++This option can be useful in system<br>
+ scripts (cron scripts, for example) that examine areas of the<br>
+ filesystem that change frequently (mail queues, temporary directories,<br=
>
+ and so forth), because this scenario is common for those sorts of<br>
+@@ -2779,6 +2787,11 @@ explicitly.<br>
+ <br>
+ If @samp{-delete} fails, @code{find}&#39;s exit status will be nonzero<br=
>
+ (when it eventually exits).<br>
++<br>
++Together with the @samp{-ignore_readdir_race} option, @code{find} will<br=
>
++ignore errors of the @samp{-delete} action in the case the file has disap=
peared<br>
++since the parent directory was read: it will not output an error diagnost=
ic, and<br>
++the return code of the @samp{-delete} action will be true.<br>
+ @end deffn<br>
+ <br>
+ @node Adding Tests<br>
+diff --git a/find/find.1 b/find/find.1<br>
+index 0437cd8..0d44c37 100644<br>
+--- a/find/find.1<br>
++++ b/find/find.1<br>
+@@ -479,6 +479,17 @@ this option on and part of it with this option off<br=
>
+ (if you need to do that, you will need to issue two \fBfind\fR commands<b=
r>
+ instead, one with the option and one without it).<br>
+ <br>
++Furthermore,<br>
++.B find<br>
++with the<br>
++.B \-ignore_readdir_race<br>
++option will ignore errors of the<br>
++.B \-delete<br>
++action in the case the file has disappeared since the parent directory wa=
s read:<br>
++it will not output an error diagnostic, and the return code of the<br>
++.B \-delete<br>
++action will be true.<br>
++<br>
+ .IP &quot;\-maxdepth \fIlevels\fR&quot;<br>
+ Descend at most \fIlevels\fR (a non-negative integer) levels of<br>
+ directories below the starting-points.<br>
+@@ -1030,6 +1041,17 @@ and<br>
+ .B \-delete<br>
+ together.<br>
+ <br>
++Together with the<br>
++.B \-ignore_readdir_race<br>
++option,<br>
++.B find<br>
++will ignore errors of the<br>
++.B \-delete<br>
++action in the case the file has disappeared since the parent directory wa=
s<br>
++read: it will not output an error diagnostic, and the return code of the<=
br>
++.B \-delete<br>
++action will be true.<br>
++<br>
+ .IP &quot;\-exec \fIcommand\fR ;&quot;<br>
+ Execute \fIcommand\fR; true if 0 status is returned.=C2=A0 All following<=
br>
+ arguments to<br>
+diff --git a/find/pred.c b/find/pred.c<br>
+index 7e2a7bd..af3bacb 100644<br>
+--- a/find/pred.c<br>
++++ b/find/pred.c<br>
+@@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat *stat_=
buf, struct predicate *pred<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ENOENT =3D=3D errno &amp;&amp; options.ig=
nore_readdir_race)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignore unlink() error for va=
nished files.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (EISDIR =3D=3D errno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((flags &amp; AT_REMOVE=
DIR) =3D=3D 0)<br>
+--<br>
+cgit v1.0-41-gc330<br>
diff --git a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.6.0.bb</a> b/meta/=
recipes-extended/findutils/<a href=3D"http://findutils_4.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">findutils_4.6.0.bb</a><br>
index 072d3b3c05..db03252f54 100644<br>
--- a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">findutils_4.6.0.bb</a><br>
+++ b/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">findutils_4.6.0.bb</a><br>
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df27defe1e96=
c2e1ecd4e0c9be8967949&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;bison-native&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-Unset-need_charset_alias-when-building-for-=
musl.patch&quot;<br>
+SRC_URI +=3D &quot;file://0001-Unset-need_charset_alias-when-building-for-=
musl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-find-make-delete-hon=
our-the-ignore_readdir_race-opti.patch \<br>
+&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;9936aa8009438ce185bea2694a997fc1&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ded4c9f73731cd48fec3b6bdaccce896473b6d8e=
337e9612e16cf1431bb1169d&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007f2519056f379735--
