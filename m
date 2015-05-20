Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f45.google.com (mail-vn0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1B8607BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:20:02 +0000 (UTC)
Received: by vnbg129 with SMTP id g129so3782460vnb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=um3UG5lSxFabRrTz5jwbG7kYE+Qr9eqGHRrZifDyugo=;
	b=IAME22d5X52dA8qn4u89m+olbHhJokyzprJZNet/avK+ZPGldQhLs73QzMR5siG8TM
	9HpTDpTNLdUZrCN6QYvvFlTQslKq8+hG43jZWNT1qL6vEqOmbFXF7B7K3Q5lmSUwBO2U
	SCC4q6PUxmxwDiiYPXRfoowz1fIV01111wRuxF6IaA3l50zdzwHmPCc7/Bqa061AFDK2
	97rLPYJ30wk5u8lM+Bpi8WPHjGxiF8RWqwL1lYNuqv4mPdkTz59QnbP74B659i/hEji9
	DNfpB3kMCO1sGNVAp0Dm8qh6o1eOwEe9wlIeCK83zkhQ5vl9bJdvBjxgz0hr5Cj6zvgW
	TGpQ==
X-Gm-Message-State: ALoCoQkYVSMvJggELvDGia7LO98SQsArezWpSMGMBCyWIhcUzthO2GmZJgYkxorYI4mZb5g0ZdQJ
MIME-Version: 1.0
X-Received: by 10.52.100.103 with SMTP id ex7mr34059136vdb.71.1432135203916;
	Wed, 20 May 2015 08:20:03 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 08:20:03 -0700 (PDT)
In-Reply-To: <CAC1BbcTWajWUmkPAvjOT_WPhR3z1EhU0QKfcc3Y7Z4F7cARc0Q@mail.gmail.com>
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
	<CAOMwXhNkjpH-jQS=c0RkPyGVQ4D3JCXAyRmrWckr3XcYwf9jgA@mail.gmail.com>
	<CAC1BbcTWajWUmkPAvjOT_WPhR3z1EhU0QKfcc3Y7Z4F7cARc0Q@mail.gmail.com>
Date: Wed, 20 May 2015 16:20:03 +0100
X-Google-Sender-Auth: 9kvWheNocW51q2TikDn_kLHG9dQ
Message-ID: <CAOMwXhNO_NQLCdNGU3SSvoeV_C4+m5w3=9hydiMQhq-=W_kt5A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 20 May 2015 15:20:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 4:17 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 20 May 2015 at 17:09, Laszlo Papp <lpapp@kde.org> wrote:
>> On Wed, May 20, 2015 at 4:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 20 May 2015 at 16:02, Laszlo Papp <lpapp@kde.org> wrote:
>>>>
>>>> On a second thought: is even worse now than that, our code has to
>>>> handle _three_ different scenarios:
>>>>
>>>> 1) Desktop.
>>>> 2) Embedded without Yocto or embedded with old Yocto.
>>>> 3) Embedded with new Yocto.
>>>>
>>>> I do not get excited about this.
>>>
>>>
>>> Do as the documentation says in your distro and you have one scenario.
>>
>> That means compromising security. I am now looking for the ideal case
>> in the future. What is wrong about dropping the privileges in busybox
>> for undedicated processes without creating this separation?
>>
>> That would combine the convenience with security, wouldn't it?
>
> We already do that. Since June 2002. version 0.60.4

Then I cannot understand the incompatible change. If the privilege is
dropped early and the code is well-understood, then what exactly was
being solved in here for the price of incompatibility and more complex
environments across projects?

But in any case, if BUSYBOX_SPLIT_SUID=0 helps me with being
compatible while it still drops the privileges properly as intended by
busybox upstream, I guess I can go for that. I am yet to understand
the "certain users do not follow it" part. What exactly?

