Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id AA9F560851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 17:26:48 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id i18-v6so8978201qtp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 10:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tJvsNKXRe9cCujR/vQ3Eg+FH7iNsP4P8S5I6M0JBdNA=;
	b=fc2su4OQ88eJ6crX7QgHeOfBlq9bjRZFLu/J3tPDOsljf+wNdBUY2yDtWu+Gaazd3s
	0QIkpQzSlOvGlBqCtmFvxtpjCymegiSsNYBDuZrGbHdDbaRfORXdV0lc2V9CEog+AO2G
	5f87IMIk+/l1yh83ghsNo/rfDbTlkQpECIhiHPCMle0kqixaB0/r44Dc1WNPerRMeVIw
	o5n7RCqoK1aY/o9L5BdR0DDQHfh7KZ5/NzO1AUsVbF5iYEkCZ7+9ZFWvq1vi7m59h9z+
	nTKXXtWpnUVih8ekFFzs7hc7HvfEuwmZ8dM9wchOnn1FOK9R3M/Fynnp4uni4y0fIXwS
	QIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tJvsNKXRe9cCujR/vQ3Eg+FH7iNsP4P8S5I6M0JBdNA=;
	b=OXAIfDr7cBLVllxy/aUCvOyb6BvxymAW3+I8R5poFPnXOMcbAKV/aJqbQda1L82U2+
	M+1+QlF70sFYVu1H4NSuiFIPSKf4vCF2PVcXv3hqyvc1VikoNC/rc49NSrUbh0jLxKn0
	HPo0mqZypAoMwfzssaUUM6wUxVlVAfVocOh3Y5xhuvozhysaB77trA/7oe2eUSo9Sgxd
	o9Yt4wZfLsTKJSfIFC+iRAENu1oPmZXKXz9ByhL+9YG43dU9+J2ufA1yhYDdbU3R/jHE
	1sIbNDTv/t02i/hpyybdg9i5pgMPCAiHJPFrwnYdDUWRjcFoNu8ChIJ8+/vp3pzNt4Z8
	jI2g==
X-Gm-Message-State: ALKqPwdBjxDEmbKFYY/Dly1YPJjXd9fAR79cDm3fxx+AxfhkZjqyyUu1
	Hwx7yP6X3OQGUfbLAzbpeyctm0hYPVNBgKJcdTc=
X-Google-Smtp-Source: ADUXVKIHOYpASm6SqwVsf5tHAc2HMRONg/VJaJfihqsQWFbBgr8JSg23CdzTEaxNTfw3xbvZuOqNuWkzqEMzJFbF2OU=
X-Received: by 2002:aed:23d0:: with SMTP id
	k16-v6mr17956725qtc.20.1527614808875; 
	Tue, 29 May 2018 10:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:26:18
	-0700 (PDT)
In-Reply-To: <CAEhQi8krCQK=HoekQXPM-5hTPv-ch6S_qy=wQnVTkwm5XtpQmw@mail.gmail.com>
References: <CAEhQi8n2uy8y4OyZ+X1hxcEQk54sAV8Ew-_8NsqD+ri8ctfRFg@mail.gmail.com>
	<CAEhQi8krCQK=HoekQXPM-5hTPv-ch6S_qy=wQnVTkwm5XtpQmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:26:18 -0700
Message-ID: <CAMKF1so9VrkxJwaRi3oNT-+8onzOp9m_4Mc8c0nKXQAQe4nvoQ@mail.gmail.com>
To: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] protobuf fetch failed
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
X-List-Received-Date: Tue, 29 May 2018 17:26:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the branch has disappeared upstream. No sure if we can find a
equivalent fork where this branch is intact. then a simple SRC_URI re
assignment would be enough. Otherwise we might have to upgrade to
a version that exists now a days

On Fri, May 25, 2018 at 1:55 AM, M=C3=A5ns Zigher <mans.zigher@gmail.com> w=
rote:
> Sorry disregard my comments on protobuf_3.5.1.bb it works there. But the
> questions stand when it comes to rocko branch and protobuf_3.4.1.bb.
>
> BR
> Mans Zigher
>
> 2018-05-25 10:52 GMT+02:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:
>>
>> Hi,
>>
>> I am using rocko and for some reason the fetch started to fail. The reci=
pe
>> protobuf_3.4.1.bb
>>
>> SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.4.x"
>>
>> ERROR: protobuf-3.4.1+gitAUTOINC+b04e5cba35-r0 do_fetch: Fetcher failure
>> for URL: 'git://github.com/google/protobuf.git;branch=3D3.4.x'. Unable t=
o
>> fetch URL from any source.
>>
>> The strange thing is that I cannot find a branch 3.4.x in the
>> https://github.com/google/protobuf.
>>
>> I also noticed that on master you are using 3.5.1 but the same problem
>> occurs there
>>
>> SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.5.x"
>>
>> which is a branch I cannot find.
>>
>> What is it that I am missing here?
>> Would it make sense to use tag instead of branch in the recipe?
>>
>> BR
>> Mans Zigher
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

