Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFD5A60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 21:05:49 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e185so24444913vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=ZEVEmbnl8VJ/AvvALYAvgRP4OYYe2vAS03gnCWDql+A=;
	b=oLT8RXs3veQ1TRnhgvjGmdnWJKA6Mlq+m5/Ky7BphRJBlz/tCKAzm5V/ajm0Swpzdf
	tnWPyqHavFYMnqAIO1e4Ruhf/Rf87J+64w7V9nMysXZqwAMo+/pwEuWQzUZBwCPsIJkH
	sBuDD7HAWJ+jQvW1f2vu5g9FzoGFj6CmKrJRUoxrpqFEtUuuZL/1UnZ/7teUT6/x7q/Q
	JBWIbHYduvLkcqwSzr8oMnatiEBDCXwWpit5XdXxwDoM+KFbQd34XeSFfBN/UimmHLzM
	DcDTPaRxxqv9SsFw8KWAUJblm6NXn7Y+10Gh+J5XsSJl4pvpMJZ66xHLtWxXs/29kZlu
	hNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=ZEVEmbnl8VJ/AvvALYAvgRP4OYYe2vAS03gnCWDql+A=;
	b=DBqm/fjNjzn0DmQq/KhOoAgHHPD8RMEIKpLJ1OQ3kNrNdLSmkHY4SREyTQM/3CH9lQ
	28OtHzDfRBei/NkWwCbOgozX+1KekRIZHZ3SykVJKoxYTyg0UOY++y45VjRQ4Hw4cN7C
	iiZpJTI3fanWtwHJxaQ/vNIGzYk8zZnLifiDCXvxP99CTkabJv1EA0ReuwaeEJ5UslTV
	rZboCORd4mKN26H0iy5Q+A5t6TJAnYUNePqBdM9//DkEqjSwEnPQbAv042QR438oefAR
	wNxogVzy60Wn52ReDQj6LOtLYZffT9gGvzlp+3veQwIdeb7My77yplJumCxxfBLdmtBx
	9mXw==
X-Gm-Message-State: AOPr4FUSt5zQqzzZZh7DjMo+M7BOy16LvgVnxBXheEYEQlSa4Jv9tv2f6JQW8emA8bYAsFA1JA4lxUE/jNAtGA==
MIME-Version: 1.0
X-Received: by 10.176.64.167 with SMTP id i36mr20113504uad.120.1461013549799; 
	Mon, 18 Apr 2016 14:05:49 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 14:05:49 -0700 (PDT)
In-Reply-To: <57152C67.1030508@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<57152C67.1030508@windriver.com>
Date: Mon, 18 Apr 2016 23:05:49 +0200
Message-ID: <CALbNGRRE5nxvd8-bCvGbhvTyt2qGpnurnyDdv+C=gz7SaWP9Hg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 21:05:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 8:50 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 4/18/16 9:16 AM, Andreas M=C3=BCller wrote:
>> On Mon, Apr 18, 2016 at 3:55 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>>
>>> On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>>
>>>> If sysroot is required, override DEBUG_FLAGS to remove -fdebug-prefix-=
map
>>>
>>>
>>> We should probably get this in the release notes, as many people do ind=
eed
>>> want remote debug to work.
>>>
>>> Can you tell gdb the base path to use when looking for symbols?  I've n=
ot
>>> done remote GDB for some time but wouldn't "set substitute-path /
>>> //my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?
>>>
>>> If gdb can't be told then instead of having to replace all of DEBUG_FLA=
GS it
>>> would be neat if the prefix mapping variables where in another variable=
 that
>>> could just be unset.
>>>
>>> Ross
>> OK I think I could live with removing -fdebug-prefix-map for now.
>>
>> A thought: We have the setting IMAGE_GEN_DEBUGFS - I have not yet
>> tested. As far as I understand it creates an unstripped sysroot and
>> does not affect target rootfs - is that correct? Does the sysroot
>> created by IMAGE_GEN_DEBUGFS contain the sources? If yes we could set
>> that as sysroot for gdb.
>>
>> I think one of the problems we have here is that there is no reference
>> way documented (or it is outdated) how remote debugging is meant to be
>> performed.
>
> Remote debugging is setup to always assume the remote side has access to =
a
> debugable sysroot.
Just that I get this right: remote =3D target? If yes: Where do you get
this from? Or - have you ever run a remote session with files taken
from target? I have: see caffeine/colleagues section below.
> This isn't the project's sysroot, since that is transient,
> but a REAL matching sysroot to the main image.
If you say transient: Do you mean status of last build. Isn't that
what I am usually looking for when debugging?
>
> The easiest way to do this is to add the following to your local.conf:
>    IMAGE_GEN_DEBUGFS =3D '1'
This exactly what I've asked for in my previous mail - further comments bel=
ow.
>
> After this, look in your deploy directory and you will see the image to d=
eploy
> to the target, and also a matching 'debug' chunk that you keep on your lo=
cal
> host.  This way you -know- they are always in sync.
You really want me to wait for building an full image after each
modification - I will either die for caffeine overdose or my
colleagues will kill me...
>
> There is class material from the various Yocto Project Dev Day classes on=
 using
> this.
>
>
> The alternative is tell GDB itself to map directories.  I don't remember =
offhand
> the right option, but GDB supports remapping a directory reference to an =
actual
> directory.  It should be pretty simple to re-map it -- but due to the tra=
nsient
> nature of the sysroot directory in the build, I don't recommend doing it =
this way.
>
We are using remote debugging with build sysroot almost daily and we
do that since we use openembedded. The more I learn here it seems
nobody else does remote debugging. How do you fix bugs?

I'll remove -fdebug-prefix-map and wait till remote debugging breaks
again - maybe then completely. That scares me as I am loosing the
possiblity to start a remote debug session on an productive image
within seconds.

Andreas

