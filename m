Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9DE6E627
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 13:02:20 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 19so24360081ykq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sKfnrGBv56KfX7HqbOKYICyE6SE6zeFVi69Jm+lpZts=;
	b=NPbVb2yHK3tTf2qlDIO1Twvse7ppmdQajk6WW54sxza4BuXU2tPFU97l8BUYAiwRKt
	pAJJitfHeNhQxnpJwLbUEdx3OL69oDSmtebt5jCM3zfV+YIi8+vCPGMGtFJnkLkI03QV
	jUs9IWaXJheKjP5DTCW/RWmL6YSmW8QqeUEofzs0p/4o8s0iyH9ulzugNfGaqjIK91Al
	acy8FSqnNfkiNed9PNIQgyHAvz5Si07f3MLmRdA3NsreUXirJn5MuhjWxj6sGZy13sgw
	fn8SwfiQii3zQ9kcQtz1x/Uudpd5Y7ZdsK3XoUtDUcjmMVPHKabBre7t+kgs4eMO8W+U
	tmzg==
MIME-Version: 1.0
X-Received: by 10.170.74.5 with SMTP id q5mr11358248ykq.30.1422968541892; Tue,
	03 Feb 2015 05:02:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 3 Feb 2015 05:02:21 -0800 (PST)
In-Reply-To: <CAJTo0Lb+NmyRvMw=CH0TKF-EfCeen3khOut3iSEvsckmrQV8nw@mail.gmail.com>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
	<54D0C0B1.1090500@kernelconcepts.de>
	<CAJTo0LZxw5LV55fi9QA6X=vgM4UrZ-LtHXqp2KuMEVmGffgNiA@mail.gmail.com>
	<54D0C433.50705@kernelconcepts.de>
	<CAP9ODKorL58Y=bAxv39bz+CFBmJqxbtxtgZbA92=8q8nHL2Mow@mail.gmail.com>
	<CAJTo0Lb+NmyRvMw=CH0TKF-EfCeen3khOut3iSEvsckmrQV8nw@mail.gmail.com>
Date: Tue, 3 Feb 2015 11:02:21 -0200
X-Google-Sender-Auth: OJuTZ8XZTzm95o_GODrHC523z6Q
Message-ID: <CAP9ODKoSBqZTpKczXd3Q4FUfcZFrtN-DVCSMDNisp_fqnykWnw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 13:02:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 3, 2015 at 11:00 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 3 February 2015 at 12:53, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> > last time I checked (some days ago) it was not necessarily fatal. I was
>> > able to
>> > build complete image collecting a pile of PR_INC errors. That's what
>> > confused me...
>> > I'll check if I still have the log on another machine later.
>>
>> Florian has a point here. We should use 'bb.fatal' and abort all build
>> as soon as possible.
>
>
> Its an error in a specific recipe, so why should that abandon the build
> immediately?

It ends changing the content of the recipe and might raise a rebuild
of several things. Which ends being invalid as PRINC would make an
error in the end. So why not fail soon and ensure it is act upon it
ASAP?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

