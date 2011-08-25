Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwaNy-0008B8-UW
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 15:54:23 +0200
Received: by eyb7 with SMTP id 7so1532294eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=h6j1SBco4quU/HQr5UTx+3hPT0nIkyefQ889MVxDXbY=;
	b=ozbw7Vd4R1o/WgwS1vmsVxtZ4cD/WjRFPYgOR2Lg2nqkME4okh4u+boOC7QU1MqYgs
	yMPzfNfFAAHW8yEct3oGG6c7OOMLuyTFh9RenEj6Von0tefCojbVEbdcMFDMlmPp0CAD
	Qz+ok04raHgnY5PlF5hqMyrS++mLpKFr7JHHI=
Received: by 10.52.90.37 with SMTP id bt5mr537922vdb.364.1314280174118; Thu,
	25 Aug 2011 06:49:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Thu, 25 Aug 2011 06:49:14 -0700 (PDT)
In-Reply-To: <1314263909.19905.25.camel@phil-desktop>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
	<1314263909.19905.25.camel@phil-desktop>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 25 Aug 2011 06:49:14 -0700
X-Google-Sender-Auth: 4bBNI14n53nqAPP3OmeVUeNTq9E
Message-ID: <CABcZANmZ6x785kcyLD5ZmZ0yTG+5aci4rDCv00Fu9vO8+jsxqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2011 13:54:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2011 at 2:18 AM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-08-19 at 15:11 -0700, Chris Larson wrote:
>> But then, there's a tendency nowadays to avoid map/filter/etc,
>> so that's probably not best :)
>
> Oh, is there? =C2=A0What's the objection to those constructs, out of
> interest? =C2=A0I am quite fond of them myself.

Good question, I'm not sure what the reasoning is. I've read multiple
documents around discussing idiomatic python that seem to feel that
they should generally be dropped in favor of comprehensions and
generator expressions. But, using that for something like this just
looks rather silly in my opinion: [foo for foo in bar if foo].
*shrug*.

Personally, I'm quite a fan of the functional programming methodology,
but I do think using the functional style too much in python code
tends to result in code which is extremely dense, and therefore harder
to read, just due to how the language is, whether you compose
generator expressions and comprehensions or you use map/filter/etc.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


