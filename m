Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id BF4F66FAE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:22:11 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so908944ykr.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AY9C7ocsU/hnzGxskeMCs78GeiyBKTee26vASoYJ2p4=;
	b=yrB/3vDca9Fzp0q0mzT4TR1NnEegAd2uUL0d+3dabfSzhpoGuzjWVJBu/J2ro6INYQ
	KLACgdFq30VLOKnUqvYxFxMr/8BNe0WGxhWjipAiSoFnfYlMLtRlH+7sYQPR5N35+YI8
	JQSqhR24VC8UDCQ8DDEssCyHGbEbpkVF8qZ+umu+6t6zo6IcHgMYctyQr1RTU6QlP7bw
	H5fLIcO6JRTIfh3INbkwmlLZDWGi6FUQMD7FnAPBSXnPBjUPCMYs1CO331EFjd0d1jQH
	42zolu1qLKqEQI9xpbRnTMciGVJXMmXMDmPGyGs9JFZbgr/MDkDLf0Z+kz+e6z34mI/g
	Y2fw==
MIME-Version: 1.0
X-Received: by 10.236.44.173 with SMTP id n33mr6538376yhb.2.1395750132138;
	Tue, 25 Mar 2014 05:22:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 25 Mar 2014 05:22:12 -0700 (PDT)
In-Reply-To: <1395676843.24890.7.camel@ted>
References: <1395676843.24890.7.camel@ted>
Date: Tue, 25 Mar 2014 09:22:12 -0300
X-Google-Sender-Auth: KzdFP2t9MzFpPH-gvlbPIL1nJcQ
Message-ID: <CAP9ODKo8S2PjwqdxgwLYC=fWLMsdqLKkLXGuvnxf4xd3nqCJJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Features in Yocto Project 1.7
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
X-List-Received-Date: Tue, 25 Mar 2014 12:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 24, 2014 at 1:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As development on 1.6 finishes up, its time to think about what we
> should be doing in the 1.7 cycle.
>
> I think from my perspective, in 1.7 I'd like to see us looking at
> "Developer Workflow". Its a generic topic which I think covered multiple
> areas (in no particular order):
>
> * the ADT/SDK and how it intergrates into the rest of the system
> * toaster
> * python devshell
> * exteralsrc.bbclass
> * memory resident bitbake
> * how a standalone app developer might build an image
> * locked sstate
>
> and probably more I'm forgetting.
>
> If anyone does have things they plan to work on, or ideas for things
> that should be worked on, please do file enhancement requests in the
> bugzilla:

I'd like to cover
http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089287.html
but this got no replies. So I am unsure people think it is an
important thing or not.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

