Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 874FF7915F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 08:22:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w24-v6so2019926wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DzIQhIB22iPXfxxt34xgY117PgLbKuiI3QadTk+Zaos=;
	b=NmExnFjWXSxF40NgKMV48RV7yWxnWOOvX3sl2g190WRXstpE6xMA+QUozMdLME7CEU
	uq7USMnoczdCPBxBLjmR562LLRbZXokyk1ZKhBZZtMc/WWV79BTk6ZSEKTuAAHF8lAUx
	eXi0vG/e8TBjQ8UFSvmLK7VVvg710n42Zyle0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DzIQhIB22iPXfxxt34xgY117PgLbKuiI3QadTk+Zaos=;
	b=KDy3Md6bzUOX2Vf39IC/xttyg+TkXqcmweLoq8Uxk/Hh1oijMlWPsvwxXk1PhH5EEl
	R0jwYLix1Y6HwLWc8g0v1HachiotcATqjYgg4ITsvFAZjeT835P2ccFzqOEopir+0SxV
	lDcuuPw2ogfSk7JyAxmYkqt+BHSWvzhqHW0c5eRMzLC6Q7KXJkruOfuGp32mnFouG+mn
	IefCJsG4DOBIf5gOCEdw7HNfPQFTj1jvyQ7nJoZjaNfMyU7DgfD6jJ7MZE/3f8NNgeao
	FYFHhZ9Vej1Io/9yMBD7fMvKkxMHjMTSTnKipVcxC7q+u7eyg7QAfzM1czEoSkg4pafm
	OOqQ==
X-Gm-Message-State: AOUpUlFPbuoI6E5EJNzix0XHa4DBL1akmawYfN33x3Gwmj5cFRhaRLcr
	a1w5H0dPLk3JP5kNa8NC2uU8bg==
X-Google-Smtp-Source: AA+uWPyjq1l/yIFk6FiTFImUVjCkq71EvVgD3i4O8LzYnC2OM3tLlYfsMWyG9M62O3ZQv5I7XFTE1g==
X-Received: by 2002:a1c:9e89:: with SMTP id
	h131-v6mr26608309wme.13.1534839725216; 
	Tue, 21 Aug 2018 01:22:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m8-v6sm9084119wrn.72.2018.08.21.01.22.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 01:22:04 -0700 (PDT)
Message-ID: <77b26139005bcfac54f24cf4e261499e68595e10.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 09:22:03 +0100
In-Reply-To: <c3f18902-3719-cb74-197e-787a42663953@windriver.com>
References: <cover.1534497181.git.Qi.Chen@windriver.com>
	<760193dd3732a2239aa96f7660dd85ed4071ebd2.1534497181.git.Qi.Chen@windriver.com>
	<179b2fa5f801bc5f8cf6618489889352039a4ad9.camel@linuxfoundation.org>
	<c3f18902-3719-cb74-197e-787a42663953@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] assimp.py: fix AttributeError in tearDownClass
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
X-List-Received-Date: Tue, 21 Aug 2018 08:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-21 at 10:18 +0800, ChenQi wrote:
> On 08/21/2018 12:53 AM, Richard Purdie wrote:
> > On Fri, 2018-08-17 at 17:17 +0800, Chen Qi wrote:
> > > When running this test case, we will see the following error.
> > > 
> > >   AttributeError: type object 'BuildAssimp' has no attribute
> > > 'project'
> > > 
> > > assimp.py test case does not make use of SDKBuildProject, so
> > > remove
> > > the import statement and the tearDownClass.
> > > 
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  meta/lib/oeqa/sdk/cases/assimp.py | 5 -----
> > >  1 file changed, 5 deletions(-)
> > 
> > I'm not seeing this error when I run the test and I can't see it on
> > the
> > autobuilders. Why are you seeing this and we're not?
> > 
> > I'm trying to understand some other odd behaviour in SDK tests and
> > am
> > wondering if this is related or not.
> > 
> > (e.g. https://autobuilder.yocto.io/builders/nightly-mips/builds/122
> > 1/st
> > eps/Running%20SDK%20Sanity%20Tests/logs/stdio)
> > 
> > Cheers,
> > 
> > Richard
> > 
>  I did a quick search and found this one: https://github.com/pexpect/
> pexpect/pull/31
> """
> sys.stdout.buffer is not guaranteed to exist - e.g. if sys.stdout has
> been reassigned to an io.StringIO instance, it won't.
> """
> 
> And we have in ConcurrencyTestSuite:
> process_result._stdout_buffer = io.StringIO()

Note http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/core/utils/concurrencytest.py#n103

process_result._stderr_buffer.buffer = dummybuf(process_result._stderr_buffer)

which creates a dummy buffer object...

Cheers,

Richard




