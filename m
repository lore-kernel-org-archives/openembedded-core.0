Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1C28677FC3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:10:31 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id o200so3169340itg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t8I6L/MJVdbgpbOMX/b8IdJf7mVoeqD84nCNa1Q1evg=;
	b=qJ6NM6/JjvY+84UyYxmupjoUydN3zQ3akPUgDge/6sZKYuQEqMPIt0Kk2nhgIhkbXZ
	gRUqo0Guur80hdWfrOT+Rd9djgJTUMq7T5sA69hGZL6W7IjjLy8d0uQXMKposzFGQXFa
	tPuPgAtu+mqBRGbxCe8EK13qj0HpqllZT/umPRwpHcRnMooOUC0L8aRKiHb9ySQ+OypX
	/nxRIAq8wFo2tqmwM+h5+B3+CzGz+8dWi8QBsnE/GKasvmOuFxeOXvIBvT+TcWpXd65q
	9Rwi2jo1JJSQSWBD42vYeuRWaLCFvfWwzoHJPEC9DuQa/WSIZkWTxd1sT/YfcZiQAvvl
	noIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t8I6L/MJVdbgpbOMX/b8IdJf7mVoeqD84nCNa1Q1evg=;
	b=DbB+mzjzrVTt24k5T5PDepz49c1VFGEPgPOzLePWwzQvbvRy1LE14Zu0t2qN+68Wj4
	TXBaddI637ROEl6q+2VPGJAvvawu8N2FUSSyIkDdjHIqdeBc/8G9Y9tAI3Cz1wZk57s2
	fCAf2ZlnfHpoPDr7gwXcIzEImk5jpyRs5jLsls21v1ZbgjihC/jVgLWOxt6Vm2KJZB94
	lSqItLBoUU/16ASVGQRDz47KVp0feWIlYAytbIWShaRPfqkYFZqWkc0yzGFJ+uJ+uDdR
	RGRQcnwEmCJV9Uq3aUrspXt9ma4XeEjrxxodpS5msQ7mV4UroLdxaHC2jXqKAgSdAhDO
	jqKg==
X-Gm-Message-State: AHPjjUgQ/bewR1QKC59QiEKnFhn09bq+LSCtxWvrf00bc9dd8G9noqDC
	l7ICnThxFayJIBETSmApIAcWdpPjF/bw8XcIXzpmwQ==
X-Google-Smtp-Source: AOwi7QBBmcHreIGIFHbvbGuTPJnd6Xm8slvXruFAs70LTPXYgvr/KkqFdt9MT7Gm2Up1yNEKvL0K1G86NlAu7tb81lI=
X-Received: by 10.36.181.73 with SMTP id j9mr3088411iti.6.1505916633301; Wed,
	20 Sep 2017 07:10:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 20 Sep 2017 07:10:12 -0700 (PDT)
In-Reply-To: <CABOv41NESoPK31WsMaswqVo-4ij=Q-=vUxnb5RLdzd87-D=P+A@mail.gmail.com>
References: <CABOv41NESoPK31WsMaswqVo-4ij=Q-=vUxnb5RLdzd87-D=P+A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Sep 2017 15:10:12 +0100
Message-ID: <CAJTo0LYYMz62D5GOpj6kxx3FAfUm=rJ47gND4qT-VgSobBTsUg@mail.gmail.com>
To: Gerson Fernando Budke <nandojve@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: File with a Windows line ending
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
X-List-Received-Date: Wed, 20 Sep 2017 14:10:32 -0000
Content-Type: multipart/alternative; boundary="f403045d9e42fd7e5405599f896a"

--f403045d9e42fd7e5405599f896a
Content-Type: text/plain; charset="UTF-8"

On 20 September 2017 at 15:08, Gerson Fernando Budke <nandojve@gmail.com>
wrote:

> I don't know if is important but I'm reporting anyway
>
> remote: error: found carriage return (CR) character in file:
> meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
> To ssh://gerrit.intelbras.com.br/yocto/openembedded/openembedded-core
>  ! [remote rejected] master -> master (contains files with a Windows line
> ending)
> error: failed to push some refs to 'ssh://gerrit.intelbras.com.
> br/yocto/openembedded/openembedded-core'
> fatal: remote error: access denied or repository not exported:
> /openembedded-core
>

That file has CRs in because the file it is patching has CRs in.  Your
gerrit server needs to be less strict.

Ross

--f403045d9e42fd7e5405599f896a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 September 2017 at 15:08, Gerson Fernando Budke <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:nandojve@gmail.com" target=3D"_blank">na=
ndojve@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I don&=
#39;t know if is important but I&#39;m reporting anyway<br><br>remote: erro=
r: found carriage return (CR) character in file: meta/recipes-core/ovmf/ovm=
f/<wbr>0004-ovmf-enable-long-path-<wbr>file.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>To ssh://<a href=3D"http://gerrit.intelbras.com.br/yocto/openembedde=
d/openembedded-core" target=3D"_blank">gerrit.intelbras.com.br/<wbr>yocto/o=
penembedded/<wbr>openembedded-core</a><br>=C2=A0! [remote rejected] master =
-&gt; master (contains files with a Windows line ending)<br>error: failed t=
o push some refs to &#39;ssh://<a href=3D"http://gerrit.intelbras.com.br/yo=
cto/openembedded/openembedded-core" target=3D"_blank">gerrit.intelbras.com.=
<wbr>br/yocto/openembedded/<wbr>openembedded-core</a>&#39;<br>fatal: remote=
 error: access denied or repository not exported: /openembedded-core</div><=
/blockquote><div><br></div><div>That file has CRs in because the file it is=
 patching has CRs in.=C2=A0 Your gerrit server needs to be less strict.</di=
v><div><br></div><div>Ross</div></div></div></div>

--f403045d9e42fd7e5405599f896a--
