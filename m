Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id CC2476011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 18:15:03 +0000 (UTC)
Received: by lfaz4 with SMTP id z4so105800282lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ktookADnEwo2txSLTUn+z58AphY66uZ35Z0O58mtYYE=;
	b=Yu02MatsaRgnLjRqG+BuhK+Q/59FRK5kQY2leVSKY/qTbKO3KRql40jfbRIb7GmpOk
	d965HunEqiRe1c/XM7gwoQyUPM0NrKyRuRIEj6layu13dZb552mcynibvdGcUbMgL5MM
	fecyAAJA38nQmGaNFXB474xm958ZTvPuVfASp+MH2Q8DJAu5SUZ6bNJHjUiiM4SQCm3X
	gAPYbVDZcma13wrY4M9VEzZD4XTs+NH2MtDlgrg3sjm8RprtGf0JY8OH+BG+gqIlVW8a
	sUcOvH7+uhWUoOrNmp2l/Xw8NsdLxWCygWmwMQJr2JrQDVCXD/3sGHCziUaxF+PShNjJ
	lv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ktookADnEwo2txSLTUn+z58AphY66uZ35Z0O58mtYYE=;
	b=h0mh7v7E+eYgpWhfZEDTDt2FYUflIUI2PuiAQ2WTVVlkgAoYh7o4zgYtTKs5BvQ2iF
	o2UAyHkoGFmeS7zJVuLExV20+iDN8jKE8ADYDOijF+uXyXFB/DpIDNypIV8CTy0U5/vw
	SdUwBnWoUiy2uK+6gwCm3Lr98US9RUSYS7PRVKvT6zqLXTD1TKUgHLkaYIhkjHHHH8Zt
	6bksRt3J+WJKif5jn4zXLJxe1oCQDtcjcAvXklmnNehUsjh3RlaBNU7PP+hIuw3dwfdx
	4HkHGBzVFKfNgbIQRGsmeYiFv/TfCQy701hm4uFQOOK37/H2epECXur4rtdbY6yar9pm
	wIyA==
X-Gm-Message-State: ALoCoQnH1gplzcOy7YKFafTCV8NYoDf31U6yCq+lLiDhfpA2NKNpZ464gPvWH6KXkjFAaLAfyXav
MIME-Version: 1.0
X-Received: by 10.112.198.69 with SMTP id ja5mr1809403lbc.121.1448561703763;
	Thu, 26 Nov 2015 10:15:03 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Thu, 26 Nov 2015 10:15:03 -0800 (PST)
In-Reply-To: <CAD3vsf4AyaCVhvu27U8N666EjYwFg7XPWQ7NGjAg_xwbH6dRQQ@mail.gmail.com>
References: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
	<CAD3vsf4AyaCVhvu27U8N666EjYwFg7XPWQ7NGjAg_xwbH6dRQQ@mail.gmail.com>
Date: Thu, 26 Nov 2015 23:45:03 +0530
Message-ID: <CAD3vsf6RJs5ZgsgqvRU1qWvf1Zk3F8hgY5PYq2dMimQzEr_eqw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 18:15:05 -0000
Content-Type: text/plain; charset=UTF-8

>> WARNING: Could not copy license file
>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
>> to
>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
>> [Errno 1] Operation not permitted:
>> '/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'

The above warning comes up during do_populate_lic task, and this task
is not being executed in pseudo environment. So changing ownership of
license files to root user (explicitly via "0") fails, as normal user
doesn't have permissions to do so.

In this case, use of os.getuid() and os.getgid() behaves correctly, by
giving normal user id and solving this warning. So this is one
advantage of using os.getuid() and os.getgid() over explicit "0".

Regards,
Jagadeesh

On 11/26/15, Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com> wrote:
>>> We get below host contamination warnings of license files for
>>> each recipe, when we try to create a separate ${PN}-lic package (which
>>> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
>>> in local.conf.
>>>
>>
>> WARNING: Could not copy license file
>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
>> to
>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
>> [Errno 1] Operation not permitted:
>> '/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'
>>
>
> My earlier testing was done till do_package_qa  task, so could not
> capture this warning. Will check and get back.
>
> Thanks,
> Jagadeesh
>
>> Ross
>>
>

