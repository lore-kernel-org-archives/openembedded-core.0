Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2F63A71BF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 12:33:02 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id l23so15986326ybj.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fuilx8i14+jXYnVTaPxePkTNbUHlKRZ6xSddCLTNap4=;
	b=xk7EiOvwIJJhhaKUnrOeymqZ5+ai9CLWdQUNUhfqBnyumxNsQ3RBBN4g0p3O3H1dJi
	3F5WKUKUpF87n+Pcx2bk48iC8btcqVl2+QNvgMBlr/dnXbGAHMCMFdvTvxCxufhd2tUU
	spidQ7vNp2BBmCSrG2BpU0CyqIEwssi0WBcQpJSY71yX174Buem5ds7+vEgRNRqHZ0Fj
	GN/hRkmKMK8MdvPQAQgk7ELFgKK0MBIap0BozAvayX9urwHxONzeRXR545tKaCCWpKrT
	WnJeQYEmOzy4djyhOhPjqzhLPfjMCc575IJpfUwl7wWlDs+Xlkgm5rLGVlBgVF4Sgr+d
	qWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fuilx8i14+jXYnVTaPxePkTNbUHlKRZ6xSddCLTNap4=;
	b=TEox3njTtug2Ke67QM0/5bVCjegUtx3BjWu9hH08lKQaYXvcaNG2LFi7DCqdTk7Toj
	LsSwhly95Ltb+r624zW3oVZL0AbU4cnzrVj/4aBAvgsFeOO1v1FYP8Yh1GpqYVvMRNUR
	TPgCDkKLruiUI73Us5SzJcqi/i9BQxuhXuel7Tbj8PM3sjwo5X9aU6qE4KHO/YsRcL6y
	HAXo+F4uQbXbhsL2TekxT2Zc/DCtQacrnNkseGxWSRIRQu/ezof7tdwTPbsQusjk+Di5
	b3Ejy1ImrO4ZEoe0LPsjWmFjexhY4cl8pF+yYYg9XFmW1eGyC+moz6fi+a/6vRVWcRg+
	9xLA==
X-Gm-Message-State: AIkVDXLtFh4+OXMbQanv64i+W26ipZ9Hbi32HQbIyvLgbH/ug92WZvmpHeCZ74EwlX1MrnSpZxufeIt4leztxbtx
X-Received: by 10.37.21.195 with SMTP id 186mr6384504ybv.103.1484829182981;
	Thu, 19 Jan 2017 04:33:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Thu, 19 Jan 2017 04:32:32 -0800 (PST)
In-Reply-To: <CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com>
References: <cover.1484819263.git.dengke.du@windriver.com>
	<5f146756851fbbddb0b37c85b2705857495d38e0.1484819263.git.dengke.du@windriver.com>
	<CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 19 Jan 2017 14:32:32 +0200
Message-ID: <CAHiDW_FMcOb2-Rmh0bgJ7jksK47WUDxNzZwGJHG42Tp0QE08yw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssh: upgrade to 7.4p1
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
X-List-Received-Date: Thu, 19 Jan 2017 12:33:03 -0000
Content-Type: multipart/alternative; boundary=001a113e43da01272c054671bcb7

--001a113e43da01272c054671bcb7
Content-Type: text/plain; charset=UTF-8

On 19 January 2017 at 13:52, Burton, Ross <ross.burton@intel.com> wrote:

> You're removing this patch:
>
> On 19 January 2017 at 09:50, Dengke Du <dengke.du@windriver.com> wrote:
>
>> --- a/meta/recipes-connectivity/openssh/openssh/add-test-support
>> -for-busybox.patch
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -Adjust test cases to work with busybox.
>> -
>> -- Replace dd parameter "obs" with "bs".
>> -- Replace "head -<num>" with "head -n <num>".
>> -
>> -Signed-off-by: Maxin B. John <maxin.john@enea.com>
>> -Upstream-Status: Pending
>> -
>> -Index: openssh-6.8p1/regress/cipher-speed.sh
>> -===================================================================
>> ---- openssh-6.8p1.orig/regress/cipher-speed.sh
>> -+++ openssh-6.8p1/regress/cipher-speed.sh
>> -@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
>> -               printf "%-60s" "$c/$m:"
>> -               ( ${SSH} -o 'compression no' \
>> -                       -F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
>> --                      exec sh -c \'"dd of=/dev/null obs=32k"\' \
>> -+                      exec sh -c \'"dd of=/dev/null bs=32k"\' \
>>
>
> But upstream still has exec sh -c \'"dd of=/dev/null obs=32k"\', so this
> patch is still needed.
>
> Please always explain why patches are being removed in the commit message.
>

There's also lots of changes to the remaining patches. Some of them look
weird -- possibly they're just whitespace changes? Please mention what the
patch changes are in the commit message.

Jussi

--001a113e43da01272c054671bcb7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 19 January 2017 at 13:52, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra">You&#39;re removing this patch:</div><div class=3D"=
gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 19 January =
2017 at 09:50, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto:dengke.du@=
windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><div id=3D"m_-6663932194610955239gmail-:g0" class=
=3D"m_-6663932194610955239gmail-a3s m_-6663932194610955239gmail-aXjCH m_-66=
63932194610955239gmail-m159b623a3630db7c">--- a/meta/recipes-connectivity/o=
p<wbr>enssh/openssh/add-test-support<wbr>-for-busybox.patch<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-Adjust test cases to work with busybox.<br>
-<br>
-- Replace dd parameter &quot;obs&quot; with &quot;bs&quot;.<br>
-- Replace &quot;head -&lt;num&gt;&quot; with &quot;head -n &lt;num&gt;&quo=
t;.<br>
-<br>
-Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@enea.com" ta=
rget=3D"_blank">maxin.john@enea.com</a>&gt;<br>
-Upstream-Status: Pending<br>
-<br>
-Index: openssh-6.8p1/regress/cipher-s<wbr>peed.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssh-6.8p1.orig/regress/cip<wbr>her-speed.sh<br>
-+++ openssh-6.8p1/regress/cipher-s<wbr>peed.sh<br>
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=3D0; for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;%-60s&=
quot; &quot;$c/$m:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0( ${SSH} -o &#39;co=
mpression no&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-F $OBJ/ssh_proxy -2 -m $m -c $c somehost \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exec sh -c \&#39;&quot;dd of=3D/dev/null obs=3D32k&quot;\&#39; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exec sh -c \&#39;&quot;dd of=3D/dev/null bs=3D32k&quot;\&#39; \</div></=
blockquote></div><br></span>But upstream still has exec sh -c \&#39;&quot;d=
d of=3D/dev/null obs=3D32k&quot;\&#39;, so this patch is still needed.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Please alw=
ays explain why patches are being removed in the commit message.</div></div=
></blockquote><div><br></div><div>There&#39;s also lots of changes to the r=
emaining patches. Some of them look weird -- possibly they&#39;re just whit=
espace changes? Please mention what the patch changes are in the commit mes=
sage.</div><div><br></div><div>Jussi</div></div></div></div>

--001a113e43da01272c054671bcb7--
