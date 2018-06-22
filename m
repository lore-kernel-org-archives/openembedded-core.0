Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB5777DE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:46:09 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id d2-v6so6209908wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 03:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BHzN1tiQUHOlOsuVDWEJYk3tsi5PTrlBHhg3E6r0agQ=;
	b=r+mV/RUIN6NEgb+fTKjMbVNQAUbzjoVznJ+GttRw7kJIX/OFremnSwp+nipWytocvc
	yNqewNvCbrwU1IU1RAHR4ItCC7fdARVCLIsFBTxFj/j+0TWSxZPpoiOhjILkDLk+izcP
	55pefg4/SjzhaNgrwkso4kK0Z3LKHzr/dc6gYFKxS8KYlwH+zAq+y6Fx80eG3QVEVPxX
	341zjnxtcIy74ReM8PqNl4yw4W3/uyXDq6gsyvc6ViIPv+Gw3wIAGSTyEl8R9HtTsfHT
	AvnmhNi6NyHJc7c9Dc4sHOm8uhDzRLblDNVVcpVQ+a51VnGD+coyfs5OsvOQoOnDIPeI
	kyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BHzN1tiQUHOlOsuVDWEJYk3tsi5PTrlBHhg3E6r0agQ=;
	b=Pimk/z9KIKjIiIfhPfbkG9M3A5y+7W16g4h3OVKWmBv1S5p/KM0Fp1hJ0JlDRtZcrR
	CS+ILIkWRtct3e3NqtW9y68eD+4WNOg04qyLUwFiSth1bqMaV9t9NSwWMlEMRXkovx2Z
	R+73j8T24iJjNXIH+PilaodO4ke5NFuODRqqiY7oSgWM2Jt6cEbhvRJApYJVD2O6Nhqj
	vBBgak/mx1JvajuNo3BA1+OV2QLUtvuRBiuzXpc0m5RPwKnExf3LDZN5HQmQlijM3cbw
	KxVNZuC8ASM0PsqVvNas4nXzG5ZND4QRvaooUamkG0i4qUtjrICMlT2CP0LGWSg27fIy
	jeHg==
X-Gm-Message-State: APt69E00tW2H3d1G8PQMKfo7Uy8fKVcgTzGJYUuOIOeA6OxIs83FM0wN
	WKo4uxUXf9qI8xNcoy1eKDDL75GWZ+5wo3jbNwk=
X-Google-Smtp-Source: AAOMgpcjRsPfF4XjOIu/kITIQKvqy29KUtnT/bCCgziTppCtI/MUIjfylFmxQjrYS7/XHptdDlydplIcuS5W8/892hQ=
X-Received: by 2002:adf:8462:: with SMTP id
	89-v6mr1244171wrf.138.1529664369885; 
	Fri, 22 Jun 2018 03:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180622101217.63726-1-zhixiong.chi@windriver.com>
In-Reply-To: <20180622101217.63726-1-zhixiong.chi@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jun 2018 12:46:00 +0200
Message-ID: <CA+chaQcCq7TcE3-oOqgYuDEsDgd716u2tVH7FNV4Xe_HN6EpAw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] findutils: update the patch to avoid patch fuzz warning
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
X-List-Received-Date: Fri, 22 Jun 2018 10:46:09 -0000
Content-Type: multipart/alternative; boundary="0000000000006484fa056f38bdfe"

--0000000000006484fa056f38bdfe
Content-Type: text/plain; charset="UTF-8"

Thanks for quick update

For some reason this patch of .patch cannot be applied (at least when
applied from patchwork)
https://patchwork.openembedded.org/patch/151897/

openembedded-core $ pwam 151897
git diff con2018-06-22 10:43:15 URL:
https://patchwork.openembedded.org/patch/151897/mbox/ [3472] ->
"pw-am-151897.patch" [1]
Applying: findutils: update the patch to avoid patch fuzz warning
.git/rebase-apply/patch:31: trailing whitespace.

.git/rebase-apply/patch:33: trailing whitespace.

.git/rebase-apply/patch:40: trailing whitespace.

.git/rebase-apply/patch:78: trailing whitespace.
--
error: patch failed:
meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch:29
error:
meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch:
patch does not apply
Patch failed at 0001 findutils: update the patch to avoid patch fuzz warning
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Normal patch tool fails to apply it as well:

$ patch -p1 < pw-am-151897.patch
patching file
meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
Hunk #1 FAILED at 29.
1 out of 5 hunks FAILED -- saving rejects to file
meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch.rej



On Fri, Jun 22, 2018 at 12:12 PM Zhixiong Chi <zhixiong.chi@windriver.com>
wrote:

> Regenerate the patch to avoid patch fuzz warning.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...-honour-the-ignore_readdir_race-opti.patch | 29 ++++++++++---------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git
> a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> index 45e499a184..333b38e882 100644
> ---
> a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> +++
> b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> @@ -29,6 +29,8 @@ https://savannah.gnu.org/bugs/?52981
>
>  Upstream-Status: Backport
>  Signed-off-by : Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +%% original patch:
> 0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>  ---
>   NEWS          |  4 ++++
>   doc/find.texi | 15 ++++++++++++++-
> @@ -37,22 +39,22 @@ Signed-off-by : Zhixiong Chi <
> zhixiong.chi@windriver.com>
>   4 files changed, 46 insertions(+), 1 deletion(-)
>
>  diff --git a/NEWS b/NEWS
> -index 88cf17d..9809bf4 100644
> +index 660c241..b86ec1e 100644
>  --- a/NEWS
>  +++ b/NEWS
> -@@ -42,6 +42,10 @@
> -
> - ** Bug Fixes
> -
> +@@ -42,6 +42,10 @@ Updated the Danish translation.
> +
> + ** Bug Fixes:
> +
>  +#52981: find: the '-delete' action no longer complains about disappeared
> files
>  +        when the '-ignore_readdir_race' option is given, too.  That
> action will
>  +        also returns true in such a case now.
>  +
>   Applied patch #8688: Spelling fixes.
> -
> +
>   * Major changes in release 4.5.18, 2015-12-27
>  diff --git a/doc/find.texi b/doc/find.texi
> -index 3580be7..0089193 100644
> +index fdeb841..247c19a 100644
>  --- a/doc/find.texi
>  +++ b/doc/find.texi
>  @@ -1418,7 +1418,15 @@ gives a significant increase in search speed.
> @@ -85,11 +87,11 @@ index 3580be7..0089193 100644
>
>   @node Adding Tests
>  diff --git a/find/find.1 b/find/find.1
> -index 0437cd8..0d44c37 100644
> +index 7b141b8..0eec41c 100644
>  --- a/find/find.1
>  +++ b/find/find.1
> -@@ -479,6 +479,17 @@ this option on and part of it with this option off
> - (if you need to do that, you will need to issue two \fBfind\fR commands
> +@@ -479,6 +479,17 @@ one part of the filesystem with this option on and
> part of it with this option
> + off (if you need to do that, you will need to issue two \fBfind\fR
> commands
>   instead, one with the option and one without it).
>
>  +Furthermore,
> @@ -125,7 +127,7 @@ index 0437cd8..0d44c37 100644
>   Execute \fIcommand\fR; true if 0 status is returned.  All following
>   arguments to
>  diff --git a/find/pred.c b/find/pred.c
> -index 7e2a7bd..af3bacb 100644
> +index 32938fb..431f065 100644
>  --- a/find/pred.c
>  +++ b/find/pred.c
>  @@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat
> *stat_buf, struct predicate *pred
> @@ -141,5 +143,6 @@ index 7e2a7bd..af3bacb 100644
>           if (EISDIR == errno)
>             {
>               if ((flags & AT_REMOVEDIR) == 0)
> ---
> -cgit v1.0-41-gc330
> +--
> +2.17.1
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006484fa056f38bdfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for quick update<div><br></div><div>For some reason=
 this patch of .patch cannot be applied (at least when applied from patchwo=
rk)</div><div><a href=3D"https://patchwork.openembedded.org/patch/151897/">=
https://patchwork.openembedded.org/patch/151897/</a><br></div><div><br></di=
v><div><div>openembedded-core $ pwam 151897</div><div>git diff con2018-06-2=
2 10:43:15 URL:<a href=3D"https://patchwork.openembedded.org/patch/151897/m=
box/">https://patchwork.openembedded.org/patch/151897/mbox/</a> [3472] -&gt=
; &quot;pw-am-151897.patch&quot; [1]</div><div>Applying: findutils: update =
the patch to avoid patch fuzz warning</div><div>.git/rebase-apply/patch:31:=
 trailing whitespace.</div><div><br></div><div>.git/rebase-apply/patch:33: =
trailing whitespace.</div><div><br></div><div>.git/rebase-apply/patch:40: t=
railing whitespace.</div><div><br></div><div>.git/rebase-apply/patch:78: tr=
ailing whitespace.</div><div>--</div><div>error: patch failed: meta/recipes=
-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readd=
ir_race-opti.patch:29</div><div>error: meta/recipes-extended/findutils/find=
utils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch: patc=
h does not apply</div><div>Patch failed at 0001 findutils: update the patch=
 to avoid patch fuzz warning</div><div>Use &#39;git am --show-current-patch=
&#39; to see the failed patch</div><div>When you have resolved this problem=
, run &quot;git am --continue&quot;.</div><div>If you prefer to skip this p=
atch, run &quot;git am --skip&quot; instead.</div><div>To restore the origi=
nal branch and stop patching, run &quot;git am --abort&quot;.</div></div><d=
iv><br></div><div>Normal patch tool fails to apply it as well:</div><div><b=
r></div><div><div>$ patch -p1 &lt; pw-am-151897.patch</div><div>patching fi=
le meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-t=
he-ignore_readdir_race-opti.patch</div><div>Hunk #1 FAILED at 29.</div><div=
>1 out of 5 hunks FAILED -- saving rejects to file meta/recipes-extended/fi=
ndutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti=
.patch.rej</div></div><div><br></div><div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr">On Fri, Jun 22, 2018 at 12:12 PM Zhixiong Ch=
i &lt;<a href=3D"mailto:zhixiong.chi@windriver.com">zhixiong.chi@windriver.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Regenerate the p=
atch to avoid patch fuzz warning.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-honour-the-ignore_readdir_race-opti.patch | 29 ++++++++++--------=
-<br>
=C2=A01 file changed, 16 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/findutils/findutils/0001-find-make-delet=
e-honour-the-ignore_readdir_race-opti.patch b/meta/recipes-extended/finduti=
ls/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patc=
h<br>
index 45e499a184..333b38e882 100644<br>
--- a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honou=
r-the-ignore_readdir_race-opti.patch<br>
+++ b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honou=
r-the-ignore_readdir_race-opti.patch<br>
@@ -29,6 +29,8 @@ <a href=3D"https://savannah.gnu.org/bugs/?52981" rel=3D"n=
oreferrer" target=3D"_blank">https://savannah.gnu.org/bugs/?52981</a><br>
<br>
=C2=A0Upstream-Status: Backport<br>
=C2=A0Signed-off-by : Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windr=
iver.com" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
+<br>
+%% original patch: 0001-find-make-delete-honour-the-ignore_readdir_race-op=
ti.patch<br>
=C2=A0---<br>
=C2=A0 NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A0 doc/find.texi | 15 ++++++++++++++-<br>
@@ -37,22 +39,22 @@ Signed-off-by : Zhixiong Chi &lt;<a href=3D"mailto:zhix=
iong.chi@windriver.com" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt=
;<br>
=C2=A0 4 files changed, 46 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/NEWS b/NEWS<br>
-index 88cf17d..9809bf4 100644<br>
+index 660c241..b86ec1e 100644<br>
=C2=A0--- a/NEWS<br>
=C2=A0+++ b/NEWS<br>
-@@ -42,6 +42,10 @@<br>
-<br>
- ** Bug Fixes<br>
-<br>
+@@ -42,6 +42,10 @@ Updated the Danish translation.<br>
+ <br>
+ ** Bug Fixes:<br>
+ <br>
=C2=A0+#52981: find: the &#39;-delete&#39; action no longer complains about=
 disappeared files<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 when the &#39;-ignore_readdir_race&#39; =
option is given, too.=C2=A0 That action will<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 also returns true in such a case now.<br=
>
=C2=A0+<br>
=C2=A0 Applied patch #8688: Spelling fixes.<br>
-<br>
+ <br>
=C2=A0 * Major changes in release 4.5.18, 2015-12-27<br>
=C2=A0diff --git a/doc/find.texi b/doc/find.texi<br>
-index 3580be7..0089193 100644<br>
+index fdeb841..247c19a 100644<br>
=C2=A0--- a/doc/find.texi<br>
=C2=A0+++ b/doc/find.texi<br>
=C2=A0@@ -1418,7 +1418,15 @@ gives a significant increase in search speed.<=
br>
@@ -85,11 +87,11 @@ index 3580be7..0089193 100644<br>
<br>
=C2=A0 @node Adding Tests<br>
=C2=A0diff --git a/find/find.1 b/find/find.1<br>
-index 0437cd8..0d44c37 100644<br>
+index 7b141b8..0eec41c 100644<br>
=C2=A0--- a/find/find.1<br>
=C2=A0+++ b/find/find.1<br>
-@@ -479,6 +479,17 @@ this option on and part of it with this option off<br=
>
- (if you need to do that, you will need to issue two \fBfind\fR commands<b=
r>
+@@ -479,6 +479,17 @@ one part of the filesystem with this option on and pa=
rt of it with this option<br>
+ off (if you need to do that, you will need to issue two \fBfind\fR comman=
ds<br>
=C2=A0 instead, one with the option and one without it).<br>
<br>
=C2=A0+Furthermore,<br>
@@ -125,7 +127,7 @@ index 0437cd8..0d44c37 100644<br>
=C2=A0 Execute \fIcommand\fR; true if 0 status is returned.=C2=A0 All follo=
wing<br>
=C2=A0 arguments to<br>
=C2=A0diff --git a/find/pred.c b/find/pred.c<br>
-index 7e2a7bd..af3bacb 100644<br>
+index 32938fb..431f065 100644<br>
=C2=A0--- a/find/pred.c<br>
=C2=A0+++ b/find/pred.c<br>
=C2=A0@@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat *=
stat_buf, struct predicate *pred<br>
@@ -141,5 +143,6 @@ index 7e2a7bd..af3bacb 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (EISDIR =3D=3D errno)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((flags &amp; AT_REMOVE=
DIR) =3D=3D 0)<br>
---<br>
-cgit v1.0-41-gc330<br>
+-- <br>
+2.17.1<br>
+<br>
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

--0000000000006484fa056f38bdfe--
