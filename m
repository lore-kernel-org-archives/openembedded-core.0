Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 300346C44A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 14:01:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so9499905wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 06:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=LXI0H8SvquVy4LlvBg9g/20IrI0ryOhr7+AuNAxqxvk=;
	b=Khazv1iF17nvdDLFHnz8baRDQgQ4S3AFWk//DyXT0tir2IAmZcM5DFzBM8kMYA5JUU
	M66REmg7D4Kr7E928g+PaSwACyY3MG431niaMor6jIAJYE7hSs5Q8LSpj1eLKDAeso9l
	zFGZcUUN6jDZC1t471T6u5J7ZaluhUwIS8dUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LXI0H8SvquVy4LlvBg9g/20IrI0ryOhr7+AuNAxqxvk=;
	b=ucfhtdiMGxgzpOqucshKiVeBX00CeXBGc534mOIWk4qrCEMNTWwo5od4hhbbYnhBpI
	8UAJRm9QSHu6uheA/g/wkQJhY2y2JVIOyLg9VrZPOnNKiIioDD4dJ0l/mahbKqYCM/1a
	+q4S25T3JjsgjJFY4ufWovtLU6SGkUd67+MavFNYN5IynLz14NUeRomIHlKFSlsWpu3G
	9UlfxvyrXKJrGoWW7ZuMooTLKjN8/VOzW6r7Pd8QSeWy6DbGsL0snzOHKbd+/1w74DCk
	qz1ACE/kqo5cVTEWgVePX+KVxSvE3s2Yo1Xseu6OyP4ujHlRKmT7z4ImQHdxZ0mp7E82
	ykRw==
X-Gm-Message-State: APjAAAUnjGh/Uoj2+I5/LwS7Obi8p3XMWpkpwzxyV2en5efs4xmhC4Ka
	6XzSJSHeZWZr2Rfu28LwzyikLw==
X-Google-Smtp-Source: APXvYqwQyAwspo/1NyOXs04xZOCNMkeVbYl8wbV0SlxMWMoMlreQVbPZUo/U+xwC9KltClQ0ZkgsoA==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr22147139wmi.51.1574517693753;
	Sat, 23 Nov 2019 06:01:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c144sm2008066wmd.1.2019.11.23.06.01.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 06:01:32 -0800 (PST)
Message-ID: <eeb0a60c55dcb46b977d2129afe2c582f29f3e81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, gavinli@thegavinli.com
Date: Sat, 23 Nov 2019 14:01:31 +0000
In-Reply-To: <CA+chaQeQNCkxL_9uVGsG3jpNYEiMaOd6p6EHnfV6AuCMscF_Dg@mail.gmail.com>
References: <20191111221514.1663272-1-gavinli@thegavinli.com>
	<CA+chaQeQNCkxL_9uVGsG3jpNYEiMaOd6p6EHnfV6AuCMscF_Dg@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Gavin Li <gavin@matician.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: prserv: fix ResourceWarning due to unclosed socket
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
X-List-Received-Date: Sat, 23 Nov 2019 14:01:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-20 at 17:11 +0100, Martin Jansa wrote:
> Thanks, but it still starts and terminates PRServer immediately,
> right?
> 
> With your fix, all my builds now start with:
> 
> NOTE: Started PRServer with DBfile: /OE/build/oe-
> core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 34335, PID: 9429
> NOTE: Terminating PRServer...
> NOTE: Started PRServer with DBfile: /OE/build/oe-
> core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 45753, PID: 9433
> 
> before this I was using:
> https://github.com/shr-distribution/bitbake/commit/728d9ec3b3448bba91a3cc0d505b804e702aec4b
> which doesn't start it just to terminate it, but RP said that my fix
> doesn't look correct, so I haven't sent it to ML. BTW: bitbake
> patches should go to bitbake-devel ML not oe-core ML.

FWIW I finally got around to fixing this. The resource issue was half
the problem, the unnecessary restarts are now also addressed. This was
particularly important to get right for the context of memory resident
bitbake.

Cheers,

Richard


