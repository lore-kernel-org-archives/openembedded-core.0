Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D47571A9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 06:04:59 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id y198so179045735oia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 22:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Ovo4IvuW69++IQbmadgJ60dtpfDVRSaVZUtc1+1cYTk=;
	b=Z5oGZguL/yHt5tUvAHBvZVHkZp5GwY0EicsrFgmetFsbUJ1iiVNzQ7W1QtsSDCV1QA
	sjskIM3bNkxLo36nBflVsuKV8NWs+57Jo5yyNRjNu3TI0K6AzoBdYFx/BOTN79B80n7o
	tm+058J+arwcam7XzF6311/4DfXlEV/ASOQhiaQm+kRdRUQOSym7iH5nVLEa2Mvy5SUs
	0zXA/2q8iJ84BPeLbgCTTWgwF3ZPPz4tH7stOUnEB09OnapYk2SM0VBT2ty0Vt7agMB0
	a6kKEeIMRdDpWau3zUtI+EL9ELcuZJ5nCjbKMNoXqVXiWb7cF3kdAeqcKavf1hX5v8ZO
	7Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Ovo4IvuW69++IQbmadgJ60dtpfDVRSaVZUtc1+1cYTk=;
	b=fajdXqbZBl4XOQ6cnD8KYY9UY3X6/vERPZrbi1+fZGtlA1skLsA6vOPvYyBwbVbKDF
	rDeVaXYtWAaxDGONT+swMuCtWSDdTYGQC42qnG+rEAcKbygf13HXrarSe0hhwR4vJUVL
	4n+7iyyhk81WKf5Dzc9ZRokh3pOzKvSIti5mQWmB/1ApOv3YlnIvjtliBZCltYxNYP8v
	q5RetywTYOlkiEvSI7iqabe9KhwC6SnV0J4Xiu098CIvwZnUgK9KQg6GfeuTFsSE5eV7
	Tt2g6d0HA7edl3tKhQGcmfXG4jytlBnx4RlvXSX1NHuqZe1htCJqnTSSgUNtORDAIe+v
	+aZQ==
X-Gm-Message-State: AKaTC029goI7MdDLF2/aC5N+WwFOQvuCNr1O1Uzr12uwwrQE/B+ETArY6ApdG501tgVbPACYkQcshl6hdG0J0A==
X-Received: by 10.157.17.174 with SMTP id v43mr13693244otf.251.1480399500750; 
	Mon, 28 Nov 2016 22:05:00 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Mon, 28 Nov 2016 22:04:40 -0800 (PST)
In-Reply-To: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
References: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 28 Nov 2016 23:04:40 -0700
X-Google-Sender-Auth: uENU74s4tjyzSLSYcOf9b3EvqTA
Message-ID: <CABcZANmmXvVNTiozc_y-i+efy7JZGphPezgbBRS8fZKfdtYnVA@mail.gmail.com>
To: Jiajie Hu <jiajie.hu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: execute associated functions while preparing the source tree
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
X-List-Received-Date: Tue, 29 Nov 2016 06:05:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c18fcd45e36ac05426a5e2c

--94eb2c18fcd45e36ac05426a5e2c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 7:59 PM, Jiajie Hu <jiajie.hu@intel.com> wrote:

> Execute prefuncs and postfuncs associated with the task while preparing
> the source tree. If any changes are made to the source tree by these
> prefuncs or postfuncs, a separate commit will be created so that the
> changes won't get incorporated with other patches.
>
> Signed-off-by: Jiajie Hu <jiajie.hu@intel.com>
> ---
>  scripts/lib/devtool/standard.py | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/
> standard.py
> index e4d2a57..8302112 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -424,8 +424,7 @@ class BbTaskExecutor(object):
>          self.rdata =3D rdata
>          self.executed =3D []
>
> -    def exec_func(self, func, report):
> -        """Run bitbake task function"""
> +    def _exec_func(self, func, report):
>          if not func in self.executed:
>              deps =3D self.rdata.getVarFlag(func, 'deps', False)
>              if deps:
> @@ -435,12 +434,25 @@ class BbTaskExecutor(object):
>                  logger.info('Executing %s...' % func)
>              fn =3D self.rdata.getVar('FILE', True)
>              localdata =3D bb.build._task_data(fn, func, self.rdata)
> +            prefuncs =3D localdata.getVarFlag(func, 'prefuncs', True)
> +            postfuncs =3D localdata.getVarFlag(func, 'postfuncs', True)
>              try:
> +                for prefunc in (prefuncs or '').split():
> +                    bb.build.exec_func(prefunc, localdata)
> +                    yield prefunc
>                  bb.build.exec_func(func, localdata)
> +                for postfunc in (postfuncs or '').split():
> +                    bb.build.exec_func(postfunc, localdata)
> +                    yield postfunc
>              except bb.build.FuncFailed as e:
>                  raise DevtoolError(str(e))
>              self.executed.append(func)
>
> +    def exec_func(self, func, report):
> +        """Run bitbake task function"""
> +        for step in self._exec_func(func, report):
> +            pass
> +
>
>  class PatchTaskExecutor(BbTaskExecutor):
>      def __init__(self, rdata):
> @@ -462,7 +474,12 @@ class PatchTaskExecutor(BbTaskExecutor):
>                  else:
>                      os.rmdir(patchdir)
>
> -        super(PatchTaskExecutor, self).exec_func(func, report)
> +        for step in super(PatchTaskExecutor, self)._exec_func(func,
> report):
> +            if self.check_git and os.path.exists(srcsubdir):
> +                stdout, _ =3D bb.process.run('git status --porcelain',
> cwd=3Dsrcsubdir)
> +                if stdout:
> +                    bb.process.run('git add .; git %s commit -a -m
> "Committing changes from %s\n\n%s"' % (' '.join(self.useroptions), step,
> GitApplyTree.ignore_commit_prefix + ' - from %s' % step), cwd=3Dsrcsubdir=
)
>

This will do the commit after the first postfunc is done, so won=E2=80=99t =
the
changes from the main func and the first postfunc both be included in that
commit?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c18fcd45e36ac05426a5e2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 28, 2016 at 7:59 PM, Jiajie Hu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jiajie.hu@intel.com" target=3D"_blank">jiajie.hu@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":108" class=3D"a=
3s aXjCH m158ae054f4967d05">Execute prefuncs and postfuncs associated with =
the task while preparing<br>
the source tree. If any changes are made to the source tree by these<br>
prefuncs or postfuncs, a separate commit will be created so that the<br>
changes won&#39;t get incorporated with other patches.<br>
<br>
Signed-off-by: Jiajie Hu &lt;<a href=3D"mailto:jiajie.hu@intel.com">jiajie.=
hu@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/standard.<wbr>py | 23 ++++++++++++++++++++---<br>
=C2=A01 file changed, 20 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/<wbr>standard.py b/scripts/lib/devtool/<wb=
r>standard.py<br>
index e4d2a57..8302112 100644<br>
--- a/scripts/lib/devtool/<wbr>standard.py<br>
+++ b/scripts/lib/devtool/<wbr>standard.py<br>
@@ -424,8 +424,7 @@ <span class=3D"il">class</span> BbTaskExecutor(object):=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rdata =3D rdata<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.executed =3D []<br>
<br>
-=C2=A0 =C2=A0 def exec_func(self, func, report):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Run <span class=3D"il">bitba=
ke</span> task function&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def _exec_func(self, func, report):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not func in self.executed:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D self.rdata.getVarF=
lag(func, &#39;deps&#39;, False)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if deps:<br>
@@ -435,12 +434,25 @@ <span class=3D"il">class</span> BbTaskExecutor(object=
):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39=
;Executing %s...&#39; % func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D self.rdata.getVar(&#=
39;FILE&#39;, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata =3D <span class=
=3D"il">bb</span>.build._task_data(fn, func, self.rdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefuncs =3D localdata.getVarFla=
g(func, &#39;prefuncs&#39;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 postfuncs =3D localdata.getVarFl=
ag(func, &#39;postfuncs&#39;, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for prefunc in (pr=
efuncs or &#39;&#39;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <spa=
n class=3D"il">bb</span>.build.exec_func(prefunc, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yiel=
d prefunc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=
=3D"il">bb</span>.build.exec_func(func, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for postfunc in (p=
ostfuncs or &#39;&#39;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <spa=
n class=3D"il">bb</span>.build.exec_func(postfunc, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yiel=
d postfunc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except <span class=3D"il">b=
b</span>.build.FuncFailed as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Devtool=
Error(str(e))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.executed.append(func)<=
br>
<br>
+=C2=A0 =C2=A0 def exec_func(self, func, report):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Run <span class=3D"il">bitba=
ke</span> task function&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for step in self._exec_func(func, report):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
<br>
=C2=A0<span class=3D"il">class</span> PatchTaskExecutor(<wbr>BbTaskExecutor=
):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, rdata):<br>
@@ -462,7 +474,12 @@ <span class=3D"il">class</span> PatchTaskExecutor(<wbr=
>BbTaskExecutor):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0os.rmdir(patchdir)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(PatchTaskExecutor, self).exec_func(func,=
 report)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for step in super(PatchTaskExecutor, self)._ex=
ec_func(func, report):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.check_git and os.path.ex=
ists(srcsubdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout, _ =3D <spa=
n class=3D"il">bb</span>.process.run(&#39;git status --porcelain&#39;, cwd=
=3Dsrcsubdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if stdout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <spa=
n class=3D"il">bb</span>.process.run(&#39;git add .; git %s commit -a -m &q=
uot;Committing changes from %s\n\n%s&quot;&#39; % (&#39; &#39;.join(self.us=
eroptions), step, GitApplyTree.ignore_commit_<wbr>prefix + &#39; - from %s&=
#39; % step), cwd=3Dsrcsubdir)</div></blockquote></div><br>This will do the=
 commit after the first postfunc is done, so won=E2=80=99t the changes from=
 the main func and the first postfunc both be included in that commit?<br>-=
- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Chr=
istopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmb=
edded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor=
 Graphics</div>
</div></div>

--94eb2c18fcd45e36ac05426a5e2c--
