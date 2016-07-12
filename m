Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 347516067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:38:09 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id o67so29156016qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 16:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HMIPdSGGBMPy6O42sPBIItUvqL2lcld6RpwEmkPP4/4=;
	b=Z61R/M22Zo0jfQXUXDrRhSqhdtNVx8F2p+m7m24mssu45otAc6bUAFvIRn8UuMJ05p
	kqj99qjL2/eBbyD3wHETkZ3YlMBnyWJwq2T//rgiV3xLaUeRa1nU84pex9YrOlcDJWQ5
	c4IHvXThzu/Ld47+Ilfg2G6nkFRK22m5P1X4Ze3oafvB49RMDGTbmNM0xj10a8I6Ohhc
	DdIwUyDJCjyeJxYh0rz0bESQtAy5+uJdtb1mnlc24atJuMzDCtBdC1lGB8AQjjDzBAnm
	pI1eQ5QVdKSGc4VE9t8R54pQY1b3S1gYPRVg/xHw6CT+PYT0yCKNDYljBG8qWhablGCd
	y7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HMIPdSGGBMPy6O42sPBIItUvqL2lcld6RpwEmkPP4/4=;
	b=KI8L5qe2N0DlZw5wqbcQAYYGu7FlN2JfskUjg/alLTDO1PLrdAIZkhNvZu7gc6yfGg
	qK/awl2bYsfAD0Tj418Ar+HshFJKFN6l+uT1K93L46tVqzA4uTGYoZBASEkFURIZpvKV
	dQIF0dHUCzdNbhd9ig3pJ9b+MwQuO2stU52LzEQiZUF8OGHJW7iY+C/fFGLSHxH/Cfga
	dMPNQ0oYhbjeK7epKwKB/bhAaNdsO4qnHfPzh9YMj5tjldqkhDj1dqsKQsO0OTGRk2U5
	tOGp5mLTBoMcawDqzH0yN49NO/uKj7VRQNNGNMqq05GZHLxF/D9DB4OkfCVR7J+N584o
	AVow==
X-Gm-Message-State: ALyK8tISMzfEbRdlgbg3RDIEwv8UJUa8kJODS3l8JVLhLbrGc45s/yHHbrkGoLLoK+UFTUQICBHL+ex5/eDjlA==
X-Received: by 10.55.39.142 with SMTP id n136mr6811502qkn.149.1468366690509;
	Tue, 12 Jul 2016 16:38:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 12 Jul 2016 16:37:41 -0700 (PDT)
In-Reply-To: <57857E9B.2060607@gmail.com>
References: <57857E9B.2060607@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2016 16:37:41 -0700
Message-ID: <CAMKF1srQZpiu1fkeTc9KYmc+p-jztbrL_5zywzPs2eipoE4G=Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: musl 1.1.15 for krogoth?
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
X-List-Received-Date: Tue, 12 Jul 2016 23:38:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 12, 2016 at 4:34 PM, akuster808 <akuster808@gmail.com> wrote:
>
> Khem,
>
> would updating Krogoth musl to 1.1.15 be safe?

It would be, since there are no ABI breaking changes between 1.1.14 and 1.1.15
incremental fixes and new architectures primarily.

>
> I already pulled in the other musl tip updates.

OK thanks

