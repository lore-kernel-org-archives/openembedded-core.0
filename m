Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 733C377EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 16:14:12 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m81so1576995ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6rpnM9yR7riFEobUo+wVyipIzfH5rf9M7S/Moaj2G6s=;
	b=on1xxBWfS8DxKNeRVoxTa7Ag8uiEBrg2BnSpD1vBYUEbcN+naTL8pMgMqWeYuG/0Ad
	+FEu1Qnns7XH4ftpgx2igNFfW2M2SkPYmSDeicAluSB/IwqcdpQwec3J61tr/Q580TBu
	X3JKIVVDZgqbkFIk7C7l8UaT6VsmWpKfrmYh+WQI6NZ4+I6UfHlEoBYpmDhTNAJqvbMM
	IFwFKD0SY+YqHKgPb7LGbAZvZbkRHFE4wksJxIlfbaNEfoiZziwTY0Hc5uti6dCsYUb+
	aObtTvYvB78dcJ7uEKfWJVb/aOa3fBZFw9DATn+txi5vPgCpfBgJvJYIPT+jcaSqmEwB
	ybdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6rpnM9yR7riFEobUo+wVyipIzfH5rf9M7S/Moaj2G6s=;
	b=CRx6GIG8hes2QKIXg3PkDds/Ax4KCPMZf8Kws0Vr01riVx43zQXgk+rccZSQgY9bHR
	FjbRgTqc2MAbMN2lVWT3ffEf+Ig+jLJ73pav0Vmh1EGVNb2LgcfC5Xa6jBahMI8FphFz
	xhZOhF/zSXoYXYveTG9ewozjxVsrpkmUuzK77V2A/HoepBk/p6JZWMezwI4jfyr04tnu
	h62jp3J4i1yl7knKOZbwNuNIRvvrCiNOnJYGkMAsiFh7qL2noz8KGMZCDmSh33vG3x/y
	LRRWFAeqwqm2G97tzzImEbFsUAj69toi5eQ7twYYe+cvJA2tnaozyYBNFBXrOKPjyKJT
	Vm/w==
X-Gm-Message-State: AHPjjUhk+eCAVOudoLCrBXZ4non+WxEE4BGQNkpD4cGw3dYsS6NM3QyB
	3GtTAOkIG+MKNWqKOBMQpkYogjIrvVD6kbWABUcdHg==
X-Google-Smtp-Source: AOwi7QB9Xgik5aWm27rQEJiyDH3zOO7U4OxsTLrxHdGYpccuf66Zg4PKutzlLran4HxCpdcIPwQkQwe90JzeSJz6KWc=
X-Received: by 10.107.41.135 with SMTP id p129mr32227602iop.142.1507133654307; 
	Wed, 04 Oct 2017 09:14:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 09:13:53 -0700 (PDT)
In-Reply-To: <ba1bbc29-6515-e99f-be98-921ccd96c614@siemens.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
	<bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
	<CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
	<ba1bbc29-6515-e99f-be98-921ccd96c614@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 17:13:53 +0100
Message-ID: <CAJTo0LaHrM7r1S4=Qp5AXZMwrH5Qd4Vcn2O5Z2QnDW9Q24wPrw@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 16:14:13 -0000
Content-Type: multipart/alternative; boundary="001a1141f22618525f055abae645"

--001a1141f22618525f055abae645
Content-Type: text/plain; charset="UTF-8"

On 4 October 2017 at 12:56, Andrej Valek <andrej.valek@siemens.com> wrote:

> I have unpacked the rpm package over command "rpm -qp --scripts
> busybox-1.27.2-r0.i586.rpm" and links to /bin/sh looks good for me.
>
> update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50
>

I wiped tmp and rebuild busybox and it's still linking to busybox.suid
here.  Annoyingly I asked Joshua to replicate and he confirmed your
busybox.nosuid link.

Argh! :(

Ross

--001a1141f22618525f055abae645
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 October 2017 at 12:56, Andrej Valek <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andrej.v=
alek@siemens.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I have unpacked the rpm=
 package over command &quot;rpm -qp --scripts<br>
busybox-1.27.2-r0.i586.rpm&quot; and links to /bin/sh looks good for me.<br=
>
<span class=3D""><br>
update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50<br></span><=
/blockquote><div><br></div><div>I wiped tmp and rebuild busybox and it&#39;=
s still linking to busybox.suid here.=C2=A0 Annoyingly I asked Joshua to re=
plicate and he confirmed your busybox.nosuid link.</div><div><br></div><div=
>Argh! :(</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141f22618525f055abae645--
