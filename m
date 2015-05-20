Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 33E137215B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:09:44 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so3764446vnb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=k+7fBDvC3ngRBeT99nmblVp7PGLBNIxLdHXAxbJpLLA=;
	b=eyGYgcSYBPnRM3KSkjVJFg7kBZKFqQvnM9kimIOP94iydDLCt+0h6mx8TpQk28nVcZ
	udWsprPcldfbiPUqEqfkRlI0sCwy8m2qV2rQsB9QnejtfEBTRf116MZFoN37TEBpTtdV
	0sOzm5RVeRRIHzoMYvhuZzOSnLdIlKIuu6yDWp/bqK+azhoeQl+KICRQh30G5u1MgjMI
	i7RL4C58De7pUOuCHU1Nt3w+b4o1v1HeGq2kc24sFRt2JkM30ZVR7kDgtogVDvVux57H
	jRQllclv1aILNnnwZYjAc/6zGhAQF79k/ssaM9jSeMaG4Ha0vTuR7zTCsfuTaSWqRn3W
	wnEQ==
X-Gm-Message-State: ALoCoQkY9ywYK896t+5x4LCgXVVAVhMiorxbS88KTL3s32Kg0FXgvwW6SUrIvuozNgWi9ghZAlTT
MIME-Version: 1.0
X-Received: by 10.52.240.176 with SMTP id wb16mr34683206vdc.25.1432134585654; 
	Wed, 20 May 2015 08:09:45 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 08:09:45 -0700 (PDT)
In-Reply-To: <CAJTo0LbAzuA6m6bvZG5oOhqwGKavxh=enywV4MzoHmONAOYUTA@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
	<CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
	<CAOMwXhOG9=fraTJfnuoWUY=e6ZwATRCKHOmUvTerz7m+08T_sg@mail.gmail.com>
	<CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
	<CAJTo0LbAzuA6m6bvZG5oOhqwGKavxh=enywV4MzoHmONAOYUTA@mail.gmail.com>
Date: Wed, 20 May 2015 16:09:45 +0100
X-Google-Sender-Auth: w-buhdOUCwUFO4pWAh72NcsnJ8M
Message-ID: <CAOMwXhNkjpH-jQS=c0RkPyGVQ4D3JCXAyRmrWckr3XcYwf9jgA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 15:09:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 4:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 May 2015 at 16:02, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> On a second thought: is even worse now than that, our code has to
>> handle _three_ different scenarios:
>>
>> 1) Desktop.
>> 2) Embedded without Yocto or embedded with old Yocto.
>> 3) Embedded with new Yocto.
>>
>> I do not get excited about this.
>
>
> Do as the documentation says in your distro and you have one scenario.

That means compromising security. I am now looking for the ideal case
in the future. What is wrong about dropping the privileges in busybox
for undedicated processes without creating this separation?

That would combine the convenience with security, wouldn't it?

