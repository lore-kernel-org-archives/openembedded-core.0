Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id AD04672F99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 11:46:03 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s186so13965220qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 03:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f2543pZ34oNz6KBfFGn44A2dAB4rhs0pKUr3v4le8V4=;
	b=iLxCCjuwCDHrf0+1IhyQXtJjI/w7i5wJq6rgYf/vLRMgQDJTv2O5RI29LO33u22ywt
	asLUp/UNNfmZ14KzMXCPBLkJvm9sJdRWMBBbgwMQENKV9GWkmprQtRD0W9Fn7MaXWNtb
	k7BhFBGsHj4pKJxG9Cfs2Z5bohmg+3jBf0IA3vuQ0nlDPsDnZNU3OfFCGvDwN2UNyOvk
	L/RTMBNsUJuvkgHGuKUObX6OAle414c/mqktzJbOrVnukYOGcgujVOwFa+f28j1RmW7M
	FBiRIjrjl/l44o9IogyESDFhQCku6klUVL+rPOsDqt1RbskSeugJu83MK0rSDjQLYpMH
	f1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f2543pZ34oNz6KBfFGn44A2dAB4rhs0pKUr3v4le8V4=;
	b=hzaVazKumq+sLAbHq//PeS9EMOfeyF6OD40s9B929gWLRsokWCoxBEv8IjK7blQ5tl
	GCmbkLyrxzjE1Pnz4CPKHJbakx6v5IJdH63wF+JK1GBdBcW80bX+VwAGzjD05cBYAlnY
	SxVU4te0AB1nN4DC1O9MRjzme/UcDL8bfDSdyCNX+Zg+JN9PYt2n+t5uF+/Rigf+einv
	c5AtWMDLc3IuNbOGdUQlk1Oe4YfNTu2bpelB8CZ8KCTt7PFVATcSU0sj/1SWKna9YiP+
	NFlKvAMNf32Nm0PPyL+BFEUk9d6byHlRSP5ZFjfJOI+q2Tr0CplT4FMJRriDO2PSJDVZ
	1lAw==
X-Gm-Message-State: AMke39lhIKC+r4ncMbjavaZbiDmFDbCXsUkpublnbkbkWu/VoZbIDzTHhWovgBbUY2QM3GlnnnacJer9ETs4K8cI
X-Received: by 10.55.47.4 with SMTP id v4mr1916200qkh.77.1488282364683; Tue,
	28 Feb 2017 03:46:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 28 Feb 2017 03:45:44 -0800 (PST)
In-Reply-To: <20170227200707.4566-1-raj.khem@gmail.com>
References: <20170227200707.4566-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Feb 2017 11:45:44 +0000
Message-ID: <CAJTo0LaHQ1QSLMx8m+ybXwQVzp65r5KB=r=Samv1q7+vUA9CYg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 28 Feb 2017 11:46:03 -0000
Content-Type: multipart/alternative; boundary=001a114f4108ac5a27054995bde3

--001a114f4108ac5a27054995bde3
Content-Type: text/plain; charset=UTF-8

On 27 February 2017 at 20:07, Khem Raj <raj.khem@gmail.com> wrote:

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

| DEBUG: Executing shell function do_compile
| ##### Building Go bootstrap tool.
| cmd/dist
| #
_/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/go/src/cmd/dist
|
/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/recipe-sysroot-native/usr/lib/go/pkg/tool/linux_amd64/6l:
readsym out of sync

Sorry.

Would any logs help?

Ross

--001a114f4108ac5a27054995bde3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2017 at 20:07, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D"gmail-:20t" class=3D"gmail-a3s gmail=
-aXjCH gmail-m15a812f778952517">* This is converging the recipes for <span =
class=3D"gmail-il">go</span> from<br>
=C2=A0 meta-virtualization and oe-meta-<span class=3D"gmail-il">go</span><b=
r>
<br>
* Add recipes for <span class=3D"gmail-il">go</span> 1.7<br>
<br>
* <span class=3D"gmail-il">go</span>.bbclass is added to ease out writing<b=
r>
=C2=A0 recipes for <span class=3D"gmail-il">go</span> packages<br>
<br>
* <span class=3D"gmail-il">go</span>-examples: Add an example, helloworld w=
ritten in <span class=3D"gmail-il">go</span><br>
=C2=A0 This should serve as temlate for writing <span class=3D"gmail-il">go=
</span> recipes<br></div></blockquote></div><br><div class=3D"gmail_extra">=
| DEBUG: Executing shell function do_compile</div><div class=3D"gmail_extra=
">| ##### Building Go bootstrap tool.</div><div class=3D"gmail_extra">| cmd=
/dist</div><div class=3D"gmail_extra">| # _/data/poky-master/tmp/work/x86_6=
4-linux/go-cross-x86_64/1.7.4-r0/go/src/cmd/dist</div><div class=3D"gmail_e=
xtra">| /data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/re=
cipe-sysroot-native/usr/lib/go/pkg/tool/linux_amd64/6l: readsym out of sync=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Sorry=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Woul=
d any logs help?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div></div>

--001a114f4108ac5a27054995bde3--
