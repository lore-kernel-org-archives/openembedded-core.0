Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6697D7327E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:59:00 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id q21so281163307iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LYthTTLrey8XHh2gP6Wi37A10HSOPBWr9ca5805AUyo=;
	b=Z35GOEZk7KMZ1052mIdnnd0+0rD8umEPUrX/Pd4uCHAe6SWph0YYc3I7F+Bh8FnBkL
	ypON5kWJiAm8pRDxoJuyeYu5phP1X6n2MSh4IhqzSksjk1ZVhVyimP2nTgLf2h3xEvtc
	K6xF3tEk0FEtNvTMa//ocqvq+q8na5x7bW2tZH3Nd4hME4Vu56x+XNgiYeeTXkudTWKV
	88Yzxl87EQRTPdwClAfyvQbGllTM8B1AM8lA6A+AE4wfqoOIfWLd1Da/XeazuAN/P4+j
	zZIt0VcVzQ9STprXzCCC0zZagchnGET7v/u4D5cAJUW9aZrOwPQkvnGybqsch6OgnbIC
	s9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LYthTTLrey8XHh2gP6Wi37A10HSOPBWr9ca5805AUyo=;
	b=idvRxdePkmhkwv1J/32wnpGlnnRG8A7DTt9SdnTwOA2xytsI0VefngLItnCOv27qM4
	6kv0Ab4XbKYppmRmd6ouwPAePR8QUHhRuZGlhBY5mufnca2HVXOBnhIQlf7aCG9EdY78
	NqePhLH9Ab3QO0lwQxSNUQMhLSKaN27tK/EC9KL2mB0QgyvprVVQlh83ZNUDhRG5QX0j
	D7wK3iCKFvlwumPWAR5vx4Z4rQXfE06e8rMYxY1Xdd7AJGgOM/zGq4B1sQx42IVfi37j
	I6D4MQQzeStCLKsq7zuwSLN/Ko5T4Ry/hUd/HpfwZWVotVhpizBYMGdLX3uYrvUfCm0W
	weiw==
X-Gm-Message-State: ALoCoQl3+KoxAItvRXDh6+Qp1rl7tzqJPFDvJN/XdPNngwMKd8fVrHwel0VeUnwngx7Wb/ICAAQvPSXC2gVki2wtrHHFZ3iX1vybyomDxhDy7zGjp0jf3IE=
X-Received: by 10.107.135.104 with SMTP id j101mr74341552iod.133.1452247141019;
	Fri, 08 Jan 2016 01:59:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 01:58:41 -0800 (PST)
In-Reply-To: <0348DF50-6B9B-4765-9F27-C731D38BBE4C@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<CAJTo0LbtH+=faMv7DpSbhsmaB6A9DmXkDSwAk6YA4cvGi7c_qg@mail.gmail.com>
	<0348DF50-6B9B-4765-9F27-C731D38BBE4C@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 09:58:41 +0000
Message-ID: <CAJTo0LaTcw38opFWMpoS4Ow+5vkmbNV0QA=SROTHQNSpVRBXZw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] musl fixes phase 2
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
X-List-Received-Date: Fri, 08 Jan 2016 09:59:00 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92f784910528cfa28a

--001a113ebe92f784910528cfa28a
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 09:40, Khem Raj <raj.khem@gmail.com> wrote:

> This is a patch from sabotage linux, I have addressed all other issues.
>

Thanks Khem, merged those into my testing branch now.   There's a lot
pending in your branch, do you have an ETA for when the rest of the
muslification patches will be sent?

Ross

--001a113ebe92f784910528cfa28a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 09:40, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>This is a patch from sabotage =
linux, I have addressed all other issues.</div><div class=3D"yj6qo ajU"><di=
v id=3D":51p" class=3D"ajR" tabindex=3D"0"></div></div></blockquote></div><=
br>Thanks Khem, merged those into my testing branch now. =C2=A0 There&#39;s=
 a lot pending in your branch, do you have an ETA for when the rest of the =
muslification patches will be sent?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe92f784910528cfa28a--
