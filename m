Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 742F260A88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 14:01:23 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id e14so4115875iej.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5ssY9w1mlPcLxIuhc+zeISJ0MlsVJuxmpja18fBOoF4=;
	b=KKB3F8KNlPtXYkgOlopl/TvUqSjpUWYJf6QEr2vu1UXmlNm8BXtE30sJgsVy6EthcC
	ICnh03ER/YZ/12/bgqEfyUOIL7HqmG8/Mcc4rBLJOqWrHUC2eqy8avZzlhhGsCZpp6Xi
	GVnqVGhjAwRJSV/e1GLVtJK+5WsuHhx5ZCAV3DVzHr50OoFYzx5Sl/Iuya9A3jYbtj3f
	C+mGiMZaud+5a0AxU1YGqPG48Qp0nQzeI0J6R+6qEVuPhKO/lqMHHiwA/qAKdxA/h73O
	W3xup+MlUHhyiiRNxyJTfaC0YfB3IvgplnU1ub2zVcZnt0/355R1YZs3biDfumCiQCAP
	4j1g==
MIME-Version: 1.0
X-Received: by 10.50.50.144 with SMTP id c16mr2419874igo.6.1380290484789; Fri,
	27 Sep 2013 07:01:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 27 Sep 2013 07:01:24 -0700 (PDT)
In-Reply-To: <8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
	<8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
Date: Fri, 27 Sep 2013 11:01:24 -0300
X-Google-Sender-Auth: 90yJ0K2MnsTWIPhA-9YzVQ3QgZ0
Message-ID: <CAP9ODKpYNSJs-T=GTpa725A6GK32GykgPbv7w5KeiwPhXVLfzw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] wic: Initial code for wic (OpenEmbedded Image Creator)
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
X-List-Received-Date: Fri, 27 Sep 2013 14:01:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Tom,

On Thu, Sep 26, 2013 at 11:17 PM, Tom Zanussi
<tom.zanussi@linux.intel.com> wrote:
> Initial implementation of the 'wic' command.
>
> The 'wic' command generates partitioned images from existing
> OpenEmbedded build artifacts.  Image generation is driven by
> partitioning commands contained in an 'Openembedded kickstart' (.wks)
> file specified either directly on the command-line or as one of a
> selection of canned .wks files (see 'wic list images').  When applied
> to a given set of build artifacts, the result is an image or set of
> images that can be directly written onto media and used on a
> particular system.
>
> 'wic' is based loosely on the 'mic' (Meego Image Creator) framework,
> but heavily modified to make direct use of OpenEmbedded build
> artifacts instead of package installation and configuration, things
> already incorporated int the OE artifacts.
>
> The name 'wic' comes from 'oeic' with the 'oe' diphthong promoted to
> the letter 'w', because 'oeic' is impossible to remember or pronounce.
>
> This covers the mechanics of invoking and providing help for the
> command and sub-commands; it contains hooks for future commits to
> connect with the actual functionality, once implemented.
>
> Help is integrated into the 'wic' command - see that for details on
> usage.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>

Could you please elaborate why to make a new command instead of using
the class system?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

