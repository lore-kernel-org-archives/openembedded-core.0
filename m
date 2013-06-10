Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id BD5FB619E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 12:10:34 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so9937288obc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 05:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=87fkt42aD4UEzXWuSAhU+OLfOwT3EEJH9kG21ZSh2io=;
	b=d3B3nVLVcz4q54/44GczD2u+lnzJRUUlmiMBqD8C66izDgoOONE/tpPsqnBx6k1D1+
	6wEdpuFXRMzWiU9Od/mXki5L2ydFSBDo23XAV818BeqLPbuUZTxEefeGNAT5NxtB9lfr
	QN02KHEXl4NCvin2cCR01Mnz8WkVuYCXAv3nla00ZRa4njwHtQdvLwr91c0CPdZZ8eL5
	xqH9eVkMKWFKDWL6gB7WpCvNkpIS8NJnOPBVdMcBTZ3iYiIe30pJqRWN364Cwbdye+9S
	rGDSp36AVKiTf+CAkdcwfAy0qDBuD2Q29gzrEPiPBG3cFamRJNddGBIp4l4Mult83VYC
	EgAQ==
X-Received: by 10.60.68.13 with SMTP id r13mr7871186oet.71.1370866235171; Mon,
	10 Jun 2013 05:10:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Mon, 10 Jun 2013 05:10:15 -0700 (PDT)
In-Reply-To: <CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<2326207.iuBVrRrsbt@helios>
	<CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 10 Jun 2013 14:10:15 +0200
Message-ID: <CAP71WjxSiWcGu98VTY2z_Dsf+WgSEMKnCoPkoWUfrR7ch321dQ@mail.gmail.com>
To: John Stirling <ap.john.stirling@gmail.com>
X-Gm-Message-State: ALoCoQngwxi5MGNdYbx2AQJ7Z6OTlmyB5bY8iQdF9de3tEyIs8RWbrJI4VePPKEsJ/USwG08FsSz
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 12:10:34 -0000
Content-Type: multipart/alternative; boundary=001a11331a76fbc52b04decbaa96

--001a11331a76fbc52b04decbaa96
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 1:19 PM, John Stirling
<ap.john.stirling@gmail.com>wrote:

> You suggest just cutting it down to
>
> IMAGE_INSTALL += " \
> qtui \
> "
> and it should work itself out ?
>

hi, i have observed the same issue, and I used the following 'workaround':

BAD_RECOMMENDATIONS = " \
    qt4-embedded-demos \
    qt4-embedded-examples \
    qt4-embedded-demos-doc \
    qt4-embedded-tools \
    qt4-embedded-assistant \
    "
which I added in my image recipe, that would ensure that the packages which
are RECOMMENDS don't get installed in the final image.

I would be happy to use another (nicer?) method, too.

--001a11331a76fbc52b04decbaa96
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 10, 2013 at 1:19 PM, John Stirling <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ap.john.stirling@gmail.com" target=3D"_blank">ap.john.stirling@=
gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>You suggest just cutting it down to=A0</div><div><br>=
</div>


<div><div>IMAGE_INSTALL +=3D &quot; \<br>qtui \<br>&quot;<br></div></div><d=
iv>and it should work itself out ?</div><div></div></blockquote></div><br>h=
i, i have observed the same issue, and I used the following &#39;workaround=
&#39;:</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">BAD_RECOMMENDATIONS =3D &quot; \<br></div><div class=3D"gm=
ail_extra">=A0 =A0 qt4-embedded-demos \</div><div class=3D"gmail_extra">=A0=
 =A0 qt4-embedded-examples \</div>

<div class=3D"gmail_extra">=A0 =A0 qt4-embedded-demos-doc \</div><div class=
=3D"gmail_extra">=A0 =A0 qt4-embedded-tools \</div><div class=3D"gmail_extr=
a">=A0 =A0 qt4-embedded-assistant \</div><div class=3D"gmail_extra">=A0 =A0=
 &quot;</div><div>which I added in my image recipe, that would ensure that =
the packages which are RECOMMENDS don&#39;t get installed in the final imag=
e.=A0<br>

</div><div><br></div><div>I would be happy to use another (nicer?) method, =
too.</div><div><br></div><div style><br></div><div style><br></div></div></=
div>

--001a11331a76fbc52b04decbaa96--
