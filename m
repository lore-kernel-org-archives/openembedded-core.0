Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8EA77065
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 10:56:28 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d97so690110uad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hwOAKViaWynhStLuWSujIcyC9VaSd8V659llavZpH8Y=;
	b=PSrb9XohsjKVr7iQIhDo4aGsD4O9WczqI5o+QHba1od62QRT+h5gJhHFFjs0+jJZAr
	firFP87Dn/MtJr5rKbbLdkZz4DTayRrm6swtWYmCLt1NQZlrTgfh9Jew1YT61bogW9BV
	+/GKa2FQ0xHH6GatTpV+CCEzQQytl7k54STfkPL/F+bymgmIu9sX2LFx87V5vY5dxcQ5
	oZcTuFckarfGBxFL8559KtWGx8xIyBweBnzgLlrEnDQ9RhXqN2Kk9VeH1jJXiDw/wUpU
	Bxx5Ie3MN2COfQJ60IJ7iJzD/JGXlFw0DBD8BMUyfm+jBwV7h32311voukEagSe5VJKG
	RZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hwOAKViaWynhStLuWSujIcyC9VaSd8V659llavZpH8Y=;
	b=kYIsArGfh/ShE2sl266RvvaAMIqnr8G2WwdoBd6xky3ue/DtXouPBMpXOfOZM+feHO
	FipV1pWbYPkxtErkL/PWlTpeHKOQ+RzEUCVGwI1nbyKd4dYKYZl219vEXI2+6sRz/JwC
	SvTi+2Kz1v88IzzP82G9b0YzCAE+QtNw7yhDBOFcysYSpy+7Mjdo0lYpnamlCGKbvIFR
	fuu33944YfVRWZxLMizQV6vRhVQmIUI8tpM2PmIyYfwLws4EoIuq5ljGZfJ+XXS9/X/J
	ArdXgzLGUP+KXMKag0VPc+DtrDMK78BnxbaFQG81fE//Gxj8Iui3JnwIsIWcIuZnzenk
	7C6A==
X-Gm-Message-State: AEkoousjnqlknJiODY765W2YQ6FXFxONSg0m/Wauk2QrdUOhuBuLBgmP7izE/F93+wcNmyto/h6YWOoXP+GR4Q==
X-Received: by 10.176.68.102 with SMTP id m93mr50224943uam.111.1470740189460; 
	Tue, 09 Aug 2016 03:56:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.66 with HTTP; Tue, 9 Aug 2016 03:56:28 -0700 (PDT)
In-Reply-To: <CAJTo0LbSmfeoTfpsTRgZ4ZUr7B+fkjxHBPAmAWu=UWk3UUAj4Q@mail.gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
	<CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
	<1741854.t2UPzGOPnl@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRSP+nbV045-UaW_bZXv0iwnTe-MhjMLe3NEqAeg=-6Lyw@mail.gmail.com>
	<CALbNGRTfPz3h=G3WJG88ShDtCJjgFj1zTk0kT=Ri+k_N6d=tog@mail.gmail.com>
	<CAJTo0LbSmfeoTfpsTRgZ4ZUr7B+fkjxHBPAmAWu=UWk3UUAj4Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 9 Aug 2016 12:56:28 +0200
Message-ID: <CALbNGRSpQmP_La5bVxmG_6PE7GVP5aze2c+er=8kNsDz5AmEfA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Tue, 09 Aug 2016 10:56:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2016 at 12:00 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 9 August 2016 at 10:22, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
> wrote:
>>
>> Is there anything wrong with this patch? The original patch was sent
>> end of May, there were pings / a resend but it was never applied. Why
>> I insist: It is necessary for RaspberryPi's open source (VC4) patch
>> series pending for very long time.
>
>
> Just slipped through the net, now in my staging branch for master.
>
> Ross
Thanks

