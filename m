Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 69E3A72653
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 12:00:18 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q108so9800533qgd.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 04:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yJIw718beWqb5dgzUZmGSkGJ/OB/nAwZHxXxwYAGXBA=;
	b=SriVXjSoFXoFSLwMG2vIT+3gMd3imqvBE8u2YPTrBv+ua/yJnd4qMHJgHVqMLwXc7a
	yDpMMelpT6gutV0MD1gOvB2gAkotkUT5SDtGYu9qCBwknBFQ1wEjoHRfdK69IMTvBng7
	WXx3KMaeg/CpDNIENbC7f8vz7z/DKukUSZT/kbWXnvMN/7TITGlZ5A54yIJKp5mjhkG/
	AMS057B0Sjmv6AuhTOM1yn2AyFPJfpQ1dNKkF3B4Pm1BgvkfWhFeFfcWw0/F4V4EstKN
	pjv5q86JjC/288j/DsmFoyRvI+b3BVDLnC8QG94wYbj8vmtYSCu6EIg7tvfBTY2GYY8e
	3xQg==
X-Gm-Message-State: ALoCoQnDbETs3fuoOUSCp6af8aMgg64FrW0mojYcWnUnZ1ZxbCTHeRhEBPglln8BZJBICbX8rODy
X-Received: by 10.224.93.6 with SMTP id t6mr74509258qam.93.1418817618876; Wed,
	17 Dec 2014 04:00:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 17 Dec 2014 03:59:58 -0800 (PST)
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Dec 2014 11:59:58 +0000
Message-ID: <CAJTo0LZ9dimBGF-J68r0E-opkrDTjy5dyV19impjmXU4gBpHpA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Import Python Modules for Toaster
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
X-List-Received-Date: Wed, 17 Dec 2014 12:00:21 -0000
Content-Type: multipart/alternative; boundary=089e014950282cb749050a6838a3

--089e014950282cb749050a6838a3
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 05:44, Saul Wold <sgw@linux.intel.com> wrote:
>
> These 4 python modules are needed by toaster, since we want to have a
> complete environment, we need add these python modules to oe-core so
> that toaster can run.
>

I'm not very comfortable with pulling pieces from meta-python or
meta-openstack and merging them into oe-core just for running Toaster on
Poky.  I think a better solution would be to ensure that meta-python has
everything required and then if we want to continue with the one-repo model
for Poky use combo-layer to copy the relevant recipes from meta-python into
poky.

Ross

--089e014950282cb749050a6838a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 December 2014 at 05:44, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto=
:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> =
wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":5f6" class=3D"a3s" style=
=3D"overflow:hidden">These 4 python modules are needed by toaster, since we=
 want to have a<br>
complete environment, we need add these python modules to oe-core so<br>
that toaster can run.</div></blockquote></div><br>I&#39;m not very comforta=
ble with pulling pieces from meta-python or meta-openstack and merging them=
 into oe-core just for running Toaster on Poky.=C2=A0 I think a better solu=
tion would be to ensure that meta-python has everything required and then i=
f we want to continue with the one-repo model for Poky use combo-layer to c=
opy the relevant recipes from meta-python into poky.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e014950282cb749050a6838a3--
