Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 663A3606B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 22:04:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u65so7138924wmu.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ckT2XsWoh+4oPhzcWfTA9Xhvblx3gHdO+qxRwFBlJos=;
	b=EAu3yGkQJAwN/wv2RvQqvmQ7IMFNMqNQU6sixdHzKki2cP4/OHigkRmGQ6WQkkIifc
	Qj1eTEqim0ErX5blbSiv+BDeXAojb3l+ljckfcOCD7+KGdLXaDso05VLuck4fOt5kGWN
	BI3ZF1BcpEnVgfcylkz7iv0LIgpI3hubVDFoWvC0m630LWwptFnPZd8yxk/h4d5uyhcp
	r7lVssyFJWQ1LOYcaEgr+RJ4lYxlGOwgEZ1l0+HYUVSYArgnZow6Q7ZB80BiUsN9jws0
	VRsXAZKtVFjJ1maTIRtPpdJJ553K4oKkaTu90wRPvU9VsARkjw7XZP+tUiRO6tJI8VuM
	uz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ckT2XsWoh+4oPhzcWfTA9Xhvblx3gHdO+qxRwFBlJos=;
	b=tHRi5lRm7bL/LaL8kBVQDJWvurkdJ98b0QdBNQnTzeL3X/ngIfO9HGUtU+WMEafiIY
	tgr6prGY4EGNQF3T6cW/7E/GDytNWG2suxRIofxupUnRsTCoCeQvv5HRBOssLInpO/9M
	cRYMujJAuuOiWm8GufiJH9wSv5F7iqbID+pwp0uIpxqIvKqd8jBUYllCbvnv0h6XITmI
	sThItXUkTAdYrwfK0+ZjdcA8WMc3Acc/Qr9vBxgW2oJytwwOvwiOzL/9nBKn///bJJvE
	h0QZaO4GgeDIr1UtQdSF69VtQSOhhV0eCrKeCcf+yYsrnpx5UjHbMDILBKSFkBxOLUau
	Ilyg==
X-Gm-Message-State: AN3rC/5FxK4qErotFgmAoFyLEIXrW6D3uZJ9Uvhd0yUR4LI2kZLqOX2U
	oEBcGKMhO1CKAR3t5f7fcImV34isUQ==
X-Received: by 10.28.31.200 with SMTP id f191mr551849wmf.63.1492812274552;
	Fri, 21 Apr 2017 15:04:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.196 with HTTP; Fri, 21 Apr 2017 15:04:34 -0700 (PDT)
In-Reply-To: <20170421144817.66c189b6@t510.zcs.saftware.de>
References: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
	<CAAQYJAs_8am0azk+0_3MNvwrNU6WiX2_5HgH0ouwWdyK6F8rAA@mail.gmail.com>
	<20170421133034.59e68228@t510.zcs.saftware.de>
	<CAKRNOGyKJ5_W5Ws0Q7E2Nm9d8SV6bTZzXac2K6uEexE7567UjA@mail.gmail.com>
	<20170421144817.66c189b6@t510.zcs.saftware.de>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 22 Apr 2017 00:04:34 +0200
Message-ID: <CAAQYJAuZtXMhZ4FniXEkLXJK8-ZT6RRs-AYTJXtu6L5jPC_TwQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Fri, 21 Apr 2017 22:04:34 -0000
Content-Type: multipart/alternative; boundary=001a114b2e80575222054db471e5

--001a114b2e80575222054db471e5
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 2:48 PM, Andreas Oberritter <obi@opendreambox.org>
wrote:
> On Fri, 21 Apr 2017 14:37:36 +0200
> David Vincent <freesilicon@gmail.com> wrote:
>
>> On 2017-04-21 13:30 GMT+02:00 Andreas Oberritter <obi@opendreambox.org>:
>> > On Fri, 21 Apr 2017 13:02:51 +0200
>> > Andrea Adami <andrea.adami@gmail.com> wrote:
>> >
>> >> On Fri, Apr 21, 2017 at 12:39 PM, Andreas Oberritter
>> >> <obi@opendreambox.org> wrote:
>> >> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
>> >> >
>> >> > It broke dpkg's update-alternatives, which requires absolute paths.
>> >>
>> >> This is really uncommon.
>> >
>> > Actually it's not. Try it on any Debian or Ubuntu system.
>> >
>> >> I had already expressed my negative opinion about absolute paths for
kernel [1].
>> >> Personally, I had to patch the bootloader (kexecboot).
>>
>> Same here, that's why I submitted it in the first place. Didn't
>> thought that would break dpkg...
>>
>> >>
>> >> So please try some workaround instead of changing it back.
>> >
>> > Well, there's no workaround. Other than opkg's update-alternatives,
dpkg's maintains
>> > an alternatives database in /etc/alternatives, so the symlink is going
to point to
>> > an absolute path outside of /boot anyway.
>>
>> The problem is that, for bootloaders, it is not always possible to
>> mount the rootfs. So, it must only rely on information in the boot
>> partition that can be mounted anywhere.
>
> I understand the problem the patch tried to address.
>
> Those bootloaders don't find the kernel by chance. The name of the image
> is usually set in the environment. You can update the environment in
postinst-
> scripts or just change the name of the kernel image to match the
bootloader's
> expectations, just to name some alternatives.
>
>> >
>> > To fix your problem, kernel.bbclass should be changed to not use
update-alternatives
>> > at all. But it's definitely wrong to break the original u-a by using
invalid command-
>> > line arguments.
>> >
>>
>> And reverting this patch breaks boot for those who rely on a relative
>> symlink ; that is also wrong.
>
> Yes. However, I'd argue that a regression is worse than a problem that
> persisted for years.

We lived for years with the relative symlink.

Then  78ee4d8  broke the bootloaders in 2014
Finally it was reverted end 2016 and now it is under review again...ouch

What broke what?

My point is, while I had the sources and could modify and reflash the
bootloader, the same is not valid for many people.

Anyway, I have found out that there was a workaround to allow boot from NFS:

+ROOTFS_POSTPROCESS_COMMAND += "make_zimage_symlink_relative;"

Cheers
Andrea

--001a114b2e80575222054db471e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Apr 21, 2017 at 2:48 PM, Andreas Oberritte=
r &lt;<a href=3D"mailto:obi@opendreambox.org">obi@opendreambox.org</a>&gt; =
wrote:<br>&gt; On Fri, 21 Apr 2017 14:37:36 +0200<br>&gt; David Vincent &lt=
;<a href=3D"mailto:freesilicon@gmail.com">freesilicon@gmail.com</a>&gt; wro=
te:<br>&gt;<br>&gt;&gt; On 2017-04-21 13:30 GMT+02:00 Andreas Oberritter &l=
t;<a href=3D"mailto:obi@opendreambox.org">obi@opendreambox.org</a>&gt;:<br>=
&gt;&gt; &gt; On Fri, 21 Apr 2017 13:02:51 +0200<br>&gt;&gt; &gt; Andrea Ad=
ami &lt;<a href=3D"mailto:andrea.adami@gmail.com">andrea.adami@gmail.com</a=
>&gt; wrote:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;&gt; On Fri, Apr 21, 2017 at =
12:39 PM, Andreas Oberritter<br>&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:obi=
@opendreambox.org">obi@opendreambox.org</a>&gt; wrote:<br>&gt;&gt; &gt;&gt;=
 &gt; This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.<br>&gt;=
&gt; &gt;&gt; &gt;<br>&gt;&gt; &gt;&gt; &gt; It broke dpkg&#39;s update-alt=
ernatives, which requires absolute paths.<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; =
&gt;&gt; This is really uncommon.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Actuall=
y it&#39;s not. Try it on any Debian or Ubuntu system.<br>&gt;&gt; &gt;<br>=
&gt;&gt; &gt;&gt; I had already expressed my negative opinion about absolut=
e paths for kernel [1].<br>&gt;&gt; &gt;&gt; Personally, I had to patch the=
 bootloader (kexecboot).<br>&gt;&gt;<br>&gt;&gt; Same here, that&#39;s why =
I submitted it in the first place. Didn&#39;t<br>&gt;&gt; thought that woul=
d break dpkg...<br>&gt;&gt;<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; So pl=
ease try some workaround instead of changing it back.<br>&gt;&gt; &gt;<br>&=
gt;&gt; &gt; Well, there&#39;s no workaround. Other than opkg&#39;s update-=
alternatives, dpkg&#39;s maintains<br>&gt;&gt; &gt; an alternatives databas=
e in /etc/alternatives, so the symlink is going to point to<br>&gt;&gt; &gt=
; an absolute path outside of /boot anyway.<br>&gt;&gt;<br>&gt;&gt; The pro=
blem is that, for bootloaders, it is not always possible to<br>&gt;&gt; mou=
nt the rootfs. So, it must only rely on information in the boot<br>&gt;&gt;=
 partition that can be mounted anywhere.<br>&gt;<br>&gt; I understand the p=
roblem the patch tried to address.<br>&gt;<br>&gt; Those bootloaders don&#3=
9;t find the kernel by chance. The name of the image<br>&gt; is usually set=
 in the environment. You can update the environment in postinst-<br>&gt; sc=
ripts or just change the name of the kernel image to match the bootloader&#=
39;s<br>&gt; expectations, just to name some alternatives.<br>&gt;<br>&gt;&=
gt; &gt;<br>&gt;&gt; &gt; To fix your problem, kernel.bbclass should be cha=
nged to not use update-alternatives<br>&gt;&gt; &gt; at all. But it&#39;s d=
efinitely wrong to break the original u-a by using invalid command-<br>&gt;=
&gt; &gt; line arguments.<br>&gt;&gt; &gt;<br>&gt;&gt;<br>&gt;&gt; And reve=
rting this patch breaks boot for those who rely on a relative<br>&gt;&gt; s=
ymlink ; that is also wrong.<br>&gt;<br>&gt; Yes. However, I&#39;d argue th=
at a regression is worse than a problem that<br>&gt; persisted for years.<b=
r><br>We lived for years with the relative symlink.<br><br>Then =C2=A078ee4=
d8 =C2=A0broke the bootloaders in 2014<br>Finally it was reverted end 2016 =
and now it is under review again...ouch<br><br>What broke what?<br><br>My p=
oint is, while I had the sources and could modify and reflash the bootloade=
r, the same is not valid for many people.<br><br>Anyway, I have found out t=
hat there was a workaround to allow boot from NFS:<br><br>+ROOTFS_POSTPROCE=
SS_COMMAND +=3D &quot;make_zimage_symlink_relative;&quot;<br><br>Cheers<br>=
Andrea<br><br></div>

--001a114b2e80575222054db471e5--
