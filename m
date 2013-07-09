Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A5A78619DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:14:55 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so3799942eaf.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 08:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=D84ovI+MXwUnoBKD/bqCjvNy3DqT6RbbvJnpwSq1J3k=;
	b=NLPm3wxxb3ngDeH4JTzkQd8VkUjYR3B/IpXasG20vf/iqvRGb36hxKco89nSpPsp6e
	THtdFZUwAsq1v//QbHtOAStns+y8f5ML1TpoDvyFeVHS7f6Okt3tX7JE2B2wiAK8QWtB
	A5XlskMjLVwcFMjH/PeeYANv0AlSUaq+qa6nVQdBGPT3EoUeG9sZ5JDbt3oCgAorvqGH
	q0mzFRvNB61DGFXgLcw7/uGfPgZACdOoEu6YOG4HliU0+ELZooJIlmIFMpVDED4mNQam
	7hd5AQXR/jTX/cltaQvtmcbO54XP3XIMPzQ1nW18aFLtZ9I3BWt9IJDBbNDOUP0MqOe1
	nkCg==
MIME-Version: 1.0
X-Received: by 10.14.0.4 with SMTP id 4mr30464068eea.68.1373382895648; Tue, 09
	Jul 2013 08:14:55 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Tue, 9 Jul 2013 08:14:55 -0700 (PDT)
In-Reply-To: <51DAEEE9.6000203@windriver.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CALmOhgk+NG_aqEwbtKXm0KTWGEim9z5bCpCE8sHiovsaDiTPew@mail.gmail.com>
	<51D0569A.7050705@balister.org> <51DAEEE9.6000203@windriver.com>
Date: Tue, 9 Jul 2013 16:14:55 +0100
Message-ID: <CALmOhgkONNQgOjYsosWAk2avLr2nEukjRW=kFuAzLMyyvjEuGA@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQmjdvYgSeFZFpzF363mGQdLBCDkgEmzWQHcQuWgeRNfCOYu/q53DAph0znHaaKr2+LuS7Yz
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
X-List-Received-Date: Tue, 09 Jul 2013 15:14:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 July 2013 17:55, Mark Hatle <mark.hatle@windriver.com> wrote:
> For anyone with an old or
> broken system, they will need to download (or build) the buildtools..
> install it and have it in their path prior to running oe-core.


Does a download location already exist with downloads available for
people who receive this error when building? If so, could it be made
part of the error message? Or maybe instead of asking people to use a
working version of "make" the error message could instruct them to use
one of these buildtools-tarball SDKs (and provide instructions for
doing so)?

