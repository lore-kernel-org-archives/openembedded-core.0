Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2D26C6FF7F;
	Mon, 24 Apr 2017 02:52:35 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id z52so41930016wrc.2;
	Sun, 23 Apr 2017 19:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s67uu77a0t16WgqUDQmX20U0LEfcYsxoqeA1J6G2dSI=;
	b=Yr6J1rJumD8bt5yPJ9sbHCbHGUnhn75WfySI1Cau3ypKJFmuYTTDvcN5shQikjyYZD
	06wuRuzkj4UPCSV50bPClpCbA6E9db3SXRw2F/ZlcDsTAFvlSB+kWqQEhRC7VtkDzeQN
	hYdAJ58Lu7gDqqQzhfz3cxH9VyuhTa1KovvhMMMkCqUKvo1rsHiAMfW+mKUSdw9/KksW
	9+YnJx4ArEu1CemXunFUmIx51IPWCTQDi7ATWOVmKSHlZbtnuVTN+muKgFyopULd1TkB
	eBp3jnR/k7vmHCGyhBmb7+rcYNGLCeEqcd/1lqGGJMf3m7tCj0m9J9wjy0ZNlrRrysrM
	MgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s67uu77a0t16WgqUDQmX20U0LEfcYsxoqeA1J6G2dSI=;
	b=MEr8HfqObJny0kULsUfpKlgH2yUvEEB10a9thFaFr4t4wcrrv0ywEvcPN/CPSns46z
	G6Vc4ZIwUH+OOTFz6bwNQZiLPoBVPEApCTZs/EKZjDYqz97I/T0RLjfLD14uHVRW5Jh8
	xvblHB8YRp79J7+SMkst/fwUCIK5hkVca2LwEPz/VOdNpcBLxRJzW5AXBhPO9nlX+zeX
	eQeg9YkVIY9Tq0ZsMs8+xK+TWtFpY+VoaaSlPCrThGTKOiDR4uaPsDAR+A0dj3vmpVJO
	xay4DfZECAnFzLSIZbOl9TQckVX74LPDZRbBNRdChBGwwYXD9hxm3qe5TKLOF6ywHcGP
	6WQA==
X-Gm-Message-State: AN3rC/6dltYegKNLuWvWh5puJT2GyzoMv35mZkF0aDLwjqs/8BUh70TA
	MqPsCvnZkcQOn0XY4UuCzebUnrPBVw==
X-Received: by 10.223.139.146 with SMTP id o18mr3646891wra.175.1493002356349; 
	Sun, 23 Apr 2017 19:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Sun, 23 Apr 2017 19:52:05 -0700 (PDT)
In-Reply-To: <CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Apr 2017 19:52:05 -0700
Message-ID: <CAMKF1spOfQgu0qish5uwBfFeX7t1b=11DvfiKBfrYEG2zvJxsw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 02:52:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 23, 2017 at 5:31 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Sun, Apr 23, 2017 at 8:30 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>>
>>
>> On Sun, Apr 23, 2017 at 6:04 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>>
>>> On 16 April 2017 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> > I have put together recipes for upcoming gcc-7 major release as well
>>> > as glibc 2.26 release, which we would target for next release ( 2.4 )
>>> >
>>>
>>> I threw these at the autobuilder and the errors are starting to appear:
>>>
>>> http://errors.yoctoproject.org/Errors/Latest/?filter=
>>> eddf6362e17899113f10cf53ed0db8a4b13ff3fc&type=commit
>>>
>>> Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I
>>> have your grub fix already).
>>
>>
>> I wasn't able to bring up the linux-yocto one .. but the 4.10 linux Yocto
>> should be at a high enough stable
>> release to build with gcc7. So if there's a direct link to that error, I
>> can take a closer look.
>
>
> And sure enough, after I sent that the error page with linux-yocto finally
> wheezed in.
>
> I see that it was the 4.1 kernel, which is expected to fail. I haven't
> looked into backporting gcc7 fixes
> that far, but if there's demand, it is something we can consider/look into.
>

I think we will need them on 4.1 too but lets wait for gkh to apply them first.

