Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6rCm-0006D0-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:57:48 +0200
Received: by eekb57 with SMTP id b57so396128eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 15:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GIpkN0X1FwXIDa9lnbH3y3tZrwQm8yxPDZ5n2fwLOpc=;
	b=1KIJ93rJ7/9gyJxM+kmX5Lf9KQ+N5tk28IZAXGl2V43MXd7r7VzQvVtBKahrtc0f/R
	mlUWJyNDBA6w8RZQ+u8H1zhn/eTMlfJt5eTq3qKfyKaw+j3D4Z6jyfTGuvNRlkKaaal/
	60J9sa9JosRYMf+U6VeBIR/v3CnUr9zn1ifnX/qOdL6kFV3ZXPO2CPjpeyAM+YGLlYVn
	0yYS141sdOvNAsR9XQ0iXP/s0mQ8L9ESN+8UEHgM7+rKS33Y2kwTkTL9DiMb3GXClb5h
	1sj9BwRsuu7G1++MUziE4FaiA8ohfQaysLr63MUH3T/HIvKFjh27aPXKotMU+C7/fLPV
	Q1Pg==
Received: by 10.14.218.134 with SMTP id k6mr4122968eep.14.1346280333674; Wed,
	29 Aug 2012 15:45:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 29 Aug 2012 15:45:03 -0700 (PDT)
In-Reply-To: <1346278937.4396.57.camel@x121e.pbcl.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2012 15:45:03 -0700
Message-ID: <CAMKF1sp43PBMeZ+=9GiSp7a3msUXgFViqPAu6PA98VL2KmMs_g@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 22:57:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 29, 2012 at 3:22 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-08-29 at 22:50 +0100, Burton, Ross wrote:
>> I'm curious if the people who want / and /usr on separate partitions
>> that Phil refers to are a hypothetical group of people, or people who
>> can chime in with their opinion.
>
> As far as I know, only Intel have ever expressed any real interest in
> having this feature work.  My recollection is that there are some
> supposed "carrier grade" systems where this is, for whatever reason, a
> requirement.

whatever the reasons are. Its not clear what are reasons these systems can
not use techniques available now a days for creating new systems. I can
understand if OE had a legacy of it but seemingly its a feature being added.
I see that as an exception and not norm and we are treating as norm.

 There's been some previous discussion on the list, see for
> example:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/017360.html
>
> and the follow-ups to that message.
>
> p.
>
>


