Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2957C6AF3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 22:55:42 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id o10so1712681eaj.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 15:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=uUTHU9x5gMF4mbP1EF0Lyvfs8H6Zs9k0lPxHUdKZuRM=;
	b=LZ1h1vjlnc8C2I6DSzGHtnE6doPIEO4o9WcbTRwIhmzpBSjXZCN2mgeffHlmqgDNxc
	0V7hYD+jgBNLCE2dGic/Gt1JjWbuyl/7bTpPZIoa4M9yTgDR3XeX9TET+lQ5aLfaa7jJ
	sKVXyOrVtT0Dx7RabY0adQOY328NskRCuRjOAOOeZ7L45REFuq09yu/4zqEVJvQDZEyG
	TNl9ok8KF+qL67ckvZnzEz6q+fHBM9f6ZI0u1YxGVN7FMk2H2/a4tdJebEA0PNQUhcs6
	VI5NAyff4LQNxvct8uml33XEYenqCGnvKgeAWl3DByQeNnqsk+siysqc3nZzkedY5DkG
	jQOg==
MIME-Version: 1.0
X-Received: by 10.14.199.134 with SMTP id x6mr18623532een.114.1372632942042;
	Sun, 30 Jun 2013 15:55:42 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Sun, 30 Jun 2013 15:55:41 -0700 (PDT)
In-Reply-To: <51D0569A.7050705@balister.org>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CALmOhgk+NG_aqEwbtKXm0KTWGEim9z5bCpCE8sHiovsaDiTPew@mail.gmail.com>
	<51D0569A.7050705@balister.org>
Date: Sun, 30 Jun 2013 18:55:41 -0400
Message-ID: <CALmOhgnm7_D0U845bJyxWx=NvrhX-TAYugxwSUt9R8MSM7BB6w@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Philip Balister <philip@balister.org>
X-Gm-Message-State: ALoCoQmUaNjtvsmTvmavsgvWi5ZLPEAFbw7ZAIc/CgEGTRjQzZh6kKECh33MOH2JX1J5wwUg3uud
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
X-List-Received-Date: Sun, 30 Jun 2013 22:55:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 June 2013 12:02, Philip Balister <philip@balister.org> wrote:
> On 06/30/2013 11:56 AM, Trevor Woerner wrote:
>> On 27 June 2013 10:08, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>>>
>>> A number of vendors are providing a modified version, so checking
>>> for just the version string is not enough.  We also need to check
>>> if the patch for the issue has been applied.  We use a modified
>>> version of the reproduced to check for the issue.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>> +
>>> +        if status != 0:
>>> +            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
>>
>>
>> Instead of returning an error and asking the user to manually update
>> their own 'make', wouldn't it be better if bitbake simply built its
>> own known-to-be-working -native version instead? In this way a good,
>> working version of 'make' could be installed in a potential SDK's
>> sysroot as well?
>
> Is the broken version good enough to build a working version?


In my case that's what I did (i.e. I used make-3.82 to build and
install early in my $PATH make-3.81). I was then able to bitbake again
which went to completion successfully.

