Return-Path: <winiston@futuraautomation.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0CC73174
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 08:49:22 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fy10so128905609pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 00:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:references:in-reply-to:subject:date:mime-version
	:content-transfer-encoding:importance;
	bh=PoEvkNOvfN7QFlFCybYHjYOFwvJ8xiFn7nBwioTmo4A=;
	b=Aj0SV0XGiArc/Tn4/uwqlAX/yi346nEHAUeDO4vVaZbOM0XX0O/CFKSAVc+DkVwE3N
	/dciAb7Nao+lDddQHj9E9d0x5i/r3K4fMBlLPmexQBDXHrgrAUfVikdki+uuxILwRAUO
	+dPGxFBew2a8Wwwh+z06Yxu0XREg5coLJ5HrY7MBlLpn8UwMlLLDcrixnaO1lmXeMTbw
	i0VZNOm6HDGaCpX5kkzuF0uS1gc2FcPaqQsh9cvqXM5n0ZXlKnpRPESlRkTk+vqLIBgu
	SOrKdRQDep7sA3BLta/rlshsIgcxsSHriN12VZdnd6/JKe6MZ7vn4cKYGgdeJL/DeAfd
	y3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:references:in-reply-to
	:subject:date:mime-version:content-transfer-encoding:importance;
	bh=PoEvkNOvfN7QFlFCybYHjYOFwvJ8xiFn7nBwioTmo4A=;
	b=c90nX2/HNRApnWmI+Oi5XjSlPYm4hn625QGOr9XKX7jUw+YqS5l6igDkGgDU+ErdFi
	lRxaVuYOYYKGxjTMBX2uxuvAU9AZf1JgPVBwCb9wFLFee0CQoDtmG4irF9ekKB0+AN+s
	CXba6gLp14laKhjA0JGDVtAGpdVV1/n5meWvoG+uU07ZRzMUC1DvRjns+zGIEvNB1w8U
	cw7kR4ioFlLNOrKAl0ir5PRlYLx9ywzV1UtHFg7FfHETmODeG37NreXzJJLQUiOEIII8
	mEw6QfyjQ2KFDOXo0J7R6NI1ml4cbBfKezkRKQONjbXaqRWl++vQ0kzy5OuiUMULvg+D
	IdCQ==
X-Gm-Message-State: AD7BkJKvHeZVXirhm8WExPcwy8TNDoLnrD0K8QXQEolHupb5vMWNpS/oLH+AUSkAq6KfAQ==
X-Received: by 10.66.237.39 with SMTP id uz7mr24666471pac.141.1456908563643;
	Wed, 02 Mar 2016 00:49:23 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	h19sm9085040pfh.43.2016.03.02.00.48.50
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Mar 2016 00:49:22 -0800 (PST)
Message-ID: <38408F728A334E9F9A452EFD2448CC8D@RD3>
From: <winiston@futuraautomation.com>
To: "Anders Darander" <anders@chargestorm.se>,
	<openembedded-core@lists.openembedded.org>,
	"yocto texas" <meta-ti@yoctoproject.org>,
	"Yocto layer" <linux-yocto@yoctoproject.org>
References: <AB28D54196164B23BA942EBCF3204741@RD3><20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com><2CD39F82881F465AAD78DBB61BCA369E@RD3><CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com><E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
In-Reply-To: <20160226093319.GA4329@ad.chargestorm.se>
Date: Wed, 2 Mar 2016 14:22:16 +0530
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Re: How to integrate third party application software to yocto image
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
X-List-Received-Date: Wed, 02 Mar 2016 08:49:23 -0000
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 8bit

Hi,

I am new to this community.What does mean top post? Please see my 
bblayers.conf file content.

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  /home/winiston/poky/meta-yocto-bsp \
  /home/winiston/poky/meta-ti \
  /home/winiston/poky/meta-oe \
  /home/winiston/poky/meta-multimedia \
  /home/winiston/poky/meta-qt5 \
  "
BBLAYERS_NON_REMOVABLE ?= " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  "
#added by hob
BBFILES += "${TOPDIR}/recipes/images/custom/*.bb"
#added by hob
BBFILES += "${TOPDIR}/recipes/images/*.bb"


I have copied  meta-oe , meta-multimedia and meta-qt5 from meta-openembedded 
to  /home/winiston/poky.

It spits out the same error. Log output as given below.

winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-base
Parsing recipes: 100% |########################| Time: 19:17:59
Parsing of 1760 .bb files complete (0 cached, 1760 parsed). 2285 targets, 
196 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'navit' (but 
/home/winiston/poky/meta/recipes-core/images/core-image-base.bb RDEPENDS on 
or otherwise requires it)
ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with 
bluez4 and bluez5 is selected in DISTRO_FEATURES
NOTE: Runtime target 'navit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['navit']
ERROR: Required build target 'core-image-base' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-base', 'navit']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
winiston@winiston-VirtualBox:~/poky/build$


1. What could be the problem? Since I could not proceed my project, Kindly 
help me to solve this issue.



Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Anders Darander
Sent: Friday, February 26, 2016 3:03 PM
To: openembedded-core@lists.openembedded.org ; yocto texas ; Yocto layer
Subject: Re: [OE-core] How to integrate third party application software to 
yocto image

Hi,

Please, don't top post.

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160226 
06:41]:
> I copied "recipes-navigation" folder from meta-oe (Open embedded build 
> tree) to "/poky/meta "

> I have appended  in “conf/local.conf”  as given below

> IMAGE_INSTALL_append = " navit"

> While creating the image, it spits out the following error,

> winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
> Loading cache: 100% |##########################| ETA:  00:00:00
> Loaded 1510 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'navit' (but 
> /home/winiston/poky/meta/recipes-qt/images/qt4e-demo-image.bb RDEPENDS on 
> or otherwise requires it)
> ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with 
> bluez4 and bluez5 is selected in DISTRO_FEATURES

This is the error. You have bluez5 in your DITRO_FEATURES, and I assume
that navit requires bluez4? Anywya, it's blacklisted.

> NOTE: Runtime target 'navit' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['navit']
> ERROR: Required build target 'qt4e-demo-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['qt4e-demo-image', 'navit']

> Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code.
> winiston@winiston-VirtualBox:~/poky/build$

> Should I make any other setting to add the “navit” recipe to my image?
> Is this the correct method of copying  "recipes-navigation" folder  to
> "/poky/meta "  ?

Well, it works. If you don't mind the rest of meta-oe, I'd rather add
that layer to conf/bblayers.conf. That would make it easier to get
updates to e.g. navit.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB
-- 
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core 


