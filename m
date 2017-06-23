Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1A65860670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 03:52:20 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id p21so27305401qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 20:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=38Xs8ZtXjTM/NWVBnx6eHhdx+8S2sJUgGQsDNq7Mz3A=;
	b=iFQrSfYxGcoTkNnGrrkTB315jYOo4V1Ut4jC08IfwF5E5pLoFzYiYPds5JNDDUjO32
	2miuEX4SgNx3KMynNanhj7y+01h8qAbrR4sIjA9r4HREBH+w/NiaCttuBa7MJ+uyiBU1
	gMSbFZ2bkhUQrRAAKMERAZWFd80YXm4BXzk2j1NZDzmCGECZ6PVOcCP47KJXngYwFnGh
	OlLoxLhFgp2nFonDVTxxnMjlE8X/k3gHYvYUtwOAxvBnUWReOElS4NPZv2lIDf19iLpa
	hjN+rqFYWHJsveBPjwKMMZYfCYeRvvq09ChdWTtHhHCewAQ99LWhc0DppA5bm6C0kBkg
	2Bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=38Xs8ZtXjTM/NWVBnx6eHhdx+8S2sJUgGQsDNq7Mz3A=;
	b=Uoi0QQc7rgou43ZdsSltsgYbC1yCt77K9kzndXBT7IvcmhxSm5zOQuQiPW6WC6jBo0
	eZD3eKRth1II3j4DVh7+q9Cyt0u5y/aG4jZIfmJAn0MERzo8C7sPkBEorG+fUPjzqQLc
	l7tUAzgp+iUr+CSwiYHWN2NvTCjnEckcSIA5UouJQ/+u8T+ge3soPwWrMcz7frzT3T4m
	1sptzryD9Pve3DfPnFSvunpVuDJvyyTBuqUb4czhzgElb+bT0bG9VKHHpc+e4ISEocb3
	3AW4gzDUfX7XRv4O/S0+26IzhqM8Ig2GNKEqvnymh7jiNd7dvTjW0NwpjjhY+G80FEQ8
	eMxw==
X-Gm-Message-State: AKS2vOxuJ3Luppj/+wl5lRbRDvW/f7B0R6m9mXpqxcTFLFUO14m6mfei
	bYLIBMCSO24FOVEuYF9jztXx5TAgRA==
X-Received: by 10.55.70.69 with SMTP id t66mr6947893qka.147.1498189941631;
	Thu, 22 Jun 2017 20:52:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.172 with HTTP; Thu, 22 Jun 2017 20:52:21 -0700 (PDT)
In-Reply-To: <4fddad5f-f731-9601-46f5-554126757532@windriver.com>
References: <cover.1498120161.git.liezhi.yang@windriver.com>
	<8134a5ecf72045c33cdfc80a0b647aee7674035e.1498120161.git.liezhi.yang@windriver.com>
	<CADkTA4M7BXya=y=WgsBwAKahTwR1esPSv2u+Zz-wT_GhjgfQSw@mail.gmail.com>
	<4fddad5f-f731-9601-46f5-554126757532@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Jun 2017 23:52:21 -0400
Message-ID: <CADkTA4NM-tCe23QpgfF6krXvxcXfayTc7ZFvofxu9GkUcxTLNg@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Jun 2017 03:52:21 -0000
Content-Type: multipart/alternative; boundary="001a114abc5246f2400552988796"

--001a114abc5246f2400552988796
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 22, 2017 at 9:48 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 06/22/2017 11:07 PM, Bruce Ashfield wrote:
>
>>
>>
>> On Thu, Jun 22, 2017 at 4:30 AM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     The following commit has removed rpc ports from
>> runqemu-export-rootfs, so
>>     runqemu should also remove them, otherwise "runqemu nfs" doesn't
>> work. And use
>>     abspath for nfsroot, otherwise it doesn't work when it is a relative
>> path.
>>
>>
>> That change in question was discussed on list and was supposed to be
>> optional.
>>
>> Can you confirm that a non-root user can still do a NFS root with both of
>> these
>> changes applied ?
>>
>
> The runqemu-export-rootfs uses UNFS, no root privilege is required, I can
> confirm that both "runqemu slirp nfs" and "runqemu nfs" work well, so I
> assume
> the answer is yes.
>

Yes, that's good enough to confirm the old functionality. As long as
non-privileged ports can be used, we should be fine.

Bruce


>
> // Robert
>
>
>> Bruce
>>
>>
>>     commit 6bb9860ef7ba9c84fe9bd3a81aa6555f67ebd38e
>>     Author: Cody P Schafer <dev@codyps.com <mailto:dev@codyps.com>>
>>     Date:   Tue Jun 6 18:30:49 2017 -0400
>>
>>         runqemu-export-rootfs: don't change RPC ports
>>
>>     [YOCTO #11687]
>>
>>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>>     <mailto:liezhi.yang@windriver.com>>
>>
>>     ---
>>      scripts/runqemu | 8 ++------
>>      1 file changed, 2 insertions(+), 6 deletions(-)
>>
>>     diff --git a/scripts/runqemu b/scripts/runqemu
>>     index 26328e5b512..41b870c9f7c 100755
>>     --- a/scripts/runqemu
>>     +++ b/scripts/runqemu
>>     @@ -784,16 +784,12 @@ class BaseConfig(object):
>>                  all_instances.sort(key=int)
>>                  self.nfs_instance = int(all_instances.pop()) + 1
>>
>>     -        mountd_rpcport = 21111 + self.nfs_instance
>>     -        nfsd_rpcport = 11111 + self.nfs_instance
>>              nfsd_port = 3049 + 2 * self.nfs_instance
>>              mountd_port = 3048 + 2 * self.nfs_instance
>>
>>              # Export vars for runqemu-export-rootfs
>>              export_dict = {
>>                  'NFS_INSTANCE': self.nfs_instance,
>>     -            'MOUNTD_RPCPORT': mountd_rpcport,
>>     -            'NFSD_RPCPORT': nfsd_rpcport,
>>                  'NFSD_PORT': nfsd_port,
>>                  'MOUNTD_PORT': mountd_port,
>>              }
>>     @@ -801,7 +797,7 @@ class BaseConfig(object):
>>                  # Use '%s' since they are integers
>>                  os.putenv(k, '%s' % v)
>>
>>     -
>>     self.unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,
>> udp,mountport=%s"
>>     % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
>>     +        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" %
>> (nfsd_port,
>>     mountd_port)
>>
>>              # Extract .tar.bz2 or .tar.bz <http://tar.bz> if no nfs dir
>>              if not (self.rootfs and os.path.isdir(self.rootfs)):
>>     @@ -1006,7 +1002,7 @@ class BaseConfig(object):
>>
>>              if self.fstype == 'nfs':
>>                  self.rootfs_options = ''
>>     -            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
>>     self.rootfs, self.unfs_opts)
>>     +            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
>>     os.path.abspath(self.rootfs), self.unfs_opts)
>>                  self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>>
>>              if self.fstype == 'none':
>>     --
>>     2.11.0
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its
>> end"
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114abc5246f2400552988796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 22, 2017 at 9:48 PM, Robert Yang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D""><br>
<br>
On 06/22/2017 11:07 PM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Thu, Jun 22, 2017 at 4:30 AM, Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></spa=
n><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.<wbr>com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 The following commit has removed rpc ports from runqemu-expor=
t-rootfs, so<br>
=C2=A0 =C2=A0 runqemu should also remove them, otherwise &quot;runqemu nfs&=
quot; doesn&#39;t work. And use<br>
=C2=A0 =C2=A0 abspath for nfsroot, otherwise it doesn&#39;t work when it is=
 a relative path.<br>
<br>
<br>
That change in question was discussed on list and was supposed to be option=
al.<br>
<br>
Can you confirm that a non-root user can still do a NFS root with both of t=
hese<br>
changes applied ?<br>
</span></blockquote>
<br>
The runqemu-export-rootfs uses UNFS, no root privilege is required, I can c=
onfirm that both &quot;runqemu slirp nfs&quot; and &quot;runqemu nfs&quot; =
work well, so I assume<br>
the answer is yes.<br></blockquote><div><br></div><div>Yes, that&#39;s good=
 enough to confirm the old functionality. As long as non-privileged ports c=
an be used, we should be fine.</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 commit 6bb9860ef7ba9c84fe9bd3a81aa655<wbr>5f67ebd38e<br>
=C2=A0 =C2=A0 Author: Cody P Schafer &lt;<a href=3D"mailto:dev@codyps.com" =
target=3D"_blank">dev@codyps.com</a> &lt;mailto:<a href=3D"mailto:dev@codyp=
s.com" target=3D"_blank">dev@codyps.com</a>&gt;&gt;<span class=3D""><br>
=C2=A0 =C2=A0 Date:=C2=A0 =C2=A0Tue Jun 6 18:30:49 2017 -0400<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 runqemu-export-rootfs: don&#39;t change RPC por=
ts<br>
<br>
=C2=A0 =C2=A0 [YOCTO #11687]<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@=
windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" targe=
t=3D"_blank">liezhi.yang@windriver.<wbr>com</a>&gt;&gt;<div><div class=3D"h=
5"><br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0scripts/runqemu | 8 ++------<br>
=C2=A0 =C2=A0 =C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/scripts/runqemu b/scripts/runqemu<br>
=C2=A0 =C2=A0 index 26328e5b512..41b870c9f7c 100755<br>
=C2=A0 =C2=A0 --- a/scripts/runqemu<br>
=C2=A0 =C2=A0 +++ b/scripts/runqemu<br>
=C2=A0 =C2=A0 @@ -784,16 +784,12 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_instances=
.sort(key=3Dint)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.nfs_inst=
ance =3D int(all_instances.pop()) + 1<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mountd_rpcport =3D 21111 + self.=
nfs_instance<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 nfsd_rpcport =3D 11111 + self.nf=
s_instance<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfsd_port =3D 3049 + 2 * se=
lf.nfs_instance<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mountd_port =3D 3048 + 2 * =
self.nfs_instance<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Export vars for runqemu-e=
xport-rootfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export_dict =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;NFS_INST=
ANCE&#39;: self.nfs_instance,<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;MOUNTD_RPCPOR=
T&#39;: mountd_rpcport,<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;NFSD_RPCPORT&=
#39;: nfsd_rpcport,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;NFSD_POR=
T&#39;: nfsd_port,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;MOUNTD_P=
ORT&#39;: mountd_port,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 @@ -801,7 +797,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Use &#39;%s=
&#39; since they are integers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.putenv(k, =
&#39;%s&#39; % v)<br>
<br>
=C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 self.unfs_opts=3D&quot;nfsvers=3D3,port<wbr>=3D%s,mountprog=
=3D%s,nfsprog=3D%s,<wbr>udp,mountport=3D%s&quot;<br>
=C2=A0 =C2=A0 % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.unfs_opts=3D&quot;nfsvers=
=3D3,port<wbr>=3D%s,udp,mountport=3D%s&quot; % (nfsd_port,<br>
=C2=A0 =C2=A0 mountd_port)<br>
<br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Extract .tar.bz2 or .<a h=
ref=3D"http://tar.bz" rel=3D"noreferrer" target=3D"_blank">tar.bz</a> &lt;<=
a href=3D"http://tar.bz" rel=3D"noreferrer" target=3D"_blank">http://tar.bz=
</a>&gt; if no nfs dir<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not (self.rootfs and os.=
path.isdir(self.rootfs)):<br>
=C2=A0 =C2=A0 @@ -1006,7 +1002,7 @@ class BaseConfig(object):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.fstype =3D=3D &#39;=
nfs&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rootfs_o=
ptions =3D &#39;&#39;<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_root =3D &#39;/d=
ev/nfs nfsroot=3D%s:%s,%s&#39; % (self.nfs_server,<br>
=C2=A0 =C2=A0 self.rootfs, self.unfs_opts)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_root =3D &#39;/d=
ev/nfs nfsroot=3D%s:%s,%s&#39; % (self.nfs_server,<br>
=C2=A0 =C2=A0 os.path.abspath(self.rootfs), self.unfs_opts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_c=
mdline =3D &#39;root=3D%s rw highres=3Doff&#39; % k_root<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.fstype =3D=3D &#39;=
none&#39;:<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.11.0<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 ______________________________<wbr>_________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br></spa=
n>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@list<wbr>s.openembedded.org</=
a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><span class=3D""><b=
r>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org<wbr>/mailman/listinfo/openembedded<wbr>-core</a>&gt;<br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its<br>
end&quot;<br>
</span></blockquote>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a114abc5246f2400552988796--
