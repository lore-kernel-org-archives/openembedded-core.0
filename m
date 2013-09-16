Return-Path: <jc@vtkloud.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1656D6010E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:39:28 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id v2so2770333qcr.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:in-reply-to
	:references:from:to:cc:subject:content-type;
	bh=mp+dOY1XemMBlyyFsO/RrqY3YFlinDv97ebhuXNf+SQ=;
	b=mWg7Dao69PBoXPlrcUV1lztxXUdS0GKOtbpx+PlUP12hDlAGWG0UitTWjCH3iwU61r
	j9NfvRl6ozCXQEmzF2NMYZXkqLamla4b/4yJ9WnvmtFDy8nsd1Y9WFH6nWuRJWpp+F5c
	qDu6jQlcn86ZraBDW+fTkAyhfxg+Up+wUJQSPHGTuUbVMnszS837vDass1TGNWKaPwb5
	kk9BFZodpcOz7whtiIns2WJHvRtyXSTMSEng3BjJf1zzYMKdBRS7XQRBzRPTQxH6KkIl
	rY4BFEHGf6L1WS9KE0bVt999SV00DQj76f+L1fsn5Af6bCbU/bChPfpX4y39V3ivtfuG
	0Ciw==
X-Gm-Message-State: ALoCoQn+b6UmJWPedaZJNNgtcW8x16OBIOqvaE1ErIeUuzdtmkjlHX2Dn1I8d7qGe9r6jUbqQym3
X-Received: by 10.229.185.68 with SMTP id cn4mr46994400qcb.5.1379345969471;
	Mon, 16 Sep 2013 08:39:29 -0700 (PDT)
Received: from [127.0.0.1] (ec2-54-235-159-142.compute-1.amazonaws.com.
	[54.235.159.142])
	by mx.google.com with ESMTPSA id g2sm24032093qaf.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 08:39:28 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.5.0; +http://www.nodemailer.com/)
Date: Mon, 16 Sep 2013 08:39:28 -0700 (PDT)
Message-Id: <1379345967717.a9ba8559@Nodemailer>
In-Reply-To: <3047549.YMT2qeacCQ@helios>
References: <3047549.YMT2qeacCQ@helios>
X-Orchestra-Oid: 0ECCB65C-3E40-489D-A3DE-B9AF1D475693
X-Orchestra-Sig: 4b7ed4eee43ed9023c8db39c3987485d5da7d69b
X-Orchestra-Thrid: TDF50CD80-D5BE-4DE9-9446-44DAF41E57D4_1446105799272783485
X-Orchestra-Thrid-Sig: e38f55ced3dc14ab0f427d33dc3db7c9b9883c16
X-Orchestra-Account: 2710d038b39aad21a8e3788cfbfcd8c62c32563a
From: "JC" <jc@vtkloud.com>
To: "Paul Eggleton" <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: lib ao ?
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
X-List-Received-Date: Mon, 16 Sep 2013 15:39:28 -0000
Content-Type: multipart/alternative;
	boundary="----Nodemailer-0.5.0-?=_1-1379345968717"

------Nodemailer-0.5.0-?=_1-1379345968717
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks. I'll have a look. FWIW I created my own libao recipe, I'll clean it=
 to comply to recipe policy and will send it if the older one doesn't work =
out




Jay




=E2=80=94
JC

On Mon, Sep 16, 2013 at 5:37 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:

> On Monday 16 September 2013 10:59:43 Randy MacLeod wrote:
>> On 13-09-13 07:12 PM, JC wrote:
>> > Hi,
>> >=20
>> > I cannot find a trace of libao. Is this present somewhere in some
>>=20
>> It is:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/libao/li=
bao=5F
>> 0.8.8.bb
>> > openembedded-* repo I would have missed =3F I could not find it in
>> > layers.openembedded.org
> There isn't currently a libao recipe in common OE-Core based layers =
indexed by=20
> the layer index. FYI though there is a recipe in the unofficial (and =
apparently=20
> unmaintained) meta-jlime layer here:
> https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime
> It would be great to have this added to meta-multimedia - please test it =
and=20
> if it works for you please feel free to send a patch adding it to meta-
> multimedia.
>=20=20
>> The UI for that site has changed, you have to set:
>> Branch: OE-Classic
>> to search meta-openembedded.
>>=20
>> Painful, I know, but I assume there was confusion about what's in
>> oe-core and what's in OE-Classic.
> This is *not* correct. OE-Classic as shown in the layer index is =
OE-Classic,=20
> the old monolithic OpenEmbedded; it is not the same thing as meta-oe or =
any of=20
> the layers in the meta-openembedded repository.
> Cheers,
> Paul
> --=20
> Paul Eggleton
> Intel Open Source Technology Centre

------Nodemailer-0.5.0-?=_1-1379345968717
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable


<div>Thanks. I'll have a look. FWIW I created my own libao recipe, I'll =
clean it to comply to recipe policy and will send it if the older one =
doesn't work out</div>
<div><br></div>
<div>Jay</div>
<div><br></div>
<div class=3D=22mailbox=5Fsignature=22>=E2=80=94<br>JC</div>
<br><br><div class=3D=22gmail=5Fquote=22><p>On Mon, Sep 16, 2013 at 5:37 PM=
, Paul Eggleton <span dir=3D=22ltr=22>&lt;<a href=3D=22mailto:paul.=
eggleton@linux.intel.com=22 target=3D=22=5Fblank=22>paul.eggleton@linux.=
intel.com</a>&gt;</span> wrote:<br></p><blockquote class=3D=22gmail=5Fquote=
=22 style=3D=22margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex;=22><p>On Monday 16 September 2013 10:59:43 Randy =
MacLeod wrote:
<br>&gt; On 13-09-13 07:12 PM, JC wrote:
<br>&gt; &gt; Hi,
<br>&gt; &gt;=20
<br>&gt; &gt; I cannot find a trace of libao. Is this present somewhere in =
some
<br>&gt;=20
<br>&gt; It is:
<br>&gt; http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/li=
bao/libao=5F
<br>&gt; 0.8.8.bb
<br>&gt; &gt; openembedded-* repo I would have missed =3F I could not find =
it in
<br>&gt; &gt; layers.openembedded.org
<br><br>There isn't currently a libao recipe in common OE-Core based layers=
 indexed by=20
<br>the layer index. FYI though there is a recipe in the unofficial (and =
apparently=20
<br>unmaintained) meta-jlime layer here:
<br><br>https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime
<br><br>It would be great to have this added to meta-multimedia - please =
test it and=20
<br>if it works for you please feel free to send a patch adding it to =
meta-
<br>multimedia.
<br><br>&gt; The UI for that site has changed, you have to set:
<br>&gt; Branch: OE-Classic
<br>&gt; to search meta-openembedded.
<br>&gt;=20
<br>&gt; Painful, I know, but I assume there was confusion about what's in
<br>&gt; oe-core and what's in OE-Classic.
<br><br>This is *not* correct. OE-Classic as shown in the layer index is =
OE-Classic,=20
<br>the old monolithic OpenEmbedded; it is not the same thing as meta-oe or=
 any of=20
<br>the layers in the meta-openembedded repository.
<br><br>Cheers,
<br>Paul
<br><br>--=20
<br><br>Paul Eggleton
<br>Intel Open Source Technology Centre
<br></p></blockquote></div><br>

------Nodemailer-0.5.0-?=_1-1379345968717--
