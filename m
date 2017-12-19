Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id C949F78430
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:23:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513689796; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=FD+i3cjybryhnWzXg9eCSkuNhL6NIQzTocaWxO6SZvc=;
	b=sdIwFnnuw9SRZ2bQISQHM3M5eW1Jm0NsTfaliDxZJh5uyq3QLA8iNZgX2K8ciqjjfUii+5Px
	shlZnbNtt6IXroGyv4eiejAiAu+7RFkVrGKLDsYd7cNopZq9KK26eWZnDrOvKdXDnNBeacVd
	mn3c6Jxzn30OaAdZevtDZWdJL0A=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mxa.mailgun.org with ESMTP id 5a3912c4.7f7f6d6847b0-smtp-out-n02;
	Tue, 19 Dec 2017 13:23:16 -0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id 143so7718633qki.2;
	Tue, 19 Dec 2017 05:23:16 -0800 (PST)
X-Gm-Message-State: AKGB3mI200OzzmcPkBeoFjNung9/UCk1tLU3SY+08rZhy60bHR3Me3gN
	SeFtsUxtq3IxqbCcZcjUIbhDM2gcF40FtYcz6lk=
X-Google-Smtp-Source: ACJfBotBpbqg7DOlnlgi0BusXQ/JNmhN0TmtLV0XQbcwJi0eIR9yRtMkFIIe0cnx1OjNlRFgZHRM2LbUJ1/I5Aq7MQE=
X-Received: by 10.55.191.1 with SMTP id p1mr4750329qkf.152.1513689796193; Tue,
	19 Dec 2017 05:23:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 05:23:15 -0800 (PST)
In-Reply-To: <32cbea3c-5275-cd8e-e7ef-7654e1e94bfa@linux.intel.com>
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
From: Derek Straka <derek@asterius.io>
Date: Tue, 19 Dec 2017 08:23:15 -0500
X-Gmail-Original-Message-ID: <CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
Message-ID: <CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 13:23:16 -0000
Content-Type: multipart/alternative; boundary="94eb2c0437b09a32dd0560b15ec0"

--94eb2c0437b09a32dd0560b15ec0
Content-Type: text/plain; charset="UTF-8"

Cool.  Works for me.  Thanks.

-Derek

On Tue, Dec 19, 2017 at 8:12 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 12/19/2017 02:31 PM, Derek Straka wrote:
>
>> Well, I've been able to do it just fine for the majority of packages in
>> meta-python by myself.  Since I contribute the majority of the patches and
>> maintain the layer, I want this capability maintained in meta-python.  If
>> you plan on removing that functionality in oe-core, I'd like to have the
>> opportunity to maintain the python recipes there as well rather than have a
>> feature unilaterally removed.  I don't consider it a burden and my
>> customers find it valuable to split things out.
>>
>
> If you're able to take over the maintenance of oe-core's python packages,
> then that's great and much appreciated! I'll send a patch that assigns them
> to you in a moment.
>
> Alex
>

--94eb2c0437b09a32dd0560b15ec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Cool.=C2=A0 Works for me.=C2=A0 Thanks.<div><br></div><div=
>-Derek</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Tue, Dec 19, 2017 at 8:12 AM, Alexander Kanavin <span dir=3D"ltr">&lt;=
<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alex=
ander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">On 12/19/2017 02:31 PM, Derek Straka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Well, I&#39;ve been able to do it just fine for the majority of packages in=
 meta-python by myself.=C2=A0 Since I contribute the majority of the patche=
s and maintain the layer, I want this capability maintained in meta-python.=
=C2=A0 If you plan on removing that functionality in oe-core, I&#39;d like =
to have the opportunity to maintain the python recipes there as well rather=
 than have a feature unilaterally removed.=C2=A0 I don&#39;t consider it a =
burden and my customers find it valuable to split things out.<br>
</blockquote>
<br></span>
If you&#39;re able to take over the maintenance of oe-core&#39;s python pac=
kages, then that&#39;s great and much appreciated! I&#39;ll send a patch th=
at assigns them to you in a moment.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--94eb2c0437b09a32dd0560b15ec0--
