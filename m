Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id ADBAC73694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 14:53:52 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so134357690qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=gDL4cPT5zrB9hA6HHjBthX/FAzYUN4zeA01SG9VWBRc=;
	b=dKCDVkoHaRnYrr1EtKfSqYk/cKEoe2Fk9XCCd+X04OHJdtwAw2xlo6Rlffqba2nD72
	0uHjhXRM0lOFZAx+LHxlfiJlMlTdnm2Inzr0iPhQ77TED6QJATN8glJgWEdXQiQhS+C9
	awFhaLfhva+AkN9dpsTGCz8cFAw1F0Aag8fHXfT+UwLxNomsVYXOcSlEAa4SEfXJRt2E
	mirUn4JbeNnoee2PJOmPeh/TKlF5KiOlh8Yr2K0KW+LXsi6GmJVm5+uSE4n6ZZrId4gQ
	eTOxSsyAHAEoa0UicoMhYhY8a2k9klbe6arfGegVdl3H3VOZFpsRLrioGDfHa8UYY7G9
	h2Bw==
X-Received: by 10.140.165.150 with SMTP id l144mr48551856qhl.99.1437490432426; 
	Tue, 21 Jul 2015 07:53:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Tue, 21 Jul 2015 07:53:33 -0700 (PDT)
In-Reply-To: <c3b8e75db6f2ebc1bd9e53a4f01da0d642e4edcb.1437461993.git.zhe.he@windriver.com>
References: <cover.1437461993.git.zhe.he@windriver.com>
	<c3b8e75db6f2ebc1bd9e53a4f01da0d642e4edcb.1437461993.git.zhe.he@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 21 Jul 2015 07:53:33 -0700
X-Google-Sender-Auth: 33EOTldS67UrWm05-0FLtp5FLRM
Message-ID: <CABcZAN=D=2FUBHmSRiwYE7PbqHsjYJUQB5PkfvnQYO-=YFJecw@mail.gmail.com>
To: zhe.he@windriver.com
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] kernel: Define KERNEL_IMAGETYPE as a list
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
X-List-Received-Date: Tue, 21 Jul 2015 14:53:52 -0000
Content-Type: multipart/alternative; boundary=001a1134effa97c9a8051b63d2b1

--001a1134effa97c9a8051b63d2b1
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 21, 2015 at 12:23 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> To support building packaging and installing multi types of kernel
> images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
> as a list.
> Modify wherever reference KERNEL_IMAGETYPE accordingly.
>
> Fixes [YOCTO #6945].
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
>

Question, why not add KERNEL_IMAGETYPES, and make KERNEL_IMAGETYPE equal to
your new KERNEL_IMAGETYPE_0?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134effa97c9a8051b63d2b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jul 21, 2015 at 12:23 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:=
zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":384" class=3D"a3s" st=
yle=3D"overflow:hidden">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver=
.com">zhe.he@windriver.com</a>&gt;<br>
<br>
To support building packaging and installing multi types of kernel<br>
images, such as zImage uImage, at one time define KERNEL_IMAGETYPE<br>
as a list.<br>
Modify wherever reference KERNEL_IMAGETYPE accordingly.<br>
<br>
Fixes [YOCTO #6945].<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;</div></blockquote></div><br>Question, why not add KERNE=
L_IMAGETYPES, and make KERNEL_IMAGETYPE equal to your new KERNEL_IMAGETYPE_=
0?<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson a=
t kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintai=
ner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1134effa97c9a8051b63d2b1--
