Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D848731CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 18:52:32 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j15so13910835oih.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JJ/lhNNT5B7WlXCBuFOlCad26v+XAe/PJoI2TLbupAI=;
	b=fl27FKs/n1Kwi5Q058yZwgt0lU9BU6250+6xbnCep9GaApOhZf7XtSym9XNkvmryin
	TvWjjHQREpty4SkU90GRAyx3wwhaJqA3eUntt7FmIm2dgnbblL1NEDz8mYaj+ulZlO94
	fyhpxxbXmaIBuw3nDGXScOjYgs9x4tRb2Y3QpOiG/bokN0qlg/QGNMX64XJJv2JKNyzx
	FfKcaqUZ4soLFTebW42EnUJQvlzgp2gU10RWpTab8NYkbygN2BBRpMYsntc1RfAN81h7
	7PrT9FzzgyfzEzSom1v7RVCgqppfozfjy9QfjN7cEXFc83Y3Bb7Luk4Lc4WvyEjyLjiP
	0AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=JJ/lhNNT5B7WlXCBuFOlCad26v+XAe/PJoI2TLbupAI=;
	b=VwNeM9ii/u6ak8p9RNYlAvHMc48hoq46vDvTItgLzmkxBfQG44x7aDWkRsG/nouUVs
	mg/sOqX3IVHsJKTYH0bCi1R4jGP/+uzxwZfl2mm9+ZWnFjugZfH9ypU+eTb2ODqYRU/H
	ieAHRSdHavxRhptkbl26nRJC4BlxMJd/I8u7nw0AIdPZnrOfXzzAg7Z2JDgaWmu1i+yO
	N0pNbaM9DvkLulkV9sFpv327YZwKXlw3q6SoC6XsPmebYmBZxf+hnhLeJGcE9trye3vJ
	G3HO/BegMP27gXxwbpV8bxL5vtSKuemJg6YcV8V5GRAqE7KNmmj7NJ1NTsGNNM7ancm1
	kuZQ==
X-Gm-Message-State: AIkVDXLQPO8HYBTcAK2CFAs+yYNpMolXhOd44yIO09Pb/d5ct9Pm9rmfnQdzAY3PFEPFzD5AsOR5ssmQunVWKw==
X-Received: by 10.202.71.137 with SMTP id u131mr18380687oia.111.1485283953326; 
	Tue, 24 Jan 2017 10:52:33 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.5.8 with HTTP; Tue, 24 Jan 2017 10:52:12 -0800 (PST)
In-Reply-To: <f375139dfac77be3c12335a6a302582368ceeb13.1485247027.git.mariano.lopez@linux.intel.com>
References: <cover.1485247027.git.mariano.lopez@linux.intel.com>
	<f375139dfac77be3c12335a6a302582368ceeb13.1485247027.git.mariano.lopez@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 24 Jan 2017 11:52:12 -0700
X-Google-Sender-Auth: pfsSfknPYfAM7k9foc1CD2JM-Mo
Message-ID: <CABcZANn9jc51biiwD=0v9izwzovbpwaE0bLtnpBX3VE=oVLfiQ@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_ipk.bbclass: Add check for empty lines in DESCRIPTION
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
X-List-Received-Date: Tue, 24 Jan 2017 18:52:33 -0000
Content-Type: multipart/alternative; boundary=001a113e3c686dc0eb0546db9e1a

--001a113e3c686dc0eb0546db9e1a
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2017 at 1:37 AM, <mariano.lopez@linux.intel.com> wrote:

> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
> opkg uses empty lines as separator for next package and if an ipk
> file was packaged with empty lines in DESCRIPTION opkg won't be
> able to handle such ipk file, this happens at execution time.
>
> This commit will add a check for empty lines in DESCRIPTION when
> generating to ipk package to avoid this issue.
>
> [YOCTO #10677]
>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>

Could it handle a line with just a space, or a period? Could you not
replace the lines with that instead, rather than aborting?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113e3c686dc0eb0546db9e1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jan 24, 2017 at 1:37 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:m=
ariano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":r1" =
class=3D"a3s aXjCH m159d15b04395aa43">From: Mariano Lopez &lt;<a href=3D"ma=
ilto:mariano.lopez@linux.intel.com">mariano.lopez@linux.intel.com</a><wbr>&=
gt;<br>
<br>
opkg uses empty lines as separator for next package and if an ipk<br>
file was packaged with empty lines in DESCRIPTION opkg won&#39;t be<br>
able to handle such ipk file, this happens at execution time.<br>
<br>
This commit will add a check for empty lines in DESCRIPTION when<br>
generating to ipk package to avoid this issue.<br>
<br>
[YOCTO #10677]<br>
<br>
Signed-off-by: Mariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.inte=
l.com">mariano.lopez@linux.intel.com</a><wbr>&gt;</div></blockquote></div><=
br>Could it handle a line with just a space, or a period? Could you not rep=
lace the lines with that instead, rather than aborting?<br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div>=
</div></div>
</div></div>

--001a113e3c686dc0eb0546db9e1a--
