Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TyAh5-0000In-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 01:29:42 +0100
Received: by mail-la0-f41.google.com with SMTP id fo12so3990695lab.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=BOZ16R9WVV2mm84y+JrP05LY0Q6zVHCZwSBfmvK6KS8=;
	b=UX9+sceTwVGANMHGrMS2Hh8gZlFgl5suip4XM//xAWIZHNfDG1XZa6KdQ88HYKXmoO
	BZlkuBrQFjDcax2ZeS7nirR4qUmnkXY7lKyoTp7N0ai5N6VSDh0KlkHpKEfU53sW34LC
	fWH+zBoXSGGG9Ci1HhmBs25KWmQvQ6KCq9GLFZLuyedVUuECdNNFJkU4cBL6PqqO3thx
	O7kOVetmCcWDqFoZOKQWmWUY3ov+LDWMWDYtkrcmkctxvm0KSDOGOO7vCkTlYP4N5GKJ
	XYXDJSq8dZz6rWMgJfgSjIu89iuhvLi/buc2isp267hnD4FhCmdsp3XN5i0GsQBiQGBW
	jmag==
X-Received: by 10.112.44.164 with SMTP id f4mr29452lbm.43.1358986435365; Wed,
	23 Jan 2013 16:13:55 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 23 Jan 2013 16:13:35 -0800 (PST)
In-Reply-To: <20130123172748.GB14381@jama.palm1.palmone.com>
References: <20130123172748.GB14381@jama.palm1.palmone.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 23 Jan 2013 17:13:35 -0700
X-Google-Sender-Auth: F5D-rlNUvoOb7HSUYapp8SWL3fU
Message-ID: <CABcZANkfiefEBNVAswnCrmjPFSiJeijvaJ+o++EH7qtrQfnKMA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts between PN-doc packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 00:29:42 -0000
Content-Type: multipart/alternative; boundary=f46d0401229fbc0c3904d3fdaf6d

--f46d0401229fbc0c3904d3fdaf6d
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 23, 2013 at 10:27 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> |  * check_data_file_clashes: Package gcc-doc wants to install file
> rootfs/usr/share/info/dir
>

In this particular case, I think we can look at how other distros handle
this file and follow suit.
-- 
Christopher Larson

--f46d0401229fbc0c3904d3fdaf6d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 23, 2013 at 10:27 AM, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":t7">| =C2=A0* check_data_file_cl=
ashes: Package gcc-doc wants to install file rootfs/usr/share/info/dir<br><=
/div></blockquote>

</div><br>In this particular case, I think we can look at how other distros=
 handle this file and follow suit.<br>-- <br>Christopher Larson</div></div>

--f46d0401229fbc0c3904d3fdaf6d--
