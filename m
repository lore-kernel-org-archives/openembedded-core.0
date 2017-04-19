Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7F071AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:36:30 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id h67so24942807qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UdyNiVInNuKc7ibzxpwlYkHj+l4cxpoGl3jgoaH2IKs=;
	b=SNDEJ/bE7fOtudcV+gJoH2LzgsGv4GF6hVbHEP+pj5KmNCCxR3klpgfAnov5sjKbHT
	8HC8NRTU5iZW87tdWAdeMXxP85YB7nY96lwihqg3mnc4SOylZnu3kazktcisozUrre1/
	Nwit3B6kUYZhrLu01/uXsPSef7DSO9FaGe3Fk6IexCxdfUAqQ5ee12JocWCOjKmlDkF2
	t9nyGpf8PtDPcv8lMGbNSbkTf07I2YpMmFu5zKpIHXPldYsMD8bKZBc8soYusGY8vWa3
	vqMNu+8R2ihKKVNlHN/s23a4RmVl1f5Bjn2Y/1VjqkGBakfR2iYE0h8jdTglkU9V5Eq/
	nV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UdyNiVInNuKc7ibzxpwlYkHj+l4cxpoGl3jgoaH2IKs=;
	b=GyfRX4oQ/4tD9agqzEWet0mM5QVE3q0+GO/YD1Q2TQCw5bLjQsgxuejiaw/xVNsrUf
	MBEpZD/6vM9167JUmfjP1kjodS9jRz/GrFtafBEp+S8B6dO8kvhveNeoyN9tPEVR5m5s
	xRv9+KnCB5eLUzaVIqlW+yyo+39wQFXXvSF7g9UWwX9/oBR8aLDCVsQe+5RpfPqrYYtG
	k+ebe6Irp7f2N2tTHfRooZ/68d+iOwyWmjrMjY1J13Socz7LpOPZxRniFJRQw4tvkU6C
	5o7/OIOdDkivaKiWU9i2w7VkuhZ9XgSm/1QbhafshCp8IcsYV5kXY4VJGww9vzCJD7cX
	DLZQ==
X-Gm-Message-State: AN3rC/7k0EtIUIiPAML0yXWCPde3btBgF/hfIkgtM65+VafyXsGotbQ1
	O2jxfv230WbaRc/U7+JPEyNPzHvph7D8
X-Received: by 10.55.214.208 with SMTP id p77mr3629442qkl.121.1492619792061;
	Wed, 19 Apr 2017 09:36:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 19 Apr 2017 09:36:11 -0700 (PDT)
In-Reply-To: <CAMKF1spCN1u2cWm9V4VHStu7Btj=34JTSqvTbNWXPsb3r99JBA@mail.gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-2-raj.khem@gmail.com>
	<CAJTo0LandPvX8nK+oPW0vj8DSC+jU7mBEZc+LEE4uq3TmkubHw@mail.gmail.com>
	<CAMKF1spCN1u2cWm9V4VHStu7Btj=34JTSqvTbNWXPsb3r99JBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Apr 2017 17:36:11 +0100
Message-ID: <CAJTo0La1PPef_BP-6Zc8aSJiSkmDwXR3AR9i7Dn+vRakRScS1A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Wed, 19 Apr 2017 16:36:31 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f87deb2d054d87a07c

--001a1149d4f87deb2d054d87a07c
Content-Type: text/plain; charset=UTF-8

On 19 April 2017 at 17:25, Khem Raj <raj.khem@gmail.com> wrote:

> key_secret_is_set is a typo in libtirpc map file which is fixed here.
>

Can you resubmit with that in the commit log.  Are you pushing these
upstream?

Ross

--001a1149d4f87deb2d054d87a07c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 April 2017 at 17:25, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":pq" class=3D"a3s aXjCH m=
15b8709b82457a88">key_secret_is_set is a typo in libtirpc map file which is=
 fixed here.<br></div></blockquote></div><br>Can you resubmit with that in =
the commit log.=C2=A0 Are you pushing these upstream?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149d4f87deb2d054d87a07c--
