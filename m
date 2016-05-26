Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 53CF66E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 18:26:50 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id y126so63882233qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PwJyvKjW60VY2HzI+hzDx/7E7vPOu56I9/xc3VzF3sY=;
	b=Wc+NQPWaFXJEVKIYa54F2oq6e0MdDgYPZevXV3kUuFTbrO9rWEtKk3J+xG70/PJqZS
	DJLXm9wI6g2daaDuj9R7BzOt36xzeeTunVtmexaCbWTrNe5BJu4kKLuOrUsxhpecltwC
	Dg18njStJgPUc1WefpTCyR9gGIhnFrOy/RxMxWJFmTEn15x738LpW/mMkqzmTZ1CHJQk
	vrYjXVz1OEh61XgQvX4Oe2Is6IXrFu0ArVl4K4YfjKE6F/eCmqz1uk3ibF3DqEzspj/4
	Zqyt+t8nPGARWXnd/PdNShMbG51udNw8naXnS+GhgM8Ze2zG+vsh9UXby8ka13G9rQpu
	N7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PwJyvKjW60VY2HzI+hzDx/7E7vPOu56I9/xc3VzF3sY=;
	b=SOg7AlYfZTaMj1SFPxPjlzoh4JFFxnsGwnIYLEKrO4Ih66Ie3Z/V+w1+DvZW6m1ujv
	xBN/PPaM9ofWwsnNEN3yN7v6Oh4kn0VG3qNCzfPErM8T1YtFQ5WFFdxehmSjJ3Tnr4Wt
	R0nM1uXSOClPAu4j890knCODqtKDiNLFyiEMzc1OdNJqW9J/dJlYvbmzi6bMenbJmX62
	OqRRrnxDg3SYouCpyWL+l0GdZXMBGO+t1Z2gRnRtqLzE3J4g/Wh77QBAUqw3TVX/3Qlq
	dsLbnH1737ab+owX70fYNdjpNXC5oK8a7bzjxgQ5CkuVioAm/0hMexnxnQKxBkowzLPF
	8piQ==
X-Gm-Message-State: ALyK8tJdgETMKI9n9V1CFKUSd4zpHWXGCp9vtJYhM2WBRHESiABOAa8yjdlQbqr9gpavMy5rzzn0+XTJEhf44w==
X-Received: by 10.233.239.210 with SMTP id d201mr10684927qkg.41.1464287211331; 
	Thu, 26 May 2016 11:26:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 26 May 2016 11:26:21 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605260450590.7564@localhost.localdomain>
References: <alpine.LFD.2.20.1605260450590.7564@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 May 2016 21:26:21 +0300
Message-ID: <CAMKF1srrmTQx7eSz5ZmLP7jeFR1RgpwFT9vQ=Kw3cXvWLUdNCQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there an actual defensible usage for combining "_append" and "+="?
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
X-List-Received-Date: Thu, 26 May 2016 18:26:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 26, 2016 at 11:56 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
>   i've grumbled about this before -- the *apparent* redundancy in
> combining the "_append" and "+=" constructs -- but someone recently
> suggested there's a use case for that that weirds me out if true.
>
>   given that "_append" defers appending, and that "+=" inserts a
> space, the argument was that combining them both defers appending
> *and* inserts a space when appending is finally done.
>
>   *blink*.
>
>    seriously? is that what that combination is being used for?

I am not sure if its used consciously most of time, I ask developers
why they used it
they just wanted to add to an existing variable and += did not work.

the construct is an unintended side effect of bitbake syntax

>
> rday
>
> p.s. i don't even want to think what happens if you combine "_append"
> and, say, "=+". or some other operator.
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

