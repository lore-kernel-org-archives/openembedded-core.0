Return-Path: <rahulchauhankitps@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8279360CB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 13:35:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z26so6967750lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 05:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RxhXfDSu1GMWoEdLclBDRSv5aPyDQ+4CcvcFlEvrfXY=;
	b=S4W/i0nJ/UZ24WpBCn6cf1iI5Ac+IAjd5zJFYrBGS8RdKpo2qNY3UF6/wojnwKX1c+
	b3oEyixbCkRPbOPa4X6lQz+2vIMng+Nrumtid/8sq9aOsa6n4fA8O48Zq93SSBIEK0eT
	RuERIw51qkDjMTu2YXGpga4QaQr/b0szg3ePqK2pNBHQUiNDL0FOlTcaN5+ZkLmXoL6Y
	ORLCQwMpvTfW/y129vAwIirxnT8c5kjRI/wDX9jUJZJBPiTTw+wnHySwJtatjYSrGVaX
	aJjcKPvnC1EP9FmwX2i/WGcqZH9Xa8/JSN6WLurAjpoUtJia4UWZQ38aL5KluVcGFbep
	uFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RxhXfDSu1GMWoEdLclBDRSv5aPyDQ+4CcvcFlEvrfXY=;
	b=o7ZEh374NgJD9Cpm4+9T3ZETp0jIxOvaG0BTc0PbPjpNYzg6a7pqaVtANFH8iZSqJd
	O9hPR87BZKFrrLT0P+3ATmI5lbxm1ThIQwJI3yJ3bWnELdv1852t5uLPTo4mPnT4mZtp
	K5wSrRjNa5xzq8Er32nkDqmeXLqnr3gwFgytYaaK/cFw3wqq6RNLmgZn3sIR2aSE1WuC
	VQjjgFLb8CPYxe4QIps8FboOGyRoG7rGRYmTTnVFqeGvo9ndeGNQHuGqWleZMt1q3Rdj
	HR956M2SFHcFUhCLh5N9K03QtuHfnJHTEC6QfXOLtj6ptA+lTVT9agkn2pRPKSMfVTHI
	NbIw==
X-Gm-Message-State: APjAAAXZtZcp17PW30XzNdMQmlmQF05J1tEwplj1QeQvsLIrRPE3b7lW
	vp8s9WqAhvch/8RuNU7kayr4k3/+AlCXPSCicp8=
X-Google-Smtp-Source: APXvYqyFrr+fbFKYCCTJVS2DOQisEkRMfx59IM9IEr6fvkBo19r2T44Yo72g8VZJ8Af0lO/16FKPztJZIHeS6Mrm5hw=
X-Received: by 2002:ac2:5dc8:: with SMTP id x8mr3536556lfq.217.1581428117050; 
	Tue, 11 Feb 2020 05:35:17 -0800 (PST)
MIME-Version: 1.0
References: <1581358619-5570-1-git-send-email-rahulchauhankitps@gmail.com>
	<CAGk+Jeh6gN0Mk=ooVUZm7tzNu1B9+tPMhtkYk7tJm0Fb1v6dZQ@mail.gmail.com>
	<CANNYZj8kpcFzQPSeB0BZnaC_PfLOvDOqAk93S9pg+PhnffT5CA@mail.gmail.com>
	<CAGk+Jeiq+UC-PZeHojPKAdcg5FFEGngaFnz0jO7XBA5sAW6OMg@mail.gmail.com>
	<CANNYZj8kLUhhXHw9ZTm7aJpbZ-ESvxpEhRyKsfwtp1DyM1U89g@mail.gmail.com>
In-Reply-To: <CANNYZj8kLUhhXHw9ZTm7aJpbZ-ESvxpEhRyKsfwtp1DyM1U89g@mail.gmail.com>
From: rahul chauhan <rahulchauhankitps@gmail.com>
Date: Tue, 11 Feb 2020 19:05:04 +0530
Message-ID: <CAGk+JegMRnXLDM1ix9NP_BTPOmaE7NE-igm=n_7HEwZBR01P_Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ruby: fix CVE-2019-16254
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
X-List-Received-Date: Tue, 11 Feb 2020 13:35:17 -0000
Content-Type: multipart/alternative; boundary="000000000000279662059e4cedea"

--000000000000279662059e4cedea
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Tue, Feb 11, 2020 at 7:04 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Either way is fine.
>
> Alex
>
> On Tue, 11 Feb 2020 at 14:28, rahul chauhan <rahulchauhankitps@gmail.com>
> wrote:
>
>> Thanks Alexander,
>>
>> For quick response,
>> should i resubmit this patch with --subject-prefix="zeus][PATCH"
>> or
>> should i submit the next patch version.
>>
>> On Tue, Feb 11, 2020 at 6:45 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Yes. You should always specify the target branch in the subject if it is
>>> not for master.
>>>
>>> Alex
>>>
>>> On Tue, 11 Feb 2020 at 14:06, rahul chauhan <rahulchauhankitps@gmail.com>
>>> wrote:
>>>
>>>> Hi community members,
>>>>
>>>> This patch Fixes CVE-2019-16254 on zeus branch.
>>>> patch test failed, since I did not use --subject-prefix="zeus][PATCH"
>>>> at the time of patch submission to
>>>> openembedded-core@lists.openembedded.org.
>>>>
>>>> should i resubmit this patch with --subject-prefix="zeus][PATCH"
>>>> or
>>>> can anyone guide me what should do next in  this situation ?
>>>>
>>>> Thanks & Regards
>>>> Rahul Chauhan
>>>>
>>>> On Mon, Feb 10, 2020 at 11:47 PM Rahul Chauhan <
>>>> rahulchauhankitps@gmail.com> wrote:
>>>>
>>>>> Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
>>>>> ---
>>>>>  .../ruby/ruby/fix-CVE-2019-16254.patch             | 106
>>>>> +++++++++++++++++++++
>>>>>  meta/recipes-devtools/ruby/ruby_2.5.5.bb           |   1 +
>>>>>  2 files changed, 107 insertions(+)
>>>>>  create mode 100644
>>>>> meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
>>>>>
>>>>> diff --git a/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
>>>>> b/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
>>>>> new file mode 100644
>>>>> index 0000000..704c850
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch
>>>>> @@ -0,0 +1,106 @@
>>>>> +From 18d5289b4579822e391b3f5c16541e6552e9f06c Mon Sep 17 00:00:00 2001
>>>>> +From: Yusuke Endoh <mame@ruby-lang.org>
>>>>> +Date: Tue, 1 Oct 2019 12:29:18 +0900
>>>>> +Subject: [PATCH] WEBrick: prevent response splitting and header
>>>>> injection
>>>>> +
>>>>> +This is a follow up to d9d4a28f1cdd05a0e8dabb36d747d40bbcc30f16.
>>>>> +The commit prevented CRLR, but did not address an isolated CR or an
>>>>> +isolated LF.
>>>>> +
>>>>> +Upstream-Status: Backport
>>>>> https://github.com/ruby/ruby/commit/3ce238b5f9795581eb84114dcfbdf4aa086bfecc
>>>>> +CVE: CVE-2019-16254
>>>>> +
>>>>> +Co-Authored-By: NARUSE, Yui <naruse@airemix.jp>
>>>>> +Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
>>>>> +---
>>>>> + lib/webrick/httpresponse.rb       |  3 ++-
>>>>> + test/webrick/test_httpresponse.rb | 46
>>>>> +++++++++++++++++++++++++++++++++++++--
>>>>> + 2 files changed, 46 insertions(+), 3 deletions(-)
>>>>> +
>>>>> +diff --git a/lib/webrick/httpresponse.rb b/lib/webrick/httpresponse.rb
>>>>> +index 6d77692..d26324c 100644
>>>>> +--- a/lib/webrick/httpresponse.rb
>>>>> ++++ b/lib/webrick/httpresponse.rb
>>>>> +@@ -367,7 +367,8 @@ def set_error(ex, backtrace=false)
>>>>> +     private
>>>>> +
>>>>> +     def check_header(header_value)
>>>>> +-      if header_value =~ /\r\n/
>>>>> ++      header_value = header_value.to_s
>>>>> ++      if /[\r\n]/ =~ header_value
>>>>> +         raise InvalidHeader
>>>>> +       else
>>>>> +         header_value
>>>>> +diff --git a/test/webrick/test_httpresponse.rb
>>>>> b/test/webrick/test_httpresponse.rb
>>>>> +index 6263e0a..24a6968 100644
>>>>> +--- a/test/webrick/test_httpresponse.rb
>>>>> ++++ b/test/webrick/test_httpresponse.rb
>>>>> +@@ -29,7 +29,7 @@ def setup
>>>>> +       @res.keep_alive  = true
>>>>> +     end
>>>>> +
>>>>> +-    def test_prevent_response_splitting_headers
>>>>> ++    def test_prevent_response_splitting_headers_crlf
>>>>> +       res['X-header'] = "malicious\r\nCookie: hack"
>>>>> +       io = StringIO.new
>>>>> +       res.send_response io
>>>>> +@@ -39,7 +39,7 @@ def test_prevent_response_splitting_headers
>>>>> +       refute_match 'hack', io.string
>>>>> +     end
>>>>> +
>>>>> +-    def test_prevent_response_splitting_cookie_headers
>>>>> ++    def test_prevent_response_splitting_cookie_headers_crlf
>>>>> +       user_input = "malicious\r\nCookie: hack"
>>>>> +       res.cookies << WEBrick::Cookie.new('author', user_input)
>>>>> +       io = StringIO.new
>>>>> +@@ -50,6 +50,48 @@ def test_prevent_response_splitting_cookie_headers
>>>>> +       refute_match 'hack', io.string
>>>>> +     end
>>>>> +
>>>>> ++    def test_prevent_response_splitting_headers_cr
>>>>> ++      res['X-header'] = "malicious\rCookie: hack"
>>>>> ++      io = StringIO.new
>>>>> ++      res.send_response io
>>>>> ++      io.rewind
>>>>> ++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
>>>>> ++      assert_equal '500', res.code
>>>>> ++      refute_match 'hack', io.string
>>>>> ++    end
>>>>> ++
>>>>> ++    def test_prevent_response_splitting_cookie_headers_cr
>>>>> ++      user_input = "malicious\rCookie: hack"
>>>>> ++      res.cookies << WEBrick::Cookie.new('author', user_input)
>>>>> ++      io = StringIO.new
>>>>> ++      res.send_response io
>>>>> ++      io.rewind
>>>>> ++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
>>>>> ++      assert_equal '500', res.code
>>>>> ++      refute_match 'hack', io.string
>>>>> ++    end
>>>>> ++
>>>>> ++    def test_prevent_response_splitting_headers_lf
>>>>> ++      res['X-header'] = "malicious\nCookie: hack"
>>>>> ++      io = StringIO.new
>>>>> ++      res.send_response io
>>>>> ++      io.rewind
>>>>> ++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
>>>>> ++      assert_equal '500', res.code
>>>>> ++      refute_match 'hack', io.string
>>>>> ++    end
>>>>> ++
>>>>> ++    def test_prevent_response_splitting_cookie_headers_lf
>>>>> ++      user_input = "malicious\nCookie: hack"
>>>>> ++      res.cookies << WEBrick::Cookie.new('author', user_input)
>>>>> ++      io = StringIO.new
>>>>> ++      res.send_response io
>>>>> ++      io.rewind
>>>>> ++      res = Net::HTTPResponse.read_new(Net::BufferedIO.new(io))
>>>>> ++      assert_equal '500', res.code
>>>>> ++      refute_match 'hack', io.string
>>>>> ++    end
>>>>> ++
>>>>> +     def test_304_does_not_log_warning
>>>>> +       res.status      = 304
>>>>> +       res.setup_header
>>>>> +--
>>>>> +2.7.4
>>>>> diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
>>>>> b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
>>>>> index 223b037..58bb97f 100644
>>>>> --- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
>>>>> +++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
>>>>> @@ -3,6 +3,7 @@ require ruby.inc
>>>>>  SRC_URI += " \
>>>>>
>>>>> file://0001-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
>>>>>             file://run-ptest \
>>>>> +           file://fix-CVE-2019-16254.patch \
>>>>>             "
>>>>>
>>>>>  SRC_URI[md5sum] = "7e156fb526b8f4bb1b30a3dd8a7ce400"
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>

--000000000000279662059e4cedea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks. <br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2020 at 7:04 PM Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">Either way is fine.<div><br></div><div>Alex</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
11 Feb 2020 at 14:28, rahul chauhan &lt;<a href=3D"mailto:rahulchauhankitps=
@gmail.com" target=3D"_blank">rahulchauhankitps@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div>Thanks Alexander,</div><div><br></div><div>For quick response, <br></di=
v><div>should i resubmit this patch with --subject-prefix=3D&quot;zeus][PAT=
CH&quot; <br>or <br>should i submit the next patch version.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Fe=
b 11, 2020 at 6:45 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Yes. Yo=
u should always specify=C2=A0the target branch in the subject if it is not =
for master.<div><br></div><div>Alex</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Feb 2020 at 14:06, rahu=
l chauhan &lt;<a href=3D"mailto:rahulchauhankitps@gmail.com" target=3D"_bla=
nk">rahulchauhankitps@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi community members=
,</div><div><br></div><div>This patch Fixes CVE-2019-16254 on zeus branch.<=
/div>patch test failed, since I did not use --subject-prefix=3D&quot;zeus][=
PATCH&quot; at the time of patch submission to <a href=3D"mailto:openembedd=
ed-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.o=
penembedded.org</a>.<br>=C2=A0<br><div>should i resubmit this patch with --=
subject-prefix=3D&quot;zeus][PATCH&quot;</div><div>or <br></div><div>can an=
yone guide me what should do next in =C2=A0this situation ?<br></div><div><=
br></div><div>Thanks &amp; Regards</div><div>Rahul Chauhan<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Feb 10, 2020 at 11:47 PM Rahul Chauhan &lt;<a href=3D"mailto:rahulchauhank=
itps@gmail.com" target=3D"_blank">rahulchauhankitps@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:=
 Rahul Chauhan &lt;<a href=3D"mailto:rahulchauhankitps@gmail.com" target=3D=
"_blank">rahulchauhankitps@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ruby/ruby/fix-CVE-2019-16254.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 106 +++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.5.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 107 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254=
.patch<br>
<br>
diff --git a/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch b/met=
a/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch<br>
new file mode 100644<br>
index 0000000..704c850<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/ruby/ruby/fix-CVE-2019-16254.patch<br>
@@ -0,0 +1,106 @@<br>
+From 18d5289b4579822e391b3f5c16541e6552e9f06c Mon Sep 17 00:00:00 2001<br>
+From: Yusuke Endoh &lt;<a href=3D"mailto:mame@ruby-lang.org" target=3D"_bl=
ank">mame@ruby-lang.org</a>&gt;<br>
+Date: Tue, 1 Oct 2019 12:29:18 +0900<br>
+Subject: [PATCH] WEBrick: prevent response splitting and header injection<=
br>
+<br>
+This is a follow up to d9d4a28f1cdd05a0e8dabb36d747d40bbcc30f16.<br>
+The commit prevented CRLR, but did not address an isolated CR or an<br>
+isolated LF.<br>
+<br>
+Upstream-Status: Backport <a href=3D"https://github.com/ruby/ruby/commit/3=
ce238b5f9795581eb84114dcfbdf4aa086bfecc" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/ruby/ruby/commit/3ce238b5f9795581eb84114dcfbdf4aa086b=
fecc</a><br>
+CVE: CVE-2019-16254<br>
+<br>
+Co-Authored-By: NARUSE, Yui &lt;<a href=3D"mailto:naruse@airemix.jp" targe=
t=3D"_blank">naruse@airemix.jp</a>&gt;<br>
+Signed-off-by: Rahul Chauhan &lt;<a href=3D"mailto:rahulchauhankitps@gmail=
.com" target=3D"_blank">rahulchauhankitps@gmail.com</a>&gt;<br>
+---<br>
+ lib/webrick/httpresponse.rb=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
+ test/webrick/test_httpresponse.rb | 46 ++++++++++++++++++++++++++++++++++=
+++--<br>
+ 2 files changed, 46 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/lib/webrick/httpresponse.rb b/lib/webrick/httpresponse.rb<br>
+index 6d77692..d26324c 100644<br>
+--- a/lib/webrick/httpresponse.rb<br>
++++ b/lib/webrick/httpresponse.rb<br>
+@@ -367,7 +367,8 @@ def set_error(ex, backtrace=3Dfalse)<br>
+=C2=A0 =C2=A0 =C2=A0private<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0def check_header(header_value)<br>
+-=C2=A0 =C2=A0 =C2=A0 if header_value =3D~ /\r\n/<br>
++=C2=A0 =C2=A0 =C2=A0 header_value =3D header_value.to_s<br>
++=C2=A0 =C2=A0 =C2=A0 if /[\r\n]/ =3D~ header_value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise InvalidHeader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0header_value<br>
+diff --git a/test/webrick/test_httpresponse.rb b/test/webrick/test_httpres=
ponse.rb<br>
+index 6263e0a..24a6968 100644<br>
+--- a/test/webrick/test_httpresponse.rb<br>
++++ b/test/webrick/test_httpresponse.rb<br>
+@@ -29,7 +29,7 @@ def setup<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@res.keep_alive=C2=A0 =3D true<br>
+=C2=A0 =C2=A0 =C2=A0end<br>
+<br>
+-=C2=A0 =C2=A0 def test_prevent_response_splitting_headers<br>
++=C2=A0 =C2=A0 def test_prevent_response_splitting_headers_crlf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res[&#39;X-header&#39;] =3D &quot;malicious\r\n=
Cookie: hack&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0io =3D StringIO.new<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res.send_response io<br>
+@@ -39,7 +39,7 @@ def test_prevent_response_splitting_headers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0refute_match &#39;hack&#39;, io.string<br>
+=C2=A0 =C2=A0 =C2=A0end<br>
+<br>
+-=C2=A0 =C2=A0 def test_prevent_response_splitting_cookie_headers<br>
++=C2=A0 =C2=A0 def test_prevent_response_splitting_cookie_headers_crlf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0user_input =3D &quot;malicious\r\nCookie: hack&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res.cookies &lt;&lt; WEBrick::Cookie.new(&#39;a=
uthor&#39;, user_input)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0io =3D StringIO.new<br>
+@@ -50,6 +50,48 @@ def test_prevent_response_splitting_cookie_headers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0refute_match &#39;hack&#39;, io.string<br>
+=C2=A0 =C2=A0 =C2=A0end<br>
+<br>
++=C2=A0 =C2=A0 def test_prevent_response_splitting_headers_cr<br>
++=C2=A0 =C2=A0 =C2=A0 res[&#39;X-header&#39;] =3D &quot;malicious\rCookie:=
 hack&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 io =3D StringIO.new<br>
++=C2=A0 =C2=A0 =C2=A0 res.send_response io<br>
++=C2=A0 =C2=A0 =C2=A0 io.rewind<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D Net::HTTPResponse.read_new(Net::BufferedIO.n=
ew(io))<br>
++=C2=A0 =C2=A0 =C2=A0 assert_equal &#39;500&#39;, res.code<br>
++=C2=A0 =C2=A0 =C2=A0 refute_match &#39;hack&#39;, io.string<br>
++=C2=A0 =C2=A0 end<br>
++<br>
++=C2=A0 =C2=A0 def test_prevent_response_splitting_cookie_headers_cr<br>
++=C2=A0 =C2=A0 =C2=A0 user_input =3D &quot;malicious\rCookie: hack&quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 res.cookies &lt;&lt; WEBrick::Cookie.new(&#39;author=
&#39;, user_input)<br>
++=C2=A0 =C2=A0 =C2=A0 io =3D StringIO.new<br>
++=C2=A0 =C2=A0 =C2=A0 res.send_response io<br>
++=C2=A0 =C2=A0 =C2=A0 io.rewind<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D Net::HTTPResponse.read_new(Net::BufferedIO.n=
ew(io))<br>
++=C2=A0 =C2=A0 =C2=A0 assert_equal &#39;500&#39;, res.code<br>
++=C2=A0 =C2=A0 =C2=A0 refute_match &#39;hack&#39;, io.string<br>
++=C2=A0 =C2=A0 end<br>
++<br>
++=C2=A0 =C2=A0 def test_prevent_response_splitting_headers_lf<br>
++=C2=A0 =C2=A0 =C2=A0 res[&#39;X-header&#39;] =3D &quot;malicious\nCookie:=
 hack&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 io =3D StringIO.new<br>
++=C2=A0 =C2=A0 =C2=A0 res.send_response io<br>
++=C2=A0 =C2=A0 =C2=A0 io.rewind<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D Net::HTTPResponse.read_new(Net::BufferedIO.n=
ew(io))<br>
++=C2=A0 =C2=A0 =C2=A0 assert_equal &#39;500&#39;, res.code<br>
++=C2=A0 =C2=A0 =C2=A0 refute_match &#39;hack&#39;, io.string<br>
++=C2=A0 =C2=A0 end<br>
++<br>
++=C2=A0 =C2=A0 def test_prevent_response_splitting_cookie_headers_lf<br>
++=C2=A0 =C2=A0 =C2=A0 user_input =3D &quot;malicious\nCookie: hack&quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 res.cookies &lt;&lt; WEBrick::Cookie.new(&#39;author=
&#39;, user_input)<br>
++=C2=A0 =C2=A0 =C2=A0 io =3D StringIO.new<br>
++=C2=A0 =C2=A0 =C2=A0 res.send_response io<br>
++=C2=A0 =C2=A0 =C2=A0 io.rewind<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D Net::HTTPResponse.read_new(Net::BufferedIO.n=
ew(io))<br>
++=C2=A0 =C2=A0 =C2=A0 assert_equal &#39;500&#39;, res.code<br>
++=C2=A0 =C2=A0 =C2=A0 refute_match &#39;hack&#39;, io.string<br>
++=C2=A0 =C2=A0 end<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_304_does_not_log_warning<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res.status=C2=A0 =C2=A0 =C2=A0 =3D 304<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res.setup_header<br>
+--<br>
+2.7.4<br>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" re=
l=3D"noreferrer" target=3D"_blank">ruby_2.5.5.bb</a> b/meta/recipes-devtool=
s/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"noreferrer" target=3D"_blank=
">ruby_2.5.5.bb</a><br>
index 223b037..58bb97f 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.5.5.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.5.5.bb</a><br>
@@ -3,6 +3,7 @@ require ruby.inc<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-check-fi=
nite-isinf-isnan-as-macros-firs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2019-16254.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;7e156fb526b8f4bb1b30a3dd8a7ce400&quot;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000279662059e4cedea--
