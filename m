Return-Path: <winiston@futuraautomation.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id E6D1876DBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 03:51:33 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id fy10so83599571pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 19:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:content-transfer-encoding:importance
	:disposition-notification-to;
	bh=SJDQGdAHFBFSq5dmzm58xSGa4v4HU7OJNW36SRx+jWQ=;
	b=U5zD0t6yyoDVj2wrkBtCtkdTtEOxc+En4sHh8X0MHk29Hyyr983GEPw/4a6kvFlYzM
	2xyY7mJweCHFUgSCFyBBqv3WOccVF97Im2tGuW+AtQ6cOzplFET1UZi6uOHz3rRjiLc5
	/noqJrmbOFm9nFGsu7gqQ1IQarEZDuXrYAmBF5PrO/UAjRwzSwZxO+NJoV0Nat8JmwwH
	Ls4TGsachYtNAlCIzyz0b2hY0eXK8U58Xr53gM9En/x5DwW7V36m1Mw/7Df+Edxw7T4f
	umiDfHfGRlU5E171CWC9YlJ0j37FhSwzRrj6y12BI8KZlw6TYxVMtECAfMdh1CRCNOzs
	ZY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance:disposition-notification-to;
	bh=SJDQGdAHFBFSq5dmzm58xSGa4v4HU7OJNW36SRx+jWQ=;
	b=FzNa8pKEbDjL0pwSF8UjQrahI3f1czu2UaWMwTrTF6OKaCnKxtf2DegrGsclmCWZ9y
	bUpv187OzFLD3selAV1QfOcUz3nTfIGR3ihdW0g7JLaeSIcnIKDFXNJustk/8S3huIEi
	sGVe9no/c7qG9olyfWJ/HSiAC+SoLDy2aLKe1hKCkz9L4fT+Z/3RkoyvZBcTYObs3WGE
	4zYruZLEBdDobIvW1/MXTKFUXti3I7inz4jkaF2IWpZev2JAWz2cwi8n/q9/qgEGX7oK
	9CBTk22wepEhWWvAlBGvFPlS+Djj01eDDUlKhLtNJ+BhHkzialtclTx2TqX1mGfSpW4l
	PKrg==
X-Gm-Message-State: AG10YOQ/OMWLEpDJ4jC/ytCYkqnfZLLBuMK7zPBhHmQPM89ruSk4KoErbP2B3aATT/+J6A==
X-Received: by 10.66.252.73 with SMTP id zq9mr35028504pac.16.1456113094578;
	Sun, 21 Feb 2016 19:51:34 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	q85sm32648721pfq.81.2016.02.21.19.51.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Feb 2016 19:51:33 -0800 (PST)
Message-ID: <6C4376326F0F421EA23035B83CCA8B9F@RD3>
From: <winiston@futuraautomation.com>
To: "Khem Raj" <raj.khem@gmail.com>
References: <5174C2003D56485DACF46FA90CEFE553@RD3>
	<CAMKF1srxScqs8C6xDyKSiU06WN00g_BJuijOz3SA3ugqNE1i_A@mail.gmail.com>
In-Reply-To: <CAMKF1srxScqs8C6xDyKSiU06WN00g_BJuijOz3SA3ugqNE1i_A@mail.gmail.com>
Date: Mon, 22 Feb 2016 09:25:17 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: Error building core-image-sato
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
X-List-Received-Date: Mon, 22 Feb 2016 03:51:34 -0000
Content-Type: text/plain; format=flowed; charset="utf-8"; reply-type=original
Content-Transfer-Encoding: 7bit

Dear,

Yes, I added meta-ti layer in the bblayers.conf  which is reside in 
/home/winiston/meta-ti  and I used hob to create the image.  My 
bblayers.conf contents as given below.

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

#BBLAYERS ?= " \
#  /home/winiston/poky/meta \
#  /home/winiston/poky/meta-yocto \
#  /home/winiston/meta-ti \
#  "
BBLAYERS_NON_REMOVABLE ?= " \
  /home/winiston/poky/meta \
  /home/winiston/poky/meta-yocto \
  "
#added by hob
BBFILES += "${TOPDIR}/recipes/images/custom/*.bb"
#added by hob
BBFILES += "${TOPDIR}/recipes/images/*.bb"

#added by hob
BBLAYERS = "/home/winiston/poky/meta /home/winiston/poky/meta-yocto 
/home/winiston/meta-ti"


What could be the problem?

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Khem Raj
Sent: Monday, February 22, 2016 7:38 AM
To: winiston@futuraautomation.com
Cc: OpenEmbedded core
Subject: Re: [OE-core] Error building core-image-sato

On Wed, Feb 17, 2016 at 9:02 PM,  <winiston@futuraautomation.com> wrote:
> Dear,
>
> I tried to build core-image-sato. It spits out the following error.
>
> winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-sato
> Parsing recipes: 100% |###############################| ETA:  00:00:00
> Parsing of 1060 .bb files complete (0 cached, 1060 parsed). 1496 targets,
> 138 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but
> /home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'xf86-input-tslib' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['xf86-input-tslib']
> NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-core-x11-xserver', 'xf86-input-tslib']
> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: 
> ['packagegroup-core-x11-base',
> 'packagegroup-core-x11-xserver', 'xf86-input-tslib']
> ERROR: Required build target 'core-image-sato' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-sato',
> 'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver',
> 'xf86-input-tslib']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code.
> winiston@winiston-VirtualBox:~/poky/build$
>
> How do I resolve this error?

whats the content of your bblayers.conf, do you have some
modifications to default configuration ?

>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


