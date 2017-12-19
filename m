Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA2F7842F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:02:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513692140; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=tlvqrve3mrK8wzQYRMxmrc1soHtED/+jOVRvMS0z5W4=;
	b=abuhJULdpTbz6rXiigO2eMdJt0eSzJhLP+lRihNynQRaPmbfy9A0a/1eFBUkgsnzpDQ8xTAh
	N2527XBQoMa6E7Zs557rLkRtiIgzLvTL4Hz7gUwZ/PeQKXeBUogUBOBeSpRNjp8WxevTpvPl
	DasCvy7x/TDYQVBGty0/wb3aN2o=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mxa.mailgun.org with ESMTP id 5a391bec.7fec94b93870-smtp-out-n02;
	Tue, 19 Dec 2017 14:02:20 -0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id d66so22599437qkg.1;
	Tue, 19 Dec 2017 06:02:19 -0800 (PST)
X-Gm-Message-State: AKGB3mLlc2udvtM2LALS/2Rh0ArAejkUhw3aS0mCZjCctqzNTqYdKZt8
	1WaQ8ZPUsvRrHKjR1OKs4a87edOMVQTEjc6xWW4=
X-Google-Smtp-Source: ACJfBov4OP2cx62hmt4IZKHjVJKtN0NLZi/9M9BGQaNIbBG4H7xnLwema65hxjw2atccEYD8b4vs84cc9eF0L7Ir7w8=
X-Received: by 10.55.153.194 with SMTP id b185mr1692428qke.230.1513692139150; 
	Tue, 19 Dec 2017 06:02:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 06:02:18 -0800 (PST)
In-Reply-To: <CAJTo0LZ0e2iX84X_cOKxi9ziu9EgapG9_4MOKkPBEhKE=teCzg@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
	<2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
	<CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
	<32cbea3c-5275-cd8e-e7ef-7654e1e94bfa@linux.intel.com>
	<CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
	<CAJTo0LZ0e2iX84X_cOKxi9ziu9EgapG9_4MOKkPBEhKE=teCzg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 19 Dec 2017 09:02:18 -0500
X-Gmail-Original-Message-ID: <CADNbA1pLbXO=Wqz_M6LD801YgR266n=5tndBgSqZz49g-hQdsQ@mail.gmail.com>
Message-ID: <CADNbA1pLbXO=Wqz_M6LD801YgR266n=5tndBgSqZz49g-hQdsQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 14:02:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c07d53040ea6a0560b1eaa0"

--94eb2c07d53040ea6a0560b1eaa0
Content-Type: text/plain; charset="UTF-8"

Thanks for the heads up.  I'll pull the changeset into my testing branch
and touch up all the meta-python recipes to remove the now non-existent
packages.

On Tue, Dec 19, 2017 at 8:43 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 19 December 2017 at 13:23, Derek Straka <derek@asterius.io> wrote:
>
>> Cool.  Works for me.  Thanks.
>>
>
> There's an epic patch on the list which I'm reviewing right now that
> drastically changes how the core Python library is packaged.  If you'd like
> to have a look, the almost-final (my bandaid fixes need to be squashed) is
> at poky-contrib:ross/py.
>
> Ross
>

--94eb2c07d53040ea6a0560b1eaa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the heads up.=C2=A0 I&#39;ll pull the changeset=
 into my testing branch and touch up all the meta-python recipes to remove =
the now non-existent packages.</div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, Dec 19, 2017 at 8:43 AM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><span class=3D"">On 19 December 2017 at 13:23, Derek Strak=
a <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" target=3D"_bla=
nk">derek@asterius.io</a>&gt;</span> wrote:<br></span><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Cool.=C2=A0 Works for me.=C2=A0 Thanks.<br></blockquote><div><br></di=
v></span><div>There&#39;s an epic patch on the list which I&#39;m reviewing=
 right now that drastically changes how the core Python library is packaged=
.=C2=A0 If you&#39;d like to have a look, the almost-final (my bandaid fixe=
s need to be squashed) is at poky-contrib:ross/py.</div><span class=3D"HOEn=
Zb"><font color=3D"#888888"><div><br></div><div>Ross=C2=A0</div></font></sp=
an></div></div></div>
</blockquote></div><br></div>

--94eb2c07d53040ea6a0560b1eaa0--
