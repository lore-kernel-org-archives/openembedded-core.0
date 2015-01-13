Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id BE80365C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:39:25 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so1886661qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 04:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OTVaEVk94GQ0hg0KfjJ3UTy/RTHYfekFtVzZLbcIp40=;
	b=OC0C71ADvi8l3t69P078iayK5owhNzhqHIW9p54iIYarNpQgnI5tSYuBRGfpk3PDGc
	z/XTRkB1IO+CPkQuMGnuI7k5Hahyxndf1Uw2L95B7+EcgBhgoMiIY8Tn7WVZtkhep9EW
	paCTgAMO/2+2cMdeyIslruM626sHxdBEOy38frp8vHsP6JBiCC73unpyLBTv4L68gkCk
	3oTXT6YzXejWNyOGmI21RTUshmQ0AsiTGrU+iMWEdlAfJjAW7hclMyyW4E5i6I0cQB+h
	pEXLdPsMw8Jawpp2b1XeNS/oyqUob3PthYkYUDAoAYEY2XfiNUnTJJXWXCsHDBW6TXsD
	kgqg==
X-Gm-Message-State: ALoCoQmbxR3HHJdve4tzGukTyD9z4plvTyMNB30ssS9+fUcaSDZagknC9vEb/uEJdo/j5XQkmtxn
X-Received: by 10.224.7.197 with SMTP id e5mr3501226qae.64.1421152766298; Tue,
	13 Jan 2015 04:39:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 13 Jan 2015 04:39:06 -0800 (PST)
In-Reply-To: <2660201.qfFQ8E793P@peggleto-mobl5.ger.corp.intel.com>
References: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1421054310.31262.2.camel@linuxfoundation.org>
	<1B56A49860EB2D45ADE3731B15C959FDAE519B@G08CNEXMBPEKD01.g08.fujitsu.local>
	<2660201.qfFQ8E793P@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 12:39:06 +0000
Message-ID: <CAJTo0LbyTD4C39QXm+NnT60jgefg=zepkeGOzUDeFWwCQ8DW_A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Tue, 13 Jan 2015 12:39:29 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4cea7ec050c87e9ac

--001a11c223f4cea7ec050c87e9ac
Content-Type: text/plain; charset=UTF-8

On 13 January 2015 at 10:17, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Once a file has been successfully downloaded and checksums matched once
> (and
> the .done file has been written), they won't be checked again for that
> file.
>

There's a patch to change that behaviour which I promised to review... I'll
dig it out now.

Ross

--001a11c223f4cea7ec050c87e9ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2015 at 10:17, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2jl" class=3D"a3s" style=3D"overflow:hidden">Once a file has been succ=
essfully downloaded and checksums matched once (and<br>
the .done file has been written), they won&#39;t be checked again for that =
file. </div></blockquote></div><br>There&#39;s a patch to change that behav=
iour which I promised to review... I&#39;ll dig it out now.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c223f4cea7ec050c87e9ac--
