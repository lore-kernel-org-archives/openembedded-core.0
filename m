Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E814E79AF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 21:10:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x12-v6so10249987wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nHwwZWMyNdBYU34D5mJP7Lkss8joUvF0VAjbCuHqndY=;
	b=ZwX7OtHsy/syjHc8TwwbQxVZ3jtfiN1Fib8enn+e503QF5uuIBWnN896rsdtT8H4Z8
	cGAKRA6SwDQtHhN/jvfuZ7ar5ku9xzqOnWUMffC30E7yGg7fvyp5CJV1ZSBp6i1T+oBW
	/jSuz/BdALqzoGsDgazij/qYWdAQHylKsUcj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nHwwZWMyNdBYU34D5mJP7Lkss8joUvF0VAjbCuHqndY=;
	b=d5owolI86RlmzDwXIJcsfTXSbzTxDOYG2I78BvNJiLGXNJCTcXxd/fAGC3RAp2vlz8
	saqnrPvsNOF5dCVPsMj9IcZYg5pmLeujfU7glb0FRSrdFkbC6TiHus+hN6nktox/pwvx
	p6LcWbxBUy+WJMTmSMEHE9PmwSU3E3HIH/uZStuRWJhjyB3f+ox2tpYnTDbHmwCU+EP0
	pCbgnUgnnMp7DnZiE6gc+oCk9fVpavncXB5b+bUOeZ1J94sna52FjoP8BGCbhWC2De26
	6FLcQKLs9k9IeWpwNa+URRoNcOt05ZJeqR1RuUwsqIwR5YLe71KGUyACAhSUpeE9l+oT
	xlkg==
X-Gm-Message-State: AGRZ1gLeVvic/aTrcuAGIS1F0qTitQXdw5MlbBOC3XEMBx2C4T1GKu7e
	9aB9riEaEMcJiN3N1l9u30nZu33QmfU=
X-Google-Smtp-Source: AJdET5dMf2Hl5HOXl3b0JSdqTV3ZbOlHA1QLYFDgsYafpgHrH1leJ2z4tEjR7ya7HkwAU3TmDYh0vA==
X-Received: by 2002:a5d:6585:: with SMTP id
	q5-v6mr4486292wru.141.1540847416331; 
	Mon, 29 Oct 2018 14:10:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c64-v6sm10871516wma.44.2018.10.29.14.10.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 14:10:15 -0700 (PDT)
Message-ID: <3fb4ca4995bbf08a40eebfa07518b6ffe2d99855.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 21:10:13 +0000
In-Reply-To: <80df3fff-2347-4736-758c-5050ac31494f@gmail.com>
References: <1540452055-22743-1-git-send-email-akuster808@gmail.com>
	<b2dd231dcb644b0c97082d64abc7dfd703ef6d95.camel@linuxfoundation.org>
	<a6650d3c-d356-22c7-5efe-8ebcf980e9fb@gmail.com>
	<1528f5f1b89f065ed67487b9a35b750e908cf64b.camel@linuxfoundation.org>
	<80df3fff-2347-4736-758c-5050ac31494f@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] os-release: add more variables to list
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
X-List-Received-Date: Mon, 29 Oct 2018 21:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-29 at 12:36 -0700, akuster808 wrote:
> On 10/29/18 10:12 AM, richard.purdie@linuxfoundation.org wrote:
> > This sounds very much like "I want to be a distro but I don't want
> > to
> > be a distro".
> > 
> > Changing os-release just because a layer was included is a really
> > bad
> > idea. Its distro policy what would be included there, including
> > what
> > the cpe name might be.
> 
> This is why I think its appropriate to have at least  "CPE_NAME"
> added.
> > 
> > Whether the nodistro defaults are right is a different question but
> > meta-security should not be poking there.
> 
> I really didn't want to do another layer for something as simple as
> "CPE_NAME" but why not.

Does OE have a standard "CPE_NAME" which works for everything/everyone?
Should it have?

I get the feeling I'm missing something here but you're not giving me
much to work with and the original patch didn't just add CPE_NAME...

Cheers,

Richard






