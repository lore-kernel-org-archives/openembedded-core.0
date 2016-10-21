Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 939AE719BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 16:13:02 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 66so11741516itl.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=bUtxfFf/zIWup1ZB5z+zs6jXwqYG0v2oXqlYaCg8tSI=;
	b=w6pm8obJrOioavvcYZo/DUut6KY8r5zov4ZtdYOfRTiHnmW0q1Lwujt68fFgMdZJfI
	tX0RQNvKO723NnT8U4uErOt3y8Oietr0tvdOYOi1Jhef4lVDj92G8Gcbm+XV9FD5ztCe
	J+XC83sVp0/gI3idHmmrXZaDbmw5hYuDhl2w8caUpzAecyKE7g2G+XMGr4Cs16ntn6kF
	7iGfdt9O5sS0wR+px3qnOtN65VRzj+kvnZqRZ/SYaZZJz2taso2mDT0hE74VS6H7Y1th
	Jv8QSNDrAAsS6NwO8zsisHRhKxXzrABZvRofS7Ch745q0C/3TmkN/e4FSAPcx9iDJp7Z
	4X6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=bUtxfFf/zIWup1ZB5z+zs6jXwqYG0v2oXqlYaCg8tSI=;
	b=iejQPJKGoZT5OLoD58S0tOOJyHcBtUfclxKvNzF9Kqfy0l41rDYe5BZnT1iTvzgQ9k
	L0U5VjG6sWrIJe2B5pUde5gkqMKhD2uHG/+CBDPA/uQ1VCSU46trnNjgbdHWDC41SCf3
	GWcJUuRl7H+EB4/+14ObXElmmaN58pngyjKg5rJ/9gd0hweIoXrBvkUGVvWItkAmyWnf
	aw/9WFjQ3SK1w23st3CC2WRtgZNsiP8Pqokfs2G2565E9h4DC02obmRJ/hyrZTFQOI6x
	4QSeVrNmrpcU46ZVPUT/IyLjZLg31BseQ0iv+lka8WYdmNQyM3K0JUn/BjwoePr0fi3j
	d23w==
X-Gm-Message-State: AA6/9Rn4PoV8xUPjAr9EBYB0yIo/CsZ46xSJG4985tcInAAZ3jwm/BqO9t1n+/8qIWzSj0UmKMAX+aUUalKohg==
X-Received: by 10.202.222.133 with SMTP id v127mr11444625oig.22.1477066383770; 
	Fri, 21 Oct 2016 09:13:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Fri, 21 Oct 2016 09:12:43 -0700 (PDT)
In-Reply-To: <20161021070545.19812-1-mikko.ylinen@intel.com>
References: <20161021070545.19812-1-mikko.ylinen@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 21 Oct 2016 09:12:43 -0700
X-Google-Sender-Auth: 7g873sWjaNKA7qTQgjcUrr4ehh8
Message-ID: <CABcZANk+BkwmJDCGC_HRfHQyF6aks6raYhM8AY4ne_ZXm=fPrQ@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd-staticids.bbclass: catch missing uid/gid exceptions
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
X-List-Received-Date: Fri, 21 Oct 2016 16:13:02 -0000
Content-Type: multipart/alternative; boundary=001a11440d061d4b71053f62512a

--001a11440d061d4b71053f62512a
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2016 at 12:05 AM, Mikko Ylinen <mikko.ylinen@intel.com>
wrote:

> The change to get rid of FuncFailed exceptions changed the behavior
> of how missing uid/gid error are be handled. Instead of catching
> the exception and handling that via bb.parse.SkipPackage(), a fatal
> error was called.
>
> This won't work with recipes that are unused and therefore do not have
> UID/GIDs defined. The problem triggers when parsing all recipes (e.g.,
> oe-selftest runs bitbake -p).
>
> The right way to handle this is to raise bb.parse.SkipPackage(). This
> will error correctly once the recipe is needed.
>
> Signed-off-by: Mikko Ylinen <mikko.ylinen@intel.com>
> ---
>  meta/classes/useradd-staticids.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/useradd-staticids.bbclass
> b/meta/classes/useradd-staticids.bbclass
> index afb580a..4162774 100644
> --- a/meta/classes/useradd-staticids.bbclass
> +++ b/meta/classes/useradd-staticids.bbclass
> @@ -53,8 +53,7 @@ def update_useradd_static_config(d):
>      def handle_missing_id(id, type, pkg):
>          # For backwards compatibility we accept "1" in addition to "error"
>          if d.getVar('USERADD_ERROR_DYNAMIC', True) == 'error' or
> d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
> -            #bb.error("Skipping recipe %s, package %s which adds %sname
> %s does not have a static ID defined." % (d.getVar('PN', True),  pkg, type,
> id))
> -            bb.fatal("%s - %s: %sname %s does not have a static ID
> defined." % (d.getVar('PN', True), pkg, type, id))
> +            raise NotImplementedError("%s - %s: %sname %s does not have a
> static ID defined. Skipping it." % (d.getVar('PN', True), pkg, type, id))
>          elif d.getVar('USERADD_ERROR_DYNAMIC', True) == 'warn':
>              bb.warn("%s - %s: %sname %s does not have a static ID
> defined." % (d.getVar('PN', True), pkg, type, id))
>
> @@ -323,7 +322,7 @@ python __anonymous() {
>          and not bb.data.inherits_class('native', d):
>          try:
>              update_useradd_static_config(d)
> -        except bb.build.FuncFailed as f:
> +        except NotImplementedError as f:
>              bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN', True),
> f))
>              raise bb.parse.SkipPackage(f)
>

NotImplementedError is not the right exception for this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11440d061d4b71053f62512a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Oct 21, 2016 at 12:05 AM, Mikko Ylinen <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mikko.ylinen@intel.com" target=3D"_blank">mikko.ylinen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2sa" =
class=3D"a3s aXjCH m157e6228ee82d47a">The change to get rid of FuncFailed e=
xceptions changed the behavior<br>
of how missing uid/gid error are be handled. Instead of catching<br>
the exception and handling that via bb.parse.SkipPackage(), a fatal<br>
error was called.<br>
<br>
This won&#39;t work with recipes that are unused and therefore do not have<=
br>
UID/GIDs defined. The problem triggers when parsing all recipes (e.g.,<br>
oe-selftest runs bitbake -p).<br>
<br>
The right way to handle this is to raise bb.parse.SkipPackage(). This<br>
will error correctly once the recipe is needed.<br>
<br>
Signed-off-by: Mikko Ylinen &lt;<a href=3D"mailto:mikko.ylinen@intel.com">m=
ikko.ylinen@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/useradd-<wbr>staticids.bbclass | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/useradd-<wbr>staticids.bbclass b/meta/classes/use=
radd-<wbr>staticids.bbclass<br>
index afb580a..4162774 100644<br>
--- a/meta/classes/useradd-<wbr>staticids.bbclass<br>
+++ b/meta/classes/useradd-<wbr>staticids.bbclass<br>
@@ -53,8 +53,7 @@ def update_useradd_static_config(<wbr>d):<br>
=C2=A0 =C2=A0 =C2=A0def handle_missing_id(id, type, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# For backwards compatibility we accept &=
quot;1&quot; in addition to &quot;error&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;USERADD_ERROR_<wbr>DYNAM=
IC&#39;, True) =3D=3D &#39;error&#39; or d.getVar(&#39;USERADD_ERROR_<wbr>D=
YNAMIC&#39;, True) =3D=3D &#39;1&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #bb.error(&quot;Skipping recipe =
%s, package %s which adds %sname %s does not have a static ID defined.&quot=
; % (d.getVar(&#39;PN&#39;, True),=C2=A0 pkg, type, id))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;%s - %s: %sname %=
s does not have a static ID defined.&quot; % (d.getVar(&#39;PN&#39;, True),=
 pkg, type, id))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise NotImplementedError(&quot;=
%s - %s: %sname %s does not have a static ID defined. Skipping it.&quot; % =
(d.getVar(&#39;PN&#39;, True), pkg, type, id))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif d.getVar(&#39;USERADD_ERROR_<wbr>DYN=
AMIC&#39;, True) =3D=3D &#39;warn&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;%s - %s: %sna=
me %s does not have a static ID defined.&quot; % (d.getVar(&#39;PN&#39;, Tr=
ue), pkg, type, id))<br>
<br>
@@ -323,7 +322,7 @@ python __anonymous() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and not bb.data.inherits_class(&#39;<wbr>=
native&#39;, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_useradd_static_confi=
g(<wbr>d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.build.FuncFailed as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except NotImplementedError as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(1, &quot;Skipping =
recipe %s: %s&quot; % (d.getVar(&#39;PN&#39;, True), f))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage(=
f)</div></blockquote></div><br>NotImplementedError is not the right excepti=
on for this.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder -=
 BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software=
 Engineer, Mentor Graphics</div>
</div></div>

--001a11440d061d4b71053f62512a--
