Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D4AB778A6B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 20:15:28 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l12so19373145ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5v66UhPAr36fgG4Fy7Uy1gl4oBZnSsIXZVcAHQUG/GI=;
	b=D0d6vpylzL8ff86I/upUdXnrFgI67DpmPbz+ZusYRzgjjyVdsxKJ/1mmXggKXwg8Kr
	69lbo+dg5RhyU5aG+jiTzkB+7YlkZK3aThjkhrJFORhz88zrdmWMnJqk9FTpswDcUZ9R
	GLkxcAf0wQP4uwhxsNWd3antE0FOEIDX4uTnWqrPXYvOGrMyKW/5ae5HN2W4YwExok7m
	wsw30pe6jNXukXLl88QpmfcuDz59BttpxFDZpnybr4zqpN7+NYRpmN+XC9PmF1bhAJVb
	w2fG97j8V2ad/qKOjl77/DJtBHX7ksQ8XEQsvvztLgqJ+18zTZAmJ2KbOGUl+ItJNvIC
	mo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5v66UhPAr36fgG4Fy7Uy1gl4oBZnSsIXZVcAHQUG/GI=;
	b=ln/kkXCfsIwzszRR7ZhTe9bgMfkAeSqPRWnHHvL1/3ur0Ol/pLUmN4uWt+nlstCwhW
	H1h3HV+9N9RMjiJMNujMAiY8PuQcTftGXanmq/KdKdDN4TVEy3Cl9GUzDCzGPwm23i1u
	OOgPHbm6gn/ir+0umnmKrdWjYH4InPaj27pkuI1jQHvnLJ3j3mTCM7zJ3YGBZZnk9pWN
	5DjaxiGWPGy/YIe0hrbXnDjNpEL8ejM5QcJA9wGt7zWxNwiWpMWUW6FuyosLHMcwqPfM
	LPDy5qD3PAvuVf7odDTDrdxPeUTTGaRe0NzstywbdCtOSCcMZQ7r2qB5Ecsa0o3jLXN7
	Twig==
X-Gm-Message-State: APf1xPCRLtziuCNBhSjQ41mzlVqRzXTO6T/mgeWAFe9empU6duQRxrnA
	oKsqJhIivp1q4SHker8K19zNTmk/5yLq3sC431NVQQ==
X-Google-Smtp-Source: AG47ELt88/a1yw0zbdRCBxO9DgPV4B2nFBpCw+vrG2Gb/1sAVMt4qJwaCCa+kpKnlAsd7fx1Xjj2DOjF9HaLhvXKHpg=
X-Received: by 10.107.7.87 with SMTP id 84mr19055341ioh.216.1520280929915;
	Mon, 05 Mar 2018 12:15:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 5 Mar 2018 12:15:09 -0800 (PST)
In-Reply-To: <72969d24-99fa-2a47-2b61-1102c1675e3c@gmail.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
	<20180305172046.21729-2-ross.burton@intel.com>
	<30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
	<CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com>
	<72969d24-99fa-2a47-2b61-1102c1675e3c@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Mar 2018 20:15:09 +0000
Message-ID: <CAJTo0LYg6q5xr5aG0dL5SOuAU54YFm19HkUySvobnwRAKWLntA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Mon, 05 Mar 2018 20:15:29 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf4c96d3f0566affcb8"

--001a113ecdf4c96d3f0566affcb8
Content-Type: text/plain; charset="UTF-8"

On 5 March 2018 at 18:03, akuster808 <akuster808@gmail.com> wrote:

> Can you share your script?
>

I honestly wish I could because I need to run it again against master.  It
was basically the refresh hack in ross/patchmaggeddon to force bitbake to
refresh the patches, then a bit of shell to commit per-directory, then I'm
using VSCode to review the changes.

Some can be submitted as they update the context correctly.
Some can be dropped as the refresh just changed the hunk filenames.
Some can be dropped and replaced with a patch removal as the refresh is
showing that the patch can be removed now.

Generating a massive branch is trivial, the review is boring.  I've still
got ~50 patches outstanding and that's not even all of oe-core.

Ross

--001a113ecdf4c96d3f0566affcb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 March 2018 at 18:03, akuster808 <span dir=3D"ltr">&lt=
;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <p>Can you share your script?</p></span></div></blockquote><div><br></d=
iv><div>I honestly wish I could because I need to run it again against mast=
er.=C2=A0 It was basically the refresh hack in ross/patchmaggeddon to force=
 bitbake to refresh the patches, then a bit of shell to commit per-director=
y, then I&#39;m using VSCode to review the changes.</div><div><br></div><di=
v>Some can be submitted as they update the context correctly.</div><div>Som=
e can be dropped as the refresh just changed the hunk filenames.</div><div>=
Some can be dropped and replaced with a patch removal as the refresh is sho=
wing that the patch can be removed now.<br></div><div><br></div><div>Genera=
ting a massive branch is trivial, the review is boring.=C2=A0 I&#39;ve stil=
l got ~50 patches outstanding and that&#39;s not even all of oe-core.</div>=
<div><br></div><div>Ross</div></div></div></div>

--001a113ecdf4c96d3f0566affcb8--
