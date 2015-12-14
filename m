Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 003C473173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:30:58 +0000 (UTC)
Received: by iow186 with SMTP id 186so35724296iow.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vPxe8JvKc1DPRKlpI0ZknzIlxpFJ9dg21Xp8oom4g7M=;
	b=n41WtQBh4Vkbylp40BiRfcWXrwsaRehO2Tnzkg5WiKCSH7T/Ykqg3UgQrO+JSxsvYa
	lXkyCF8opFJM66nNUhEW34TWzSY24qOIOq/iKkT5RF6MnGY5uSiHWGSq6eVTdLG6Fx1S
	A5HqgDsNUdjzWDevM2R7dXcWu4nTLWpjPRDfglJD7vc5vkYBuRXUE/0H27gZ209ENf3Z
	HXb4cwi6NO3gvUL3m4QvTMI9GBKyYungoGEut3o39HTJCdan17uaw4bnWIkYeENN6C1R
	TUgDwWNb2vW8rdX8HmYrNHjl1w1VNLMYm3lVPjl0u01O+bPgf60k/I431+8I4860EyQ+
	qt3A==
X-Received: by 10.107.153.136 with SMTP id b130mr11940406ioe.83.1450117859516; 
	Mon, 14 Dec 2015 10:30:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.69.129 with HTTP; Mon, 14 Dec 2015 10:30:40 -0800 (PST)
In-Reply-To: <CAJTo0La2XQ6JOt5Qt3eS+80LVKGEktVOKVe=pe=KpbC8X-TYAQ@mail.gmail.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
	<CAJTo0La2XQ6JOt5Qt3eS+80LVKGEktVOKVe=pe=KpbC8X-TYAQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 14 Dec 2015 11:30:40 -0700
Message-ID: <CABcZAN=1AGrZPG4xkU2BoyQWcY3GB8ezvixPX63d9U0bs_cT-g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] recipetool/devtool: send errors to stderr
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
X-List-Received-Date: Mon, 14 Dec 2015 18:31:01 -0000
Content-Type: multipart/alternative; boundary=001a1140e940e628f90526dfdf9f

--001a1140e940e628f90526dfdf9f
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 14, 2015 at 5:06 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 23 September 2015 at 19:24, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> are available in the git repository at:
>>
>>   git://github.com/kergoth/openembedded-core scriptutils-log-improvements
>>
>> https://github.com/kergoth/openembedded-core/tree/scriptutils-log-improvements
>>
>
> There's also a similar scriptutils-log-improvements-2 branch, what branch
> is the one you want merged?


The scriptutils-log-improvements branch, please. scriptutils-log-improvements-2
includes bits which aren't yet ready. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1140e940e628f90526dfdf9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Dec 14, 2015 at 5:06 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span class=3D"">On 23 September 2015 at 19:24, Christopher Larson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div style=3D"overflow:hidden">are av=
ailable in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/kergoth/openembedded-core" rel=3D=
"noreferrer" target=3D"_blank">github.com/kergoth/openembedded-core</a> scr=
iptutils-log-improvements<br>
=C2=A0 <a href=3D"https://github.com/kergoth/openembedded-core/tree/scriptu=
tils-log-improvements" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/kergoth/openembedded-core/tree/scriptutils-log-improvements</a></div></=
blockquote></div><br></span>There&#39;s also a similar scriptutils-log-impr=
ovements-2 branch, what branch is the one you want merged?</blockquote></di=
v><br></div><div class=3D"gmail_extra">The <span class=3D"">scriptutils-log=
-improvements branch, please. </span><span class=3D"">scriptutils-log-impro=
vements-2 includes bits </span>which aren&#39;t yet ready. Thanks.<br>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>ker=
goth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mai=
ntainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1140e940e628f90526dfdf9f--
