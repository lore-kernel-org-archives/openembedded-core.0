Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id CB62860664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:36:26 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hu8so3012367vcb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VlNedqDLfzWrI+V4hCmHuummOweS9t6JsR9YZjnwJMI=;
	b=jL1u2Sq+nE/0bh3hVqbnlS7vKvm34/0krhJRV2hYMY2aC20hpQaJdo14MkyXEI7C9w
	WW79aDFcY7fIJrqgjU8GMDgOPt18TcTlL0bnedusS2pKXVjAE325ONP7F6SzgRhNvyYi
	781d+qqc40tYoClZoY7m72GD88ESYuGDvV8IkJjDfraqnLxkzF//hnUYZfWjap5WIGJS
	a+vVhoYK/+BcZlrS2JWFDg6gIWm67VQ0BliSRBZdNxkL0W6y8CzpHU4t9HtZOkH4khMc
	n12NM/lpJx7CvfU1CmECM2XM6Zm/81DgadZf5tD8liDKWbMyDtUGLcUYf91dLo8FRf/a
	fWZg==
X-Received: by 10.58.249.136 with SMTP id yu8mr37442vec.37.1379522188381; Wed,
	18 Sep 2013 09:36:28 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Wed, 18 Sep 2013 09:35:48 -0700 (PDT)
In-Reply-To: <1379520447.18603.30.camel@ted>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<1379520447.18603.30.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 17:35:48 +0100
X-Google-Sender-Auth: q6CpbLduS1QVK9UMBsNVWvZ2uRQ
Message-ID: <CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Wed, 18 Sep 2013 16:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 September 2013 17:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-18 at 16:14 +0100, Paul Barker wrote:
>> On 19 August 2013 19:32, Mark Hatle <mark.hatle@windriver.com> wrote:
>> > On 8/19/13 1:08 PM, Saul Wold wrote:
>> >>
>> >> On 08/14/2013 01:30 PM, Mark Hatle wrote:
>> >>> +Upstream-status: Pending
>> >>
>>
>> I'm the new maintainer for opkg,
>
> Congratulations! :)
>

My time for this is fairly limited, but felt it was important that
someone maintain it as it's a critical dependency for a lot of us.

As I understand things the Yocto Project is currently in a
stabilisation cycle. So my plan was to wait until 1.5 is released and
then look at moving oe-core to opkg-0.2.0, adding PACKAGECONFIG
options (I've got a signed package feed I'd like my target to be able
to verify, this needs opkg to be built with --enable-gpg) and whatever
else needs doing. For now the experimental recipes are available from
https://bitbucket.org/opkg/meta-opkg.

As a side question - is there a specific maintainer for opkg-utils?
I'd like to discuss whether two separate repositories is a good idea
or whether we'd benefit from merging this into the opkg repo.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

