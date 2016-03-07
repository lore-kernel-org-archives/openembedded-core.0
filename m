Return-Path: <h4nn35.work@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 12D256FF86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 22:42:52 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id e6so134758212vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Tcd0yZn4mySanDBiWEg89PCWmimwFgVupBMZX5rC6vY=;
	b=YliOF5EPKLoaRMemIOSkE808Pi63wReBkipKpEz+g+uNiqC0zdtbr8O8FIlm+2pghP
	kQnBXP+iaI65cNJaw7KrxSBtaqpJDSxXnSbb3k1Q1Bxeg1oOAWgFSBl0IdL1Yy6WWXNf
	dP+ZivUV/9HOckA8PpXxbJ6ehn3Wv5KlciqmshKgkRZPNYWS2553XEEklx8GyAtTS8sR
	stPUeR9sMWbRrqukwsOd8NfGazhqRriuejkmsLxBgHnNR7BBHoXXH/yI/8DQUlbgM3+7
	nAEDa+yjpo6pzBcvUa/LUZWmjP/yUp5uQPYapeXma7L1/HjlTKDyPrt/zv2jK32e8AL2
	UBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Tcd0yZn4mySanDBiWEg89PCWmimwFgVupBMZX5rC6vY=;
	b=h5NAcQhKKWYjzbqvdkbsr6F7YA/zhfr1mgHCzvxgXP57UZJZ3N0yiTdyxxJRN2JBAC
	/LOM8e/k26G/FH38UHz2s9M/ZdXS/uUmJTtGD63pqPCgxkuffckeUtYyK33F7bWz7afB
	oFIfdRyfgPWjxYNfoCJ+J9RASDf/M3CQP9rm9yFInJbrP4w+iw5Gaes8ktW5LZ573DKf
	33MKAr64w443SA0xIFLauCcxPDoS74nOBfHczrz++spWPTTcZiUQJqbR6HXPawdW4U2C
	/A6j7zTSNX1vc1CIKIYVChIqOPTZSuDJqb2x0HsfOicW6jbl4n2uSvDXxyD9csoZEng8
	LIpA==
X-Gm-Message-State: AD7BkJKGB0lFaHlHXsM3ARTwyYTiwO/i+PM3sEr2b/xfBGiCKR2t9hQCR02dFicGWNHmKRYTe5EoaVilPeYCUA==
MIME-Version: 1.0
X-Received: by 10.31.49.138 with SMTP id x132mr23029716vkx.33.1457390572912;
	Mon, 07 Mar 2016 14:42:52 -0800 (PST)
Received: by 10.31.198.133 with HTTP; Mon, 7 Mar 2016 14:42:52 -0800 (PST)
In-Reply-To: <CAJTo0LZd5wWn6U=uSrEWVMn40Zy=2AhvR9hguZ2E9dpN8-_avw@mail.gmail.com>
References: <1456863137-7388-1-git-send-email-johannes.pointner@gmail.com>
	<CAJTo0LZ_rMH3zn+uox0D0tBw+T74xbkNzdvCoR3CCwpo1SnZpg@mail.gmail.com>
	<CAHvQdo0ckNBU19WSrMwehCsZ-HO37uqNRWqnywUfK3ZPtPT0Zg@mail.gmail.com>
	<CAJTo0LZd5wWn6U=uSrEWVMn40Zy=2AhvR9hguZ2E9dpN8-_avw@mail.gmail.com>
Date: Mon, 7 Mar 2016 23:42:52 +0100
Message-ID: <CAHvQdo3CtRRt9kjf82PGuO9EM5E85JDbjT_XEGCE1xNnYjYGQw@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch][jethro] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Mon, 07 Mar 2016 22:42:55 -0000
Content-Type: text/plain; charset=UTF-8

Sure, I'll send a patch for master.
Furthermore, I'll send a second version of this one, because I just
saw that I messed up the file mode of the patch file.

2016-03-07 17:00 GMT+01:00 Burton, Ross <ross.burton@intel.com>:
>
> On 7 March 2016 at 14:50, Johannes Pointner <h4nn35.work@gmail.com> wrote:
>>
>> The reason I thought this patch wouldn't be needed for master is that
>> it was included in xserver 1.18.1 and master is already on xserver
>> 1.18.0.
>> Do you know if it is planned to switch to the newer 1.18.1 version?
>
>
> No, we're upstream version frozen now, so this is appropriate for master
> too.  Patches for stable branches should be applied to master first, so can
> you also prepare a patch for the master branch too?
>
> Ross

