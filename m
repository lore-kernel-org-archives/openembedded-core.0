Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9670873D5E
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 02:09:45 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so4293402igb.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 19:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lcznP1Iku+z8CqoTlKJGPoFeQ0+beaL3LbUoE4XMRzk=;
	b=cCJ9Wah4dneck960esthpy5DqL9zspgftJICQ1G6wt2VXPj1udxYPI89QFM9dJFRQ6
	Gv7RoNUZcqB8KjnyxjHSdpzLk7XyabppqG0tcx3eE5zF6fMBdpg6nJtyHzyZxFonoAEH
	Vpts+9d14MxeLSNKsOJhTHwRUqYbtZSO5fC/AwT50jbfw/POGGvXyy3D8XFWlRwcjnI5
	D68ozwvZe+uBvI98th8wh4SuiCeFdlOl7fhpZ0AsAv9+H8HvNQZkX1GHBGJL7uKagIj3
	AOpmMu5qwLZfedmTRK7aDebVoSWqIAnuYHo0zZP/4FZhdgAF+nis0rAFnVd8k+/M1PUd
	SMSw==
X-Received: by 10.43.13.71 with SMTP id pl7mr1202736icb.31.1429236586511; Thu,
	16 Apr 2015 19:09:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Thu, 16 Apr 2015 19:09:16 -0700 (PDT)
In-Reply-To: <CAJ86T=UwLFJ5LOAg48Z2jM973JyWc68EiEER9tADc+7qQdnDWQ@mail.gmail.com>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
	<CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
	<CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
	<20150415100850.GA2338@jama>
	<CAJ86T=UwLFJ5LOAg48Z2jM973JyWc68EiEER9tADc+7qQdnDWQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Apr 2015 22:09:16 -0400
Message-ID: <CAMKF1soYC_BnMGv4Su5Z+6v1oFKpYCfRWvFxdnPXp9i04BAHHQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Fri, 17 Apr 2015 02:09:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 5:37 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>
> Hiding OE sysroot perl when configuring intltool and using only host
> perl does also prevent the segfault.
>
> I'm not sure what the correct fix is though. Perhaps have the
> autoconf-native scripts run host perl via a wrapper which removes any
> reference to OE sysroot perl from the PATH?

Not sure why Richard suggested that but may be his intention was to
build automake-native early enough since perl takes a bit of time to
build and it would serialize the build but we dont know unless we
measure, may be there are enough native tools to build to keep
processors spinning while its building perl-native
in theory correct fix is to add dependency on perl native for autoconf
native and do the necessary surgeries (if required to use perl-native)

