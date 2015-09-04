Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9B676FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:32:55 +0000 (UTC)
Received: by qgez77 with SMTP id z77so18810729qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 08:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yBPIg5HjV+mM4eHb39080vMPnpl00qYm8kJ0zg99wdw=;
	b=bYZqVUizWmUpzv7P611dcD5DtXKfL/iRvPSs9LdqmLCzVP1xtQquTNOLepJ1m0kx4G
	2jE1IWVgm/9iy5YshB+L8o9olen/+ddRZgMMX32ozlZ2piRFv1OPs7u3Sm/uZw6l3A++
	eNZmHGi0aPHrrOBbEom5yVneISBCPFy2hMuwWsTxt3Dk9Mz4Z9HJv0I2AZXZnd1KY6D4
	7h9201loHruJnMaE0YrbiLRdwg7snvly1wueLfyfibYLwilT55kkCvsS3HSxlwgr7rYL
	T+yJhtR1Auo6+KnWvIIAB/IhKxXcITFC3iqVqi6ml1bGldSeYJ06kR54mb8vkAlDZT0w
	aqCQ==
X-Gm-Message-State: ALoCoQlxWfBrUZPQEBFrwuFbwTNARYxx5tc3Akop5zmn6Nj2kg6eaPc5N5jYhlAItz0RVpSwxjo4
X-Received: by 10.140.232.150 with SMTP id d144mr3191037qhc.17.1441380775594; 
	Fri, 04 Sep 2015 08:32:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 08:32:36 -0700 (PDT)
In-Reply-To: <2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
References: <1441380461.24871.171.camel@linuxfoundation.org>
	<2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 16:32:36 +0100
Message-ID: <CAJTo0LZDX+hQiAw4cw6Xt6B6YOHPjznO_dSPCSzbQgbz6SVR9Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: Set gcc 5.2 as the default
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
X-List-Received-Date: Fri, 04 Sep 2015 15:32:57 -0000
Content-Type: multipart/alternative; boundary=001a113548521dcc68051eed9d93

--001a113548521dcc68051eed9d93
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 16:29, Khem Raj <raj.khem@gmail.com> wrote:

> a small nit. Make it 5.% to logically indicate that 5.x is a bug fix
> release and next big upgrade will be
> 6.x
>

To be honest I'd prefer *any* change to the compiler beyond eg 5.2.0 ->
5.2.1 to be explicit.  I think we've all seen enough breakage from a "bug
fix" release to know that it needs a proper test.

Ross

--001a113548521dcc68051eed9d93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 September 2015 at 16:29, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":34o" class=3D"a3s" st=
yle=3D"overflow:hidden">a small nit. Make it 5.% to logically indicate that=
 5.x is a bug fix release and next big upgrade will be<br>
6.x<br></div></blockquote></div><br>To be honest I&#39;d prefer *any* chang=
e to the compiler beyond eg 5.2.0 -&gt; 5.2.1 to be explicit.=C2=A0 I think=
 we&#39;ve all seen enough breakage from a &quot;bug fix&quot; release to k=
now that it needs a proper test.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a113548521dcc68051eed9d93--
