Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id A1D2D65C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 20:46:51 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id z52so91157219wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 May 2017 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kZfoMnh7ODKF7S6VXKW3P5wkhJXNLk+iCMxafnYrKW4=;
	b=NFrVwaRL6YVS+lufyOvGVBTK8UeNI3AJAzMvMNGQofgLjtIFNFIFDyORBqSxc7xKUS
	Metd6h/J1PdfF6oLLKf8wLkQA80GcknHYH3tM1xpdUjDULeJtSPO+l0q+qZy7bjUJUiY
	hucYEHhPJnfq7Vwun2aoL5hom2bfQufd379ZTJiAs6TBtsCZp3aYJVcQx+gZrgZjCnEI
	JqdXa0gj01ykMnA3ucwYF5AT4YvJMdvXUaiC+flTUweiYquL/RQ6LO1ywHhI4e/UZX5S
	2S3ety4gOaBPO3LAeJp/4ODCGECPBI58Zwiy5lTtCP/mFbNGxGqR89Ksbd6jTtaXxpTx
	1CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kZfoMnh7ODKF7S6VXKW3P5wkhJXNLk+iCMxafnYrKW4=;
	b=V5fmMHv83OvBGCTZsnn2o+LSinltJ3w2NABv4OxQCMkF/oboqPZA2HYCisMwnEaK5r
	+PEXr6vz3gfE++shaaUg4ME6bbHVaRrTyFaKyM4xgq0TIy66+JAOKyGjS/f2JgFnG5s1
	8WnI1FJwAYyxPQcsa6Rc4LL2v43IHS52iUJWeLtDd1b/3ielDxqWNWFyuVPW8zkz0XkB
	7xT/FyEixndEuh9plsaYA5oz30+vCGB7qxk8Kva74nuW5nDSCfi8Yban9J7JCvQORQRh
	+s5vPr2W2Cnzi8eDtwZxpKbED65GmFjCIztaiesyeE7emHCQbBYy/P/gIwaMmhiyvLyL
	2UjQ==
X-Gm-Message-State: AN3rC/5Utyy1ke6SEI5KxLPc5GoC9s5EzVqgPAT/0XCwpsmheqPhjfdl
	WUKWfVqCInfxAk6xxCmA+kPCyMO6+w==
X-Received: by 10.223.165.138 with SMTP id g10mr24136663wrc.19.1493758012067; 
	Tue, 02 May 2017 13:46:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Tue, 2 May 2017 13:46:51 -0700 (PDT)
In-Reply-To: <CAPoQQ-12=StmUO64uVY-0RadSgp=PUS7NkdubFWNJ1ukRcMP5w@mail.gmail.com>
References: <20170501194223.16344-1-dev@codyps.com>
	<CAJ86T=X4VYZTkCmeF1tsoKbXxYGJO-i1VPfVa36K38S1Qf-+zw@mail.gmail.com>
	<CAPoQQ-3T6tJSTzzrpf5pfn7RXzP6FEic-54VFVt+6L=ZF5BD=w@mail.gmail.com>
	<CAJ86T=U29MAsgHYWo4qUt9C1j5CEDscJgEwttx9z6P+FQXEJqA@mail.gmail.com>
	<CAPoQQ-12=StmUO64uVY-0RadSgp=PUS7NkdubFWNJ1ukRcMP5w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 2 May 2017 13:46:51 -0700
Message-ID: <CAJ86T=XFRZkLVrtouBWHEJQHiMXKDOhX8ua-1R-KaaxA3-Ywaw@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Tue, 02 May 2017 20:46:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 2, 2017 at 12:07 PM, Cody P Schafer <dev@codyps.com> wrote:
> On Tue, May 2, 2017 at 12:49 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, May 2, 2017 at 8:49 AM, Cody P Schafer <dev@codyps.com> wrote:
>>>>>  do_compile[progress] = "percent"
>>>>>  cmake_do_compile()  {
>>>>> -       cd ${B}
>>>>
>>>> Removing the redundant "cd ${B}" should perhaps be a separate commit?
>>>
>>> I'm not really seeing that as useful, change right now can be viewed
>>> as "moves the ${B} from being in `cd` to being part of the command
>>> line for `cmake --build`". Is fairly straight forward because cmake
>>> requires a path be specified (where `make` makes it optional).
>>
>> If ${B} is the default directory for both these tasks then "cd ${B}"
>> is redundant and can be removed. If it is not the default directory,
>> then removing it will potentially break do_compile_append() and
>> do_install_append() functions which rely on running in ${B}. That
>> logic doesn't depend on whether or not "cmake --build" takes care of
>> changing directory on it's own, so if "cd ${B}" is redundant, then
>> removing it should be standalone commit.
>
>     meta/classes/base.bbclass
>     307:do_configure[dirs] = "${B}"
>     326:do_compile[dirs] = "${B}"
>
> ${B} is the default dir for do_compile & do_configure.
>
> Are we concerned about prepend scripts changing the directory to
> something not-${B} & appends implicitly relying on ${B} being the
> directory?

No, no concerns about that. The point is simply that you appear to
have identified two redundant "cd ${B}" commands in cmake.bbclass and
removing them could/should be a standalone commit rather than being
mixed up with the "cmake --build" change. If every patch only does one
thing then it makes the review process a little easier.

> It seems that prepends/appends should avoid changing directories &/or
> avoid depending on a specific directory. Many (but not all) of the
> appends I've seen are pretty explicitly about the dirs they need
> (Using ${B}, ${S}, and ${WORKDIR} as needed instead of assuming the
> dir). Is there a policy on what the right thing to do is w.r.t. cwd
> changes within tasks & specifically within appends/prepends to tasks?

