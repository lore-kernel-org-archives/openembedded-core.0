Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id F376F71994
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:25:09 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id s140so60099422qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FpXhswRm/QDTXJTPYj+0XpZhi4L88piZFJKRNos+5ao=;
	b=C0oxy+ysBRsONGiYq7QhitjJBY67YE/PBKxCpsqXkshiVcq4NS0/5RXGvZk5lMiDLw
	IAE+RkZIFjByuMM/RqW1HIeurGVsrkVs0ncoP7y3SNzv07sB2hTwTtD8Oc1EXUNLFPrL
	8E5PO23lVQ9kybDgBHcq7rrXgoF1Ska0j8a/WCN389mZEtlvG/cLbvweTA3WoBpXtKpA
	UD9ZL6md2wcSES4oBCszhfSraP2iJj8ZWp5UR7xuj9PMy+9Opw22zwCoeNw6V0Y+wLb/
	epPBBqEhS+P6KC7IFWjmTGb9EauPfEgEb0J8bpDiUbGkFAsiZd0gj8dj8TCYomh17byR
	PI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FpXhswRm/QDTXJTPYj+0XpZhi4L88piZFJKRNos+5ao=;
	b=XI+74GgU5/XAnQx5YBPehUuMbS/I7R7z4f1l6tsTkvCmGsk6sICRMHYqrUk36wY2dB
	sg+68K/k7dl8AxeJ54dpQCxj7nEw3WBavtH2REBL/bZWqBupujf8LsgxriRKMXsi5ahW
	IGDfzCBUFr+exkrkSN6H3XEltqKcRo467B7uMAkUizc6ICkkmA/qpMGKrF1MJWbkUdWM
	So11A2WZHQLbUWrQYYRZi4jvWCMn+nkEynHkj01NPKw2kBkOwC99nRBJ4L/KfSR68Cyx
	jgU8BDr3HavUGyTz1JW728n4IVz0Q6Pl4ya4KGZxHsWbDNdEv69ZBls12U+0ipBtSx2P
	b87Q==
X-Gm-Message-State: AMke39mMvjsnvGud2IZTPrafHdOJoMRyXZoZ05gcdSlKa1e9hxGysXNiQztWN8+7Q1WnFiBUSUsUo3fzn1Cq2qC+
X-Received: by 10.55.1.134 with SMTP id u6mr11590329qkg.36.1486398309842; Mon,
	06 Feb 2017 08:25:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 6 Feb 2017 08:24:49 -0800 (PST)
In-Reply-To: <CAJ86T=W2qeo7bf6f3JCxY1x+YHZQPDfusq5F7qq5XXDOQB17jw@mail.gmail.com>
References: <CAJ86T=W2qeo7bf6f3JCxY1x+YHZQPDfusq5F7qq5XXDOQB17jw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Feb 2017 16:24:49 +0000
Message-ID: <CAJTo0LYqvtc-oDg2o1PRnQd_ZqQtWCD6SyfvDvTDcZd2pC5_Rw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: virtual/ -vs- virtual-
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
X-List-Received-Date: Mon, 06 Feb 2017 16:25:10 -0000
Content-Type: multipart/alternative; boundary=001a114046c440e7090547df1353

--001a114046c440e7090547df1353
Content-Type: text/plain; charset=UTF-8

On 27 January 2017 at 20:36, Andre McCurdy <armccurdy@gmail.com> wrote:

> Is the rule about using "virtual/foo" for PROVIDES and "virtual-foo"
> for RPROVIDES documented somewhere?
>

I don't think it's written anywhere apart from the metadata, no.

Ross

--001a114046c440e7090547df1353
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2017 at 20:36, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ng" class=3D"a3=
s aXjCH m159e1a5e5c88f756">Is the rule about using &quot;virtual/foo&quot; =
for PROVIDES and &quot;virtual-foo&quot;<br>
for RPROVIDES documented somewhere?<br></div></blockquote><div><br></div><d=
iv>I don&#39;t think it&#39;s written anywhere apart from the metadata, no.=
</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a114046c440e7090547df1353--
