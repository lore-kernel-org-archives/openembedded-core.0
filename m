Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A9A8260C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:15:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w15so8290039qkf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/V1mMa8DCqeR0n/GYudRIx/WYSoc5ssDNKLpe/BJhuI=;
	b=JK9h1KmZxkgxNVU1fTNTuKYDOdXzhiwRZeDFHZzTpbm/e1g+W6YC11AIz8/1sINK8b
	DFWhuc+RPNgFkQvE3XC4Ep0IFdc0YUbpBqhF/dWwCzgbCYC/JvRACspUDRERKQfEesww
	uIxFcQhAWacCN1fXIM8WZCMuHfNPiR8Bv7mcrwpH2BTaJ18ygUTszPxeKburZU3RKpUz
	LhDSfeOkzKykIOc5uGO+eAoy5N78CwQcCDM4xWBoupQ4iQ0WT9B8UpYFy1SpurW0vGDv
	I7oga2jkUZH6pR1YMzR00MT3LjJNeF2cdVqtFPI+CfuUob+j4F69XXKX4wePAHZam6nN
	3QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/V1mMa8DCqeR0n/GYudRIx/WYSoc5ssDNKLpe/BJhuI=;
	b=C33yuoatD0E07xxRPV7MuERiR/AGf1ReSATcvw+Gjk1HdA2snqzXeCagUNDWErShoA
	xNzN9bUNum4XQW3eYTxXgNeuQmQRX7L0NxY7G8eGO5UMCHLcDeLdtAV2QyM9bk+sRyx5
	jps9mOGFN3MwZ4Rqh0j2LYUUx4VsmoL+7RIiJ+U/KIg4DBgZZu4shEyoXjRsfvz9Kqg+
	n+g8tc5S82Gk61O4WlF4TUPsuDkP8KB0SB1B+IQLJrPqU1SSdxa5rOQX+BmYT4lBJ0yt
	pThWgosJ3QTWZK85mrfpgrSunhFI8/mklKam01Js1V6yws+/2UlteIGpDJ4+O4/9vkKL
	S07A==
X-Gm-Message-State: APjAAAUuEr0IF1p3TkJ1O0zver23k7er0PKJ2Z4QajGOSPEBZS0c/tnU
	MGKfrTIAl4g+wFNmjs4B+YEJmfudSBKxe2QWFjk=
X-Google-Smtp-Source: APXvYqwMQMZzUZ+k3oPGvvpyme8zXkJTL98F3ilnpkDbwGm4l2HCWUwSGbH2n7o2tii3uT50LeU+mG6rsHEFVCsifcQ=
X-Received: by 2002:a37:de05:: with SMTP id h5mr1259635qkj.474.1581664503210; 
	Thu, 13 Feb 2020 23:15:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
	<CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
	<CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
	<CANNYZj-7Aidoy4Y6P7ZzXNuGtUCcKddF4B3oeBMrcmmNAceDtQ@mail.gmail.com>
In-Reply-To: <CANNYZj-7Aidoy4Y6P7ZzXNuGtUCcKddF4B3oeBMrcmmNAceDtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 23:14:36 -0800
Message-ID: <CAMKF1soWY20D8HwCEQK8pTsxcR8Bxc7y3aE2mnx2_XdFVJW4Og@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Fri, 14 Feb 2020 07:15:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 11:05 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 14 Feb 2020 at 02:40, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> autobuilder runs poky, to reproduce this you will need to use
>> oe-core+bitbake checkout
>>
>> and then for qemux86-64
>>
>> bitbake -ctestimage core-image-sato-sdk-ptest
>
>
> If I set up a nodistro build, ptest packages are no longer available and build doesn't start:
>
> akanavin@ubuntu1804-ty:~/poky/build-nodistro$ bitbake core-image-sato-sdk-ptest
> ...
> ERROR: Nothing RPROVIDES 'acl-ptest' (but /home/akanavin/poky/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb RDEPENDS on or otherwise requires it)
>
local.conf I have

DISTRO_FEATURES_append = " largefile opengl ptest multiarch wayland pam polkit "
IMAGE_CLASSES += "testimage testsdk"

> Can you share the config (local.conf) I need to use? Or maybe you can show the failure you're getting. The tests should be skipped if /var/lib/rpm is absent on the target image, so I would like to find out why it is there (presumably).
>
>>
>> it might also work in poky setup if you remove
>> PACKAGE_CLASSES ?= "package_rpm"
>> from local.conf
>
>
> That's what the autobuilder test does, and then it passes, so I don't think this will help.
>
> Alex

