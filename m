Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6A16018C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:22:45 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id u110so8869398qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=MmDFv3/kHVSptcQTjzB5EqnZLXGpQAOVPXWJ70mJt4Q=;
	b=qObCw14Zz5A2S35MTdfBBaoS2UY2NffwV/9J53v01L+a6TCxVBbyQL7v09fXuZNzFh
	j/kIaPX3Agx6yTY09R4dLqy0FMAhmq1SUU8zPQ4qJk2mvVZKrXQh0IKW9rCXiPWS79on
	UKVT/hg58zav+Id1JWTkM/KuQp6C7P0wYcTW61nQTK4ejAj0v4ECtNT/pdaP/FOZNsHW
	x0Zdf2J/Obq9TimxcCFKB2HgHkcNI3ppSO/ICkbYpAKLGJbRpjqucSdBmkGUbAVSRPWo
	69Hx+BmE9FOFTYO1nzFoYbe2RkqxzBXc3ohgnmRVlIqFYtPDqAXbqLvtamZfKYvDpJJo
	UTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=MmDFv3/kHVSptcQTjzB5EqnZLXGpQAOVPXWJ70mJt4Q=;
	b=nCHK2xgRCC717WLw9ZXE8CqvL6vxP+xE4FrXniqE6UJk9n4kgLLUlXp9l24q3wllIp
	BiIIcf96nz77fybxI0QcSWq30XfMf4pH6DiM+tk0Bmi3ShisWjzlIYNHOKXT6N4aIvSH
	5yUvsgoiyi7ZrMgQzHdMh7s7cdRzCzFWjlI2wtktueCSo5OI8oS8kNytVyp9UPmRcAal
	L/pwhoCMz3e0kqN/1G93RCp/nkWacLbmwz1siZgM6ODIqj5C2739ZZJtky67s47TMzje
	yy9IxGUFcVXiFwyD6UNXp/ZroxehyTe29dQNjE5015uSIotP5mi8RwiMBbDCY7Ccn9N7
	0lRw==
X-Gm-Message-State: AD7BkJIUAcPPtMKEXCzhCOtzllVaFC5nVB01nu+xr435m4gOfi415knHxfBPj/BE5qKu0Wpa3HOFlZAZqoARcw==
MIME-Version: 1.0
X-Received: by 10.141.4.135 with SMTP id g129mr37259095qhd.31.1457436166386;
	Tue, 08 Mar 2016 03:22:46 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 8 Mar 2016 03:22:45 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 8 Mar 2016 03:22:45 -0800 (PST)
In-Reply-To: <56DE9321.4030404@siemens.com>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<56D9964E.1070404@siemens.com>
	<1457105433.2804.30.camel@linuxfoundation.org>
	<56DE9321.4030404@siemens.com>
Date: Tue, 8 Mar 2016 18:22:45 +0700
Message-ID: <CAMKF1soj3B8c-eW=vwZ7f0XQEYeeQqwF8vbCXe=-KgJzFWExeQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Tue, 08 Mar 2016 11:22:46 -0000
Content-Type: multipart/alternative; boundary=001a113962eafaf93c052d87cc61

--001a113962eafaf93c052d87cc61
Content-Type: text/plain; charset=UTF-8

On Mar 8, 2016 3:54 PM, "Pascal Bach" <pascal.bach@siemens.com> wrote:
>
> Hi Richard
> > Using this method is a supported approach. I'm a little surprised
> > .debug directories don't work. Have you tried just setting:
> >
> > set sysroot /home/projects/rootfs-dbg
> > set substitute-path /usr/src/debug /home/projects/rootfs
> > -bbg/usr/src/debug
> This doesn't seem to work (tried only with dizzy).
> The only way I could get this to work is to extract both the rootfs and
the rootfs-dbg into the same place and then set sysroot to that location.
> Is this the way it is supposed to be?

Yes

>
> >
> > as I believe it should work with IMAGE_GEN_DEBUGFS=1 "out the box". If
> > it doesn't that is a bug and we should try and look into fixing that.
> I'm currently using dizzy. I will give it another try with jethro next
week maybe it is working there.
>
> Pascal
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113962eafaf93c052d87cc61
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Mar 8, 2016 3:54 PM, &quot;Pascal Bach&quot; &lt;<a href="mailto:pascal.bach@siemens.com">pascal.bach@siemens.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Richard<br>
&gt; &gt; Using this method is a supported approach. I&#39;m a little surprised<br>
&gt; &gt; .debug directories don&#39;t work. Have you tried just setting:<br>
&gt; &gt;<br>
&gt; &gt; set sysroot /home/projects/rootfs-dbg<br>
&gt; &gt; set substitute-path /usr/src/debug /home/projects/rootfs<br>
&gt; &gt; -bbg/usr/src/debug<br>
&gt; This doesn&#39;t seem to work (tried only with dizzy).<br>
&gt; The only way I could get this to work is to extract both the rootfs and the rootfs-dbg into the same place and then set sysroot to that location.<br>
&gt; Is this the way it is supposed to be?</p>
<p dir="ltr">Yes</p>
<p dir="ltr">&gt;<br>
&gt; &gt;<br>
&gt; &gt; as I believe it should work with IMAGE_GEN_DEBUGFS=1 &quot;out the box&quot;. If<br>
&gt; &gt; it doesn&#39;t that is a bug and we should try and look into fixing that.<br>
&gt; I&#39;m currently using dizzy. I will give it another try with jethro next week maybe it is working there.<br>
&gt;<br>
&gt; Pascal<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</p>

--001a113962eafaf93c052d87cc61--
