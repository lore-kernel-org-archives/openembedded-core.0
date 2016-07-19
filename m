Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF4160290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 11:36:15 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m101so16142932ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/xWwXCe6vfH11tyt00OaZwX7DGus0Ntj9xge4FdUYog=;
	b=1g8xwiuNy9sMIkKdPfuBQ57qdm04oy0mHARaoOOTjiKyuQwzK3t+0cVImwsW2VOjaD
	O0IRTYBQ6p8cczyn7zgKtwz31mGSo3qGx6BWBY6xqhfWHAwnZBv6ZjsMRBhkw6/xN2JU
	/okDNm/E0eHVek3RhudosHabxKwsijEdLPabWKatE19YGyQ+9zy5HoR3yY4EqcxUDWu2
	Dl2/xG9m6NuKWROAdms/ScqiQfrfGvy9d1UnLsXUQBAeTH5L2bi+xOtEm76T7Id7ib6O
	kS5DHuujNhHMzdj5nc6VwWhchyCmJsbIJOljlYI3l8kJKSw2fZ9gtKUYxguhNt2xD4NY
	0yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/xWwXCe6vfH11tyt00OaZwX7DGus0Ntj9xge4FdUYog=;
	b=TgMR7GY62ze/U4bzny+VX9I+UTWet30BV71W3YjTnLwbBTDxCeyR1onQFpaxmUfSTl
	lRC7NZvylt1pPCTrWoMJytgA4+66FFIWWvHK6OM9cPzbQvu8MYW8bl13tXZbO1k29wMp
	+NB+3K6T+eF3ctC9AWsadxb4voYSnBLXkskGzo2fGMwK6MbhPdZbyz3TC1VvDVSifwWT
	Rlj9bBXJM3gUeUqvRVchcNS3ZanJO40ZQBxZ9Wi2zgwVet4ngSsXGOlAZI9//9Qomcx8
	h1XYHzti489phKDwrWTsVuA/eFWV9HduAaW9H3GbzOOwt0iBBtrOP/0czuo/O34wh2xR
	RPTA==
X-Gm-Message-State: ALyK8tIZcC4Ap7pks1luky//B2f0dfwfi5ZyPX+bgYSJszgDq/KS1FKuYC49PTtYlTbzoSRaKU563qrcJimkRdUa
X-Received: by 10.107.138.212 with SMTP id c81mr37082884ioj.148.1468928176702; 
	Tue, 19 Jul 2016 04:36:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 19 Jul 2016 04:35:57 -0700 (PDT)
In-Reply-To: <20160719004552.GA25758@scvick-mobl.amr.corp.intel.com>
References: <20160711175529.2650-1-stephano.cetola@linux.intel.com>
	<20160711175529.2650-2-stephano.cetola@linux.intel.com>
	<CAJTo0LZfTnmKoMCwjZhU9-ooBZm4F1vsy=vC4sh9p0HQF6mVKQ@mail.gmail.com>
	<20160719004552.GA25758@scvick-mobl.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jul 2016 12:35:57 +0100
Message-ID: <CAJTo0LYp6GpMLabjNDBS7=dyCVdS2jNYLyDUHDKxfp+JuRBkLg@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Tue, 19 Jul 2016 11:36:17 -0000
Content-Type: multipart/alternative; boundary=001a113ed9322c70780537fb7e3b

--001a113ed9322c70780537fb7e3b
Content-Type: text/plain; charset=UTF-8

On 19 July 2016 at 01:45, Stephano Cetola <stephano.cetola@linux.intel.com>
wrote:

> There should be a V4 out there already that splits off space. Not sure
> what I
> was thinking here, but I realized pretty quickly my mistake :)
>

Somehow missed that, thanks!

Ross

--001a113ed9322c70780537fb7e3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 July 2016 at 01:45, Stephano Cetola <span dir=3D"ltr">&lt;<a href=3D"=
mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.cetola@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":1c2" class=3D"a3s aXjCH m156009dc0d6dd493">There should be a V4 out=
 there already that splits off space. Not sure what I<br>
was thinking here, but I realized pretty quickly my mistake :)<br></div></b=
lockquote></div><br>Somehow missed that, thanks!</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed9322c70780537fb7e3b--
