Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8B08D65C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 09:07:59 +0000 (UTC)
Received: by vnbf7 with SMTP id f7so6525936vnb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 02:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=YtB/0s4jHeotzeCe1I2A9pVzk4Mqk38Pgoh9lqrfHus=;
	b=P3vM9hPiVR3IYdOd/w5Ov9/nCcOdrxvNeF1KMf22XKiiqsMFjf5U49HMok4AAMApZD
	ytzAem+gV85MMAXwC7i+PBCx6+zgcX1gavw6S6Fl2DR0sPYPbmitM94bRlenLKzRFRGk
	DVaoK1rudffDDKIzN4RGkABluWEj5L2dj8rPBUkg8R1F5aJ+iefQtu4d+9NXW/Y6uTS1
	n7jr682tvKV6aDLVmnxQ6C8pUO2bO6XReOYtbkvwR0LhC04TiLuPJ5b7nlIFzYOysrsc
	lKfaik3nxBXIaCS8fdTCs0UHkSv5+WGeXY1+R9ckWP7T6hpgx5czIFUelN6yQpY62lJP
	m+pQ==
X-Gm-Message-State: ALoCoQnyOeBkvVf9DJ5upQXSfSsbIDYcx+83oQfs6zay5iGg6calcVAmsi1/GE3tjXnuSzKnxEul
MIME-Version: 1.0
X-Received: by 10.52.180.102 with SMTP id dn6mr30168128vdc.17.1432631280595;
	Tue, 26 May 2015 02:08:00 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Tue, 26 May 2015 02:08:00 -0700 (PDT)
In-Reply-To: <20150525213237.GA7426@nbbrfq.cc.univie.ac.at>
References: <CAOMwXhN1Ww=T_OJC8e-VtzM_OozOQUjCU7cF1-shUMZ_kVG4Xg@mail.gmail.com>
	<20150525213237.GA7426@nbbrfq.cc.univie.ac.at>
Date: Tue, 26 May 2015 10:08:00 +0100
X-Google-Sender-Auth: 2WDpma4PFvPQPZ7mXZxa2iaje9k
Message-ID: <CAOMwXhO-v+i+TftbffUoQOu9a-t3wHpJNAb=8gqjFVND8T4DnQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: busybox <busybox@busybox.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: adduser: add -k [was: Re: Post USERADD_PARAM action]
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
X-List-Received-Date: Tue, 26 May 2015 09:08:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 25, 2015 at 10:32 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Fri, May 22, 2015 at 12:37:13PM +0100, Laszlo Papp wrote:
>> Hi,
>>
>> is it possible to do some post action after useradd_param is executed?
>>
>> I would like to modify the created user's home directory, in this
>> special case the profile. I see that the useradd util has this on
>> desktop, but busybox does not have it, and very likely will not have
>> it, at least not in the near future anyway:
>
> mhm, why so?

People tend to complain about not very common and minimalistic
features going in. Perhaps, if it is optional, it may sneak in easier.
Man proposes, Denys disposes.


> The attached compiles for me.
>
> cheers,
>
>>
>>        -k, --skel SKEL_DIR
>>            The skeleton directory, which contains files and
>> directories to be copied in the user's home directory, when the home
>> directory is created by useradd.
>>
>>            This option is only valid if the -m (or --create-home)
>> option is specified.
>>
>>            If this option is not set, the skeleton directory is
>> defined by the SKEL variable in /etc/default/useradd or, by default,
>> /etc/skel.
>>
>>            If possible, the ACLs and extended attributes are copied.
>>
>> I would like to do something like this with the created user's home directory:
>>
>> echo PATH=/sbin:$PATH > /home/foo/.profile
>> chmod foo:foo /home/foo/.profile
>>
>> But then again, for this, I need to make sure that the user is already created.
>>
>> Ys, L.
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

