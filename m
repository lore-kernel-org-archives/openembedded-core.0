Return-Path: <nathan@nathanrossi.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 954986FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:52:51 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v2so2647723ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ama6tt9tAklbtY+P4n3HGutKrkaYYePGHCrWxTfNO10=;
	b=aFILdg/CYxeiQcydcB2dSpkX0T67OJWk2GvetIWJOHNwLI6OicYe8yHPolNFSaIGz1
	CYCU2n+f5pwjU2tXVyhC6GdAeYHbMkx62M+3HrHsiv0XvVuHU9/qkKasTe8ydrZrCw5E
	sO++V0sS3uouNxml7d6FBHn2WCw+yg1Dcyrn0Kfqd6lI1jmFtlTNXSuMaR/r26sMz9GJ
	R/QHWGMWTsMmFT3hr8Z9B/RGnL0OO9irD4y+9XWMls9EwgIk8WrGg37CullvI4FPg/dL
	3sN6WKwSp+ujWIeqLzbZ6WJSasCkU8/VPp/Qyx+zR3P0mOryWSS8qmpbJdlSUgF1LFBw
	QoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ama6tt9tAklbtY+P4n3HGutKrkaYYePGHCrWxTfNO10=;
	b=SYJUj8aH0tbbCXH28z0O3nGh6lUW4e6XjxV7b9zAyqJ3rb9SMGEQf0lNQMOPHy9eDy
	nliKKxZIjznoeYeWjqKNTMui2VjEDv9rrFQlqo0EOLnZ/o/wgDcapU3JvbHQhRJSCd6Z
	27KjZnMBcL3jeLr1oI523z50XVlHegAopaphKoAMQGUfbKMWJOFr8+b/W3WO7CI0ATS/
	09dQmf3X5lAb1yjNZ4Fi0DTOn9ki5ttuzqrBpfEqKZqDj+OR56vSMzHUoReC6PvPPzrf
	XUr+zDQ3NwDgjzymZIwEw+agDGrfVzMoBK9wSJ9SpYOTrR8j4JGGfTJdtLONSv/8WIgP
	lFww==
X-Gm-Message-State: AA6/9RlThhsV6lY3Ys92HCAALSVoJCxBEQpfcR8z48ME9nExlNo0918l8Ka57WN2oXyXDX66e5eeYZxl0q4u2w==
X-Received: by 10.13.237.133 with SMTP id w127mr32581ywe.311.1475135572974;
	Thu, 29 Sep 2016 00:52:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.147.7 with HTTP; Thu, 29 Sep 2016 00:52:52 -0700 (PDT)
In-Reply-To: <330713b9-ebbd-32c0-659d-26f0998920aa@balister.org>
References: <330713b9-ebbd-32c0-659d-26f0998920aa@balister.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 29 Sep 2016 17:52:52 +1000
Message-ID: <CA+aJhH1BBtjevVWR+n_i0f2Yhx2_-LQbzGV0_wfNftBOA7XQcg@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Kernel check of PV versus kernel source
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
X-List-Received-Date: Thu, 29 Sep 2016 07:52:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 29, 2016 at 10:10 AM, Philip Balister <philip@balister.org> wrote:
> This check seems to have gone in recently and doesn't appear to work
> very well.
>
> ERROR: linux-xlnx-3.14-xilinx+gitAUTOINC+2b48a8aeea-r0
> do_kernel_version_sanity_check: Package Version
> (3.14-xilinx+gitAUTOINC+2b48a8aeea) does not match of kernel being built
> (4.6). Please update the PV variable to match the kernel source.
>
> I hunt around and the kernel source appears to be 3.14.2. Sometimes the
> check passes, sometimes it asks for 3.14.2 actual PV is something like
> 3.14-xilinx+gitAUTOINC+2b48a8aeea-r0
>
> Clearly, something isn't deterministic here.

It turns out "do_kernel_checkout" is not sufficiently late enough such
that the kernel source is static. This is because the
do_kernel_metadata also might change the tree (or checkout a different
branch). This is a quirk that linux-xlnx uses see paragraph below.

However kernel_version_sanity_check should avoid racing with
kernel_metadata, I have sent out a patch to resolve this and have CC'd
you Philip.

------

There is some strange behaviour that linux-xlnx was working with due
to how the some of the linux-yocto code/metadata stuff works and
issues with branchless checkouts (I don't remember specifics, it has
been a while since I implemented that). So it was setup to trick it
into checking out master of the repo, then in the kernel_metadata task
resetting master to the SRCREV. It appears that trick is no longer
needed though (KBRANCH = "" now works fine), so I will fix up
linux-xlnx, which will resolve the need to do the trick.

Note: linux-xlnx source tree does tags for releases and does not have
any requirement that the tag is on a branch.

Regards,
Nathan

>
> Philip
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

