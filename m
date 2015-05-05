Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id D576D73E6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 15:43:41 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so49681673qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 08:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/kd8eoIf51pbOFMU264JlHyYeIeS+dq4HfoFyDJPfsY=;
	b=jYOJ7C9wa8Beb8UC+IKVti6mRWPf8Zb3lZSSXxkP1blCwGxrWRRtNKo8pwhNi4CeEZ
	pEWZU1QCOhoDgQ3rKZNd0Hgkkly3yqx3kzDYGRC0FZADURCyjLQ1g4nk8GRnm3N+ShTx
	lNf1WnAEvcMLrXp/XQmdJ5i62XNny4tCpTBu3+0FdRJoiZ1+RwWIght8lLxdBtEc15tc
	nr5ZUhJV/Mi1F0RUqFcgU9VwNza7X1JW1UYwixois1WSyD3BEZOzbGWNtS6sZWlQKkok
	yw6W7R2nTicDpcGpupOJ1+Y3YoCTY9anB9zeRQ96uj9gNZJbk+XKU0Z2gKwCq3490crr
	ao5Q==
X-Gm-Message-State: ALoCoQmZKZBVYvb+soh2eUf73LGJxPZy7GpIFc/bZ/UHq5Vcc1PcFoxYeItX0adVczifyV+lTLS2
X-Received: by 10.140.89.37 with SMTP id u34mr33906749qgd.15.1430840622312;
	Tue, 05 May 2015 08:43:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 5 May 2015 08:43:21 -0700 (PDT)
In-Reply-To: <1429759127-1927-1-git-send-email-rongqing.li@windriver.com>
References: <1429759127-1927-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 May 2015 16:43:21 +0100
Message-ID: <CAJTo0LZ=0w_VY4jmhS5qPTrKh3iU66S+gWYjXC34JT059qkH1g@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Tue, 05 May 2015 15:43:44 -0000
Content-Type: multipart/alternative; boundary=001a11c117ee06029b0515578b89

--001a11c117ee06029b0515578b89
Content-Type: text/plain; charset=UTF-8

On 23 April 2015 at 04:18, <rongqing.li@windriver.com> wrote:

> +export FORITY="${@base_conditional( "DEBUG_BUILD", "1", "",
> "-D_FORTIFY_SOURCE=2", d )}"
> +EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64 ${FORITY}"'
>

"FORTIFY" not "FORITY", and why does that need to be exported?

I'm also curious as to why fortify and debug builds are incompatible, and
if there's a sufficient number of problems should we just disable fortify
in security_flags.inc when debug builds are enabled?

Ross

--001a11c117ee06029b0515578b89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 April 2015 at 04:18,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqin=
g.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":cpl" class=3D"a3s"=
 style=3D"overflow:hidden">+export FORITY=3D&quot;${@base_conditional( &quo=
t;DEBUG_BUILD&quot;, &quot;1&quot;, &quot;&quot;, &quot;-D_FORTIFY_SOURCE=
=3D2&quot;, d )}&quot;<br>
+EXTRA_OEMAKE =3D &#39;AM_CFLAGS=3D&quot;-D_FILE_OFFSET_BITS=3D64 ${FORITY}=
&quot;&#39;</div></blockquote></div><br>&quot;FORTIFY&quot; not &quot;FORIT=
Y&quot;, and why does that need to be exported?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">I&#39;m also curious as to why fo=
rtify and debug builds are incompatible, and if there&#39;s a sufficient nu=
mber of problems should we just disable fortify in security_flags.inc when =
debug builds are enabled?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a11c117ee06029b0515578b89--
