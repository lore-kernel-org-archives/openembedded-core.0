Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id C7DA873CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 21:01:14 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so22211386igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=15XnuvOR4iVM5aDHWgzTmNC70JyFR3EuLBacoZ1D9Fk=;
	b=uv3JrnCi4ih78zUFUt0ZCsr34M/MPPzD1diRW9YyW3PRHfz0+Diw93Kp3jusjZYnmh
	7dteeg8MYcLj9Srj7WVigdMoQUUmdAOJeFyaawIlCta8RGigZdTZXsiPU7We+1exTIKv
	AqpkduVDS52Kmx6S9m442bgty58dj1tYtVKCa7SPfNgBbxso+n6xfc/TkGRGz5264m89
	UsYwqAhytnQ+hKfdmQcXTRnTRF2SKrRXOHy/VxC8vMwwhlIrpktoJTBNFctBe/CFXIwB
	pL3Cz9VSJBIWjq9BHQ3KsVu4BjRRcnPk5sUaenSgjQdNyac3xwrnTWYoNsXK4ZXtRZvD
	TWag==
X-Received: by 10.50.147.6 with SMTP id tg6mr6466234igb.68.1444338075290; Thu,
	08 Oct 2015 14:01:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Thu, 8 Oct 2015 14:00:55 -0700 (PDT)
In-Reply-To: <CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
	<CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 8 Oct 2015 14:00:55 -0700
X-Google-Sender-Auth: 3QrpnMSn1R2x4QWYTpaBhXWyNfg
Message-ID: <CABcZANm6GfP7sqVdcDo2x2v-Uq85Hns7WOG+s3K9j9N1NqG1EQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Thu, 08 Oct 2015 21:01:17 -0000
Content-Type: multipart/alternative; boundary=089e013c67c2e9d62805219e29fa

--089e013c67c2e9d62805219e29fa
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 8, 2015 at 2:00 PM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Thu, Oct 8, 2015 at 6:16 AM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
>>  oe_runconf () {
>> -       cfgscript="${S}/configure"
>> +       # Use relative path for S to avoid buildpaths in files
>> +       relative_s=`python -c "import os; print os.path.relpath('${S}',
>> '.')"`
>> +       cfgscript="$relative_s/configure"
>>
>
> Why not just use inline python here, rather than calling out to an
> external python process at task execution time?


Oh, nevermind, of course oe_runconf can be run from any number of paths :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c67c2e9d62805219e29fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Oct 8, 2015 at 2:00 PM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><d=
iv class=3D"gmail_quote">On Thu, Oct 8, 2015 at 6:16 AM, Robert Yang <span =
dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_bla=
nk">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div style=3D"overflow:hidden">=C2=A0oe_runconf () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cfgscript=3D&quot;${S}/configure&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use relative path for S to avoid buildpaths i=
n files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0relative_s=3D`python -c &quot;import os; print =
os.path.relpath(&#39;${S}&#39;, &#39;.&#39;)&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cfgscript=3D&quot;$relative_s/configure&quot;</=
div></blockquote></div><br></span>Why not just use inline python here, rath=
er than calling out to an external python process at task execution time?</=
blockquote></div><br>Oh, nevermind, of course oe_runconf can be run from an=
y number of paths :)<br>-- <br><div class=3D"gmail_signature">Christopher L=
arson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Ope=
nZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics<=
/div>
</div></div>

--089e013c67c2e9d62805219e29fa--
