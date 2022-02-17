Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <8a878d0fb6364d1de656a77eda7e25a833d1d5b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 17 Feb 2022 22:38:26 +0000
In-Reply-To: <MW3PR11MB4633B716168A3E59ECA2F06994359@MW3PR11MB4633.namprd11.prod.outlook.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
	 <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
	 <CAMKF1sp5rtBg0tf4mN-9VBUxVYXbqrA1i8nQe-L_8MHNRapj1g@mail.gmail.com>
	 <MW3PR11MB4633B716168A3E59ECA2F06994359@MW3PR11MB4633.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Wed, 2022-02-16 at 02:28 +0000, Jia, Hongxu wrote:
> Hi khem,
> 
> Upstream glibc reject it because the latest docker has supported it[1], and
> upstream glibc does not backward compatibility with old docker[2]
> 
> In order to build Yocto with uninative in old docker, we need this local patch
> 
> [1] 
> https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
> 
> seccomp: add support for "clone3" syscall in default policy ·
> moby/moby@9f6b562
> If no seccomp policy is requested, then the built-in default policy in dockerd
> applies. This has no rule for &quot;clone3&quot; defined, nor any default
> errno defined. So when runc receives the con...
> github.com
> 
> 
> [2]https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html

The way I read that upstream suggested a different way of making the patch?
Could we try doing something like they suggested?

Cheers,

Richard

