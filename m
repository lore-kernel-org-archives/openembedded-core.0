Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDFC605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 04:08:31 +0000 (UTC)
Received: by igvg19 with SMTP id g19so86113538igv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 20:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kOOEmKPQdki4I6OuhkT/UZ1/LoS7hWfPzmQp1XBn/5Y=;
	b=I+weRU+lyQqrMtSpcZvPI2UPrhKqRC5GrvAIWtQUIPGWFMilahaTTKL6Y3e4aMdUt+
	ZdW7wr2kDxw5SUdjMk3PYpmO/AmxN7QLS5OxfG8ULMdzUevgmoaaEor2PR+VbgpULupV
	nZc/63iJmhXMFInAH+qwxhz799ZVCjz8mJFHYR2xGnFzukIAtSGWREacUsNykKXzQTyt
	ZWUFmLsI0ohEonMOj3e0CaWO4wRwsGn/XnNMHz/bWGvA8PxUpr5e8t9geLem4o+oHCkD
	R8tfxgF2+jz3qkNQtEZHDCzWBB4zHYmdlxN3p2Lao8CgCYQ685ZHea9V7LNl7yR0etKI
	WFXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kOOEmKPQdki4I6OuhkT/UZ1/LoS7hWfPzmQp1XBn/5Y=;
	b=y2K/lG2Wk4Kz/qMXdKV2YiKURV53YB1zoOD9LzrA6VTNdg9w1IAysp18f71XNvZR8u
	Yf4pKLTuY8H3x0T922wZDoyPJ6m4P7utV0gdljPhClyxBvNUJzkCG7X6d+oXIeNzymE+
	SO+4+/TsGDvDimJ2QoUIGWlXLq4R8CBZSMKXA8BVVsmjdMgxR6L3J1Hce6kSHACKgpFE
	/4KaMN9mhr8uh2SZ5E7eQhiXjsT4sSaq4D3azvl0JUsh5bHdOOHHESn382L+r/PuY5JO
	Bl5gXsBXkS+Z9z1tSU5r8oVZh+bzvO4Ry+yc0VY4wIyZ+V6uKNfkSJC4Nb3cjIaPhNnD
	rhAw==
X-Received: by 10.50.13.72 with SMTP id f8mr25255367igc.38.1448942912543; Mon,
	30 Nov 2015 20:08:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Mon, 30 Nov 2015 20:08:13 -0800 (PST)
In-Reply-To: <565D1C3B.8030201@windriver.com>
References: <1448873434-34150-1-git-send-email-fang.jia@windriver.com>
	<CABcZAN=zqR_W8S=eUNAZ4R95QsCsv7eB+ym4hanSHfeBXZHgJg@mail.gmail.com>
	<565D1C3B.8030201@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 30 Nov 2015 23:08:13 -0500
X-Google-Sender-Auth: IQny5FEXnjHsd2MqsfuUKqPd4LU
Message-ID: <CABcZANm8t+AnU9K_4QriQfxgQkS2eN7HofUxTfZWq03KJz+nJg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts.bbclass: unset command_not_found_handle
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
X-List-Received-Date: Tue, 01 Dec 2015 04:08:32 -0000
Content-Type: multipart/alternative; boundary=089e013c65de9a22f80525ce4f53

--089e013c65de9a22f80525ce4f53
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 30, 2015 at 11:04 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> On 12/01/2015 11:48 AM, Christopher Larson wrote:
>
>> On Mon, Nov 30, 2015 at 3:50 AM, Fang Jia <fang.jia@windriver.com
>> <mailto:fang.jia@windriver.com>> wrote:
>>
>>     On Ubuntu-system, When sourcing the env.sh from an exported sdk, and
>>     running a bogus linux command (for example "asd"), a core dump of
>>     python is usually generated.
>>
>>     Unset the command_not_found_handle to fix it.
>>
>>     Signed-off-by: Fang Jia <fang.jia@windriver.com <mailto:
>> fang.jia@windriver.com>>
>>
>>
>> Will this syntax be valid for non-bash environments? What about dash and
>> zsh?
>>
>
> unset is part of posix shell, I think it's fine to use it here.


Ah, good point, for some reason I read it as unsetopt, but yes, clearly
unset is portable, ignore me. :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c65de9a22f80525ce4f53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 30, 2015 at 11:04 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 12/01/2015 11:48 AM, Christopher Larson wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
On Mon, Nov 30, 2015 at 3:50 AM, Fang Jia &lt;<a href=3D"mailto:fang.jia@wi=
ndriver.com" target=3D"_blank">fang.jia@windriver.com</a><br></span><span c=
lass=3D"">
&lt;mailto:<a href=3D"mailto:fang.jia@windriver.com" target=3D"_blank">fang=
.jia@windriver.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On Ubuntu-system, When sourcing the env.sh from an exported s=
dk, and<br>
=C2=A0 =C2=A0 running a bogus linux command (for example &quot;asd&quot;), =
a core dump of<br>
=C2=A0 =C2=A0 python is usually generated.<br>
<br>
=C2=A0 =C2=A0 Unset the command_not_found_handle to fix it.<br>
<br></span>
=C2=A0 =C2=A0 Signed-off-by: Fang Jia &lt;<a href=3D"mailto:fang.jia@windri=
ver.com" target=3D"_blank">fang.jia@windriver.com</a> &lt;mailto:<a href=3D=
"mailto:fang.jia@windriver.com" target=3D"_blank">fang.jia@windriver.com</a=
>&gt;&gt;<span class=3D""><br>
<br>
<br>
Will this syntax be valid for non-bash environments? What about dash and zs=
h?<br>
</span></blockquote>
<br>
unset is part of posix shell, I think it&#39;s fine to use it here.</blockq=
uote></div><br>Ah, good point, for some reason I read it as unsetopt, but y=
es, clearly unset is portable, ignore me. :)<br>-- <br><div class=3D"gmail_=
signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bi=
tBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software En=
gineer, Mentor Graphics</div>
</div></div>

--089e013c65de9a22f80525ce4f53--
