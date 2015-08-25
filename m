Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0C91A76AB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:19:39 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so102619898qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IKh5VotHyJaniuimd3LxLaWyxrNjjCaPhly3b14kHGs=;
	b=iDFtnz68bFvMb6W7pV43qH0qlEHF4KCByvOONaReQzG4ljTLPoq5ZVAM+UooVv2jLA
	PUiRLjNOgz/Amf2ZZpeBWe7TLWZhO5Rv9t6pV1PU7TH+AHHEVUXFtXRVl65vsM5P7CFY
	NCeO5hrAE8CrixJwZzGoOUSj1p1LV3s9vLk+KGlK0YosxLU4ZlIn/KHAobe2RPKyGRvB
	SsXaHsGMiGBKWXyFqtnUViXm1FweRBwh8b2hKerSJbspimpbEAEEowR4gyG9OTNlVimW
	QZvE0lrrMe+BzrZNOm97ogdFYK/G/eyqLCzDqJ/VNuqKcwiL2/dighbfapq4LdV9eixM
	EEgA==
X-Gm-Message-State: ALoCoQmS2NT/SC1EOanHz+KHsm5CljGGebyl5mIvHxlGsvVGsnic7sICG5YqlB974uSFGQZtlRqc
X-Received: by 10.140.133.67 with SMTP id 64mr67165041qhf.52.1440494379678;
	Tue, 25 Aug 2015 02:19:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 25 Aug 2015 02:19:20 -0700 (PDT)
In-Reply-To: <136c1b0650d3273e647022a60ef3845287d11af3.1440424002.git.bruce.ashfield@windriver.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
	<136c1b0650d3273e647022a60ef3845287d11af3.1440424002.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 10:19:20 +0100
Message-ID: <CAJTo0LYA9kHUNQif7jEyuYSjjiBjnCDLfatckoO43C3dK5KrfQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] linux-yocto/4.1: enable DRM_CIRRUS_QEMU and EXT4_USE_FOR_EXT23
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
X-List-Received-Date: Tue, 25 Aug 2015 09:19:45 -0000
Content-Type: multipart/alternative; boundary=001a1136fdcecd56bb051e1f3b3b

--001a1136fdcecd56bb051e1f3b3b
Content-Type: text/plain; charset=UTF-8

On 24 August 2015 at 14:51, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Updating the meta SRCREV to enable cirrus graphics emulation and wider
> compatibility for the ext4 driver.
>

This causes our friend "config value requested not present in final
.config" for at least qemuppc and qemumips in my local testing.

Ross

--001a1136fdcecd56bb051e1f3b3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2015 at 14:51, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":21z" class=3D"a3s" style=3D"overflow:hidden">Updating the meta SRCREV =
to enable <span class=3D"il">cirrus</span> graphics emulation and wider<br>
compatibility for the ext4 driver.<br></div></blockquote></div><br>This cau=
ses our friend &quot;config value requested not present in final .config&qu=
ot; for at least qemuppc and qemumips in my local testing.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1136fdcecd56bb051e1f3b3b--
