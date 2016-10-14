Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB6A5719A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:54:40 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b186so4770510vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Mr/1GmYlWnE23gw5CGpZT+RPOz6ltnDzyjB704By4xs=;
	b=NQIYWBTFb19dgV/WTL9vgB3awPXL2OGYl63LHEAkExV+h84kJh933A9206e1bLYR4K
	b+eLfb0sGryD5r4f5O1b0vTL9/HTjZ6TX5SAMOyEO8rOdOQWsl46ts0NaWZ6Ovq9pJCu
	b8LNJI5maivQqj+RQtv6N5vjBkCDMsxCzkdBVLChlN2rrYJ9kagIO5AqADJb4qHiFVr5
	+8cMIB3zZbf4qWfwsq7GDFSYImATlu/zf++GaosXGNoRzeou2aCpmsw2bB44JlDx3Ila
	pa3IubrwL2JsGFz0JTjJ0/2r+yEfji13XOO59KdmSLLrg6UURex64xhHFympaX7eDmYP
	90UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Mr/1GmYlWnE23gw5CGpZT+RPOz6ltnDzyjB704By4xs=;
	b=eYjkK1mUilx/glva5p8EGReLYfRCoAiCiNhw1YtDiOpubpk7R22M+OaHD1mB2vQGyG
	nxTxPRXvZ4gwLbh0RitAQ5V/q6mDXRIe9HBeF7oTtJHex7jUAOOedGKfQd1mAm0TYMLu
	zcfa01DbtbZlDEqSghA9aX0sD+E0S9bFX6ex9qEICY5NlsZrIalGhtVI3v+N349TDoDw
	UN3hf3xfybp3pjzO5oVHZ87jd/oE64SBx+kR/PIlcjzXuRvJ/OL6AXn12/FdZp7f+6mJ
	CcurgCNc2GwS8KS5Stn12rfWFKsaWm0Qc0j2fBqLL+63GKGzHsFiFlQ2WYY1VFkMmgZ4
	k66Q==
X-Gm-Message-State: AA6/9RmMAxy422Y7Ciey8iGHp5twOtithXCsPzYdS2XmyesXX+jC9PB7ab+mEU8qRNP28/Tq5QD2/6i4l+WJKA==
X-Received: by 10.31.0.67 with SMTP id 64mr7948292vka.173.1476438881793; Fri,
	14 Oct 2016 02:54:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Fri, 14 Oct 2016 02:54:11 -0700 (PDT)
In-Reply-To: <CAHiDW_GFdwy_1ZSuv7s8L8NExnFpY-1VUA5jV==x_q3SrFSMuA@mail.gmail.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
	<HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
	<CAJTo0LZ1NdDfTb72cH-vLrE=Q=kW6ksFQ5p7pnA3Tgoj0QZbaw@mail.gmail.com>
	<HE1PR0401MB26823C71B1DC91A7D8723D59E9DF0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
	<CAHiDW_GFdwy_1ZSuv7s8L8NExnFpY-1VUA5jV==x_q3SrFSMuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2016 11:54:11 +0200
Message-ID: <CAMKF1sqxj2_VrhzRcCeHytLO=n12QdhZcVr-HAiZvPkh02QAPg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Carol Zhu <carol.zhu@nxp.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/4] Add patches for gstreamer1.0-plugins-bad V1.8.3
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
X-List-Received-Date: Fri, 14 Oct 2016 09:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2016 at 9:35 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
>
>
> On 14 October 2016 at 06:22, Carol Zhu <carol.zhu@nxp.com> wrote:
>>
>> Hi Ross,
>>
>>
>>
>>       So could we try integrating them to master branch and proving them
>> firstly?
>>
>>       If they are all ok, then we can try next.
>>
>>       They won=E2=80=99t block the RC1 of 2.2.
>
>
>
> That would be the way to go, although GStreamer 1.10 release may have
> already happened by the time oe-core master opens again: in that case the
> appropriate thing would be to upgrade the recipes in master to 1.10.

We can serialize the upgrade and get these patches in before upgrade.

>
> Jussi
>
>
>
>
>>
>>
>>
>>
>>
>> B.B
>>
>>
>>
>> From: Burton, Ross [mailto:ross.burton@intel.com]
>> Sent: Thursday, October 13, 2016 6:36 PM
>> To: Carol Zhu <carol.zhu@nxp.com>
>> Cc: OE-core <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] [poky][PATCH 0/4] Add patches for
>> gstreamer1.0-plugins-bad V1.8.3
>>
>>
>>
>>
>>
>> On 13 October 2016 at 10:07, Carol Zhu <carol.zhu@nxp.com> wrote:
>>
>>       These gstreamer patches are bug fixing and all backported from
>> higher version, so the risk is low.
>>
>>       Is that ok to integrate them into morty?
>>
>>
>> Once they've been proven in master and if the morty maintainer agrees,
>> yes.
>>
>>
>>
>> Ross
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

