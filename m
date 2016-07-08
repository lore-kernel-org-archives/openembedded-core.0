Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 70DCF60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 20:55:47 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 82so11811125qko.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hn7bEAC26WQ2DDIP9U8n0FsflxX4pcsCeI7Qevok4mk=;
	b=RH+RzYn80vwmzU6MUQgiiOSfGl3c4YdDIU4TjgXRLcIsBuuRVqCAEKSkVeh9cHx27M
	X2ztLkNr2sOXkAZtGY7N7SB2b1d/U8qZpFPWSMldWcSVR8C8+6ePENJTVzeSyAdtjF9t
	2zVYv5qrO2mDJctqn7ybQRt/0nt2nZ8wkIgvAD8p327QQd+gRvdR0y0hdfQfWBXAz45E
	qaPfZ7ntN3eEQY+xfW6jHv68pp+4h/5it+IvtdolLSLClxkUS+JDS0wKbA6ghQeiR55V
	4wCSh4zVvD8cPbuA/IcsgXDRLmooxa7K6JVPaXRwlEXXUfMPcq/VhwbX8EC6eHhYSU+/
	PrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hn7bEAC26WQ2DDIP9U8n0FsflxX4pcsCeI7Qevok4mk=;
	b=CcsUsg/W8C1GCghqBD0/oJsgKZQ9YrenXgjXCjZGOtn4nQIPreDyYuwWNykm21Jbzx
	myIJlzckQIVZbe+ZffgBSIH+4XdA3pogk4ESGyiLHilFopo/wyF85RXw8fntbb4x9PjC
	cAZV5GagF/hBbjfkbq3lg6ys+TiNl53lUcQqhaD5wQkWTzGTpaMMG1sGYuewJaY87ma6
	n/hmkUDL8rXBuinQ0oEUlQH3zy+iqzpX1/qH/w8HGloxeoLy5xLPM/JnLGIGoyG+kBIb
	tLopqAxTfRgL89GGNHIAPQFyGfCJv/5ASslwJh7COuA2tAa/TvtPutFddxVMFR1ej3O2
	gsJw==
X-Gm-Message-State: ALyK8tJg5TTXXODWyYfsRPB+EFavz6+hIPyxH1MpZGtsYyLcaUJLrQlCHNVIkz5AW9neOYvcE27ZUdk2SlxKOA==
X-Received: by 10.55.178.195 with SMTP id b186mr9447668qkf.81.1468011347514;
	Fri, 08 Jul 2016 13:55:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 8 Jul 2016 13:55:18 -0700 (PDT)
In-Reply-To: <CAMKF1soSd7zJt4PXa0oDzycHK5G6+r1xeh2AvCw3srgFZ-mSCA@mail.gmail.com>
References: <20160702081927.7365-1-raj.khem@gmail.com>
	<20160707053905.GA28068@openSUSE-i7.site>
	<CAMKF1spS0OSZ=aWRP+ZJPkcBPn=SfMrgP=uA9SvR8CmNiXm4PQ@mail.gmail.com>
	<20160707200510.GA4311@openSUSE-i7.site>
	<CAMKF1soSd7zJt4PXa0oDzycHK5G6+r1xeh2AvCw3srgFZ-mSCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jul 2016 13:55:18 -0700
Message-ID: <CAMKF1srYvEAAeMu8aGhB2OVaG9h+MpweZ-YPdWhME99V-0JMTw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Fri, 08 Jul 2016 20:55:47 -0000
Content-Type: text/plain; charset=UTF-8

Trevor

On Thu, Jul 7, 2016 at 1:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Ok thanks. Let me know if you get to see the same issue on say qemuarm or
> qemuarm64

I built core-image-sato/qemux86-64 vmdk with chromium added

CORE_IMAGE_EXTRA_INSTALL_append = " chromium "

launched this image in VM and chromium starts normally.

I am using github.com/kraj/openembedded-core kraj/master branch and
github.com/kraj/meta-raspberrypi kraj/master
everything else is upstream master and gcc is 5.x

here is my build info

Build Configuration:
BB_VERSION        = "1.31.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "x86_64-oe-linux"
MACHINE           = "qemux86-64"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""
meta-raspberrypi  = "kraj/master:b9ba221e520f39bc3e273f709b5ceea02897d525"
meta-qcom         = "master:0eaea003cac6c3175b0a3682efd6e1f20ecc9dab"
meta-96boards     = "master:6b2744bf3e82154a9329ab89cf03eec9d1f80837"
oe-meta-go        = "master:dc19a245ae5224d1c9859119a9c53b6331812400"
meta-browser      = "master:77736988073a5d90fcff9d0005c8477332ede387"
meta-metrological = "kraj/master:356f0c33298eb63af415f333fe06121d056261e1"
meta-multimedia
meta-gnome
meta-oe           = "master:f11f8664de82e4f8c23b075542f4c98c16ce1f5e"
meta              = "kraj/master:96ed9e94082589a62a6c602e5f774c11de3328c6"



>
>
> On Jul 7, 2016 1:04 PM, "Trevor Woerner" <twoerner@gmail.com> wrote:
>>
>> On Thu 2016-07-07 @ 09:27:30 AM, Khem Raj wrote:
>> > Is it specific to x86-64
>>
>> Up to this point I've only been focused on x86-64, but now that I have
>> things
>> cleared up on that arch, I'll be working on aarch64 to see how that goes.
>>
>> My "solution" for the time-being is to simply pull in the glibc_2.23
>> recipes
>> into my build and set GLIBCVERSION to match. At some point I'll be trying
>> to
>> bisect the glibc commits themselves to see if I can find anything
>> conclusive
>> (but, as always, that'll take some time).

