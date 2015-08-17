Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B16660088
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 22:57:55 +0000 (UTC)
Received: by igfj19 with SMTP id j19so67233396igf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=3XmrV6gJx2N/rGyalsz3g1pXZU8GihWG8tMZzNHGmpQ=;
	b=LwCaRBWVkqoK3tSD+UoehXXwmxv/V3pPtW8/gRKgCq8b4hdqCMIIAua21tUz2Zq7jv
	opZQtdlz6UT9Fn2G1gaSehuGyDMGeP5cQFi1lLlK5RyTon0vOVoR0hDuXKott4j9Twcf
	GmtHkd5tc44AL6P+yRqIe8GUc10JZ29iikiYJq0x/XOEq9h2d/BEAkp1IE9XHhUq57Od
	c20wIcD5b3pjMchHilTlWJo1EXC+LeGTB4fteZwgYfRC587zfCTA0wvJUG0rtKxyD5ze
	m7E38NibOOPgkA+LIwkB5KPIHiAdZb2HpULp3EQTymT2BFKKRPENyUbV+YHzW0hpWCT9
	2COQ==
X-Received: by 10.50.103.71 with SMTP id fu7mr20032044igb.38.1439852276100;
	Mon, 17 Aug 2015 15:57:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.118.150 with HTTP; Mon, 17 Aug 2015 15:57:36 -0700 (PDT)
In-Reply-To: <8a6c98b192128c361fe5d5692b0f1d23f1cfcbad.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<8a6c98b192128c361fe5d5692b0f1d23f1cfcbad.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 17 Aug 2015 15:57:36 -0700
X-Google-Sender-Auth: mWtgjgnyyWkDOiJUMYTB-5upvoA
Message-ID: <CABcZANkAWDD5Heo+gd4G+dVuOakL1tf7qt6Qz0-Teq6_FVCDaQ@mail.gmail.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
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
X-List-Received-Date: Mon, 17 Aug 2015 22:57:57 -0000
Content-Type: multipart/alternative; boundary=047d7b2e11e77235db051d89bb89

--047d7b2e11e77235db051d89bb89
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 17, 2015 at 12:10 AM, <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Check if invalid characters are present on recipe's metadata. Fields
> taken into account are: 'DESCRIPTION', 'SUMMARY', 'LICENSE' and 'SECTION'.
>
> Signed-off-by: Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com>
>

This commit message doesn't define what "invalid" is.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b2e11e77235db051d89bb89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 17, 2015 at 12:10 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:=
leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sand=
oval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":1ls" class=3D"a3s" style=3D"overflow:hidden">From: L=
eonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.int=
el.com">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;<br>
<br>
Check if invalid characters are present on recipe&#39;s metadata. Fields<br=
>
taken into account are: &#39;DESCRIPTION&#39;, &#39;SUMMARY&#39;, &#39;LICE=
NSE&#39; and &#39;SECTION&#39;.<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.go=
nzalez@linux.intel.com">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;<=
/div></blockquote></div><br>This commit message doesn&#39;t define what &qu=
ot;invalid&quot; is.<br>-- <br><div class=3D"gmail_signature">Christopher L=
arson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Ope=
nZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics<=
/div>
</div></div>

--047d7b2e11e77235db051d89bb89--
