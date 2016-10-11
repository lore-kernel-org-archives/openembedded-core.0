Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D6FAD70022
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:17:51 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q192so18749836iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cFkzN+zc/974vqEQsOjyTdzyvbOnLNNPSJzaSs20V5A=;
	b=lXrgtQWR7iO3DIV/PscmRijsDj9G/hRfhTYqdAZqk5HbEhnwTkr37yefZfSFZZBmcl
	wE96jtDHufSlMdkJRUGXlWpQxvzztQPrerj0LriWNlt2c3316Oy8mWJXwBxl7Ug7w9XL
	dz6kK9Rf4CoZzf6N7AYuyy68k85A3e44ymn5rOSdxI6D+obskM1m6fkKNcGcEtXyy+3P
	+5fANvMq/LuHFIs4nk8Qxa+Jhv91OtKMBpK7wNdMYx5zuCovJs7wyaqmUKRJZfvinoq1
	JysgBDpD4IPXLWAG94XZDY2l9bZnxNi15cPn/Wp0AaCCo8yPjfWBvW2O6sISrAPG+XX0
	cuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cFkzN+zc/974vqEQsOjyTdzyvbOnLNNPSJzaSs20V5A=;
	b=YoFt8GrW7DlaAFPwndsw9CzVboTUqhT/h4YYaOVOTYHTxbQ3QmfC8kxjVO9UdvT6B7
	Ghii1Ia8ujgJlx9TQmnVsq02bciVpXcSKUTbzs+wLUpk8ERo+kjEXWYzFi6WfwD5kZZd
	JylzabLYdW2pkbdZtrEzPZkQFWZI+9Yp4o9SjR/KSfqJ5RzZSwo+AGYKkSPV3Z2Ayd9a
	psvdh1X1PriNDOullrhk7AIwWdkBzrM407dt3G/whFut7ma/SOypn3U2EmwDSt6kFeNc
	OWb9SHaZy8v1snkSa2u2VkwSeZq+sVnNFGUDytYmfRtwdi5yca8emvvPtLQXi/DEsiqV
	3S0w==
X-Gm-Message-State: AA6/9RngsaxMXq9mKeH2WBKMLATc4lhMr6SKphPzsrVd9Opu/4aPFxEOxq5q/YiMfwqkOzpjpKB2/LzvjszOy4ku
X-Received: by 10.107.138.15 with SMTP id m15mr4642859iod.127.1476177473342;
	Tue, 11 Oct 2016 02:17:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 11 Oct 2016 02:17:32 -0700 (PDT)
In-Reply-To: <39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Oct 2016 10:17:32 +0100
Message-ID: <CAJTo0Lb04c39Qz-oTpP-BrLT=ARmr8z9uwEugrc2vK1n6wOp7w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 09:17:54 -0000
Content-Type: multipart/alternative; boundary=001a113feb3ceca345053e935931

--001a113feb3ceca345053e935931
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 09:37, Mark Hatle <mark.hatle@windriver.com> wrote:

> My understanding of the issue is that the extraction of the plural.c and
> plural.y files happens so quickly that it is unclear to make if one is
> older
> then the other -- so it sometimes uses bison to rebuild the plural.c.  This
> produces a non-deterministic build.
>

Surely the rebuilt plural.c should be identical to the shipped one?
(semantically if not literally)

Ross

--001a113feb3ceca345053e935931
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2016 at 09:37, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1g3" cla=
ss=3D"a3s aXjCH m157b2edf9bd2361e">My understanding of the issue is that th=
e extraction of the plural.c and<br>
plural.y files happens so quickly that it is unclear to make if one is olde=
r<br>
then the other -- so it sometimes uses bison to rebuild the plural.c.=C2=A0=
 This<br>
produces a non-deterministic build.<br></div></blockquote></div><br>Surely =
the rebuilt plural.c should be identical to the shipped one? (semantically =
if not literally)</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113feb3ceca345053e935931--
