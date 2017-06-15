Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE3D78077
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 11:32:04 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u19so16160231qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fV5VBWWWjbkMpXisCnHC4J8j6Ka/5Zkp+4xiONSCcjM=;
	b=aboGCoeyyReiwSSHx6P07BgGlOeWl7mQKfvQOkp3VNmvuXRE9DQx5j9GrdiDOba7nk
	I/YXhLVzXrNDt+oSis6qPqy51VL6z5H2Mad8FP847hGFUsnHlgND8360X4XeH/PZu1dT
	InWC7ax4P+BLiCzksOyUkAaOcOEyGRxwP16BMX4n3lAmWMbUqhk8zJTBBDLoA2Z47QH4
	UjEWCdC7hzGz2S18Rjq2CanL/t+ifiZEuNr4VwlGXe1nW9iu7kxMRt5sHQElsY7wkg1d
	nlpd9ter1mpXBMcEsy4zily9gDpg+E3u7V9ACQd7KBx1dIUZNijiZEhAH1E83HbjVWoM
	Ex7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fV5VBWWWjbkMpXisCnHC4J8j6Ka/5Zkp+4xiONSCcjM=;
	b=f0AD8fhXzYrevxn81CjVVvx19cAYL9em9cLKGsMdICWEOldO/fk9I5QYEyeQGZMstC
	4Vmz/IKCntaOVaNzm5EqHItNonZQef5gk5FEZn+bfJmnfiZ+Y53bJ1Sb47VlrU+DCnrL
	h8VXaxZroEUOHQjYlHISAowoqwUuSV+5mpW7EFXzKDT7j6YS/h4t2kZmQuUI/jMc0SKa
	mlHWy18KVYKEfvWLNRq9e/fGc/vPalTLgAF7jNhJwEjEebxYMbH/QOWXNC/403ZYdKnX
	sDp4kh288oQJ3YLYDk5lkrKBJt6FhqutfhxmxcAIiNfmlZ3UJScMomx3qT/8ZX0IDEY3
	j2Yg==
X-Gm-Message-State: AKS2vOxghfeZYxFmXTNGJgwLDYFYKxqMJOFti2f6tr4o0AicKOVG574c
	7mAMnZkC/E/qg5boOh8eIP6pvvMW5B77
X-Received: by 10.237.49.41 with SMTP id 38mr5883261qtg.161.1497526326024;
	Thu, 15 Jun 2017 04:32:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 04:31:45 -0700 (PDT)
In-Reply-To: <1497508479-18852-2-git-send-email-andrej.valek@siemens.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
	<1497508479-18852-2-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 12:31:45 +0100
Message-ID: <CAJTo0Lb41uTXQp7Hbh7xBWd-B088ygi9gdTOAVJgGdMaYKfq0g@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] libxml2: Disable LeakSanitizer when running API tests
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
X-List-Received-Date: Thu, 15 Jun 2017 11:32:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c955cb470f60551fe04d8"

--94eb2c0c955cb470f60551fe04d8
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 07:34, Andrej Valek <andrej.valek@siemens.com> wrote:

> Upstream-Status: Backported - [https://git.gnome.org/browse/
> libxml2/commit/?id=ac9a4560ee85b18811ff8ab7791ddfff7b144b0a]
>



> --- a/meta/recipes-core/libxml/libxml2/runtest.patch
> +++ b/meta/recipes-core/libxml/libxml2/runtest.patch
> @@ -5,9 +5,9 @@ Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
>  Upstream-Status: Pending
>

Upstream-Status goes into the path file itself, not the commit log.

Ross

--94eb2c0c955cb470f60551fe04d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 07:34, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2kq" clas=
s=3D"a3s aXjCH m15caa7893c2822d1">Upstream-Status: Backported - [<a href=3D=
"https://git.gnome.org/browse/libxml2/commit/?id=3Dac9a4560ee85b18811ff8ab7=
791ddfff7b144b0a" rel=3D"noreferrer" target=3D"_blank">https://git.gnome.or=
g/browse/<wbr>libxml2/commit/?id=3D<wbr>ac9a4560ee85b18811ff8ab7791ddf<wbr>=
ff7b144b0a</a>]<br></div></blockquote><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div id=3D":2kq" class=3D"a3s aXjCH m15caa7893c28=
22d1">
--- a/meta/recipes-core/libxml/<wbr>libxml2/runtest.patch<br>
+++ b/meta/recipes-core/libxml/<wbr>libxml2/runtest.patch<br>
@@ -5,9 +5,9 @@ Signed-off-by: Mihaela Sendrea &lt;<a href=3D"mailto:mihael=
a.sendrea@enea.com">mihaela.sendrea@enea.com</a>&gt;<br>
=C2=A0Upstream-Status: Pending</div></blockquote></div><br>Upstream-Status =
goes into the path file itself, not the commit log.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c955cb470f60551fe04d8--
