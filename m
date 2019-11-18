Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 498C67F8BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:18:12 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id d10so4300244vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 09:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZbyA/IAytgX7JWQDkkAzgT3PNu4obVhg6PIJljG8YFg=;
	b=FMKalzwO56u0PjOpejh2Fw490VDW0+WiiFgK5BJZWJdTjyD0aMZMPPmu9bOognInnr
	Kj0Gp1JAR7JDKK56TCJMSQXe0oL+51PQT/jNh1Ix4qPd/uLprXuI326K+AEu4cosvK3X
	HrF8UiH5Lom8KzpMJAjKmsdR8kykgsbv8feXutvrR7bBEcB8tyINJM5QbwavnN3GTylG
	ymRLqtH2MT6rgTYaUugmwGe8uhyFwlFth4r4DqsVVZGRlqQ9QBv80lwIKNHyRQt1G2Rw
	3EvalcjeM65c0qTiFp5abz7fYWgHQmXaB92sjiFX9Qiu11Ls3H9zeJo3kPpnynZq2KqZ
	7yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZbyA/IAytgX7JWQDkkAzgT3PNu4obVhg6PIJljG8YFg=;
	b=GYM+ojCXQcyW4wIojebtnfMiWXXwKHLPYE924bKeo57yayRbYk3ej/MI10EjxSFrN9
	vjVntc0cDKNihxiWc5bZMkqEHX38X+Tcm6W5ts1ZHkdA8TMgBLPIpne+QUIuelDIP0X/
	l+rB/Jqq0qvaJyZeJkZU4rSgZqKFc1ZjlxU5+fyYCGY80DpsWn9HUdLA6vVK0B53w8iX
	tTO11dJqWr/eFS5IkPVMw3sa7+rm4Uy4CdbbH5D2VLtQsU8IyMoV2XQY3s1J45kTdKRc
	ELXkGKiWDN6Aci9BJuTX5o1dEH6EwHP3tuAtBVaB1TwNUe86YJuLBq0Mvc5ul7ugsxJg
	QHqg==
X-Gm-Message-State: APjAAAUaCN4d/n4nS16E9RchyjK1FbtRhVAJ0KQ6h6WYuBn/xG0lGLtP
	pDjMPkVZwO2odSeZMAqkcvfM7Qw2wQ8NnJFvBRa3Te4O
X-Google-Smtp-Source: APXvYqxJ9hkLbu1fyr8VS/h8+VI1xLMH5ag4GPUh6WeQszsLfDdLVpeW53q5XY4VXjaoZrUOUyYWgk1s48PqR5UFcGs=
X-Received: by 2002:a1f:22d5:: with SMTP id i204mr8298280vki.0.1574097492877; 
	Mon, 18 Nov 2019 09:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-9-alex.kanavin@gmail.com>
	<9cefac866172047d73121778c13de58fc215904d.camel@linuxfoundation.org>
In-Reply-To: <9cefac866172047d73121778c13de58fc215904d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Nov 2019 18:18:01 +0100
Message-ID: <CANNYZj9UbdVK9NkoUaNjmBappLvz3ed8zoHYrry2FR37VfKtWQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] Revert "devtool/standard.py: Not filtering devtool workspace for devtool finish"
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
X-List-Received-Date: Mon, 18 Nov 2019 17:18:12 -0000
Content-Type: multipart/alternative; boundary="000000000000e7a4f00597a221ca"

--000000000000e7a4f00597a221ca
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Nov 2019 at 17:44, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> Are we missing a test case for something here?
>
> If yes, would that be worth noting in bugzilla whilst we know about it?
>

There are tests for 'devtool upgrade' (the sample recipes are in
meta-selftest/recipes-test/devtool/) but apparently they weren't able to
catch this. I only noticed because AUH produced a number of broken patches
for some (but not all) recipes.

I'll try to expand the tests so that they would fail with the change I
reverted. I'm not sure exactly which combination of recipe patches before
and after the upgrade triggers the issue.

Alex

--000000000000e7a4f00597a221ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 18 Nov 2019 at 17:44, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
Are we missing a test case for something here?<br>
<br>
If yes, would that be worth noting in bugzilla whilst we know about it?<br>=
</blockquote><div><br></div><div>There are tests for &#39;devtool upgrade&#=
39; (the sample recipes are in meta-selftest/recipes-test/devtool/) but app=
arently they weren&#39;t able to catch this. I only noticed because AUH pro=
duced a number of broken patches for some (but not all) recipes.</div><div>=
<br></div><div>I&#39;ll try to expand the tests so that they would fail wit=
h the change I reverted. I&#39;m not sure exactly which combination of reci=
pe patches before and after the upgrade triggers the issue.<br></div><div><=
br></div><div>Alex<br></div></div></div>

--000000000000e7a4f00597a221ca--
