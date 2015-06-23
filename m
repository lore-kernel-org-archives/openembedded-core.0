Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6754575A1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 10:57:21 +0000 (UTC)
Received: by igboe5 with SMTP id oe5so85533567igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 03:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Q4ZqC755vdBi0Y5eRxtuAgo4g6EU4Uz84aa7qZ/CAAs=;
	b=C/JF1Rxvw0svcDUw9AL/xe5dWv7aN9tnl0mWz4sgA8fUcBwEYNH7fCSLUzPzd1SJlj
	Ev/T2kAmJHxPO9Xq1OcUOqTmyuhDZXOm3SvXvA9G0kY8kdtYK5JnrJtC5bQ5LHEI2hit
	9oH+LLic23raLuD5M/9qWX++AFT+bv414gBH8YqqyWKjSGC5mCu5sId9JVfIQ2cjkWTb
	DGjUeqOg/EQpjPkPU8IfJ8DQlgflPwO6POExNdb4ukXxmJ0jCFBjzkFkIpYwb61YwDlY
	hXl9p9KAJuQHmZqq4j1mBTmfbtosZbQUfkPtAmQeh+l3S1yHrmbMAlq3i3OFdO/4+Nr1
	5grQ==
X-Gm-Message-State: ALoCoQmGrESY0l9NRWHBe6WPybS98xcVR+fu2eS0kGvkBbRx2y1Bz/aHjaWcsux+yVlSLUmsDGzU
MIME-Version: 1.0
X-Received: by 10.50.44.99 with SMTP id d3mr1350513igm.10.1435057042841; Tue,
	23 Jun 2015 03:57:22 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Tue, 23 Jun 2015 03:57:22 -0700 (PDT)
In-Reply-To: <1434451710-2526-2-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
	<1434451710-2526-2-git-send-email-jkrishnanjanappa@mvista.com>
Date: Tue, 23 Jun 2015 16:27:22 +0530
Message-ID: <CAD3vsf7A9sHrP_A09xXqH2vn-KE-GTvO_QhW1Ok13E9t3SjgBA@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][fido 2/4] runqemu-script: define console for qemuarm NFS booting
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
X-List-Received-Date: Tue, 23 Jun 2015 10:57:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f83943145812605192d41d9

--e89a8f83943145812605192d41d9
Content-Type: text/plain; charset=UTF-8

ping.

Regards,
Jagadeesh

On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Add console=ttyAMA0,115200 as one of the boot parameters
> for qemuarm, in order to print bootlog messages on the
> console.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 2db5566..dc0e053 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -368,7 +368,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" =
> "qemuarmv6" -o "$MACHINE" = "qemuarm
>              cleanup
>              return 1
>          fi
> -        KERNCMDLINE="root=/dev/nfs
> nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD
> mem=$QEMU_MEMORY"
> +        KERNCMDLINE="root=/dev/nfs
> nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200
> $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>          QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot
> $QEMU_UI_OPTIONS"
>      fi
>      if [ "$MACHINE" = "qemuarmv6" ]; then
> --
> 1.9.1
>
>

--e89a8f83943145812605192d41d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ping.</div><div><br></div><div>Regards,</div><div>Jag=
adeesh</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkr=
ishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Add console=3DttyAMA0,115200 as one of the boot parameters<br>
for qemuarm, in order to print bootlog messages on the<br>
console.<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu-internal | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<br>
index 2db5566..dc0e053 100755<br>
--- a/scripts/runqemu-internal<br>
+++ b/scripts/runqemu-internal<br>
@@ -368,7 +368,7 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemuarm&quot; -o &q=
uot;$MACHINE&quot; =3D &quot;qemuarmv6&quot; -o &quot;$MACHINE&quot; =3D &q=
uot;qemuarm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/nfs nfsroot=3D=
$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/nfs nfsroot=3D=
$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=3DttyAMA0,115200 $KERNEL_NETWORK=
_CMD mem=3D$QEMU_MEMORY&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD -M =
${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemuarmv6&quot; ]; =
then<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--e89a8f83943145812605192d41d9--
