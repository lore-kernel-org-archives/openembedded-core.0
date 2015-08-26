Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id B45F676B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:16:07 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so44333804igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LKilz40W061BDRQmJ0KUNryQWH+KYILkGSd8VxyLD6c=;
	b=irneQRctho7hc5X96PoY8lT5ikwzY8t1wXhaW3QovQ3sj0MOjKThwRTb91xdhpE5dD
	8ktTkz5rjWixFVc2foSgdDSCyiLg2WQfEoUjwlcoPHeslRBEkXAorBFfcwv3HBqAxtuk
	mzfFOW12lyRtkxwYwv7cJMMRzj1qo83r5645GYgfBIXbcQTabvij6Z9KXZqTU2r9ADoh
	yYUmijUDnrvn5rTd6jfLLidZaVu4DgRVc79pIw6U7YaxpMumatpDCrNY4EmcEuRK6nZo
	CfoAKn0/tiYgoJDUjytA0hDNlNbn+xOnr31Qkr4UVPPET9W8H0zKagFmi0ENQpqsM49Q
	XgLg==
X-Received: by 10.50.108.37 with SMTP id hh5mr669958igb.10.1440605767598; Wed,
	26 Aug 2015 09:16:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Wed, 26 Aug 2015 09:15:48 -0700 (PDT)
In-Reply-To: <55DDE5BE.9020405@linux.intel.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<8a6c98b192128c361fe5d5692b0f1d23f1cfcbad.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CABcZANkAWDD5Heo+gd4G+dVuOakL1tf7qt6Qz0-Teq6_FVCDaQ@mail.gmail.com>
	<55DDE5BE.9020405@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 26 Aug 2015 09:15:48 -0700
X-Google-Sender-Auth: gLVVfhseoCMDlQXGNDAWAzbcc_g
Message-ID: <CABcZANmGQyBCxZJzL3gSXGFZNiy1_GTsk=RvO67gVU4e6vg8Kg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] insane.bbclass: Check for invalid characters (non UTF8) on recipe metadata
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
X-List-Received-Date: Wed, 26 Aug 2015 16:16:09 -0000
Content-Type: multipart/alternative; boundary=089e01493b5a0a0a89051e392bf5

--089e01493b5a0a0a89051e392bf5
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 9:13 AM, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> hi Chris,
>
> On 08/17/2015 05:57 PM, Christopher Larson wrote:
>
>> On Mon, Aug 17, 2015 at 12:10 AM, <
>> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>>
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>>
>>> Check if invalid characters are present on recipe's metadata. Fields
>>> taken into account are: 'DESCRIPTION', 'SUMMARY', 'LICENSE' and
>>> 'SECTION'.
>>>
>>> Signed-off-by: Leonardo Sandoval <
>>> leonardo.sandoval.gonzalez@linux.intel.com>
>>>
>>>
>> This commit message doesn't define what "invalid" is.
>>
>
> Looking it closely, the commit message does include in parenthesis what is
> meant by 'invalid'.
>
> Any concert about this definition?
>

Ah, the details were in the summary, but not the description. Generally
that should be the other way around, but at least the info is there, so no
objections.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01493b5a0a0a89051e392bf5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 26, 2015 at 9:13 AM, Leonardo Sandoval <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blan=
k">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div id=3D":1tg" class=3D"a3s" style=3D"overflow=
:hidden">hi Chris,<span class=3D""><br>
<br>
On 08/17/2015 05:57 PM, Christopher Larson wrote:<br>
</span><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Mon, Aug 17, 2015 at 12:10 AM, &lt;<br>
<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_bl=
ank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@li=
nux.intel.com" target=3D"_blank">leonardo.sandoval.gonzalez@linux.intel.com=
</a>&gt;<br>
<br>
Check if invalid characters are present on recipe&#39;s metadata. Fields<br=
>
taken into account are: &#39;DESCRIPTION&#39;, &#39;SUMMARY&#39;, &#39;LICE=
NSE&#39; and &#39;SECTION&#39;.<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<br>
<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_bl=
ank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;<br>
<br>
</blockquote>
<br>
This commit message doesn&#39;t define what &quot;invalid&quot; is.<br>
</blockquote>
<br></span>
Looking it closely, the commit message does include in parenthesis what is =
meant by &#39;invalid&#39;.<br>
<br>
Any concert about this definition?</div></blockquote></div><br>Ah, the deta=
ils were in the summary, but not the description. Generally that should be =
the other way around, but at least the info is there, so no objections.<br>=
-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kerg=
oth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - =
Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e01493b5a0a0a89051e392bf5--
