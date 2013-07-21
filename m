Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id B3EDB606AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 13:27:00 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3296828eek.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 06:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=tLOp5dGGtgbpyrDRXbIsDQc1Tgn5Sa+UKTQAV+YA5q0=;
	b=lH9X+gwlIziP572Mpnk0Cs/9RmCaauAQXHfkYB6/2pG0pJO8MLNjPloKm2PuUOpgsn
	v8LjgymliYQqV65P4aCymSc/W/Pvz8lKKC9MlBAk6MIR+vJSk2HZuoacbnzDfPyfjpiD
	IA3nn00fWalUNssYmIaZFSmjzzHqF2vM1aOHmOIQSlJ6WDDJYuWQTg0KUAmdq72PZhg1
	J+ZAyybK0aIqg9dR3kKVChlg07R26zHjODVOuW/CFy870/1JhzNaqhtE53UQWScNjk9D
	X0FEPWe9o9zntaMeynMiu17wkRe3xnN6IR714IUtSzYrx7Ok1Af+b4bBd5Bn2Ad0wp6P
	oVyg==
MIME-Version: 1.0
X-Received: by 10.14.173.70 with SMTP id u46mr23125194eel.92.1374413220592;
	Sun, 21 Jul 2013 06:27:00 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Sun, 21 Jul 2013 06:27:00 -0700 (PDT)
In-Reply-To: <2871747.3HkfyQL6od@helios>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<51DAEEE9.6000203@windriver.com>
	<CALmOhgkONNQgOjYsosWAk2avLr2nEukjRW=kFuAzLMyyvjEuGA@mail.gmail.com>
	<2871747.3HkfyQL6od@helios>
Date: Sun, 21 Jul 2013 09:27:00 -0400
Message-ID: <CALmOhgk=B3ZJGs_XsVMutwc+=GRaAwVAM5=CdLf9HmsUAyvO-Q@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlDe7kvBf0Oc5laHxMFbgkUYoZlJTvMJYaU0hSds6NXB31E2tHl+W/YhDfOm3uc4vrT6VLx
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Sun, 21 Jul 2013 13:27:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 July 2013 05:41, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Tuesday 09 July 2013 16:14:55 Trevor Woerner wrote:
>> On 8 July 2013 17:55, Mark Hatle <mark.hatle@windriver.com> wrote:
>> > For anyone with an old or broken system, they will need to download (or
>> > build) the buildtools..
>> > install it and have it in their path prior to running oe-core.
>>
>> Does a download location already exist with downloads available for
>> people who receive this error when building? If so, could it be made
>> part of the error message? Or maybe instead of asking people to use a
>> working version of "make" the error message could instruct them to use
>> one of these buildtools-tarball SDKs (and provide instructions for
>> doing so)?
>
> According to Beth, the current (nightly build) can be found here:
>
>  http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/
>
> Location for the upcoming 1.5 release when that is available:
>
>  http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/buildtools/
>
> The tricky part is we don't have a solid location yet, only one being built
> from master. Perhaps we could link to an intermediary page with explanatory
> text that can link to the appropriate location.


That would be quite helpful, and maybe even help people to help
themselves should they come across this problem when trying to build.

