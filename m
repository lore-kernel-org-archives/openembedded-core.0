Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 124967F7B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 16:28:03 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c26so3035137eds.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 08:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x0p2HCcdjjju7Yp6X1FFKNzz0GTjD8R3hLHB8PZx2sw=;
	b=AZkqnBP9Rc2U+b6qOlK3V7lLqRJHsudQo0TQjMj2hewmc5AOaDCYmukerqR9vK2FvC
	fkIbIDEZJf+YnH9TwD6H16wbkaK/LXAVbh40waMAYpnhUzoIVzPOc+pzArmbhn7bnBeC
	IDTerjBD2CfV8LYAmd7cQmbHjPj2Uz3txCrRbdQ5WtJ0rOo53N+wvv+kAymCE5HSjE9q
	o70ZbHRD7BKgzUnfo2wbAtGG3CBVkrUzIGlDFzRAlvB6U/HOc94tcODdLUMhg0HkX8tT
	nT2mcj8gkGnDjGNIlDWcfOoLu1+ch7bOgVesRt3y62SopRowteLXGJxnS/RzUDZOj48b
	GcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x0p2HCcdjjju7Yp6X1FFKNzz0GTjD8R3hLHB8PZx2sw=;
	b=do4P1jZXXbW5ZJYFB+AdckbjW0yDpgCAMr4zZNPslFjUZP+JSG8jrr2LZQ9LREY3rs
	rD6fTgZBcNRpiFHDlEbs4hOD8lH2wmwCP5uL5eCvPU5lKumWP4CDrZQ6DorPKTMy6NLx
	5QE7++SZigLiuZvzUGv1JYQSbZtrbIEomDHXGbIsJKnwaA2SVKZX+gMP5tBx4KEiA/dv
	DPp7Vni9Y7O1hBJIIXC3dH9+h4ojDZKXeZMsQxzZqPO6sdcZFjBUUu4ZLTW8FXerWBxY
	niAuYtv3nAdVtgrWZxanRfLbwjAktG9ULG7ROHNrZev8PQDxsOWO6RDaN1k7zXPLnIw9
	Xl7A==
X-Gm-Message-State: APjAAAUGFLk3Q7FCp8UxH4qKpO20d6digXR4zrZ2gNZT1PUL6gNSQ/QO
	7wnTMiABSS/D4jNF1LLWayq4EIP/QHbgsSQZq338kcn5
X-Google-Smtp-Source: APXvYqx0F5NPdz3tAuzt7cjKq6j7CVQkWgmpd0/XwyRkzpi7VxPlVqRbXL/MkjqRf2C26pM/76Gy9k8torrkm6q/ArY=
X-Received: by 2002:a17:906:4815:: with SMTP id
	w21mr16475291ejq.259.1576427284507; 
	Sun, 15 Dec 2019 08:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-20-alex.kanavin@gmail.com>
	<e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
	<CANNYZj_Fj1KZoTDxsVzyJ_4Ya9KHOys9LsY1OQgm4UogC_xd-A@mail.gmail.com>
In-Reply-To: <CANNYZj_Fj1KZoTDxsVzyJ_4Ya9KHOys9LsY1OQgm4UogC_xd-A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 15 Dec 2019 11:27:53 -0500
Message-ID: <CADkTA4MyfWZfd-a9jqhTOHtFyM0RW2Mo5aDa48zy817=1g0WXQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 16:28:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 11:21 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 15 Dec 2019 at 13:53, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> wrote:
>>
>> On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
>> > Removed the bleeding-edge variant; if it is still useful please
>> > maintain it separately.
>>
>> Its needed due to people using varying kernel versions and in
>> particular by Bruce for testing of new kernels.
>
>
> The bleeding edge variant has been introduced for the first time by Zhe H=
e of Wind River 6 months ago, and hasn't been updated since. If I had kept =
that in, it would actually be providing an older version of the component t=
han the main variant. So I am not sure if it's actually being used; if it i=
s, then it should see more frequent updates.

linux-yocto-dev needs it, and unfortunately I've been hung up for
several weeks on getting mips64 to boot with the latest kernels. Hence
my entire queue is held up on that at the moment.

>
> Another problem is that devtool isn't able to upgrade the main variant pr=
operly with this included. I'd rather split it it into a different recipe, =
if someone confirms the need.

It is definitely needed.

So if it is dropped now, I'll just have to re-introduce it in my next serie=
s.

Bruce

>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

