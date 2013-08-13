Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id D579B6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:40:38 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so8264135pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=il+aChhh9673HX+KB4zwrcSc/oUAbTzCm7ZD0JNMOAI=;
	b=Mqpkip2KJ/D7HhF7S3+sn8XzwX5st3n83U0c1Zg/hNLLmyXJQlRjh+TbGlXQioAdri
	rboh2o9KrBG5zdBeUl7bmQB9X1kuWjS8g0p3FsGOLBlHBa1ikN1t9XfzMif/8XH/6FHj
	G13N95jrviuyXYhOIIOnnBTa1NIwj48ki7AnLcxIby8nJpB0N8OtbSQ4Tqcm+IDAr8m8
	wJOZWoKRRLa8sNoRfXQivOdkFYrdP/7XbI4NHG7OUHrFucLrBU1mm/gkPSLRO9zcd4CM
	hLgzZnb/93gKu3FlWLMKiXBmrXhHMbeVYvo0JeDEP7Qif/jA7KCQHVg+ldwng6mvvxux
	Si0Q==
X-Gm-Message-State: ALoCoQlO7IkICEn8YiKjlMBZgyEs723aTv32wIyzQLux4Ehoww3ZX+Q9qgM7MmJWBT+vR0+BhL7P
MIME-Version: 1.0
X-Received: by 10.68.101.194 with SMTP id fi2mr5668519pbb.109.1376415639863;
	Tue, 13 Aug 2013 10:40:39 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 10:40:39 -0700 (PDT)
In-Reply-To: <520A6DDC.5060609@windriver.com>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
	<CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
	<CAOMwXhNFwVwt4G_v-SMMph=J3zvv=Z6Jh=LvEKZGVO=_zpChrg@mail.gmail.com>
	<520A6DDC.5060609@windriver.com>
Date: Tue, 13 Aug 2013 18:40:39 +0100
X-Google-Sender-Auth: 1Qz8mkRNKsrN3_EGOrev2PIXwAI
Message-ID: <CAOMwXhMnojFEXBG0H02CH4B7DTMiFQeJMOt9bvuGbCjWmh-2NA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:40:38 -0000
Content-Type: multipart/alternative; boundary=047d7b86f572471dba04e3d7bd21

--047d7b86f572471dba04e3d7bd21
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 13, 2013 at 6:33 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 8/13/13 12:23 PM, Laszlo Papp wrote:
>
>> s/which files/which lines/
>>
>
> The kernel configuration mechanism has a tool that will combine the
> original configuration, and any listed configuration fragments (.cfg
> files).  It will combine these, and then filter them in such a way that
> last-in wins.
>
> See the Yocto Project Linux Kernel Development manual, section 2.2.3:
>
> http://www.yoctoproject.org/**docs/current/kernel-dev/**
> kernel-dev.html#changing-the-**configuration<http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration>


Could you please clarify how that is related to my question? What I wanna
understand is: I set something in the config as I wish, and then the
bitbake file is getting chopped respectively like with "ifdef/elif" etc in
C/C++, but this time inside the python script defined in the bitbake file.

I am well aware of that you can customize the defconfig, but my question
was about the python function.

--047d7b86f572471dba04e3d7bd21
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Aug 13, 2013 at 6:33 PM, Mark Hatle <span dir=3D"l=
tr">&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.=
hatle@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 8/13/13 12:23 PM, Laszlo Papp wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
s/which files/which lines/<br>
</blockquote>
<br>
The kernel configuration mechanism has a tool that will combine the origina=
l configuration, and any listed configuration fragments (.cfg files). =A0It=
 will combine these, and then filter them in such a way that last-in wins.<=
br>

<br>
See the Yocto Project Linux Kernel Development manual, section 2.2.3:<br>
<br>
<a href=3D"http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.h=
tml#changing-the-configuration" target=3D"_blank">http://www.yoctoproject.o=
rg/<u></u>docs/current/kernel-dev/<u></u>kernel-dev.html#changing-the-<u></=
u>configuration</a></blockquote>
<div><br></div><div>Could you please clarify how that is related to my ques=
tion? What I wanna understand is: I set something in the config as I wish, =
and then the bitbake file is getting chopped respectively like with &quot;i=
fdef/elif&quot; etc in C/C++, but this time inside the python script define=
d in the bitbake file.</div>
<div><br></div><div>I am well aware of that you can customize the defconfig=
, but my question was about the python function.</div></div></div></div>

--047d7b86f572471dba04e3d7bd21--
