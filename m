Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id A47AB6B26D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 22:06:17 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id z5so2898745lbh.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ucXlw0mjEejYDkGpkUnkAeOj7WptAnAd91EDMP96RFA=;
	b=bnsCYKmHnrM2Iw4JC1Z4jUoiBKUB++RSG0w+U55YOhnNyHoknocWgq5hutjNMrwyPV
	/UftjY7IONhIUcFRDB4OjlmNmfVcAP5JjUx+cnejXc7j+YZkB8wYqiykktYTjNi9hPod
	RqVTD3TCYXaBAlr5PYcijRpkeLL/NEUqq9cEXvBW4YO6TxeGyztDfRwU64wdzfbSOVWD
	5j40XkufX0UPx6ahxk86FquOCvHdoTMBIVwvHW8xcQFc0g5rg3J8QdI/qiqCNsTdD4sK
	TpdxNC4xSqGVgrilqCZKN2TRlQrxdAp1QkipLZMRToUvvMO38xTC1xQ9wkN+rGSCscxz
	llEw==
X-Received: by 10.112.144.97 with SMTP id sl1mr6211626lbb.56.1374185177240;
	Thu, 18 Jul 2013 15:06:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.18.100 with HTTP; Thu, 18 Jul 2013 15:05:57 -0700 (PDT)
In-Reply-To: <64f18573660b81394357d27a13ca89856fa94536.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
	<a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
	<64f18573660b81394357d27a13ca89856fa94536.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 18 Jul 2013 15:05:57 -0700
X-Google-Sender-Auth: 2RyJaGZBaGTUTHwqXnKe1iLha74
Message-ID: <CABcZAN=hPQ4Q+wT0JNkVQ6Pa93sZ_AsLEoy5HFyh_2gTbErt8w@mail.gmail.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/11] chkconfig-alternatives-native: add git token in package version
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
X-List-Received-Date: Thu, 18 Jul 2013 22:06:18 -0000
Content-Type: multipart/alternative; boundary=047d7b34419a5859f904e1d06bc1

--047d7b34419a5859f904e1d06bc1
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 18, 2013 at 7:16 AM, Emilia Ciobanu <
emilia.maria.silvia.ciobanu@intel.com> wrote:

> Git packages should have the following format:
>     version+gitAUTOINC[r|-]+revision
>
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
>

Just as an FYI, in case you didn't consider it, this may well result in
package versions going backwards. Not in this case, but the general one,
depending on the SRCREV.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b34419a5859f904e1d06bc1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jul 18, 2013 at 7:16 AM, Emilia Ciobanu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:emilia.maria.silvia.ciobanu@intel.com" target=3D"_blank">emilia.=
maria.silvia.ciobanu@intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":gx" style=3D"overflow:hidden">Gi=
t packages should have the following format:<br>
=C2=A0 =C2=A0 version+gitAUTOINC[r|-]+revision<br>
<br>
Signed-off-by: Emilia Ciobanu &lt;<a href=3D"mailto:emilia.maria.silvia.cio=
banu@intel.com">emilia.maria.silvia.ciobanu@intel.com</a>&gt;</div></blockq=
uote></div><br>Just as an FYI, in case you didn&#39;t consider it, this may=
 well result in package versions going backwards. Not in this case, but the=
 general one, depending on the SRCREV.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--047d7b34419a5859f904e1d06bc1--
