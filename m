Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 826C479A36
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 15:45:04 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id q41-v6so21380034qtq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N/M4b4JDFVifpUowQAMBJUgbaDQrkL/DGaxBvw/NmHE=;
	b=S2dh+aRusdT7csgVPPbxTWuDkYwTtEUH/GzyOCYis3ypCitYCTCHJsfiaFpfuO4aO5
	uz0oP1jhK1Vl/JR/Wq81tdJ+71Am9p0qv4qnLo6F7NuUaUjOmUDMPXc+JGMI7FoEqNO4
	Clg13XY9+VTdDkYRPvC1KoNsErW9WTUkP/Wq/9oclEF9d92bY/HZ3NKlBFaLgED9Pbzn
	gCNcDvZzGcl8Ikq0l7RqafAyKSjFFCnja4MbIBSemSuwXlOL/fhj7O3wNTnttcE4uC+c
	htJMU7HAzAejzuooBz0QjrGu90yWkAIJuqk+ZrCXRhC9GoN/lv6Q/NKyfrVdsT1TvlBP
	QLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N/M4b4JDFVifpUowQAMBJUgbaDQrkL/DGaxBvw/NmHE=;
	b=J1DrYnxFH1l144qoJGi22cEUizs6wYd3750l6nSX+GNohWMnIqxlPG04EdoK97Vsz8
	ZBGKahVx8P22SHFZLtccqEQ2ZsFMzzOt9ku0o9rpWcP4SBq5pi+WmOkInkuj5HqV2Qee
	InRa5b1AFo8qTl+HGzcw7MVpGIIHB3lAZIn2XG9GKGvRE37fEq0hjmVjO2yjZZ9S8XhW
	ql4u3cTtrC77/2kWD62jcS731WTpp8ZzVX6k7L4TxOKMVy8VGzzM98T4DSjoxt+isBAc
	kLyU7nTwmpZLCueYrIoK8taP6T6FKNmtqCl1ezIRCdTUmIHiEG1SNSyeBV7Ppoafmqvj
	Eu1Q==
X-Gm-Message-State: ABuFfoi+JJAm6jMGTXHGSpMwSOj9fwVE38L+izGknDmzWdSkHZBdgMSq
	x9azUmkgQsVJwDt8s1r7ZEZMQvY+1reTsPJztvI=
X-Google-Smtp-Source: ACcGV61OTCMTEDI5E6BvOh3uR/qIPjMxrb4Ybo0iQ7ZSRcwPurGAM7bQk154ftsLUPpoYEr2R9g+PIkZPYrkBzEQYiY=
X-Received: by 2002:ad4:41cc:: with SMTP id a12mr1702713qvq.55.1539013505131; 
	Mon, 08 Oct 2018 08:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20181004104147.14644-1-andrej.valek@siemens.com>
	<CA+chaQfiSfhTgs2aJhgy3wNF5nMjiy2AsnGjYMepgk5vaaHjEA@mail.gmail.com>
	<976efb5d-cd95-31ae-bad0-b3f5073eab55@siemens.com>
	<20181004112755.GA1356@jama>
	<CAJTo0LYo-+Cn47mP8rHvqEb51jcD+Np_hnPubs9YW4Z0YmOUzg@mail.gmail.com>
In-Reply-To: <CAJTo0LYo-+Cn47mP8rHvqEb51jcD+Np_hnPubs9YW4Z0YmOUzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 08:44:38 -0700
Message-ID: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: fix conflict with runlevel applet
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
X-List-Received-Date: Mon, 08 Oct 2018 15:45:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 8, 2018 at 8:39 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 4 Oct 2018 at 12:28, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> On Thu, Oct 04, 2018 at 12:59:37PM +0200, Andrej Valek wrote:
>> > This init feature was introduced via
>> > http://lists.openembedded.org/pipermail/openembedded-core/2016-January/116109.html
>> > which is from 2016. Busybox has this runlevel applet available from 2005.
>> >
>> > I think, Raj was trying to make this system really tiny. So, I am not
>> > sure, what would be the impact, if we dropped this runlevel script.
>>
>> OK, fair enough. I don't use busybox init anyway.
>>
>> I was just curious, because there is also runlevel from upstart which we were
>> using (and I have u-a for runlevel in busybox.bbappend because of that).
>> So I was surprised that there is actually 3rd implementation as OE
>> specific shell script.
>
>
> Khem, do you have an opinion?  I suspect that shell script including comment is longer than the compiled size of the runlevel applet in busybox...  We could simplify by just having the applet and removing that runlevel stub.

we should enable runlevel unconditionally when selecting busybox init
and delete the file that I added for runlevel, that way we will be
inline with busybox for this applet.

>
> Ross

