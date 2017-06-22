Return-Path: <avery.brian@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1F31B77E7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 14:57:12 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id f127so8839064pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RYKJ2NVOosCJJI1mBVYnWIMNT8LP5jKMBb1VXXvtan8=;
	b=sM+CoJ0beFa57AsxXJ8eXQ23uRtAvjuGy0Ce8jEYu6vStHHOO9PQBiKtgLQy3CBND3
	PkIBuigyXRNjzSzeFERmEV8FMwBmWTLG6AUNn5C9DAUbSdeA/JIYLkMBOaPULyZ+uiE1
	k7BvgtJ+81vHB+wbzTVKL6ZAhp75IFeCSF4C1o1LCq+bbVbBT1XzaZh9Q9BIb/sEw/SC
	8VIANugazfCwcmUcWPNxFT9reCCVmgrrAIJESPzjueIBiu4LWtIfBib0s07lKaVJlMCK
	d8LPt1w5E8HPAvxSd7mOEvFDYwcfrzYz3dzPgc+Cj7gl52qGGxF1dvFdUcMwnU+qAFcb
	61JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RYKJ2NVOosCJJI1mBVYnWIMNT8LP5jKMBb1VXXvtan8=;
	b=fIQCX7/gnpHEQ07g7IhP3GfzKSTKyDQY3qGwNU2pultEHel+RPBMuWkkegY03IeDDI
	IasATdCtJ5hFJUxjaG3+N/u6RFGfedKKcGUwqQ8Jx6xna7fUgDpIBAvj/68VNQuN/pMm
	kg9SjuPwXsceTX35dQcyvb22wmtSjwoXQCivS5Sv1DWPTKTl+K49eyy05zeq0OP50yEU
	HYF0CW88/0Dxya38vHBWoNiXvQi5wGohv2CI5ZvTky4jm8P9Yamv1LJZfMD0TBteUzXe
	O+aNA/VzA7UGHLbCjjHv1GlhI76NcYU1qIVo6uG5FNS0ahCAV6miy6NH8Xcs0S0PKK9+
	1kqw==
X-Gm-Message-State: AKS2vOwmBurm/twEHCu+JHumQPvjGuGSYk2vI8kzmF8y9dAIGam9mgom
	e+3rtKO1B4td3jBWvu2f0/linZUHTQ==
X-Received: by 10.98.75.79 with SMTP id y76mr3043514pfa.39.1498143433745; Thu,
	22 Jun 2017 07:57:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.130.201 with HTTP; Thu, 22 Jun 2017 07:57:13 -0700 (PDT)
In-Reply-To: <8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
References: <cover.1498120161.git.liezhi.yang@windriver.com>
	<8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Thu, 22 Jun 2017 07:57:13 -0700
Message-ID: <CAKV_0eho-_vpFMb9m9swD7R19y=TNJBOWKu8B43P1dDsAwfYmw@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Jun 2017 14:57:14 -0000
Content-Type: multipart/alternative; boundary="001a1135dd1230e84605528db359"

--001a1135dd1230e84605528db359
Content-Type: text/plain; charset="UTF-8"

looks good 2 me!
ty,
b
an intel employee

On Thu, Jun 22, 2017 at 1:30 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The following commit has removed rpc ports from runqemu-export-rootfs, so
> runqemu should also remove them, otherwise "runqemu nfs" doesn't work. And
> use
> abspath for nfsroot, otherwise it doesn't work when it is a relative path.
>
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

--001a1135dd1230e84605528db359
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">looks good 2 me!<div>ty,</div><div>b=C2=A0</div><div>an in=
tel employee</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Thu, Jun 22, 2017 at 1:30 AM, Robert Yang <span dir=3D"ltr">&lt;<=
a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The fo=
llowing commit has removed rpc ports from runqemu-export-rootfs, so<br>
runqemu should also remove them, otherwise &quot;runqemu nfs&quot; doesn&#3=
9;t work. And use<br>
abspath for nfsroot, otherwise it doesn&#39;t work when it is a relative pa=
th.<br>
<br>
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
</div></div></blockquote></div><br></div>

--001a1135dd1230e84605528db359--
