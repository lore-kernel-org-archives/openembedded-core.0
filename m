Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f49.google.com (mail-vn0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED766ABB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:58:27 +0000 (UTC)
Received: by vnbf129 with SMTP id f129so3732252vnb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=2In3cd7S/hisaLWET6I2WBqBcJrXxcWlQ4u/vS/OKfs=;
	b=cR5JeAde3XUfaW2AfazaPjDakQV7dxdoS3UOWf+p43YEx7KLsJqKiJEf3GnjvHTJNm
	jc2cITVV+iBTJttbtd+98OJhd2THauE+buXOAofs0tuwYEC03Sh7XpS3bAYqS3nBZRv/
	061V/mkcW/p5xYVTI9aUBlVWbH4knN6LJn/ypc3ASFqHcWJLABw+SIuWqQuUhaR3F29w
	XFXs0R53zcbRsynB3hGOE7R6TDhOkm0HRRStVLYIuYhXh12BLBzDF+aQ7oRIxgLiDT+2
	3s3q/lfl15EaBdzHOONt8/CXJ0tZsmXsxYqmdzEcihL+u5nb7FijEr4sJRjv2r8m9r8R
	4p6g==
X-Gm-Message-State: ALoCoQkEhhz5X07F1NNxTxLJRTz5GeUAyBZLBJrk1EZMjoxYdjUp3UGnOy1Y/49lhpNFBAV1KR5G
MIME-Version: 1.0
X-Received: by 10.52.7.33 with SMTP id g1mr34483121vda.83.1432133908210; Wed,
	20 May 2015 07:58:28 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 07:58:28 -0700 (PDT)
In-Reply-To: <CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
	<CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
Date: Wed, 20 May 2015 15:58:28 +0100
X-Google-Sender-Auth: chfZ5lSYZjXlqJUwV-f8CD2guzo
Message-ID: <CAOMwXhOG9=fraTJfnuoWUY=e6ZwATRCKHOmUvTerz7m+08T_sg@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 May 2015 14:58:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 3:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 May 2015 at 15:50, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> Currently, I do not see any simple way without #ifdef jungle in the
>> code around to it. It is not nice.
>
>
> Looking at the busybox recipe reveals this:
>
> # Whether to split the suid apps into a seperate binary
> BUSYBOX_SPLIT_SUID ?= "1"
>
> Just remember that the suid apps were being split out for good security
> reasons.  There's no need for sed to have suid rights!

I will not argue about security measure improvements as I agree about
them with you. However, I will debate the way this security measure is
implemented. It is distraction from the desktop world where you can
also use busybox and many use. Now, all of a sudden, we have to handle
them differently in code and scripts.

I think a less intrusive approach to implement this could have been
(and probably still not late) is to fix the rights underneath and not
by such wrappers. Such wrappers will introduce this disruption which
is not strictly needed. Well, you could say that if desktop
distributions also implement it like this, then there is no
disruption, but I think that is never going to happen if busybox
itself does not enforce it.

I think this is not a good implementation for security to remain
consistent with the rest of the world. Could it be please reconsidered
towards another solutions?

It is also good if one call tell me how to solve this differentiation
between desktop and Yocto without further code.

