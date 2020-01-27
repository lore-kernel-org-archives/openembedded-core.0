Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4B36BAAB;
	Mon, 27 Jan 2020 22:36:20 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q6so13620876wro.9;
	Mon, 27 Jan 2020 14:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sXbrIxyrAWWEefKzBAZGfXKqA/qMn22xk1N/4CfO350=;
	b=r5A8gHlMBTXcuXHYbtF18zMoRUKMk5h7MT+ROuEyN4pobp6R/Wj7qi1p1Mo7AqKczF
	Yty0gY0jgPMAvWnM2Ja8HScXtinxXqTZ0VkXvEl95GaiBCMe4E9YOjmWlXIwF9ntHKFG
	mC1lC/PTPBNEi+E7f0S/DZ0IzXbnlZXjj1vdTH3d5dHcF7MMZRWtAgfFr+4WbL6mz2QL
	JuN1ZJVG5nYnnEyuT143p0YHTK2oPxTdhOP5Msj5kHXMlZ/QcEVbKxxRFLV8JiCX5K12
	DY7Z7JcW/oACBT6kiLOJmLkKWLucSrtPwnoTQwtaCD3bnjTw3S66hIRmohBfo9rdHGc4
	4R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sXbrIxyrAWWEefKzBAZGfXKqA/qMn22xk1N/4CfO350=;
	b=reAJIBxB77aDYIgcJfwYLC8OB0hR0bIaMhaUWpuED79Jnm2W3S8IifyzOJ9PS529/d
	YiL8FlsW3l+5Zl0afEjlPFDcqFgNvQjBkvK9hAQGa0TXKyqXXZrlwya1qE4p19VSK+5v
	srkV6Wbf6M2c2uCgS5YbbUfcL7NQ0BaqUriQqdtVQCiRmp2sw/+pYWcRsUru1yRHCUxd
	d27iNXx+kf2R7l2HWygmJVWupBJjzcYqYzqGnfbRhl3ePhE2vuWwfjBK++rVllcsTYwi
	gCEplUZ81Hr/s8U32JP2c3NnzDIMlC/00H+FLt/Tam9q7vt2THQ61YKKt775kQMGtIxW
	dJgw==
X-Gm-Message-State: APjAAAU6efCHHYOl4T67FEDGmI02QcyPrHip4ZjdCFUTfGa0Qesl8Viw
	WnWZaGNgl8364FJWZRfeirfVh9rte5GBHT4zKyo=
X-Google-Smtp-Source: APXvYqzAVJU5Jic6tzlQ2D2O9bAnG0kD+dnKAD4hKTQNZCqGSyTFnpjCITHmUIHAIvMp28dLU7FXbFMwh/FMqZMOnEo=
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr25573356wrs.247.1580164581550; 
	Mon, 27 Jan 2020 14:36:21 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
	<CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
	<CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
	<CAMKF1spddmi=Sk55Dyb_eS6m6cwa1M_bBfzyqcyn6y_RG7r6wA@mail.gmail.com>
	<CANx9H-BkTeXKaZpON-+2Q2B5thd25n4B+dC2+0Zp0rKahTfTrQ@mail.gmail.com>
In-Reply-To: <CANx9H-BkTeXKaZpON-+2Q2B5thd25n4B+dC2+0Zp0rKahTfTrQ@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 23:36:10 +0100
Message-ID: <CAHtQpK46QPMJBB3Pd2Fd-fz_DvgX1qgMZx8W5wFPb46yVrmvoQ@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 27 Jan 2020 22:36:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 7:46 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Mon, Jan 27, 2020 at 10:06 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Jan 27, 2020 at 8:54 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>> >
>> > On Mon, Jan 27, 2020 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > > Awesome, thanks for the help!
>> >
>> > No probs!
>> >
>> > I've actually looked into the list and would have couple of
>> > components, which are sort-of "python2-only":
>> > - dnssec-conf: did not receive any update since 9(!) years, written
>> > totally in python2. Should this be bumped up of bumped out of
>> > [oe-core]?
>>
>> yes meta-python2 is a good place for them if they are primarily
>> written in python, otherwise retire or blacklist them
>
>
> I agree. This is one of use cases for which meta-python2 was created.

Got it, would move this one from [oe-core] to [meta-python2].

>>
>>
>> > - mozjs: this one pulls the most of dependencies and produces the most
>> > of errors. It's version is also quite old (60.9.0esr), and there is a
>> > lot of python2-only code inside. Should this one be bumped out? Latest
>> > ESR version available upstream is
>> > 68.4.2esr [1], dated 01/20/2020
>> >
>>
>> Andreas is working on it IIRC, we have updated to latest 60.x ESR
>> but perhaps 68.x might be a path if it addresses py3 migration.
>>
>> > For some other recipes I would send out the patch series later today.
>> >
>>
>> thanks
>>
>> > [1]: https://archive.mozilla.org/pub/firefox/releases/68.4.2esr/source/
>> >
>> > >
>> > > On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>> > > >
>> > > > Hello Raj,
>> > > >
>> > > > On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > > >
>> > > > > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
>> > > > > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > > > >>
>> > > > > >> Hi all
>> > > > > >>
>> > > > > >> Recently py2 is removed from oe-core, So I did quick patches to get a
>> > > > > >> world build going. And
>> > > > > >> here are initial failures, please help out with recipes your can or
>> > > > > >> care for. Eventually, the remaining
>> > > > > >> ones we can blacklist for 3.1 release.
>> > > > > >>
>> > > > > >> http://errors.yoctoproject.org/Errors/Build/97185/
>> > > > > >>
>> > > > > >> I will post more arches as they become available. If you want to try
>> > > > > >> the same for machines/distros you can try yoe/mut for meta-oe
>> > > > > >
>> > > > > > I've actually asked Ross about similar failures, specifically in
>> > > > > > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
>> > > > > > and Python3 still present. I've started to remove those yesterday, and
>> > > > > > would continue with that layer further.
>> > > > > >
>> > > > > >>
>> > > > > >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
>> > > > > >>
>> > > > >
>> > > > > All these changes are now in master and its again buildable, with or
>> > > > > without meta-python2, with meta-python2, its back to where it was with
>> > > > > everything  building however, without py2 layer we have some work to do
>> > > > > so if you are interested in this here [1] is initial list of failures
>> > > > > I will keep posting more as we go along.
>> > > > >
>> > > >
>> > > > Thanks a lot for the update! I've actually saw this in the master
>> > > > before this mail and went ahead with pulling the latest - my builds
>> > > > for i.MX8M series went fine.
>> > > >
>> > > > I'd also have a look at remaining things and try to fix some of those
>> > > > as I'll progress.
>> > > >
>> > > > > [1]
>> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors
>> > > >
>> > > > --
>> > > > Regards,
>> > > > Andrey.
>> >
>> >
>> >
>> > --
>> > Regards,
>> > Andrey.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Regards,
Andrey.

