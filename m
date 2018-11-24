Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 637EE6D502
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2018 21:39:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j2so15299558wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2018 13:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6Kk4kn9rqOEEJ1rEjty9G9b2BE+AjxaG8enbhjXW8fc=;
	b=QcpSrWaj5WKb2/j78hhDybaX+3EZpml2g8QT36hAS22CKoVzHppC6xQGZTJr9ta+wL
	Pj+s+RSRYD0CosuVjOGIDD3PV3u9qNxQD0PUgtpUVPGw0X6GmC+dqw5kgDqaL2atGhLu
	er7lPHTtkyz5YW13ZV2YSvw5ZczGhG7o6F+MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6Kk4kn9rqOEEJ1rEjty9G9b2BE+AjxaG8enbhjXW8fc=;
	b=T/l9ZcJ6UoPix7YWcznPUe23kuYEhN/PDbcuh46ynuWHgaH8wKYJ6GXPYFf8XguTxr
	hDRH3RF4lubRkp9q0Us8yYRKv2gxiKBIDftEL4OkZfd+VTbHanxsUtrewmTxzASpi7vH
	PBSqp1sLhgQj4AdjvFnKqfGzh4vdt9F2OaGFgyLHcG3DKFqQPoBC22loVEnXhiP33Fjs
	6P/j6IvNzlSOl6y+eYeuf+r/FLL7/MB4xYck9gigYmKWwIgSwRKmarOfUZPkWuC9p2IM
	5SSZs6uvpnPAJE3MF7cXd61Hn7QgmtScJFhgGnfGb6eRFZ5YjFvFoeGJmJrLNlG71C6I
	SFbQ==
X-Gm-Message-State: AA+aEWZR8NvhM0vHchlgxJvdvWdrNAzdl4Z1Cgz3HevFjAKXYYv/rjno
	7xDoaUKEAXfoMOEoWnpU/jyqig==
X-Google-Smtp-Source: AFSGD/WQEK0BO0YUFL4GkfKoo7kDMkjMyPIjBtAn13omT/PHbxRRBcYxOMvqs8o4XI1OzCHXk4h//Q==
X-Received: by 2002:adf:92e5:: with SMTP id
	92-v6mr18061121wrn.124.1543095575007; 
	Sat, 24 Nov 2018 13:39:35 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l24sm8362101wme.32.2018.11.24.13.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 24 Nov 2018 13:39:34 -0800 (PST)
Message-ID: <9e102d5de10840992d5fe843332a87a27a7b06eb.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster <akuster@mvista.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Yocto discussion list
	<yocto@yoctoproject.org>
Date: Sat, 24 Nov 2018 21:39:32 +0000
In-Reply-To: <630ef788-ccac-7ff5-edbb-6695ed621276@mvista.com>
References: <b96afa3704ab3844fb69bfd7218fc381c368403c.camel@linuxfoundation.org>
	<630ef788-ccac-7ff5-edbb-6695ed621276@mvista.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [yocto] Autobuilder changes
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
X-List-Received-Date: Sat, 24 Nov 2018 21:39:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-11-24 at 07:40 -0700, akuster wrote:
> On 11/23/18 10:02 AM, Richard Purdie wrote:
> > We now run "a-quick" on master at 1am every day which will make
> 
> What Time zone for 1am?

I'm not 100% sure but I think its UTC.

> > Building older releases is now broken until I sort out the
> > corresponding helper changes for those branches but one thing at a
> > time!
> 
> Does that include Thud ? I expect sumo and below to be problems.
> 
> Do the changes need to roll from newest to oldest  or are they
> independent? I was hoping to get Sumo tested using the original QA
> process to buy us time to get the automation working on it. Does this
> changes that ?

Good news is I've fixed the older releases now and run test builds to
check things. There were a couple of fixes needed but I've sorted those
and done a test artefact deployment too. This just updates everything
to use the new builder names.

The QA process is unchanged. If a given build generates a test report,
whichever release it is, it will be collected up but if not that is
also fine. This means we can opt in to the new code if/as/when we
backport anything. So we're good for sumo.

We do need to sort these gpg issues across various stable releases
though and probably tweak master too.

There were some test results ordering changes I'd be tempted to
backport just as they make reading the build logs so much easier...

Cheers,

Richard




