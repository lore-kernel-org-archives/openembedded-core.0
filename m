Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SZd2e-0007C7-DT
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 09:10:00 +0200
Received: by yenl13 with SMTP id l13so2825185yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 23:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=lUZIYcfEmmkgWcIeDGujBVzWkT+Exv42R1JpKhz1MfM=;
	b=SkwTYx+xFodpIDImRBGrxrMmFRc1QnBE0O6hxX9igwl2pxExxyp/dgMpoDEnp4aS8C
	NcNStcaS3ezZhcED3ii/sox1/70tEaCgvz8bennZGuOJFIRffsm9FH6AEtfe3wOGxH33
	TPBckUMs9UnC+rfOMTs9oKtXBkGXOpHk2HzCQ3muROgvwDF78BbH+7b4dcoFmTSk9dQH
	p+8UDHY1LWuzmVYi1dTiGW8AEy/AFgHPuTV4fODEm059HZfgEOsSuEBeKBuPO8QyQjCa
	XQCD4jBjgGQjDmtfVu8Zo57xmhR64s6zkkbt8T63ybwR0MBILXJeSTE5bp/fwSZTF7j4
	qn3g==
MIME-Version: 1.0
Received: by 10.50.41.196 with SMTP id h4mr9646580igl.33.1338361181413; Tue,
	29 May 2012 23:59:41 -0700 (PDT)
Received: by 10.64.28.147 with HTTP; Tue, 29 May 2012 23:59:41 -0700 (PDT)
X-Originating-IP: [79.115.102.71]
Received: by 10.64.28.147 with HTTP; Tue, 29 May 2012 23:59:41 -0700 (PDT)
In-Reply-To: <3B761AC4-FE90-45BB-912C-4114A3214843@gmail.com>
References: <3B761AC4-FE90-45BB-912C-4114A3214843@gmail.com>
Date: Wed, 30 May 2012 09:59:41 +0300
Message-ID: <CAK18fxFV9_joqTCNGRwBwpvo9RAvxyGYb=OEsZ7Zr_pCicg6OA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmD4dnaUdJNlkKJl7dWOTpkOr/lq/t6zV7VXdTRYfP8d95dZeH2b1uBfMPgtuWVvIDkQi29
Subject: Re: meta-ti: ERROR: Unable to parse /tool/yocto/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 07:10:00 -0000
Content-Type: multipart/alternative; boundary=14dae934042bcca21a04c13b7e3b

--14dae934042bcca21a04c13b7e3b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

What machine are you using?
On May 29, 2012 11:18 PM, "Elvis Dowson" <elvis.dowson@gmail.com> wrote:

> Hi,
>      When building with the latest meta-ti layer, I get the following
> error:
>
> ERROR: Unable to analyse format of PR variable: b
>                                      | ETA:  00:01:18
> ERROR: Unable to parse /tool/yocto/meta-ti/recipes-bsp/powervr-drivers/
> omap3-sgx-modules_4.05.00.03.bb
> Traceback (most recent call last):
>  File "/tool/yocto/poky/bitbake/lib/bb/parse/ast.py", line 381, in
> multi_finalize(fn=3D'/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/
> omap3-sgx-modules_4.05.00.03.bb', d=3D<bb.data_smart.DataSmart object at
> 0x337efd0>):
>         try:
>    >        finalize(fn, d)
>         except bb.parse.SkipPackage as e:
>  File "/tool/yocto/poky/bitbake/lib/bb/parse/ast.py", line 323, in
> finalize(fn=3D'/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/
> omap3-sgx-modules_4.05.00.03.bb', d=3D<bb.data_smart.DataSmart object at
> 0x337efd0>, variant=3DNone):
>             code.append("%s(d)" % funcname)
>    >    bb.utils.simple_exec("\n".join(code), {"d": d})
>         bb.data.update_data(d)
>  File "/tool/yocto/poky/bitbake/lib/bb/utils.py", line 274, in
> simple_exec(code=3D'__anon_119__tool_yocto_poky_meta_classes_staging_bbcl=
ass(d)\n__anon_540__tool_yocto_poky_meta_classes_base_bbclass(d)\n__anon_17=
6__tool_yocto_poky_meta_classes_package_bbclass(d)\n__anon_1106__tool_yocto=
_poky_meta_classes_package_rpm_bbclass(d)\n__anon_736__tool_yocto_poky_meta=
_classes_insane_bbclass(d)\n__anon_20__tool_yocto_poky_meta_classes_debian_=
bbclass(d)\n__anon_52__tool_yocto_poky_meta_classes_sstate_bbclass(d)',
> context=3D{'d': <bb.data_smart.DataSmart object at 0x337efd0>}):
>     def simple_exec(code, context):
>    >    exec(code, _context, context)
>
>  File "<string>", line 2, in <module>
>  File "__anon_540__tool_yocto_poky_meta_classes_base_bbclass", line 75, i=
n
> __anon_540__tool_yocto_poky_meta_classes_base_bbclass(d=3D<bb.data_smart.=
DataSmart
> object at 0x337efd0>)
> AttributeError: 'NoneType' object has no attribute 'group'
>
> ERROR: Command execution failed: Traceback (most recent call last):
>  File "/tool/yocto/poky/bitbake/lib/bb/command.py", line 84, in
> runAsyncCommand
>    self.cooker.updateCache()
>  File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1202, in
> updateCache
>    if not self.parser.parse_next():
>  File "/tool/yocto/poky/bitbake/lib/bb/cooker.py", line 1671, in parse_ne=
xt
>    self.virtuals +=3D len(result)
> UnboundLocalError: local variable 'result' referenced before assignment
>
>
>
> best regards,
>
> Elvis Dowson
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae934042bcca21a04c13b7e3b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>What machine are you using?</p>
<div class=3D"gmail_quote">On May 29, 2012 11:18 PM, &quot;Elvis Dowson&quo=
t; &lt;<a href=3D"mailto:elvis.dowson@gmail.com">elvis.dowson@gmail.com</a>=
&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hi,<br>
 =A0 =A0 =A0When building with the latest meta-ti layer, I get the followin=
g error:<br>
<br>
ERROR: Unable to analyse format of PR variable: b =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0| ETA: =A000:01:18<br>
ERROR: Unable to parse /tool/yocto/meta-ti/recipes-bsp/powervr-drivers/<a h=
ref=3D"http://omap3-sgx-modules_4.05.00.03.bb" target=3D"_blank">omap3-sgx-=
modules_4.05.00.03.bb</a><br>
Traceback (most recent call last):<br>
 =A0File &quot;/tool/yocto/poky/bitbake/lib/bb/parse/ast.py&quot;, line 381=
, in multi_finalize(fn=3D&#39;/tool/yocto/meta-ti/recipes-bsp/powervr-drive=
rs/<a href=3D"http://omap3-sgx-modules_4.05.00.03.bb" target=3D"_blank">oma=
p3-sgx-modules_4.05.00.03.bb</a>&#39;, d=3D&lt;bb.data_smart.DataSmart obje=
ct at 0x337efd0&gt;):<br>

 =A0 =A0 =A0 =A0 try:<br>
 =A0 =A0&gt; =A0 =A0 =A0 =A0finalize(fn, d)<br>
 =A0 =A0 =A0 =A0 except bb.parse.SkipPackage as e:<br>
 =A0File &quot;/tool/yocto/poky/bitbake/lib/bb/parse/ast.py&quot;, line 323=
, in finalize(fn=3D&#39;/tool/yocto/meta-ti/recipes-bsp/powervr-drivers/<a =
href=3D"http://omap3-sgx-modules_4.05.00.03.bb" target=3D"_blank">omap3-sgx=
-modules_4.05.00.03.bb</a>&#39;, d=3D&lt;bb.data_smart.DataSmart object at =
0x337efd0&gt;, variant=3DNone):<br>

 =A0 =A0 =A0 =A0 =A0 =A0 code.append(&quot;%s(d)&quot; % funcname)<br>
 =A0 =A0&gt; =A0 =A0bb.utils.simple_exec(&quot;\n&quot;.join(code), {&quot;=
d&quot;: d})<br>
 =A0 =A0 =A0 =A0 bb.data.update_data(d)<br>
 =A0File &quot;/tool/yocto/poky/bitbake/lib/bb/utils.py&quot;, line 274, in=
 simple_exec(code=3D&#39;__anon_119__tool_yocto_poky_meta_classes_staging_b=
bclass(d)\n__anon_540__tool_yocto_poky_meta_classes_base_bbclass(d)\n__anon=
_176__tool_yocto_poky_meta_classes_package_bbclass(d)\n__anon_1106__tool_yo=
cto_poky_meta_classes_package_rpm_bbclass(d)\n__anon_736__tool_yocto_poky_m=
eta_classes_insane_bbclass(d)\n__anon_20__tool_yocto_poky_meta_classes_debi=
an_bbclass(d)\n__anon_52__tool_yocto_poky_meta_classes_sstate_bbclass(d)&#3=
9;, context=3D{&#39;d&#39;: &lt;bb.data_smart.DataSmart object at 0x337efd0=
&gt;}):<br>

 =A0 =A0 def simple_exec(code, context):<br>
 =A0 =A0&gt; =A0 =A0exec(code, _context, context)<br>
<br>
 =A0File &quot;&lt;string&gt;&quot;, line 2, in &lt;module&gt;<br>
 =A0File &quot;__anon_540__tool_yocto_poky_meta_classes_base_bbclass&quot;,=
 line 75, in __anon_540__tool_yocto_poky_meta_classes_base_bbclass(d=3D&lt;=
bb.data_smart.DataSmart object at 0x337efd0&gt;)<br>
AttributeError: &#39;NoneType&#39; object has no attribute &#39;group&#39;<=
br>
<br>
ERROR: Command execution failed: Traceback (most recent call last):<br>
 =A0File &quot;/tool/yocto/poky/bitbake/lib/bb/command.py&quot;, line 84, i=
n runAsyncCommand<br>
 =A0 =A0self.cooker.updateCache()<br>
 =A0File &quot;/tool/yocto/poky/bitbake/lib/bb/cooker.py&quot;, line 1202, =
in updateCache<br>
 =A0 =A0if not self.parser.parse_next():<br>
 =A0File &quot;/tool/yocto/poky/bitbake/lib/bb/cooker.py&quot;, line 1671, =
in parse_next<br>
 =A0 =A0self.virtuals +=3D len(result)<br>
UnboundLocalError: local variable &#39;result&#39; referenced before assign=
ment<br>
<br>
<br>
<br>
best regards,<br>
<br>
Elvis Dowson<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div>

--14dae934042bcca21a04c13b7e3b--
