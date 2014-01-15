Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2D83A6E362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:38:46 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id l6so1042402oag.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=76xC7fWMtPRawVHLa3bTRhGB8XnYyT4FnJlwdM7uBPM=;
	b=Z0NtCS5vYsgKgB6CKAv0um0mtbrcX3suZ8mFATgcRDe7aEdAWVb17o3RU0i+tGS7CR
	g9/LC23eiCY0+DjD9mnwMExECCn8U9Ync5EQ2M00fTLpsAeGhC80ZWQMruNqyoUtwlXZ
	M94FDafTU4i4bH092u5d1ULZABo37lkiUdHCTMcug+5HbyqKOXTyYEXC9+kxWgTx25G7
	ZNbpMKtexS/ENfBk5dVAKTUX/Ovixk8mTUIA111DO5cqwZs8uEdF24AC37igdH89WyG7
	H6WIs3+5JGuWBFpE1wBXiOJ8YumVUzQINcM49lCdSfe0TXORYIJ5AXwOtWtNToKrHCjn
	PktQ==
MIME-Version: 1.0
X-Received: by 10.60.58.134 with SMTP id r6mr1290794oeq.17.1389785927090; Wed,
	15 Jan 2014 03:38:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:38:47 -0800 (PST)
In-Reply-To: <4975a4727b07aa321bb8d19429efc0796a115ecc.1389769773.git.Qi.Chen@windriver.com>
References: <cover.1389769773.git.Qi.Chen@windriver.com>
	<4975a4727b07aa321bb8d19429efc0796a115ecc.1389769773.git.Qi.Chen@windriver.com>
Date: Wed, 15 Jan 2014 09:38:47 -0200
X-Google-Sender-Auth: f_nibHAu1a6d_Ya9WLgT7pUWJc8
Message-ID: <CAP9ODKoL7vgZAk_k20AdHZyeohdDjqjGm4gYJqGepXMONkJUCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] shutdown-desktop: use poweroff for the Exec field in the shutdown.desktop
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
X-List-Received-Date: Wed, 15 Jan 2014 11:38:46 -0000
Content-Type: multipart/alternative; boundary=089e013c71e47f899504f000c079

--089e013c71e47f899504f000c079
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 5:10 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Use 'poweroff' instead of 'halt' for the Exec field in the
> shutdown.desktop.
>
> The purpose of this patch is to make the 'shutdown' icon on on our sato
> images work as expected for both sysvinit and systemd images. Previously,
> the Exec field was 'halt'. The `halt' command could poweroff the system
> in sysvinit images but it only could halt the system in systemd images.
> The difference is due to the different implementations of the `halt'
> command.
>
> In sysvinit, the `halt' command will effective execute `/sbin/init 0'. This
> is for the compatibility with sysvinit 2.4, as stated in the comments of
> the
> source code. In systemd, the `halt' command will effectively execute the
> reboot(RB_HATL_SYSTEM).
>
> As the 'shutdown' icon is expected to actually shutdown the system, we
> should
> use poweroff instead of halt for its Exec field.
>
> [YOCTO #4347]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013c71e47f899504f000c079
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 5:10 AM, Chen Qi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Use &#39;poweroff&#39; instead of &#39;halt&#39; for the E=
xec field in the shutdown.desktop.<br>

<br>
The purpose of this patch is to make the &#39;shutdown&#39; icon on on our =
sato<br>
images work as expected for both sysvinit and systemd images. Previously,<b=
r>
the Exec field was &#39;halt&#39;. The `halt&#39; command could poweroff th=
e system<br>
in sysvinit images but it only could halt the system in systemd images.<br>
The difference is due to the different implementations of the `halt&#39; co=
mmand.<br>
<br>
In sysvinit, the `halt&#39; command will effective execute `/sbin/init 0&#3=
9;. This<br>
is for the compatibility with sysvinit 2.4, as stated in the comments of th=
e<br>
source code. In systemd, the `halt&#39; command will effectively execute th=
e<br>
reboot(RB_HATL_SYSTEM).<br>
<br>
As the &#39;shutdown&#39; icon is expected to actually shutdown the system,=
 we should<br>
use poweroff instead of halt for its Exec field.<br>
<br>
[YOCTO #4347]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Ota=
vio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystem=
s.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e013c71e47f899504f000c079--
