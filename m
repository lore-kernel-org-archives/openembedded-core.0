Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 731D86AC43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 15:07:32 +0000 (UTC)
Received: by qgf75 with SMTP id 75so28688450qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jun 2015 08:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5ol8aNIQ5JqCizSWIPstqObHmxs4KUB0TGEFJvnrX3M=;
	b=eRODvbc8xEkiHHYA0I6+r2YK7poC0mJm9wqvSVzC0sN85DhYxWSfComtuG13VHnUWb
	05ojV9O/jupmbklQnsSSBUwi/XEqqOQZC/m6uCWFUjearHuZE1eeFkWtdbR1GyOSvjFZ
	MgXSb/Q5o2Vsjx54RccWYF5iqqw9TbZfBhSj5F23A2JBPOYd1XhPWShQcHR7IlEd8jGg
	8t4Qgpn7jvKJ+8IMFAEMfOTQixsk4TH69lmUSEX//d+HTbM0fa4ZKk4Z4viYHKcgyBA1
	iLo31IfkE/kovLjZemUI1K5X9/N5mFvoioC6KMMiJbOUVilKCh5dzXh54QZWc3XvF4QZ
	txHQ==
X-Gm-Message-State: ALoCoQmP/TInHnnGYdlTrfT5YBOuNS5HGnnOMMh6f+2Z+0I3icAu2FASivceMSqMmR3M+62bdtSb
X-Received: by 10.140.235.19 with SMTP id g19mr4792904qhc.52.1433516853813;
	Fri, 05 Jun 2015 08:07:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 5 Jun 2015 08:07:13 -0700 (PDT)
In-Reply-To: <c954cdeeaf11fb5bd8f4fbf63ddf0904998f2ca4.1433477519.git.bruce.ashfield@windriver.com>
References: <cover.1433477519.git.bruce.ashfield@windriver.com>
	<c954cdeeaf11fb5bd8f4fbf63ddf0904998f2ca4.1433477519.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jun 2015 16:07:13 +0100
Message-ID: <CAJTo0LYE8Oe6=aK0GekB+vb0TPZVZLCAtNUjecD9BZv3EZWEFQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: update beaglebone, mpc8315e and edgerouter to 3.19
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
X-List-Received-Date: Fri, 05 Jun 2015 15:07:33 -0000
Content-Type: multipart/alternative; boundary=001a11376dacd9f6b30517c6a6fd

--001a11376dacd9f6b30517c6a6fd
Content-Type: text/plain; charset=UTF-8

On 5 June 2015 at 05:13, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Bumping the linux-yocto SRCREVs to integrate fixes for the h/w reference
> BSPs to the 3.19 kernel.
>

edgerouter fails for me:

|
/data/poky-master/tmp/work-shared/edgerouter/kernel-source/fs/aufs/i_op.c:
In function 'au_pin_hdir_set_owner':
|
/data/poky-master/tmp/work-shared/edgerouter/kernel-source/fs/aufs/i_op.c:445:28:
error: 'struct mutex' has no member named 'owner'
|   p->hdir->hi_inode->i_mutex.owner = task;
|                             ^
|   LD      drivers/idle/built-in.o
|   CC      fs/aufs/i_op_del.o
|   LD      drivers/i2c/busses/built-in.o
|   CC      drivers/base/module.o
|   LD      drivers/i2c/muxes/built-in.o
|
/data/poky-master/tmp/work-shared/edgerouter/kernel-source/scripts/Makefile.build:257:
recipe for target 'fs/aufs/i_op.o' failed
| make[4]: *** [fs/aufs/i_op.o] Error 1

Ross

--001a11376dacd9f6b30517c6a6fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2015 at 05:13, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div id=3D":kh" class=3D""=
 style=3D"overflow:hidden">Bumping the linux-yocto SRCREVs to integrate fix=
es for the h/w reference<br>
BSPs to the 3.19 kernel.</div></blockquote></div><br>edgerouter fails for m=
e:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><di=
v class=3D"gmail_extra">| /data/poky-master/tmp/work-shared/edgerouter/kern=
el-source/fs/aufs/i_op.c: In function &#39;au_pin_hdir_set_owner&#39;:</div=
><div class=3D"gmail_extra">| /data/poky-master/tmp/work-shared/edgerouter/=
kernel-source/fs/aufs/i_op.c:445:28: error: &#39;struct mutex&#39; has no m=
ember named &#39;owner&#39;</div><div class=3D"gmail_extra">| =C2=A0 p-&gt;=
hdir-&gt;hi_inode-&gt;i_mutex.owner =3D task;</div><div class=3D"gmail_extr=
a">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div class=3D"gmail_extra">| =C2=A0 LD =
=C2=A0 =C2=A0 =C2=A0drivers/idle/built-in.o</div><div class=3D"gmail_extra"=
>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0fs/aufs/i_op_del.o</div><div class=3D"gmai=
l_extra">| =C2=A0 LD =C2=A0 =C2=A0 =C2=A0drivers/i2c/busses/built-in.o</div=
><div class=3D"gmail_extra">| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0drivers/base/mo=
dule.o</div><div class=3D"gmail_extra">| =C2=A0 LD =C2=A0 =C2=A0 =C2=A0driv=
ers/i2c/muxes/built-in.o</div><div class=3D"gmail_extra">| /data/poky-maste=
r/tmp/work-shared/edgerouter/kernel-source/scripts/Makefile.build:257: reci=
pe for target &#39;fs/aufs/i_op.o&#39; failed</div><div class=3D"gmail_extr=
a">| make[4]: *** [fs/aufs/i_op.o] Error 1</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11376dacd9f6b30517c6a6fd--
