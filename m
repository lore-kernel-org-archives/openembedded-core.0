Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9E295601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 20:06:50 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id m20so1068063qcx.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 12:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TGaqZ/LOJ3u3iDCRB+twsAXD/xQ9AUKlTp3i9b+N/Eo=;
	b=ASCra5NHO2TvNvWcSOAKrZG5x10F+gu/glMu5MU6iwdJ7ghSV71EUIfm2KmMPjKmAW
	rSh6NUC6WBWk0MfKdIqoqmXcjgMK9QwCUsi1IYrHgPT1kYOPKUSpyklzZfXo9+1orNHH
	LiySveGgYG1YtTTv3vtnJSTBbCqSb3RrGsujmfzsphtvcics7+4tpU/y3Oqa3CW++gXj
	gJq+9tHNMIEH2pUHBRdp972TtBytE7zh6GsBYt2X/toVi9YnOruWeVvu+Pa7M31LXkaD
	vM7o0UC4nLzpPPFfsR4eKvvp5cN2Vrs+xQS3m0o6TfRVpFqTfcbbTf/+TLqtHxCn00ub
	MUXw==
X-Gm-Message-State: ALoCoQnmf4y1NCmt3esAJCnOIOGtaTQ+IIY5X90+94Q1DoaH+JIZzs9SsU8YlVwLYvyfpvlGYgZf
X-Received: by 10.229.252.201 with SMTP id mx9mr693976qcb.4.1418155610916;
	Tue, 09 Dec 2014 12:06:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 9 Dec 2014 12:06:29 -0800 (PST)
In-Reply-To: <54873BE9.9030905@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Dec 2014 20:06:29 +0000
Message-ID: <CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Tue, 09 Dec 2014 20:06:55 -0000
Content-Type: multipart/alternative; boundary=001a11c2ef946ce8b10509ce15b9

--001a11c2ef946ce8b10509ce15b9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 December 2014 at 18:14, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> I don't know, maybe Ross knows?.
>

I ask for Piglit results to verify that approx 95% passes as that's the
expected pass rate.  I don't bother tracking the exact count as how it
changes as there's almost ten thousand tests and at some point you have to
let upstream deal with this.

Ross

--001a11c2ef946ce8b10509ce15b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2014 at 18:14, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<=
a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.lim=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":1f5" class=3D"a3s" style=3D"overflow:hidden">I don&#39;t know, =
maybe Ross knows?.</div></blockquote><div><br></div><div>I ask for Piglit r=
esults to verify that approx 95% passes as that&#39;s the expected pass rat=
e.=C2=A0 I don&#39;t bother tracking the exact count as how it changes as t=
here&#39;s almost ten thousand tests and at some point you have to let upst=
ream deal with this.</div><div><br></div><div>Ross</div></div></div></div>

--001a11c2ef946ce8b10509ce15b9--
