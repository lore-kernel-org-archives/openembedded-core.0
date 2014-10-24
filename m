Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9416AC0D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 11:08:41 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id j7so734225qaq.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 04:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l1NxSOecdUU9UDN1hkQlFBE76YaQW+UQqeaa8C2ly+Y=;
	b=lJ1vl5xrCu1xhN24EdmHVJt6Ld8oL6F42dXxpfUJFJ/RzR2VgyZwgC9Vno4eaq9BLC
	veOZaUgq41SQd0RjE8KMLlB3GVnFZhhtXlqhEbOixdzXvJxPFPb8FZBr8D7FMZb8nTmw
	lvQeTkJpsW774YhfT+VOtpMt25FOIx3kqQhU+h8WV48fkA/oWdvpDQTUgxxWylbDYBol
	tT6bJ8DQeueVXhtwmX+gmQ1pe69Xyb1EhCGz7Hmg3yJr/nC0IF1U0u2hfa1r1P3PrN5Z
	v25rJxfcDbeS1pcVpo+debxo53evEQt0FpcRpZ9zmrpvAo3JHJj67DAWilqV21EzpAKA
	Bkiw==
X-Gm-Message-State: ALoCoQnUdmxjVB91Qy7uxYqjhjjt8F9Ws7y1SxQgaZAxNnwJmKb/MtNU92rSB7G/7nnUby3sVAe0
X-Received: by 10.170.37.10 with SMTP id 10mr5523223ykf.99.1414148921804; Fri,
	24 Oct 2014 04:08:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Fri, 24 Oct 2014 04:08:20 -0700 (PDT)
In-Reply-To: <a7d924a83ec81fcff71ba17281c892f1f3778495.1414131798.git.Chong.Lu@windriver.com>
References: <cover.1414131798.git.Chong.Lu@windriver.com>
	<a7d924a83ec81fcff71ba17281c892f1f3778495.1414131798.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Oct 2014 12:08:20 +0100
Message-ID: <CAJTo0LY_TALpKFyeFtV-wUOVHhkJxwLTy2VYTgUiGb56gXkEdQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Fri, 24 Oct 2014 11:08:44 -0000
Content-Type: multipart/alternative; boundary=001a11378d5a24dd8c05062934b7

--001a11378d5a24dd8c05062934b7
Content-Type: text/plain; charset=UTF-8

On 24 October 2014 07:25, Chong Lu <Chong.Lu@windriver.com> wrote:

> +++ b/meta/recipes-kernel/kmod/kmod/run-ptest
> @@ -1,3 +1,4 @@
>  #!/bin/sh
>  touch testsuite/stamp-rootfs
> +tar xf testmodule.tar
>  make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
>

We should to make sure that the ptest scripts clean up after themselves, so
can you change this to delete the modules after the test has ran?

Ross

--001a11378d5a24dd8c05062934b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 October 2014 07:25, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden=
">+++ b/meta/recipes-kernel/kmod/kmod/run-ptest<br>
@@ -1,3 +1,4 @@<br>
=C2=A0#!/bin/sh<br>
=C2=A0touch testsuite/stamp-rootfs<br>
+tar xf testmodule.tar<br>
=C2=A0make -k runtest-TESTS 2&gt;/dev/null| grep -e ^PASS -e ^FAIL</div></b=
lockquote><div><br></div><div>We should to make sure that the ptest scripts=
 clean up after themselves, so can you change this to delete the modules af=
ter the test has ran?</div><div><br></div><div>Ross</div></div></div></div>

--001a11378d5a24dd8c05062934b7--
