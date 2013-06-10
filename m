Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 06E2F62062
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:05:06 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so2063746oag.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=glg1p7fpP8nfQXL2YMU4b2lzb0sowb+5hcXc8PD2cGQ=;
	b=Ba5IMZ1ukqBJCU44aqvt3SldTNjVV3ApeBi8dYIUbmcfMntPML8DPyXdkFSCDa+nM0
	OVyUJ/885LxbCQA22tKhyWmRgfB4Hfh4j53vum/9y9OVSTIDvJZxlmlrIQyIamauTK61
	+Loa3PpkCTXul3q05Zuq0XgGUMmFaoHufc1xIxqzeEobG4tPw3y37u7XFpGMcHh54QBG
	525+VKCcshCLbMNp4WDI7WCSEldUWOUZ8CAw0/aHITL/vE4+Wuz7ExlJMOgHrcr/8awd
	IS24ohsExJ3tm6wNgmQB77jOHlF8kpESlMODM0Gx+xaT9ltks85yAZP+JKaJAghUWKlH
	Iczw==
MIME-Version: 1.0
X-Received: by 10.60.134.236 with SMTP id pn12mr10054738oeb.4.1370898307709;
	Mon, 10 Jun 2013 14:05:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 14:05:07 -0700 (PDT)
In-Reply-To: <5af88b588ebad66b9e123e80c745be0210eee9f0.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
	<5af88b588ebad66b9e123e80c745be0210eee9f0.1370896990.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 18:05:07 -0300
X-Google-Sender-Auth: Khx7hVBpo62juL4z9rGJ2PUcJ_0
Message-ID: <CAP9ODKop4LBmZbH-WVUG08nznTAsZ9CZ7pBs+Wwvk-WmO8Uogg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] insane.bbclass: quiet package errors not in *_QA
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
X-List-Received-Date: Mon, 10 Jun 2013 21:05:07 -0000
Content-Type: multipart/alternative; boundary=047d7b471f6aa783ce04ded3227e

--047d7b471f6aa783ce04ded3227e
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:47 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Currently, if a package QA type from package.bbclass is not listed in
> ERROR_QA, it gets shown, regardless of whether it's in WARN_QA. This
> differs
> from the behavior of the rest of the QA handling (which doesn't call
> package_qa_handle_error at all if it's in neither _QA variable), and is
> nonintuitive. Change this to use bb.note() if it's listed neither in
> ERROR_QA
> nor WARN_QA, so it ends up in the task logs, but doesn't clutter up the
> user's
> output.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b471f6aa783ce04ded3227e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:47 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com">chris_larson@mentor.com</a>&gt;<br>

<br>
Currently, if a package QA type from package.bbclass is not listed in<br>
ERROR_QA, it gets shown, regardless of whether it&#39;s in WARN_QA. This di=
ffers<br>
from the behavior of the rest of the QA handling (which doesn&#39;t call<br=
>
package_qa_handle_error at all if it&#39;s in neither _QA variable), and is=
<br>
nonintuitive. Change this to use bb.note() if it&#39;s listed neither in ER=
ROR_QA<br>
nor WARN_QA, so it ends up in the task logs, but doesn&#39;t clutter up the=
 user&#39;s<br>
output.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div><=
br class=3D"">Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@oss=
ystems.com.br">otavio@ossystems.com.br</a>&gt;</div>
<div><br></div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b471f6aa783ce04ded3227e--
