Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id D2FE670178
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 19:11:20 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id s8so56953298ign.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7WXqCLZqa1W6kTeo9wFN4PwWqKYRsvYEAQwbUu8II/Y=;
	b=Ud9j5Z2JZdLvXfb3Vc3bWnOWUum/Lgdq2AamEATwDfxIZn7Ohk6yJ9VM7BvzfaZijO
	96nN6o9icJztn1qVfgIuZCyvaR7I7ED8j8KjXKs4dLYAPEq5sPjMWBUSAMiODUK4jQr2
	1pY01Zb3bw8JKa5/ti9WKbwJICo+HAPFOHglDn3rc7UrHeYq7Ytys+U4QEmr7qP+6Fed
	crH0tOYbzyg+QLVCRhNq/Q44jQSzgglWfYek8Br68pJI0ZBGxsor1A/SxY7ri5wl8VNu
	twWjWaaJNlkIzkBs4lKe9s/Ew1e+vClTcqoOcRzaudcqIdO5vViILDOJjctBdf6+3245
	lV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7WXqCLZqa1W6kTeo9wFN4PwWqKYRsvYEAQwbUu8II/Y=;
	b=e3I3kkoxMP2i5ydfgStTHz9DgYOHKmDZ+o7E+ct/MQL3EuPAqVMs2DSj86lW7H1BLR
	usaFKp7GzgCnsMASMVvcscgEAiyJlup7XTSPr8CTuiNij+VHCjQXYUOFolx9QUpSkoJF
	5w7phoXQY6VMWBLZ6l346FO/b/JXbaVdOEPikQ7nWOAi+SD6GpTzDxTT96kpmobDuoG5
	OxE5JmUxhmtVqX6stV48CggzQNxyCJXm330ahhbMIWonPDcag3hETqOseyB0uzbfyTx2
	u4RObfD6HaeQcW+Ojej+BQnQsBm8t6UvRere6mVtjJlr955NEgg/xOIM0LbQ3vLNhZEO
	HyrQ==
X-Gm-Message-State: AOPr4FVyhqRjZRE77quWVu4BQT829uZ9fpxyS2V61b6bTAXE+BEtPjNVFqoWHLoCz5JK2rF3BWDdZmGWs+3TJQ==
X-Received: by 10.50.65.42 with SMTP id u10mr9896165igs.13.1462389080690; Wed,
	04 May 2016 12:11:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Wed, 4 May 2016 12:11:01 -0700 (PDT)
In-Reply-To: <CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 4 May 2016 19:11:01 +0000
Message-ID: <CABcZANmJe_UvZ6zeuMTwiyx9X+xY9ATD9XVW7ESrskMtjPL4YQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Wed, 04 May 2016 19:11:21 -0000
Content-Type: multipart/alternative; boundary=047d7b414330ad99e9053208fd8b

--047d7b414330ad99e9053208fd8b
Content-Type: text/plain; charset=UTF-8

On Wed, May 4, 2016 at 2:01 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 2 May 2016 at 21:09, Christopher Larson <kergoth@gmail.com> wrote:
>
>> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA
>> failure,
>> which is what's often seen with external toolchains. This brings us all
>> on the
>> same page, and makes sure a failure to obey LDFLAGS is seen early.
>>
>
> I love the idea, but:
>
> ERROR: libgcc-5.3.0-r0 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary:
> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/libgcc/5.3.0-r0/packages-split/libgcc/lib/libgcc_s.so.1'
> [ldflags]
>
> Ross
>

No idea how I missed this, since I did test builds, but I'll submit a patch
to oe-core shortly. Thanks :)
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b414330ad99e9053208fd8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 4, 2016 at 2:01 PM, Burton, Ross <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">=
On 2 May 2016 at 21:09, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div>This will result in a failure to obey LD=
FLAGS causing a GNU_HASH QA failure,<br>
which is what&#39;s often seen with external toolchains. This brings us all=
 on the<br>
same page, and makes sure a failure to obey LDFLAGS is seen early.</div></b=
lockquote></div><br></span>I love the idea, but:</div><div class=3D"gmail_e=
xtra"><br>ERROR: libgcc-5.3.0-r0 do_package_qa: QA Issue: No GNU_HASH in th=
e elf binary: &#39;/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/li=
bgcc/5.3.0-r0/packages-split/libgcc/lib/libgcc_s.so.1&#39; [ldflags]</div><=
span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br>No idea how I missed this, since I did test builds, =
but I&#39;ll submit a patch to oe-core shortly. Thanks :)<br>-- <br><div cl=
ass=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at g=
mail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--047d7b414330ad99e9053208fd8b--
