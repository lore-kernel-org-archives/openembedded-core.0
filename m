Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3CA71E19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 18:56:22 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id p9so8108046vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 10:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Q+Fa9oFKB0HDg01u6PmvFuy0x0WdykNIyXUDKOQiIgQ=;
	b=pC+x+YQObdWYl7etic/lJZgyLYOnlzyj/91uvoZwXbJKQw4si7hNT7f1xT3uIl8zAz
	WV0K/UTT/+RLg8IUuf5G11dlCowdpLhhotequ/ta0wqRVvH3+Yk8LjyT0ay2dWNJB9ib
	H558NDB2ENouYjnq2cx/XX5D+2mQVcTApRIMc3Nr9f1SN+IVXvLxKu2UKqgNlQ1cWKNE
	GjIImteyIT1Niv/D14rulJds2wGizkttUq0W91kQf0Gl1j9MTZ4z9Qx/RD9Fro7Ke81d
	QM1iUoCsKNrAxbuisDJnLpt621PwsnaRO3e/gLb6J2O3ymK7p/aCXnTxDa8T/zTXqlXd
	fHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Q+Fa9oFKB0HDg01u6PmvFuy0x0WdykNIyXUDKOQiIgQ=;
	b=nECuT6BFhMSCR80gHOVR+1HL9kH+5FQFdWq0kGgJirO1aoIEh048kogV0w823sIfTm
	pAk3KpDHg0ytBPBu0OC1iIeJQr3UD1OdPUQGQRQEzo+7hzF/Dl1c2i7uO7vbZgaHLkEY
	pQ7WWemhbJmZZOyp7Hf1VreBKxzM5M/gw9tn0qzSSZYWWcyHpwkYO4Jkl5A5Tkw4eRZc
	sRZcd6j8vSPxDgVdbDp5kHNn2sRaHbtqWhMtAPE4vHsF2VWL/r7icU57TyeYWM8TfPdh
	ecG+Zr/uKCNlBOYBCYYXC/SEM+fqAfm2anp+iIrvgkB79enCwDKe0x1cAut0UHCqlv3Q
	/6gg==
X-Gm-Message-State: AKaTC000zqHjRBodYQuW2fN37gha/kWjhCX2kEWgqY4juCT1X0DdKUAz1o+vMhOiAOSaYKNAEylrbZcPP4B0MA==
X-Received: by 10.31.50.14 with SMTP id y14mr25732973vky.29.1481655383528;
	Tue, 13 Dec 2016 10:56:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 13 Dec 2016 10:56:23 -0800 (PST)
In-Reply-To: <CAMKF1srCbFH5g2-RgJyYBqwH12U6zuCSrF7z-sPVqQkGUYQFiQ@mail.gmail.com>
References: <1481620141-4369-1-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1srCbFH5g2-RgJyYBqwH12U6zuCSrF7z-sPVqQkGUYQFiQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 13 Dec 2016 19:56:23 +0100
Message-ID: <CALbNGRR20dSAjp_aeCOeYOUyiCmt9u5iu6ot_0ejB7CWZHKOnQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: move to tip of Emmanuele Bassi's fork
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
X-List-Received-Date: Tue, 13 Dec 2016 18:56:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 6:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Dec 13, 2016 at 1:09 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> * fixes starting of kde-plasma for wayland:
>>   | No provider of glGenFramebuffers found.  Requires one of:
>>   |     Desktop OpenGL 3.0
>>   |     GL extension "GL_ARB_framebuffer_object"
>>   |     OpenGL ES 2.0
>>   |     GL extension "GL_EXT_framebuffer_object"
>>   | /usr/bin/startplasmacompositor: line 223:   787 Aborted             =
    (core dumped) /usr/bin/kwin_wayland --xwayland --libinput --exit-with-s=
ession=3D/usr/libexec/startplasma
>> * fixes some strange behavour on kde-plasma for x11: Black screen on log=
out /
>>   Lock screen does not return.
>> * Eric Anholt seems to have passed maintainership of libepoxy over to
>>   Yaron Cohen-Tal. I agree that things didn't really turn out well since=
 then [1].
>> * 0001-select-platforms-based-on-configuration-results.patch and
>>   0002-add-an-option-to-disable-glx-support.patch wre replaced by
>>   0001-make-x11-support-optional.patch
>>
>> [1] https://github.com/ebassi/libepoxy/commit/8dead45cb366bf5c08539bef2c=
caa36b80eb1483
>
> Why do we change to a different fork ? perhaps its worth mentioning in co=
mmit
Just for the record I mentioned it and if you would have followed the
link you would know.

I agree to Ross: let's wait what happens with libepoxy. I keep this
patch in my tree because from meta-qt5-extra perspective this patch
fixes many many strange issues.

Andreas

