Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0E46C0ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 22:28:43 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j18-v6so3591001iog.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 14:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pY9Xz2v9ho8vshTJJcgNXRTvjOqs4CKyC3O72fp0hk0=;
	b=EWxptBZKzmlzMiiy4XDXxm1oe9uRGsMUXsxhnMFK8L+sY+RaVxwo5ftdnOJnpAp8CK
	Y/IgGopnzUPMaNWWBESDtZm1t26YAIGhqr5bFp50Yt+NdyvlHd7kxb9Pb9s4jBE3JM/j
	+kIZYLCDp4XEKEYAeln2/9hXRaqepxvOpK/nhCdsai+Pof0eLEStiikc7l1Vgt0QkXXm
	nymCULjO1RDDoMY3paTwhMKPkkGDVXNArMjP3KIOk3CnqsG1GiRb8GU+5WRt2P9P40Ak
	2V5rckrhn1+6TOdWKSDKR4uZ1JZqhF8B8NC1f+wHMScfbJaltUaqeMIilqItMbrBLqgp
	aO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pY9Xz2v9ho8vshTJJcgNXRTvjOqs4CKyC3O72fp0hk0=;
	b=JWq5CK6bXObPLm0hotmb8uxNnhHxfFVk7HM2baz8l+lhDprw2xw8LkN05UQHZNMdBL
	RSWLRAX/t8y+ay8StK7axGVUf/DH7tHKiRivjCYJAihUQP/8DBuc6w75YsIw64xl6AwM
	VkPECs8zpSLTEuEnm9i6G7/A39y/a07EAGJjNyTgkkKYSeHhSsCkiQNg5CvJgdUvF8Rw
	1kZLumIBjIbM9pcTyLgftDPOFP7/6FZLuMlCwvcspcC+4Vz2ihr5/DEyZROMyeEKj8Nj
	dwwYG3eUMVjXY3x/8sdD+DUVx2g/54zK9e6nRU4KQbnyiaCPScw4FgiMh7mC+k4daWJg
	0Q/Q==
X-Gm-Message-State: AGRZ1gLs01S+ZMtuhbB7wK5azIbBifT7OAX6TvF9YlknrEN4y29lUCRg
	PIISeb1t8LcaokOQtTQ9mTgsTfiJu6U=
X-Google-Smtp-Source: AFSGD/W5McdXeRgLqg+W7XQB0c5+h6jFCMCzW81HQX7ba6NZyafu0tVrZ7igFNDqicEPC5qBHBp70g==
X-Received: by 2002:a6b:b490:: with SMTP id d138mr6655795iof.61.1542320924405; 
	Thu, 15 Nov 2018 14:28:44 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	q14sm4993121ioj.80.2018.11.15.14.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Nov 2018 14:28:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <32da8c27357053bf0e1eac4169125a130ae3a24f.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 16:28:42 -0600
In-Reply-To: <cfa00b9cb9aa1fcbe5525c33b16109f11f9b0db7.camel@linuxfoundation.org>
References: <20181115191442.24106-1-JPEWhacker@gmail.com>
	<cfa00b9cb9aa1fcbe5525c33b16109f11f9b0db7.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.1 (3.30.1-1.fc29) 
Mime-Version: 1.0
Subject: Re: [PATCH] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Thu, 15 Nov 2018 22:28:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 19:40 +0000, Richard Purdie wrote:
> On Thu, 2018-11-15 at 13:14 -0600, Joshua Watt wrote:
> > Splits the SDK test implementation into separate class files. The
> > classes that are included are controlled by the variable
> > ${TESTSDK_CLASSES}. This allows a SDK machine to change which
> > classes
> > are used to implement the test cases.
> > 
> > [YOCTO #13020]
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/testsdk-oecore.bbclass    |  88 +++++++++++
> >  meta/classes/testsdk.bbclass           | 202 ++-------------------
> > --
> > --
> >  meta/classes/testsdkext-oecore.bbclass | 107 +++++++++++++
> >  3 files changed, 205 insertions(+), 192 deletions(-)
> >  create mode 100644 meta/classes/testsdk-oecore.bbclass
> >  create mode 100644 meta/classes/testsdkext-oecore.bbclass
> 
> Would it make more sense to move some of this code to 'proper' python
> library/classes under meta/lib/oe ?
> 
> We did this with package_managers and I'd say it probably did improve
> things...
> 
> We probably don't want/need more bbclass files, particularly when
> they
> just include each other.

Organizationally, using Python classes for the main code makes a lot of
sense, but I believe you would still need the 3 (or 2 if you combine
testsdk-oecore and testsdkext-oecore) classes, since you want the
single entry point of testsdk.bbclass, but need to be able to override
how it gets implemented (unless I'm missing something)...

The files would basically boil down to:

---- classes/testsdk.bbclass ----

TESTSDK_CLASSES ?= "testsdk-oecore testsdkext-oecore"

inherit ${TESTSDK_CLASSES}

---- classes/testsdk(ext)?-oecore.bbclass ----

python do_testsdk() {
    from oeqa.sdk.testsdk import TestSDK
    t = TestSDK(d)
    t.run()
}

----

It might make things a little more clear if I describe the end game; I
would like to provide a different class to implement the MinGW SDK
tests. This would be done by adding the following to the MinGW SDK
machine.conf file (mingw32-common.inc):

 TESTSDK_CLASSES = "testsdk-mingw"

Then, adding a new class in meta-mingw

---- classes/testsdk-mingw.bbclass ----

python do_testsdk() {
    from oeqa.sdk.testsdkmingw import TestSDKMinGW
    t = TestSDKMinGW(d)
    t.run()
}

----

AFAICT, this is pretty similar to how the package managers are working.

Did you had something else in mind?

> 
> Cheers,
> 
> Richard
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


