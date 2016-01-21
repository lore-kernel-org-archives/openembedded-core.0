Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 79111731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 12:19:34 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q21so52164037iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 04:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/+QZCZkwXQOxyPKMQI9Ixm4CA6DAq3xUHaG6jjjEYlk=;
	b=E4a2kSZgtGV9BkBNfGZg45e2z/XFWTdSOh8PcVgRan67wOYnnYPddrDrkRj87Zk5vd
	SKWujR3fABo2Czxdp1aALLTXHThVupNLS1S3UWSuIwH0lb3Y7GcgRr9xslJmxGeQdN4+
	3RkHx/90dT7oqXJF5ecGAVvlHjtr7HqBwbQ1DK1Iiahlhis59q0K8/OZjmy2uQaMndF6
	La28mv7LB7W6clpkm09aAT0K7Szcm+tn1j9SkEDNQLJpvLr7XFhB0sYIQhEHT+S4TEHu
	GEABt7YWUbxp9jkpEZwfK71eqo1dMtJX0ie/+DOjEA06tLVAIWthG2L3XdQbvZwOAcd8
	EfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/+QZCZkwXQOxyPKMQI9Ixm4CA6DAq3xUHaG6jjjEYlk=;
	b=CAlgRku2KnVqcEyUAdDLXihOtEkUrlLHNESuJKEjrDTpDQt0IhzSFc0krZWeVds77f
	E6CFrx7RLm7Hxxe/Y0hQunoJfh+mDypYRideYT2Am1zlmwMewyn4hgSKMaaSwphjQzzA
	pcJH8odJUjpfnkDpS7bKFPRGWHEtGKM1x5Gp81juGc78jXOWY4/aprYXNX93Mdvu8ycs
	9dEaUsmt4glxF6iCNMRkx63aYiodL6S7RaCivqNxqGlK7TUob0+l0+B73p6aF/yT2Nyz
	5a0/gxLJC0LsBCkM3rsGjAw114Z2/y5mW0Hs1fY0sPJdVxQ8UmZngKzD6vogu/vW5vdH
	60eg==
X-Gm-Message-State: ALoCoQmZYXw94dP02DFbC+0/EiSXvTxyLpFTjKUxL/jRdh9sNkeexhFJNCJ0hRnz9c6eRjvulY/5ocJWiF3BIJuU3FwdsA+aa5i4vzpX0gTuVwi/FfI0loI=
X-Received: by 10.107.164.161 with SMTP id d33mr34046671ioj.148.1453378774881; 
	Thu, 21 Jan 2016 04:19:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 04:19:15 -0800 (PST)
In-Reply-To: <56A097CA.1070703@windriver.com>
References: <1453134365-26107-1-git-send-email-ross.burton@intel.com>
	<56A097CA.1070703@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 12:19:15 +0000
Message-ID: <CAJTo0LakG7AEqPxyBKFB-HZjJV4JHjOUNQH_X=d29peqKbHF-A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: replace verbose manifest removal with a single count
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
X-List-Received-Date: Thu, 21 Jan 2016 12:19:35 -0000
Content-Type: multipart/alternative; boundary=001a1141c97699ed0a0529d71db8

--001a1141c97699ed0a0529d71db8
Content-Type: text/plain; charset=UTF-8

On 21 January 2016 at 08:33, Robert Yang <liezhi.yang@windriver.com> wrote:

> NOTE: There are 10 recipes to be removed from the sysroot, removing...
> NOTE: There are 15 recipes to be removed from the sysroot, removing...
> NOTE: There are 30 recipes to be removed from the sysroot, removing...
>

Yeah, good point.  Patch sent.

Ross

--001a1141c97699ed0a0529d71db8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 January 2016 at 08:33, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":laj" =
class=3D"a3s" style=3D"overflow:hidden">NOTE: There are 10 recipes to be re=
moved from the sysroot, removing...<br>
NOTE: There are 15 recipes to be removed from the sysroot, removing...<br>
NOTE: There are 30 recipes to be removed from the sysroot, removing...</div=
></blockquote></div><br>Yeah, good point.=C2=A0 Patch sent.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1141c97699ed0a0529d71db8--
