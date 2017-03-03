Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5137768D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:13:10 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id f54so128812746uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 13:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CVEnJfKqmaPF2faKeVA+Q9evkSUcNrv0P0OXlgJE4wQ=;
	b=R5cHzExZhIauN0Es0tQ3mHjzSCl/FGF7JR/o+AhvKAQmlbHLpYXrHziCTlpTWvZqSu
	UUI5xv7kWbGyqsIvg1Ia+L6kfJcW49J1e6m4WKUoWYcgMCytdLVZWBYT/2SttA7Z33OQ
	yEPGMFRj6IO8szN9sJn0CJ5yzcU7kuWoQS8p6+/9uoYsjhuIFMnGiESzik+QjTDhVAPZ
	K2dLFR2E1GS1XHyQUkx5ny4GasDGczH1pG1mbWGSgp7h+foYbnlIHqtV42r+d59F4vVz
	sh7nsJPN8mtvl8btg+PSrJ0H+ClZPvKHQDwz/IYS4XEEMUbj9DCb1L/7Ib7gm+TRkjgE
	QXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CVEnJfKqmaPF2faKeVA+Q9evkSUcNrv0P0OXlgJE4wQ=;
	b=eqnU7IjyjTFCUXEt6N9vedklyEgmDbzCN2VB3WK4jxBcKIbO629bBJbO3+HkO8ka1x
	dnOpnD5IJ4Sv9Vj+Zn8pn/vLWVDpPDgB+AjdF50leAH9CHEjPe/C0HNQBy5FwGcrsiB+
	vMNKVOzN8lEaW45i//GmRX/GgUUALD4BTFmJU+oHddatLcfwaW8B1noZOa5U0qz90avu
	aRu5DjHQigoPyY6TWAy93UPCv8HYceZ1gkwN7ZPvoEV4wxvMuv34GLO7UzBR17FyeL88
	25MuovHqbZVZTQMwy0Z0uT9AoNcnQjKaoNrkLBSaOoqnCPbUNZfCZGZVuoFljvhilY7l
	3RbA==
X-Gm-Message-State: AMke39m9rUjtiSXakA4nifml4VT80szKTT6qTNT+EBYeIzfRqv/pG81+fLsJk0SGf5sZxK30DXJqllzeS0FTfA==
X-Received: by 10.176.64.225 with SMTP id i88mr2029931uad.60.1488575591677;
	Fri, 03 Mar 2017 13:13:11 -0800 (PST)
MIME-Version: 1.0
References: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
	<CAMKF1spQU9cmk22_Q7VtwKqJ+vVji-YfOHewUr8sz7ykkJaG3Q@mail.gmail.com>
	<7333db9a-fda0-a8e3-6a3f-9d7700e9eda4@xevo.com>
	<CAMKF1sp+pwjdasqJ2P9hg3VgqPPr+XC-GWV0oN8V8vUvE-+yEg@mail.gmail.com>
	<132772b8-699c-ac9d-8ffa-f51ab7ea6947@xevo.com>
In-Reply-To: <132772b8-699c-ac9d-8ffa-f51ab7ea6947@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 03 Mar 2017 21:13:00 +0000
Message-ID: <CAMKF1spH9qUQCPPjjVXpN2qZDs5UR=5X984WRH1WM5xeN47f0w@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] clang/LLVM versioning
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
X-List-Received-Date: Fri, 03 Mar 2017 21:13:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c12370a5d05720549da039b

--94eb2c12370a5d05720549da039b
Content-Type: text/plain; charset=UTF-8

That's reasonable I think

On Fri, Mar 3, 2017 at 12:36 PM Martin Kelly <mkelly@xevo.com> wrote:

> On 03/03/2017 12:23 PM, Khem Raj wrote:
> > On Fri, Mar 3, 2017 at 12:15 PM, Martin Kelly <mkelly@xevo.com> wrote:
> >> On 03/03/2017 12:12 PM, Khem Raj wrote:
> >>>
> >>> with  meta-clang there is no desire to support multiple versions of
> >>> llvm and thats why versioning was dropped however, I would still like
> >>> to fix the versioning if that makes it more useful.
> >>>
> >>
> >> OK, keeping a single version is certainly simpler. Could you clarify "I
> >> would still like to fix the versioning if that makes it more useful." ?
> >>
> >
> > say if there are other apps which depend on the versioning and
> > otherwise would need patching to work with llvm from meta-clang, then
> > lets fix it in meta-clang.
> >
>
>  From my investigation, it looks like the real (unwrapped) llvm-config
> is in the PATH for any recipe depending on clang-native. This means that
> when an app looks for llvm-config, it will find the real version and
> won't know that the wrapper went anywhere. Of course, if the app truly
> depends on a specific LLVM version -- due to LLVM's unstable ABI -- then
> that app will break when the meta-clang version changes. However, if we
> don't maintain multiple versions of LLVM in meta-clang, that's unavoidable.
>
> So AFAICT we could safely remove the wrapper and have apps that set
> WANT_LLVM_RELEASE still work correctly, if they compile against our
> version of meta-clang. Since it appears the wrapper has been broken for
> for some time anyway, I'm guessing there aren't many such apps anyway.
>
> Does that sound reasonable to you?
>

--94eb2c12370a5d05720549da039b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>That&#39;s reasonable I think</div><div><br><div class=3D"gmail_quote"=
><div>On Fri, Mar 3, 2017 at 12:36 PM Martin Kelly &lt;<a href=3D"mailto:mk=
elly@xevo.com">mkelly@xevo.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On 03/03/2017 12:23 PM, Khem Raj wrote:<br class=3D"gmail_msg">
&gt; On Fri, Mar 3, 2017 at 12:15 PM, Martin Kelly &lt;<a href=3D"mailto:mk=
elly@xevo.com" class=3D"gmail_msg" target=3D"_blank">mkelly@xevo.com</a>&gt=
; wrote:<br class=3D"gmail_msg">
&gt;&gt; On 03/03/2017 12:12 PM, Khem Raj wrote:<br class=3D"gmail_msg">
&gt;&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;&gt; with=C2=A0 meta-clang there is no desire to support multiple v=
ersions of<br class=3D"gmail_msg">
&gt;&gt;&gt; llvm and thats why versioning was dropped however, I would sti=
ll like<br class=3D"gmail_msg">
&gt;&gt;&gt; to fix the versioning if that makes it more useful.<br class=
=3D"gmail_msg">
&gt;&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; OK, keeping a single version is certainly simpler. Could you clari=
fy &quot;I<br class=3D"gmail_msg">
&gt;&gt; would still like to fix the versioning if that makes it more usefu=
l.&quot; ?<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; say if there are other apps which depend on the versioning and<br clas=
s=3D"gmail_msg">
&gt; otherwise would need patching to work with llvm from meta-clang, then<=
br class=3D"gmail_msg">
&gt; lets fix it in meta-clang.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0From my investigation, it looks like the real (unwrapped) llvm-config=
<br class=3D"gmail_msg">
is in the PATH for any recipe depending on clang-native. This means that<br=
 class=3D"gmail_msg">
when an app looks for llvm-config, it will find the real version and<br cla=
ss=3D"gmail_msg">
won&#39;t know that the wrapper went anywhere. Of course, if the app truly<=
br class=3D"gmail_msg">
depends on a specific LLVM version -- due to LLVM&#39;s unstable ABI -- the=
n<br class=3D"gmail_msg">
that app will break when the meta-clang version changes. However, if we<br =
class=3D"gmail_msg">
don&#39;t maintain multiple versions of LLVM in meta-clang, that&#39;s unav=
oidable.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
So AFAICT we could safely remove the wrapper and have apps that set<br clas=
s=3D"gmail_msg">
WANT_LLVM_RELEASE still work correctly, if they compile against our<br clas=
s=3D"gmail_msg">
version of meta-clang. Since it appears the wrapper has been broken for<br =
class=3D"gmail_msg">
for some time anyway, I&#39;m guessing there aren&#39;t many such apps anyw=
ay.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Does that sound reasonable to you?<br class=3D"gmail_msg">
</blockquote></div></div>

--94eb2c12370a5d05720549da039b--
