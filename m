Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id C97F672FB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:31:05 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id f54so17089024uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tLo500Auyyd4fdeOdAgeKpa4VqAcH3i6AXnL4lmNIZQ=;
	b=kV7b6yIzVSOXRX83mtaw9/UXWWrXEITdsYRgk/bRGxFjze04XQKqnX1/kxybWjLR6K
	qGHpK3RUKLHQnr10mmh2OKIVYh87HaHlwe04htkgdWbPTRekSoKvLV5LRPNkkoQA64nJ
	HWiokcff9gdSBtvCq5Y1Sm2SWcQs9ZOtTIf+5KcOupXy+SklVYGKpgZPH2Uoz+giH7Cv
	CGCXtjCKZytm2r8dtOrtlhpeMsrnJ+ivvLbrmWug+h9uwJOAHKPST0+LY79QYnpS1/2y
	aRt6DPBKnxnahlpeI1wtNbClrqJ2/tkeyu5/GhEJSjfhA/Id/LkkB2sCZwKOltp9INl6
	g2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tLo500Auyyd4fdeOdAgeKpa4VqAcH3i6AXnL4lmNIZQ=;
	b=RYhYL8HGKLerjmwrUQOVBr25JKVTXs4UgseX6IMKZV0F+I3ftUttvP0xs3J77yZGHF
	6x/pu4RiFwDO6ZT/2xxncnv7W4ILkk41OpqlYgNvdZ6gaZxlUNctMKEDC6LeWYC5w85Q
	/ukPXOq6dbI6YzBEPqTaPbFt/E+j8D+0nA04bZU7gVjinMtgZlR3geMZrtT9hbTMUfkC
	eAlScRqeXjKXvfBslhEGZKKSduN8F3O+00zmCHKIx02WwFL3RLslKmHBR6taTr0r0wyB
	vbafMJK4EmrBYQ3nuend6hzClpuzGR0izFkZUiICfJjomh8rQfI4M+xSQeZWwAQ8Am1g
	+0jA==
X-Gm-Message-State: AMke39mxiKB3xCO+MDNl8vsROxs6J52YBGc3zORy4TiLaw3/AXY+leIQ4/c1UoRkbhOZJ0mIiSBjyBiasBa+7g==
X-Received: by 10.176.64.225 with SMTP id i88mr1344108uad.60.1488295866746;
	Tue, 28 Feb 2017 07:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20170227200707.4566-1-raj.khem@gmail.com>
	<CAJTo0LaHQ1QSLMx8m+ybXwQVzp65r5KB=r=Samv1q7+vUA9CYg@mail.gmail.com>
In-Reply-To: <CAJTo0LaHQ1QSLMx8m+ybXwQVzp65r5KB=r=Samv1q7+vUA9CYg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Feb 2017 15:30:55 +0000
Message-ID: <CAMKF1spYhMO2rH0UQKzV4G5i0v8dR_HrM_VoP6z1jhH9HEGgqw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 28 Feb 2017 15:31:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c12370a7550b5054998e253

--94eb2c12370a7550b5054998e253
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2017 at 4:46 AM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 27 February 2017 at 20:07, Khem Raj <raj.khem@gmail.com> wrote:
>
> * This is converging the recipes for go from
>   meta-virtualization and oe-meta-go
>
> * Add recipes for go 1.7
>
> * go.bbclass is added to ease out writing
>   recipes for go packages
>
> * go-examples: Add an example, helloworld written in go
>   This should serve as temlate for writing go recipes
>
>
> | DEBUG: Executing shell function do_compile
> | ##### Building Go bootstrap tool.
> | cmd/dist
> | #
> _/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/go/src/cmd/dist
> |
> /data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/recipe-sysroot-native/usr/lib/go/pkg/tool/linux_amd64/6l:
> readsym out of sync
>
> Sorry.
>
> Would any logs help?
>

Hmm still  not fixed okay can you build it on another box for me

>
> Ross
>

--94eb2c12370a7550b5054998e253
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Tue, Feb 28, 2017 at 4:46 AM Bu=
rton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gma=
il_msg"><div class=3D"gmail_extra gmail_msg"><br class=3D"gmail_msg"><div c=
lass=3D"gmail_quote gmail_msg">On 27 February 2017 at 20:07, Khem Raj <span=
 class=3D"gmail_msg">&lt;<a href=3D"mailto:raj.khem@gmail.com" class=3D"gma=
il_msg" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=
=3D"gmail_msg"><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"m_4850599812289034084g=
mail-:20t" class=3D"m_4850599812289034084gmail-a3s m_4850599812289034084gma=
il-aXjCH m_4850599812289034084gmail-m15a812f778952517 gmail_msg">* This is =
converging the recipes for <span class=3D"m_4850599812289034084gmail-il gma=
il_msg">go</span> from<br class=3D"gmail_msg">
=C2=A0 meta-virtualization and oe-meta-<span class=3D"m_4850599812289034084=
gmail-il gmail_msg">go</span><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
* Add recipes for <span class=3D"m_4850599812289034084gmail-il gmail_msg">g=
o</span> 1.7<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
* <span class=3D"m_4850599812289034084gmail-il gmail_msg">go</span>.bbclass=
 is added to ease out writing<br class=3D"gmail_msg">
=C2=A0 recipes for <span class=3D"m_4850599812289034084gmail-il gmail_msg">=
go</span> packages<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
* <span class=3D"m_4850599812289034084gmail-il gmail_msg">go</span>-example=
s: Add an example, helloworld written in <span class=3D"m_48505998122890340=
84gmail-il gmail_msg">go</span><br class=3D"gmail_msg">
=C2=A0 This should serve as temlate for writing <span class=3D"m_4850599812=
289034084gmail-il gmail_msg">go</span> recipes<br class=3D"gmail_msg"></div=
></blockquote></div><br class=3D"gmail_msg"></div></div><div class=3D"gmail=
_msg"><div class=3D"gmail_extra gmail_msg"><div class=3D"gmail_extra gmail_=
msg">| DEBUG: Executing shell function do_compile</div><div class=3D"gmail_=
extra gmail_msg">| ##### Building Go bootstrap tool.</div><div class=3D"gma=
il_extra gmail_msg">| cmd/dist</div><div class=3D"gmail_extra gmail_msg">| =
# _/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/go/src/=
cmd/dist</div><div class=3D"gmail_extra gmail_msg">| /data/poky-master/tmp/=
work/x86_64-linux/go-cross-x86_64/1.7.4-r0/recipe-sysroot-native/usr/lib/go=
/pkg/tool/linux_amd64/6l: readsym out of sync</div><div class=3D"gmail_extr=
a gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_extra gmail_=
msg">Sorry.</div><div class=3D"gmail_extra gmail_msg"><br class=3D"gmail_ms=
g"></div><div class=3D"gmail_extra gmail_msg">Would any logs help?</div></d=
iv></div></blockquote><div><br></div><div>Hmm still =C2=A0not fixed okay ca=
n you build it on another box for me=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div class=3D"gmail_msg"><div class=3D"gmail_extra gmail_msg"><div clas=
s=3D"gmail_extra gmail_msg"></div></div></div><div class=3D"gmail_msg"><div=
 class=3D"gmail_extra gmail_msg"><div class=3D"gmail_extra gmail_msg"><br c=
lass=3D"gmail_msg"></div><div class=3D"gmail_extra gmail_msg">Ross</div></d=
iv></div></blockquote></div></div>

--94eb2c12370a7550b5054998e253--
