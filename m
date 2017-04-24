Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B629F60778;
	Mon, 24 Apr 2017 05:45:42 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i137so3158631wmf.0;
	Sun, 23 Apr 2017 22:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sMoOcsFgGEzi8V8g9fTTsgv4IEzNPa6OZSH9sffXFUU=;
	b=KusfLEsO+SJwDAqMun+pHL79+p4Nvy88SuP2sPJURkuHfA9QJloD8VnkSCTboWzQjc
	IwhH28hqQn/xP5+iBqiRsO/SIApsy3E4i1/QSWP2si3RpDcs3WPK7uGrn1iWHEEdsO2q
	kP6h71caf8hst5o9gy+pLpQhCmMVvtiu8ChbgFQuaAa84H2mTA+JR5o/urLsuNFMvgw6
	V6+PwjOqxDp5crKx8mEP4xViedR32NggAWnaqQBkzN/JmknY1NEMeP3mbrNiRzBXl1SL
	6OnST7KutTVssqMMKp4G912EiMy8H6tcWQUTMnWizp+arGVBUiQpBpjPRmejneQ8ZIX9
	bNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sMoOcsFgGEzi8V8g9fTTsgv4IEzNPa6OZSH9sffXFUU=;
	b=SxvUyeu97bSjNCceZeNjWPcDWHXDeA+GaGX/XkDUfBiMuPfoIPn06iZoQ5lqmPPioN
	C1iSxmt/h3T7nF/cNJKObO88d91tJUjSDWiBDnWts2P0RmSSAR43m2++fSqAsxNUsz+9
	tXAAT/GWXojg2StzXpCOdyBBCn7j1e//oy2U9pvUfjSA4wnhvWRCnpkgy+xan/BT2RBP
	ZCJ3oEpcYTeimx1nQTrCi1LMwRRYhgFWIJ2W6YfdyX9HRpQmWzB038w8q4vAj+cSiK1h
	oeHhvVB4bcfl02XlupGlENwXcP/Z0hDtJIIolz1fnnvBfogcSoPtdOk2t4CN64RaoHFf
	gz1g==
X-Gm-Message-State: AN3rC/53Yqxel3gTUKe/INlADuZCcRKD5wEExouN81RwoKkxMIJxPXzd
	LnrX0lrKbPpFguqYsTsuKlObcDr97w==
X-Received: by 10.28.206.195 with SMTP id e186mr7557571wmg.37.1493012743294;
	Sun, 23 Apr 2017 22:45:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Sun, 23 Apr 2017 22:45:12 -0700 (PDT)
In-Reply-To: <CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Apr 2017 22:45:12 -0700
Message-ID: <CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 05:45:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 23, 2017 at 3:04 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 April 2017 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I have put together recipes for upcoming gcc-7 major release as well
>> as glibc 2.26 release, which we would target for next release ( 2.4 )
>
>
> I threw these at the autobuilder and the errors are starting to appear:
>
> http://errors.yoctoproject.org/Errors/Latest/?filter=eddf6362e17899113f10cf53ed0db8a4b13ff3fc&type=commit
>
> Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I
> have your grub fix already).

There are few other fixes that needs to be in there. glibc and gcc recipes
also needed some fixes. I have pushed the whole series to kraj/master
branch on contrib repo

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

give it a whirl again.

>
> Ross

