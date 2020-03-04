Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id F2CA7618EC;
	Wed,  4 Mar 2020 20:26:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o24so1513084pfp.13;
	Wed, 04 Mar 2020 12:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=gFEBFd6C/jMMkSpEU1ncSirN5RIVDBNx7kHPa02HEd0=;
	b=EkbCCVdKDmoUxfOKEajPAEmdjYxwE72jsR9ER5xAzFsI6PUHTC0+jZNWTrkcCur/Wz
	z6oRfB6d2DZCwRg5A3fY+zSUZYzlCNSOhMHiqI3NochX5hT0juhtiWHQ+LDvfDdBZ3QB
	vepTNvfBvYNlYsdjPpJVzjmrhfRE4eBbYvIWGadq3jthWcEjXjmrWffD261+i6uQksOQ
	oY93boIW2tmnx4hynrcQtJ6yATt49tHQUvUbRPzOiZFNDc68XaAFKnWF6byGJ3KRMC+d
	AIaMoaNwHLLBlf/2a87wmLZcvk2NHs1aL0U4hB/NcilRdBuUHXlWVpD1ZLABs33HeSUl
	3wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gFEBFd6C/jMMkSpEU1ncSirN5RIVDBNx7kHPa02HEd0=;
	b=FuLz43eMn+X5ol3mTrSAW1R2KkK4McO6Dy6DOVpwonwjnbaAm9IXydr9GnJErj1SYb
	u0hvsjQ1lGr9DRTA0lek2z0keQpVpGhhhpd45MyLe+u+xz3uN/T5EoBrScdQ2fEAbIQe
	zabWwPODhBG8mn4UDNrTE2MjPBUIp3H15DHkk19utOE7dU1i5NR66tkrqpgN8T687sBe
	5IWpOzXuNnJrHyuQsNw1TF360o5M/ujfSKHnGSWbAjS/RJAnN/KNMRBk3P6zHuju5TkA
	jk4UsJ1B2iLUsT5OgG4c912gtEYo/cBoB2L1h1vEa9i6ecGTMuTt6ArNUp2FHztZhiuz
	v0Eg==
X-Gm-Message-State: ANhLgQ36VZsYkkFXV2Xi9XzAZeQlznNb5FnM/1fYb+K5wNFiEYSE8mNx
	EMtl7eqiJIfIDJt/QvQ2pmDYnpcc
X-Google-Smtp-Source: ADFU+vtbcWjNFVWaYNGONvWJ+7Vr200n3W6dPIX+X8Qr2SmpMBIVdRE6V7NTT21KyI0hzqAO8hv/GQ==
X-Received: by 2002:aa7:9102:: with SMTP id 2mr4764795pfh.195.1583353591545;
	Wed, 04 Mar 2020 12:26:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3055:bf8b:bc3b:3d57?
	([2601:202:4180:a5c0:3055:bf8b:bc3b:3d57])
	by smtp.gmail.com with ESMTPSA id
	x190sm29944376pfb.96.2020.03.04.12.26.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 12:26:31 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
Date: Wed, 4 Mar 2020 12:26:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304172415.GA29456@localhost>
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Wed, 04 Mar 2020 20:26:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Adrian,


On 3/4/20 9:24 AM, Adrian Bunk wrote:
> On Wed, Mar 04, 2020 at 05:00:44PM +0100, Alexander Kanavin wrote:
>> Taking offense or getting angry at the yocto project is entirely
>> misdirected.
> I am not angry if YP does not provide security support.
>
> I am angry when YP is telling lies that it would provide security=20
> support, but does not actually provide it.

=C2=A0I am sure its not the intent of the Yocto Project to miss lead folk=
s.

>
>> The liability for insecure millions of devices does not lie
>> with the yocto project, it lies with the OEMs.
>> ...
> The liability for insecure millions of devices lies 100% with the Yocto=
=20
> Project if it claims to provide security support but does not actually =

> provide it.
>
> If a user has to decide today whether an upcoming product will run
> Ubuntu 20.04 LTS or Yocto 3.1 LTS, then it should be clear to the
> user whether or not choosing Yocto will provide upstream security=20
> support the same way as Ubuntu.
>
> A user reading the YP LTS announcement expects security support similar=
=20
> to what Ubuntu is offering, and might only notice that this isn't true =

> after a known vulnerability gets exploited on millions of devices.
I didn't get that out of the announcement. It only reference in the LTS
announcement=C2=A0 regarding Security was in context to Community support=
=2E

The new new LTS / Stable process wiki does not claim such claims either.

https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS

>
> If security support for YP stable and LTS releases is only on a
> community support basis and usually incomplete, then it is on YP
> to make that clear to all users instead of claiming the opposite - in=20
> other projects LTS does include security support, sometimes only=20
> security fixes are permitted.

Can point out where those statements are made? Again, I am sure the
Yocto Project would like to know.

>
> This could be combined with a call for help for security support,
> an advantage of being honest would be that it becomes visible for
> users that there is a resource shortage.
There are weekly status reports=C2=A0 and minutes from various meeting th=
at
include the attendees list.=C2=A0 The attendees list has not grown. The b=
uild
swat team was shut down as no one stepped up to help. That was an
opportunity for the community to step up.

There is request for help regarding defects sent out every week and if
it wasn't for WindRiver, Intel, Joshua Watt and Richard the open defects
would go uncheck.

So the resource issue has been floating around on the various mailing
lists for some time. What do you think needs to be done to make it even
more visible?

regards,
armin
>
>> Alex
> cu
> Adrian
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architectur=
e



