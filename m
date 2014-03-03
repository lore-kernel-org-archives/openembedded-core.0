Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4C78A6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:42:15 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so3922053ier.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+IrVgNod+xu6WQ155jqsx6+X17ONHXSi2YDmVaNDcS4=;
	b=k3MpbftKIwHROBAIPG7MNWExS3YZSaNYxuJ7Lv2uYSf62waMImJLsJtMryVLx1gd0M
	bxGsKhPDUQWI0z/orcgwkY861f5ctyRLyTFi3c9ikIlPdQ5ptlYCsmZMIG/D5bT/hlvT
	kbtpPMEL0GLwTq+kS4ACvOogkA3WbSvLt8Li52FNGltKDuDocm/0vmHjPoM3UVGnOvq/
	Q9y1FmD3+nTTEL4i4yOwBQ4t3jHZX2bca6sVVukYIhUY9DgM/rWPy9M2Lrjp9F4ImqIo
	ggDtqMZGQ014a994x7hlQ+j/qNpFrlVT8cH6Ka3GrjWwsd+1yQLG2+6IQ+ZjjXpDdovl
	hoeQ==
X-Received: by 10.50.20.100 with SMTP id m4mr23905925ige.17.1393879336834;
	Mon, 03 Mar 2014 12:42:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Mon, 3 Mar 2014 12:41:45 -0800 (PST)
In-Reply-To: <5314E263.3020505@windriver.com>
References: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
	<CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
	<5314E263.3020505@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Mar 2014 12:41:45 -0800
Message-ID: <CAMKF1sqEicAz3wtcdHwk=89wotn6rSn69Niqzx-ufSghBQzZZw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Mon, 03 Mar 2014 20:42:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 3, 2014 at 12:13 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> We (and I know other commercial vendors) are already using patches similar
> to this to do exactly the same thing.
>
> I'd hope that a generic mechanism (like this) could be put in place.. and
> that oe-core/Yocto Project would choose -not- to use it for their
> distributions.  (To avoid the exact problems you mention...)
>
> The commercial folks like me can then use it, as we have to deal with the
> problems anyway.

IMO with such globs you are covering untested versions too that I see
as a problem.

