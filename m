Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01C2D7FE01
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 10:51:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b19so2366687wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 02:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=45CFMparynwk+ypHnRt2KxnLcKuc0l80Xv9XVqGoS80=;
	b=hcWZlvpwPXVQjliqgb20RguPGxCM47jbUtAtcb9wYZ1IPzFfWReoQfGaxzraqd7sYG
	qu4GJktjVcfg5zbpfIRS1PwuVKGZ9JhZw5ww7D8ya78kldDlbKD7OZqpamMtYmEXlE5y
	uR+LUjRab04DRPrEFrERtJy2aChfrDSP0iD7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=45CFMparynwk+ypHnRt2KxnLcKuc0l80Xv9XVqGoS80=;
	b=Cg8ozyQ2WAKUhqckngXqQhKRDitxI2VXg8hi2Bo7MpsWIhIPPdG9alj4FgONLO2ktZ
	atOQxbCUeymo2W3R+j1dHAn56nQ1ssnk1rV3GJX+7ZzpP8N+iJwYGmA9JOOa1AmzzsQG
	GphidikniklN1ErNHA4/SwGvvx44ijeIOwDhq9hOkZX1Kh34L9N8/NdK97uR9iT8wwNL
	TwUErGeXQiKJzUyR3pGJE0dz6Su3GNDrwcKHRX7il3EBzu5KRRvKxnN4HlK2oqx85fUs
	XBCEwFD6TwHzmLDrpYjaEvWTnpxd7M771Lw5A+Le7xt4Yi7WIc9oTqwovOX494Dek+mW
	TVdA==
X-Gm-Message-State: APjAAAXdQs+kFj4T+d6ag38Qt/Wev1h1DcBJHvLhlSjVV9Gi1jNYUkZW
	xnZp9MoxEQLHnPVKepVzG2RXYQ==
X-Google-Smtp-Source: APXvYqxOPiBCGDftiAfW74RLAFlCKV+/CNQZ2QwZqBdWy3TkFuB6omujKoe8EuPxNmhbcVHjrX9DpQ==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
	19mr4182410wmg.20.1578567117611; 
	Thu, 09 Jan 2020 02:51:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v83sm2492682wmg.16.2020.01.09.02.51.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 02:51:56 -0800 (PST)
Message-ID: <f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Huerst <pascal.huerst@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jan 2020 10:51:55 +0000
In-Reply-To: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 10:51:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 13:10 +0100, Pascal Huerst wrote:
> I'm looking for a way in yocto to build tagged releases or actually
> to build the newest tagged release from repositories.
> 
> There is a way to specify a branch or a tag in a recipe, but no way
> to always clone the newest tagged release, that I'm aware of. I
> submitted a patch to bitbake's mailing list with a proposal [1], that
> would use bitbake's `latest_versionstring()`, to always find, fetch
> and build the latest tagged release. Unfortunately there wasn't much
> of a reaction on that proposal, so I'm taking a step back, collecting
> ideas on how this could be achieved properly.
> 
> Please share your ideas...

I did look at and think a bit about your patch. The trouble for me (as
the bitbake maintainer) is that:

a) it isn't clear/obvious from the variable name what it does (or even 
   from the code)
b) it adds yet more options to the fetcher which increases the test 
   matrix and possible ways things can break
c) the test doesn't actually test it does what its supposed to (no 
   check is made on which output is downloaded for a given revision)

Some of these can be fixed, some are much harder and I can't decide if
supporting this kind of edge case is going to be an overall good thing
for the project or not. I don't want to give you false hope by fixing
c) only to say "no".

Add in Khem's valid concerns about reproducibility and it makes it a
tough one even to give feedback on.

If we have a ton of users saying "yes we really need this", that would
help but I haven't seen that as yet...

Cheers,

Richard



