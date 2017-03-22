Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id B29ED77B63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 15:44:37 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id v127so160100317qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gO+DdqTMivRAR4tXyZeV4B/Eg4/v+xOiR7WnN9ub2JY=;
	b=qamVeRW9+H28FTqjgl+gjajgf2UutqsMWv4FmQv0tenf3070GwVlq5ag7e5aQ9/rH2
	MtCL2FEtMzO7QGcKzmYjDJ0rFoy6/7TZ/xmxZy1I75nCA3GS7nFFqYGAk9nM/1XuNQb7
	irk2Pj39F7RrLJN95DlVuXhJz7db+Pu2pdf+pmZ8dP3LgE3kMgZty8wOfv/8NL2GQ+Bi
	4CB8ulTP9Vc25q2wCteZj43rCmFIp00z8Y9S/o2MAzimJRQDtfkRmcd6ThXcpq8ypEDv
	TB5YmgqalVqdu3m7ImJjAE6HPCQGFtur75tDTfDCEdWqd7PyP4pwpP5QmhXX6syBUrb2
	jgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gO+DdqTMivRAR4tXyZeV4B/Eg4/v+xOiR7WnN9ub2JY=;
	b=d7UPjh3QuZjiy0WhIjW+7gmNuWOcyBX4LsFo/1jWkd7TD9w0Q9pXVR00rfieYkUyhI
	nu9g68/CgFqLVkWbmodImoQLzrCMLSREYWHRqVfgC0+P0lzIE/VHpX/U9L7w15IDmAY/
	Xu3at4BdORU+BZTKVPEPAWyEDlh+52UEPHhz7y2cKy/ABM22RBY/i+dleC/m9sQwLh5m
	ihDtFcAF2KU1d+WC4vo+cdGKTseomMNgwO5CUFQqiNkjI9Mc+xsdykPo9bWdu6kQKpUc
	GS3z8RPanr7TofyWSgsOUR5HTEuU+YuwXM2j5x0kxnzX9wW9FGlyuNfosBLSHw4xVFN4
	/p9g==
X-Gm-Message-State: AFeK/H0zkx2htfKUvjz7CgINCUW8RlEpKJCjfkr1KOAod0O2K/vc84Q7+a3pQ68CA7voi0vn92kdB0X4bqypqfiM
X-Received: by 10.55.47.4 with SMTP id v4mr36339333qkh.77.1490197478552; Wed,
	22 Mar 2017 08:44:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 08:44:18 -0700 (PDT)
In-Reply-To: <1490194798.13980.172.camel@linuxfoundation.org>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
	<CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
	<alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
	<CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
	<1490194798.13980.172.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 15:44:18 +0000
Message-ID: <CAJTo0LZV4kh3=r=cxYpBydGO74R6cvootczedwMW3s_k1xxSWQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 15:44:37 -0000
Content-Type: multipart/alternative; boundary=001a114f41085b150e054b53a38e

--001a114f41085b150e054b53a38e
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 14:59, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> What should happen is that the openstack recipe should complain loudly
> (error) if anyone tried to build it (or parse it?) with anything except
> the versions its known to work with.
>

Is this a good time to bring up versions in DEPENDS?

It would be awesome to automatically set PREFERRED_VERSION as appropriate
depending on the constrains in DEPENDS, but I'd be really happy with errors
if the versions specified were not selected.

So in this case openstack could do DEPENDS=python-something (>4.0) and
bitbake would error out if python-something v3 is being built.

Ross

--001a114f41085b150e054b53a38e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 14:59, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":1nx" class=3D"a3s aXjCH m15af689089651d6d">What should happen=
 is that the openstack recipe should complain loudly<br>
(error) if anyone tried to build it (or parse it?) with anything except<br>
the versions its known to work with.<br></div></blockquote></div><br>Is thi=
s a good time to bring up versions in DEPENDS?</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">It would be awesome to automatical=
ly set PREFERRED_VERSION as appropriate depending on the constrains in DEPE=
NDS, but I&#39;d be really happy with errors if the versions specified were=
 not selected.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">So in this case openstack could do DEPENDS=3Dpython-something (&gt=
;4.0) and bitbake would error out if python-something v3 is being built.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114f41085b150e054b53a38e--
