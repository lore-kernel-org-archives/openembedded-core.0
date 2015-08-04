Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B186764BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 04:37:47 +0000 (UTC)
Received: by iodd187 with SMTP id d187so5789915iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Aug 2015 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=36XPM1IHHh2HgcyS0LReFvuGmDeSwv4KSI0c2uZFDMU=;
	b=zWcPdQcKQITICgrrF691fHC+Sj3h3JkRu8th5yue47JzHr/S2EC2Ala1D4aOOGPygG
	TMPp8tkUWyf0A0fFwzuAtYeWOxEeXEn0+J7itjtpr56NT2UU5w3U32WT/2Isw6VtsHmZ
	MDD68VABAkg49jcGBzSvtI10N965+vm4LPfy0ny3omxi+Qx8QEalfNaQ0evPqGgI5ism
	LAZA2NIALo8hyqosmyU/bbn+qDexnaRo/mdNqpSXBNKagcOE5S/47B3Ap5hRmVVb9uJx
	5HiVNQ/Izs4z+GCbug/li04MH5Ua2cABafDIWUxDSIzXhVlUCOD//DSXD9+fO1FI2LPM
	3FZA==
X-Received: by 10.107.10.161 with SMTP id 33mr1455331iok.155.1438663067756;
	Mon, 03 Aug 2015 21:37:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Mon, 3 Aug 2015 21:37:28 -0700 (PDT)
In-Reply-To: <1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 3 Aug 2015 21:37:28 -0700
X-Google-Sender-Auth: gpJq-s0rUr-oqbfEUBxRELmQtm0
Message-ID: <CABcZANnyGKhaXJC9Z+JnRw8PCppExQdUYWczF08OJsOt2sj4gQ@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kernel-headers: linux kernel headers
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
X-List-Received-Date: Tue, 04 Aug 2015 04:37:49 -0000
Content-Type: multipart/alternative; boundary=001a113f90881aecf4051c74d9be

--001a113f90881aecf4051c74d9be
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 3, 2015 at 1:35 PM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> A set of files is needed to allow building new Linux kernel modules
> against an already installed Linux kernel. The files include various
> header files, script files, Makefiles, source code files for several
> utility programs and Linux kerenl .config file.
>

Typo: kerenl


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f90881aecf4051c74d9be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 3, 2015 at 1:35 PM, Juro Bystricky <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1=
v2" class=3D"a3s" style=3D"overflow:hidden">A set of files is needed to all=
ow building new Linux kernel modules<br>
against an already installed Linux kernel. The files include various<br>
header files, script files, Makefiles, source code files for several<br>
utility programs and Linux kerenl .config file.</div></blockquote></div><br=
>Typo: kerenl<br><br clear=3D"all"><div><br></div>-- <br><div class=3D"gmai=
l_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics</div>
</div></div>

--001a113f90881aecf4051c74d9be--
