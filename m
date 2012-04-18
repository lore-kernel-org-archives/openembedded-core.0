Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKYap-0007SF-9u
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 19:22:59 +0200
Received: by wera1 with SMTP id a1so4920688wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=5VofgGaW0HaO6/UmqvlOpNPXd8Wixyz4RjlNHAafS+k=;
	b=VyaRtwmvseaNkveRxQid6zz26cBQ/yBp1pJk555pPtJGFjwsUBhsckwuOh33lLKRI+
	1EdztQigcEMiu5ZCR79gyz/lGJLVdsyaB0CFauDbfhOCJKVKUC/IPF4nndnWzsHP99tB
	Mle43XNALSrLoKf/QeAghV26ysG2RR/BMFJB/iupc3KZIAShGyyIcbGlNTd2T4rBsMOP
	9DpMpx75OOmduQCtJKuRsa20Wg+sJBF98Z0FeNL/0ZO8pXaLoSAiO3YtbesH1PfQh9PA
	c5Z3otG2zXs9av7AjA4Ofc8XxU4enOxrUFo3DpW8jYa7DsYesT7KTUqp3uBFEwLAOnlF
	NihA==
Received: by 10.180.95.34 with SMTP id dh2mr8034176wib.15.1334769211889; Wed,
	18 Apr 2012 10:13:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Wed, 18 Apr 2012 10:06:48 -0700 (PDT)
In-Reply-To: <1334768537.24091.156.camel@ted>
References: <1334760467.24091.100.camel@ted>
	<20120418145330.GM3635@jama.jama.net>
	<1334762445.24091.110.camel@ted>
	<CABcZANkaABCKZ+WmhhGTZEvFnHYwrP7uNSSvNTxxKxfun4JaPA@mail.gmail.com>
	<1334768537.24091.156.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 18 Apr 2012 10:06:48 -0700
X-Google-Sender-Auth: QPB2N2atcTRf9xvhQBaycbmf__M
Message-ID: <CABcZANk+nFT1F7=WBNdE_z3pj=zAzrSQBuD6-DcKT8+OCLKr9g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: Yocto Project 1.2 Release Status
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
X-List-Received-Date: Wed, 18 Apr 2012 17:22:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 18, 2012 at 10:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-04-18 at 09:22 -0700, Chris Larson wrote:
>> On Wed, Apr 18, 2012 at 8:20 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2012-04-18 at 16:53 +0200, Martin Jansa wrote:
>> >> On Wed, Apr 18, 2012 at 03:47:47PM +0100, Richard Purdie wrote:
>> >> > I thought I'd update everyone with the current 1.2 status.
>> >> >
>> >> > I'm going to branch master for release at this point. We've fixed a lot
>> >> > of issues, I'm hoping the -rc4 build will be a good one. There are signs
>> >> > there are some more minor issues around and bugs do keep getting opened.
>> >> > These are still being investigated so we'll continue to let that happen.
>> >> > Once we have a QA report for -rc4, we'll be in a better position to make
>> >> > a call on how things are looking.
>> >>
>> >> Does it mean that after creating branch, master will be open for
>> >> postponed patches from ML and master-next or do you want to keep master
>> >> as close to release branch as possible for some time (e.g. for those
>> >> 1.2.1 fixes)?
>> >
>> > I have hoped people would work more on the stabilisation and testing but
>> > I don't think I'll be able to hold off the pressure to start master
>> > rolling again at some point relatively soon.
>>
>> Just because people have things to push or are pushing things which
>> aren't bugfixes doesn't mean their time is being taken up by anything
>> but stabilization right now. Your statement implies that everything
>> being pushed is being currently worked on, which is incorrect. I'm
>> sure Mentor isn't the only company with a backlog of already complete
>> local changes to get upstream..
>
> So you're saying Mentor has been working on stabilization and has a
> queue of bugfixes which they've not shared?

No, I never said they were just bugfixes. If they were low impact
bugfixes, they'd have a shot at making it into the release, especially
if they're critical, no?

> This doesn't help us much with the quality of this release :/ At least
> the next one might benefit I guess assuming you can resolve that backlog
> problem...

Imagining that every company is going to never have changes that are
not yet upstream is a pipe dream. There's often a delay due to time
constraints and scheduling. Welcome to the real world.
-- 
Christopher Larson


