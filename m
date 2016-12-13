Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 18E1571DE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 19:30:09 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x186so8290148vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ALnUy21nHr7gSb+7VodiqBmmE8UBl0F2rnj0IJfLmt4=;
	b=Fgsy4FcN9LzJhadOYonG5IvnY5HtDpsFJK84ywESH/zTojcBycmrhpiZUFtSt8bl0u
	jhk8SlwqxzGl0CwmBBN/gwT2y4exQ9VFdCVUD2q3FbQZSpi1wGuVjbtjagbV+iKxpSnK
	egmFamBnYdD3fKCp+3Fg+GabJMyX0RVSyBql70/W6Wvpk6yElrcFww7C6piBDWACrbCe
	CofspiG6UArTqKv/3bPX4IK+sLrlzWPR/mjcCpoDQckGvaQEWZtCvkpF1PsKGOhq1Ntu
	IR1+Fr4mEz64BcEamtdT4gIUmKV6+wbPzwaAibGjq6nrIqW0iaScD8n+IHRQ2QJVtHzQ
	B+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ALnUy21nHr7gSb+7VodiqBmmE8UBl0F2rnj0IJfLmt4=;
	b=nGKnAXAco5CgqsFauC7kLQ1h5uQ3IZjl96Zvgp3JGo+g9DUTcuO6nLHkEkKG+IJyC7
	wDdfF1cbw0wAlEafes7X6lcE2gPjlHHnFSlQ5RP97UXxMMHP5gcJhSyYcsRaT81iUf4j
	irHe4q+BTGon8Qj9kf/Nt/KCJyiZc5DUmnUaYLZn8fncvnOxoRJKHKmCDBC5532+tM7E
	G5vNolV4MPB1XVPOMR4JAI03ycATU3sy57Gh88p7BFaexcclBf6JvYZKF4aEQZbhPv1I
	TIU6FNn7tiiWfh0wnsWOMEBJWSvHSq/vgchxcNm11MNb26N7f9eOf4Vt+XMW1zWNHB2C
	8isg==
X-Gm-Message-State: AKaTC01c3GVTYgoF/7rEiiiYS4tMLBmScJX8ogVS8oI/uYoPt79tZIgba+alHc86ktYEbMMHejt8Zz0IHJhBuQ==
X-Received: by 10.31.197.195 with SMTP id v186mr41803724vkf.84.1481657410897; 
	Tue, 13 Dec 2016 11:30:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 13 Dec 2016 11:29:40 -0800 (PST)
In-Reply-To: <CALbNGRR20dSAjp_aeCOeYOUyiCmt9u5iu6ot_0ejB7CWZHKOnQ@mail.gmail.com>
References: <1481620141-4369-1-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1srCbFH5g2-RgJyYBqwH12U6zuCSrF7z-sPVqQkGUYQFiQ@mail.gmail.com>
	<CALbNGRR20dSAjp_aeCOeYOUyiCmt9u5iu6ot_0ejB7CWZHKOnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2016 11:29:40 -0800
Message-ID: <CAMKF1so7M_W=LeLmz3ApWw=G3ryMZ3rbMdL+8Z2ZAvaAyd5Rww@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 13 Dec 2016 19:30:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 10:56 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Dec 13, 2016 at 6:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Dec 13, 2016 at 1:09 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> * fixes starting of kde-plasma for wayland:
>>>   | No provider of glGenFramebuffers found.  Requires one of:
>>>   |     Desktop OpenGL 3.0
>>>   |     GL extension "GL_ARB_framebuffer_object"
>>>   |     OpenGL ES 2.0
>>>   |     GL extension "GL_EXT_framebuffer_object"
>>>   | /usr/bin/startplasmacompositor: line 223:   787 Aborted            =
     (core dumped) /usr/bin/kwin_wayland --xwayland --libinput --exit-with-=
session=3D/usr/libexec/startplasma
>>> * fixes some strange behavour on kde-plasma for x11: Black screen on lo=
gout /
>>>   Lock screen does not return.
>>> * Eric Anholt seems to have passed maintainership of libepoxy over to
>>>   Yaron Cohen-Tal. I agree that things didn't really turn out well sinc=
e then [1].
>>> * 0001-select-platforms-based-on-configuration-results.patch and
>>>   0002-add-an-option-to-disable-glx-support.patch wre replaced by
>>>   0001-make-x11-support-optional.patch
>>>
>>> [1] https://github.com/ebassi/libepoxy/commit/8dead45cb366bf5c08539bef2=
ccaa36b80eb1483
>>
>> Why do we change to a different fork ? perhaps its worth mentioning in c=
ommit
> Just for the record I mentioned it and if you would have followed the
> link you would know.
>

Thanks.

> I agree to Ross: let's wait what happens with libepoxy. I keep this
> patch in my tree because from meta-qt5-extra perspective this patch
> fixes many many strange issues.
>

It would be acceptable perhaps if you can send relevant patches on top
of upsteam libepoxy.

> Andreas

