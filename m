Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96A3773074
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 09:16:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m70so1977305wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 01:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8uItZHPqMHHYBeFvTr3XuMwP6Q1BguLGOUyf4BPisEo=;
	b=qlTXzb7ux3L/PI8m8ZHG+4xwHLTZDjUIhy/UdvJ6ae0U/OAMO+LRQF89gLPPYt4Jv1
	tRJs81WE3AyNlSTlKuoDN9fmbrFdFoWWSwEAE5pzPEVCnVGJRLxrxqlnI1HfAHJE9Tjb
	OR5S6EedMhWf5cyEfKwhabrQpzWETJb2t/yANN7ckP7Uc5dhxz5UAW1QMGrskR8bOf3D
	odpggdzkOUInDIF6ZA/SOxe3T3q7f79mnKJ4PBxs2TAMXKtiLqIN3mb2qpc98g0M04Ab
	oQodKuochVt8Zcpdmh60YlpcJT+hVrJ6eIBx7XXEtCcN4S0ld3RDrUEgk7dyfaEc0m30
	eDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8uItZHPqMHHYBeFvTr3XuMwP6Q1BguLGOUyf4BPisEo=;
	b=QsfuqYRO/OYBQd1+gmeRUeJNRiQRL39ulfOTfkmzbO3+RHvkkvCYrxFqfR7ALqknTY
	8YjzLzCp6RpQpCRhdSAZKkRwopYfXqv8J8fM1anrjJpVclYNff7JwXi4Nn+g3ljE7fcV
	lCONeSoRjKp0nmNYly4Rsp0eHHlOSII+AnH7u6WP9PZN4br+i7tfWqCBnJ03RQDuJVZ+
	mQ4iH1cToaTGdjK37FMU9Vz1SJxtrWbU2/xhJ/P3fjRyG669eeb0YHG70v1WjM58MREL
	PNy60RNGY3xCEW5ddbOtMqXgsLH2tJRy+xB6n1ZL5bJwJwsRcda85nj3Wdh67oyt5WbW
	wI6A==
X-Gm-Message-State: AMke39kdgC4B/hHlPiOUSpY69tx/3VHVZ12ioZnFFbAldYRxfr+QxXD36Qr/w1nXuMmKsWI6KS0GQd7E22l1YA==
X-Received: by 10.28.6.78 with SMTP id 75mr1840476wmg.81.1487927802820; Fri,
	24 Feb 2017 01:16:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.208.207 with HTTP; Fri, 24 Feb 2017 01:16:42 -0800 (PST)
In-Reply-To: <CAMKF1sr0OxcRYC9OZsJBieR-MVFnw5XbfuKr+go8xnhgYDHstA@mail.gmail.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1sr0OxcRYC9OZsJBieR-MVFnw5XbfuKr+go8xnhgYDHstA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Feb 2017 10:16:42 +0100
Message-ID: <CA+chaQdJprDqs_aiMuWy6pRDB0WDM=fjnM6RqtLGv28EUCLOxg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Joe MacDonald <joe_macdonald@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Fri, 24 Feb 2017 09:16:44 -0000
Content-Type: multipart/alternative; boundary=001a114421b22380cf0549433046

--001a114421b22380cf0549433046
Content-Type: text/plain; charset=UTF-8

> If nobody speaks up within some
amount of time the maintainer considers reasonable (I'm thinking a Yocto
release
cycle) then it's fair game to remove the recipe in question.

Maybe this is different case with at least some PNBLACKLIST entries we
currently have, but
I don't remove PNBLACKLISTed recipes, because as we discussed it's always
easier to unblacklist
recipe from e.g. DISTRO config if the issue doesn't affect you for whatever
reason and causes
less churn in the metadata when it gets unblacklisted.

And many PNBLACKLISTed recipes are also abandonware.

So my question is, if we will remove PNDEPRECATed recipes after one cycle,
should we start
removing PNBLACKLISTed recipes as well (maybe after 2 cycles?). In both
cases it might backfire
when someone will fail to find recipe for his favorite abandonware and will
try to add completely
new recipe for it, or we see someone restoring these recipes (e.g. in own
layers instead of fixing
the PNBLACKLIST/PNDEPRECATED reasons in original layer).

On Fri, Feb 24, 2017 at 5:55 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Thu, Feb 23, 2017 at 8:00 PM Joe MacDonald <joe_macdonald@mentor.com>
> wrote:
>
>> Based on the blacklist behaviour, recipes can be tagged as deprecated.
>> Such recipes will produce a warning message when included in a build but
>> unlike blacklisted recipes, the build will continue.
>
>
> Perhaps this should also be documented in manuals
>
>>
>>
>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>> ---
>>
>> I threw this together a long time ago and never got around to sending it
>> out for
>> consideration, but after the excitement last week and this, I got
>> thinking about
>> it again and thought it might be useful.  My specific use-case for this is
>> recipes I see in meta-networking that I know are largely abandonware but
>> that I
>> don't want to completely throw out without giving some kind of heads up.
>> Obviously this is purely informational, there's no mechanism set up for
>> purging
>> deprecated recipes, that's intended to be a maintainer activity, but the
>> idea
>> would be that the maintainer would flag a recipe as deprecated (probably
>> when
>> it's become more trouble than it seems to be worth) and thereafter users
>> would
>> have fair warning that this thing is on notice.  If nobody speaks up
>> within some
>> amount of time the maintainer considers reasonable (I'm thinking a Yocto
>> release
>> cycle) then it's fair game to remove the recipe in question.
>>
>>  meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
>>  meta/conf/distro/defaultsetup.conf |  3 ++-
>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/classes/deprecated.bbclass
>>
>> diff --git a/meta/classes/deprecated.bbclass b/meta/classes/deprecated.
>> bbclass
>> new file mode 100644
>> index 0000000..3dcdadb
>> --- /dev/null
>> +++ b/meta/classes/deprecated.bbclass
>> @@ -0,0 +1,16 @@
>> +# To use the deprecated recipe check, a distribution should
>> +# include this class in the INHERIT_DISTRO
>> +#
>> +# Features:
>> +#
>> +# * To add a package to the deprecated list, set:
>> +#   PNDEPRECATED[pn] = "message"
>> +#
>> +
>> +addtask check_deprecated before do_fetch
>> +python do_check_deprecated () {
>> +    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True),
>> False)
>> +
>> +    if deprecated:
>> +        bb.warn("Recipe is deprecated: ", (deprecated))
>> +}
>> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/
>> defaultsetup.conf
>> index ca2f917..16ece3a 100644
>> --- a/meta/conf/distro/defaultsetup.conf
>> +++ b/meta/conf/distro/defaultsetup.conf
>> @@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['',
>> '/' + str(d.getVar('MACHINE'
>>  USER_CLASSES ?= ""
>>  PACKAGE_CLASSES ?= "package_ipk"
>>  INHERIT_BLACKLIST = "blacklist"
>> +INHERIT_DEPRECATED = "deprecated"
>>  INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
>> -INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
>> ${INHERIT_BLACKLIST}"
>> +INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
>> ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114421b22380cf0549433046
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">If nobody speak=
s up within some</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">amount of time the maintainer considers reasonable (I&#39;m thi=
nking a Yocto release</span><br style=3D"font-size:12.8px"><span style=3D"f=
ont-size:12.8px">cycle) then it&#39;s fair game to remove the recipe in que=
stion.</span><div><span style=3D"font-size:12.8px"><br></span></div><div><s=
pan style=3D"font-size:12.8px">Maybe this is different case with at least s=
ome PNBLACKLIST entries we currently have, but</span></div><div><span style=
=3D"font-size:12.8px">I don&#39;t remove PNBLACKLISTed recipes, because as =
we discussed it&#39;s always easier to unblacklist</span></div><div><span s=
tyle=3D"font-size:12.8px">recipe from e.g. DISTRO config if the issue doesn=
&#39;t affect you for whatever reason and causes</span></div><div><span sty=
le=3D"font-size:12.8px">less churn in the metadata when it gets unblacklist=
ed.</span></div><div><span style=3D"font-size:12.8px"><br></span></div><div=
><span style=3D"font-size:12.8px">And many PNBLACKLISTed recipes are also a=
bandonware.</span></div><div><span style=3D"font-size:12.8px"><br></span></=
div><div><span style=3D"font-size:12.8px">So my question is, if we will rem=
ove PNDEPRECATed recipes after one cycle, should we start</span></div><div>=
<span style=3D"font-size:12.8px">removing PNBLACKLISTed recipes as well (ma=
ybe after 2 cycles?). In both cases it might backfire</span></div><div><spa=
n style=3D"font-size:12.8px">when someone will fail to find recipe for his =
favorite abandonware and will try to add completely</span></div><div><span =
style=3D"font-size:12.8px">new recipe for it, or we see someone restoring t=
hese recipes (e.g. in own layers instead of fixing</span></div><div><span s=
tyle=3D"font-size:12.8px">the PNBLACKLIST/PNDEPRECATED reasons in original =
layer).</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Fri, Feb 24, 2017 at 5:55 AM, Khem Raj <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br><div class=
=3D"gmail_quote"><span class=3D""><div>On Thu, Feb 23, 2017 at 8:00 PM Joe =
MacDonald &lt;<a href=3D"mailto:joe_macdonald@mentor.com" target=3D"_blank"=
>joe_macdonald@mentor.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Based on the blacklist behaviour, recipes can be tagged as deprecated=
.<br class=3D"m_6237272864128199650gmail_msg">
Such recipes will produce a warning message when included in a build but<br=
 class=3D"m_6237272864128199650gmail_msg">
unlike blacklisted recipes, the build will continue.</blockquote><div><br><=
/div></span><div>Perhaps this should also be documented in manuals</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div><div class=3D"h5"><br class=3D"m_623727286=
4128199650gmail_msg">
<br class=3D"m_6237272864128199650gmail_msg">
Signed-off-by: Joe MacDonald &lt;<a href=3D"mailto:joe_macdonald@mentor.com=
" class=3D"m_6237272864128199650gmail_msg" target=3D"_blank">joe_macdonald@=
mentor.com</a>&gt;<br class=3D"m_6237272864128199650gmail_msg">
---<br class=3D"m_6237272864128199650gmail_msg">
<br class=3D"m_6237272864128199650gmail_msg">
I threw this together a long time ago and never got around to sending it ou=
t for<br class=3D"m_6237272864128199650gmail_msg">
consideration, but after the excitement last week and this, I got thinking =
about<br class=3D"m_6237272864128199650gmail_msg">
it again and thought it might be useful.=C2=A0 My specific use-case for thi=
s is<br class=3D"m_6237272864128199650gmail_msg">
recipes I see in meta-networking that I know are largely abandonware but th=
at I<br class=3D"m_6237272864128199650gmail_msg">
don&#39;t want to completely throw out without giving some kind of heads up=
.<br class=3D"m_6237272864128199650gmail_msg">
Obviously this is purely informational, there&#39;s no mechanism set up for=
 purging<br class=3D"m_6237272864128199650gmail_msg">
deprecated recipes, that&#39;s intended to be a maintainer activity, but th=
e idea<br class=3D"m_6237272864128199650gmail_msg">
would be that the maintainer would flag a recipe as deprecated (probably wh=
en<br class=3D"m_6237272864128199650gmail_msg">
it&#39;s become more trouble than it seems to be worth) and thereafter user=
s would<br class=3D"m_6237272864128199650gmail_msg">
have fair warning that this thing is on notice.=C2=A0 If nobody speaks up w=
ithin some<br class=3D"m_6237272864128199650gmail_msg">
amount of time the maintainer considers reasonable (I&#39;m thinking a Yoct=
o release<br class=3D"m_6237272864128199650gmail_msg">
cycle) then it&#39;s fair game to remove the recipe in question.<br class=
=3D"m_6237272864128199650gmail_msg">
<br class=3D"m_6237272864128199650gmail_msg">
=C2=A0meta/classes/deprecated.<wbr>bbclass=C2=A0 =C2=A0 | 16 ++++++++++++++=
++<br class=3D"m_6237272864128199650gmail_msg">
=C2=A0meta/conf/distro/<wbr>defaultsetup.conf |=C2=A0 3 ++-<br class=3D"m_6=
237272864128199650gmail_msg">
=C2=A02 files changed, 18 insertions(+), 1 deletion(-)<br class=3D"m_623727=
2864128199650gmail_msg">
=C2=A0create mode 100644 meta/classes/deprecated.<wbr>bbclass<br class=3D"m=
_6237272864128199650gmail_msg">
<br class=3D"m_6237272864128199650gmail_msg">
diff --git a/meta/classes/deprecated.<wbr>bbclass b/meta/classes/deprecated=
.<wbr>bbclass<br class=3D"m_6237272864128199650gmail_msg">
new file mode 100644<br class=3D"m_6237272864128199650gmail_msg">
index 0000000..3dcdadb<br class=3D"m_6237272864128199650gmail_msg">
--- /dev/null<br class=3D"m_6237272864128199650gmail_msg">
+++ b/meta/classes/deprecated.<wbr>bbclass<br class=3D"m_623727286412819965=
0gmail_msg">
@@ -0,0 +1,16 @@<br class=3D"m_6237272864128199650gmail_msg">
+# To use the deprecated recipe check, a distribution should<br class=3D"m_=
6237272864128199650gmail_msg">
+# include this class in the INHERIT_DISTRO<br class=3D"m_62372728641281996=
50gmail_msg">
+#<br class=3D"m_6237272864128199650gmail_msg">
+# Features:<br class=3D"m_6237272864128199650gmail_msg">
+#<br class=3D"m_6237272864128199650gmail_msg">
+# * To add a package to the deprecated list, set:<br class=3D"m_6237272864=
128199650gmail_msg">
+#=C2=A0 =C2=A0PNDEPRECATED[pn] =3D &quot;message&quot;<br class=3D"m_62372=
72864128199650gmail_msg">
+#<br class=3D"m_6237272864128199650gmail_msg">
+<br class=3D"m_6237272864128199650gmail_msg">
+addtask check_deprecated before do_fetch<br class=3D"m_6237272864128199650=
gmail_msg">
+python do_check_deprecated () {<br class=3D"m_6237272864128199650gmail_msg=
">
+=C2=A0 =C2=A0 deprecated =3D d.getVarFlag(&#39;PNDEPRECATED&#39;, d.getVar=
(&#39;PN&#39;, True), False)<br class=3D"m_6237272864128199650gmail_msg">
+<br class=3D"m_6237272864128199650gmail_msg">
+=C2=A0 =C2=A0 if deprecated:<br class=3D"m_6237272864128199650gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Recipe is deprecated: &quot;, (d=
eprecated))<br class=3D"m_6237272864128199650gmail_msg">
+}<br class=3D"m_6237272864128199650gmail_msg">
diff --git a/meta/conf/distro/<wbr>defaultsetup.conf b/meta/conf/distro/<wb=
r>defaultsetup.conf<br class=3D"m_6237272864128199650gmail_msg">
index ca2f917..16ece3a 100644<br class=3D"m_6237272864128199650gmail_msg">
--- a/meta/conf/distro/<wbr>defaultsetup.conf<br class=3D"m_623727286412819=
9650gmail_msg">
+++ b/meta/conf/distro/<wbr>defaultsetup.conf<br class=3D"m_623727286412819=
9650gmail_msg">
@@ -20,5 +20,6 @@ CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${<wbr>TCLIBC}$=
{@[&#39;&#39;, &#39;/&#39; + str(d.getVar(&#39;MACHINE&#39;<br class=3D"m_6=
237272864128199650gmail_msg">
=C2=A0USER_CLASSES ?=3D &quot;&quot;<br class=3D"m_6237272864128199650gmail=
_msg">
=C2=A0PACKAGE_CLASSES ?=3D &quot;package_ipk&quot;<br class=3D"m_6237272864=
128199650gmail_msg">
=C2=A0INHERIT_BLACKLIST =3D &quot;blacklist&quot;<br class=3D"m_62372728641=
28199650gmail_msg">
+INHERIT_DEPRECATED =3D &quot;deprecated&quot;<br class=3D"m_62372728641281=
99650gmail_msg">
=C2=A0INHERIT_DISTRO ?=3D &quot;debian devshell sstate license remove-libto=
ol&quot;<br class=3D"m_6237272864128199650gmail_msg">
-INHERIT +=3D &quot;${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${=
INHERIT_BLACKLIST}&quot;<br class=3D"m_6237272864128199650gmail_msg">
+INHERIT +=3D &quot;${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${=
INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}&quot;<br class=3D"m_62372728641281=
99650gmail_msg">
--<br class=3D"m_6237272864128199650gmail_msg">
1.9.1<br class=3D"m_6237272864128199650gmail_msg">
<br class=3D"m_6237272864128199650gmail_msg"></div></div><span class=3D"HOE=
nZb"><font color=3D"#888888">
--<br class=3D"m_6237272864128199650gmail_msg">
______________________________<wbr>_________________<br class=3D"m_62372728=
64128199650gmail_msg">
Openembedded-core mailing list<br class=3D"m_6237272864128199650gmail_msg">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=3D"m_6237=
272864128199650gmail_msg" target=3D"_blank">Openembedded-core@lists.<wbr>op=
enembedded.org</a><br class=3D"m_6237272864128199650gmail_msg">
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" class=3D"m_6237272864128199650gmail_msg" target=3D"_bl=
ank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>=
core</a><br class=3D"m_6237272864128199650gmail_msg">
</font></span></blockquote></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114421b22380cf0549433046--
