Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id A373D7822B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:07:41 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id u12so14128168qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PIx4g+IGZlmie4pInZGgQlWI1Pd7lXX0KwDIj766jsY=;
	b=puJCksJ/f6uxsEHR1A8ASsxoeOShuAcppXcf4cW9iv95feVv4d28l90aTcU2jgkX2x
	przGPEXpqfIYEBCUeZYixyhPFxoocYHb350nwugMQN+Cra4Q5N3xP35sc/2DWzpmag3n
	39sp81cbYvQHjHY+sEFkFAYrKkhr6BZaSXKxAYzHZj94ahDLqQUEg5ZYBf8ggZu0yVO+
	Y61YoeV4yFsDex3/mZaSLL/yw3LHlBagMzfY2jxZEVul2IDMZu2lM4q41ZauORm5GjNz
	hxmMbidPJ8XLzwT/vsz8pn6nuAWwA/8xEM9gMc0fB0NI4ZzI5tGMaikqaIU7cp8tV9Ks
	PYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PIx4g+IGZlmie4pInZGgQlWI1Pd7lXX0KwDIj766jsY=;
	b=uTCCAoib64V/udUTfl5Cz+2zidAVF+uzItI6xXzqPQaKCbQ+0BIECP0e9aSOFNbUwc
	RWxNmkECNzPZVzdW0kvzaDrOpGv1XHNZFJO8BEiYMowLg3KC8iE9fgaE5rtZUGYAWg8A
	VBSsddNBdeNClT1I6XIVbFC0HOyIwBaDWT38NeCSKSR1n7L9I5aKtXkDUdThc42KTx/0
	P/hMtbyfySwxvmVsbr9bAQehp3nlD5PQPVHQPS7nJ7NmgbXTpC9cGSF+fESoWc61v69u
	bhOCPoCpTIGUKYnZOttHD7RNb+EEszav9n6BLcBMyDnexsUUjCo3jCe1veNnRu7NahuX
	8jLw==
X-Gm-Message-State: AKS2vOxPY8UxCmaxHEIFaPK+yLa2FAZzy4wqkYAesfk4Pxi/JbfBzpB+
	5RK6vskpKwfsH899QaSrtziV5zH5Vg==
X-Received: by 10.237.49.41 with SMTP id 38mr3453535qtg.161.1498144062607;
	Thu, 22 Jun 2017 08:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.172 with HTTP; Thu, 22 Jun 2017 08:07:42 -0700 (PDT)
In-Reply-To: <8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
References: <cover.1498120161.git.liezhi.yang@windriver.com>
	<8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Jun 2017 11:07:42 -0400
Message-ID: <CADkTA4M7BXya=y=WgsBwAKahTwR1esPSv2u+Zz-wT_GhjgfQSw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu: drop RPC ports
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
X-List-Received-Date: Thu, 22 Jun 2017 15:07:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c955cac9de505528dd843"

--94eb2c0c955cac9de505528dd843
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 22, 2017 at 4:30 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The following commit has removed rpc ports from runqemu-export-rootfs, so
> runqemu should also remove them, otherwise "runqemu nfs" doesn't work. And
> use
> abspath for nfsroot, otherwise it doesn't work when it is a relative path.
>
>
That change in question was discussed on list and was supposed to be
optional.

Can you confirm that a non-root user can still do a NFS root with both of
these changes applied ?

Bruce


> commit 6bb9860ef7ba9c84fe9bd3a81aa6555f67ebd38e
> Author: Cody P Schafer <dev@codyps.com>
> Date:   Tue Jun 6 18:30:49 2017 -0400
>
>     runqemu-export-rootfs: don't change RPC ports
>
> [YOCTO #11687]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/runqemu | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 26328e5b512..41b870c9f7c 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -784,16 +784,12 @@ class BaseConfig(object):
>              all_instances.sort(key=int)
>              self.nfs_instance = int(all_instances.pop()) + 1
>
> -        mountd_rpcport = 21111 + self.nfs_instance
> -        nfsd_rpcport = 11111 + self.nfs_instance
>          nfsd_port = 3049 + 2 * self.nfs_instance
>          mountd_port = 3048 + 2 * self.nfs_instance
>
>          # Export vars for runqemu-export-rootfs
>          export_dict = {
>              'NFS_INSTANCE': self.nfs_instance,
> -            'MOUNTD_RPCPORT': mountd_rpcport,
> -            'NFSD_RPCPORT': nfsd_rpcport,
>              'NFSD_PORT': nfsd_port,
>              'MOUNTD_PORT': mountd_port,
>          }
> @@ -801,7 +797,7 @@ class BaseConfig(object):
>              # Use '%s' since they are integers
>              os.putenv(k, '%s' % v)
>
> -        self.unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s"
> % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
> +        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" %
> (nfsd_port, mountd_port)
>
>          # Extract .tar.bz2 or .tar.bz if no nfs dir
>          if not (self.rootfs and os.path.isdir(self.rootfs)):
> @@ -1006,7 +1002,7 @@ class BaseConfig(object):
>
>          if self.fstype == 'nfs':
>              self.rootfs_options = ''
> -            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
> self.rootfs, self.unfs_opts)
> +            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
> os.path.abspath(self.rootfs), self.unfs_opts)
>              self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>
>          if self.fstype == 'none':
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0c955cac9de505528dd843
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 22, 2017 at 4:30 AM, Robert Yang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The foll=
owing commit has removed rpc ports from runqemu-export-rootfs, so<br>
runqemu should also remove them, otherwise &quot;runqemu nfs&quot; doesn&#3=
9;t work. And use<br>
abspath for nfsroot, otherwise it doesn&#39;t work when it is a relative pa=
th.<br>
<br></blockquote><div><br></div><div>That change in question was discussed =
on list and was supposed to be optional.</div><div><br></div><div>Can you c=
onfirm that a non-root user can still do a NFS root with both of these chan=
ges applied ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
commit 6bb9860ef7ba9c84fe9bd3a81aa655<wbr>5f67ebd38e<br>
Author: Cody P Schafer &lt;<a href=3D"mailto:dev@codyps.com">dev@codyps.com=
</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Jun 6 18:30:49 2017 -0400<br>
<br>
=C2=A0 =C2=A0 runqemu-export-rootfs: don&#39;t change RPC ports<br>
<br>
[YOCTO #11687]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0scripts/runqemu | 8 ++------<br>
=C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
<br>
</span>diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 26328e5b512..41b870c9f7c 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -784,16 +784,12 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_instances.sort(key=3Din=
t)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.nfs_instance =3D int(a=
ll_instances.pop()) + 1<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mountd_rpcport =3D 21111 + self.nfs_instance<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nfsd_rpcport =3D 11111 + self.nfs_instance<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfsd_port =3D 3049 + 2 * self.nfs_instanc=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mountd_port =3D 3048 + 2 * self.nfs_insta=
nce<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Export vars for runqemu-export-rootfs<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export_dict =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;NFS_INSTANCE&#39;: sel=
f.nfs_instance,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;MOUNTD_RPCPORT&#39;: mountd=
_rpcport,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;NFSD_RPCPORT&#39;: nfsd_rpc=
port,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;NFSD_PORT&#39;: nfsd_p=
ort,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;MOUNTD_PORT&#39;: moun=
td_port,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -801,7 +797,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Use &#39;%s&#39; since th=
ey are integers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.putenv(k, &#39;%s&#39; %=
 v)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.unfs_opts=3D&quot;nfsvers=3D3,<wbr>port=
=3D%s,mountprog=3D%s,nfsprog=3D%<wbr>s,udp,mountport=3D%s&quot; % (nfsd_por=
t, mountd_rpcport, nfsd_rpcport, mountd_port)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.unfs_opts=3D&quot;nfsvers=3D3,<wbr>port=
=3D%s,udp,mountport=3D%s&quot; % (nfsd_port, mountd_port)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Extract .tar.bz2 or .<a href=3D"http://=
tar.bz" rel=3D"noreferrer" target=3D"_blank">tar.bz</a> if no nfs dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not (self.rootfs and os.path.isdir(sel=
f.rootfs)):<br>
@@ -1006,7 +1002,7 @@ class BaseConfig(object):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.fstype =3D=3D &#39;nfs&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rootfs_options =3D &#3=
9;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_root =3D &#39;/dev/nfs nfsroot=
=3D%s:%s,%s&#39; % (self.nfs_server, self.rootfs, self.unfs_opts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_root =3D &#39;/dev/nfs nfsroot=
=3D%s:%s,%s&#39; % (self.nfs_server, os.path.abspath(self.rootfs), self.unf=
s_opts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_cmdline =3D &#3=
9;root=3D%s rw highres=3Doff&#39; % k_root<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.fstype =3D=3D &#39;none&#39;:<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c0c955cac9de505528dd843--
