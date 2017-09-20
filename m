Return-Path: <nandojve@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id DC2BC77EAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:08:01 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id s62so1972783ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GqkDc4mZKSGDvrARFKzDi4li0W7KSrjm8u6x8o3mMG0=;
	b=VhacexrlgsGZxXF74a46sFoCWuPpVVq/VjYi2YmZw7zl7jW0UYYewIJP0cLlWpnRkh
	8yahD2LcIrG0LgQe5zf46eZUNnJVtBIKPkINBk+lUb0b3DfeeLf5PVLyiAYVs+4Ut+T8
	ma3sHlBQrmLOE5/A5awUpm19REC+B6GEQoWGtT4Za1ybY5SR5nFDXkZJNZVYFTeiEAMj
	tWLIHKjuHqswxtbAUvpYnx2lHg4hfWLqsh7G3H/WLrY5HGTj9tsmYMJs4Ixw87+NJ/uJ
	kojC2QOlInkz+2wpfC/O/Ny+HW3YXIgQuqbnyzXITDjRrRu1DtnxI2WhXpIROGXDkBGG
	Bk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GqkDc4mZKSGDvrARFKzDi4li0W7KSrjm8u6x8o3mMG0=;
	b=qgWvdwmVm0F8cKt1XCNUAjGPyqQIrsbc55ICTn/Kq559fOR3JtxBYzzHnWyLPamefJ
	FGL0GLkao4aZ3op6+iIdUhdC3Kj96xtQdsoNbtg8MEFYs9hyVoe2gHld1VvW/6T8aYnY
	vlZ1MbKhpcd5EHHol5+PSarETMkb8yRdL4XwN+ssLyzJ0Wc7dAhSGmqVqbdQ1vermnkX
	VFMfeApynr+6Jzf8z3M146GtMuU4dBLCI5jVMBf2+Qi4ETIyJx5EVrkIf0CTd7+dUWcb
	wbk+VB+aUBTZ98GdPBUlYAt2JOpaAXEH+sTuvH46nFw9i7upkA8+xwZTBYpgzc0oKgi+
	3i/A==
X-Gm-Message-State: AHPjjUglW57Kq01puzpzisKBvSskhfn7pqjkXwpa4FTBalDZQaf6hoaE
	rVJ6pYojkU1CoK3hlqcohEeG/Vy2p/hEAGp1KAwtnQ==
X-Google-Smtp-Source: AOwi7QDM7tuvHKu92uwfKCDvWR53XRAtVlYwdUhxuPYrfkpaVi9TUPFRxFQQZiaepqZGBHRjiFS5tVJUKEnyl1pHnAU=
X-Received: by 10.129.85.88 with SMTP id j85mr3986851ywb.214.1505916482474;
	Wed, 20 Sep 2017 07:08:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.197.84 with HTTP; Wed, 20 Sep 2017 07:08:01 -0700 (PDT)
From: Gerson Fernando Budke <nandojve@gmail.com>
Date: Wed, 20 Sep 2017 11:08:01 -0300
Message-ID: <CABOv41NESoPK31WsMaswqVo-4ij=Q-=vUxnb5RLdzd87-D=P+A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: File with a Windows line ending
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
X-List-Received-Date: Wed, 20 Sep 2017 14:08:02 -0000
Content-Type: multipart/alternative; boundary="001a113f27e6ffef8b05599f8043"

--001a113f27e6ffef8b05599f8043
Content-Type: text/plain; charset="UTF-8"

I don't know if is important but I'm reporting anyway

remote: error: found carriage return (CR) character in file:
meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
To ssh://gerrit.intelbras.com.br/yocto/openembedded/openembedded-core
 ! [remote rejected] master -> master (contains files with a Windows line
ending)
error: failed to push some refs to 'ssh://
gerrit.intelbras.com.br/yocto/openembedded/openembedded-core'
fatal: remote error: access denied or repository not exported:
/openembedded-core

Gerrit version:
Powered by Gerrit Code Review (2.14.2)

--001a113f27e6ffef8b05599f8043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know if is important but I&#39;m reporting any=
way<br><br>remote: error: found carriage return (CR) character in file: met=
a/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>To ssh://<a href=3D"http://gerrit.intelbras.com.br/yoc=
to/openembedded/openembedded-core">gerrit.intelbras.com.br/yocto/openembedd=
ed/openembedded-core</a><br>=C2=A0! [remote rejected] master -&gt; master (=
contains files with a Windows line ending)<br>error: failed to push some re=
fs to &#39;ssh://<a href=3D"http://gerrit.intelbras.com.br/yocto/openembedd=
ed/openembedded-core">gerrit.intelbras.com.br/yocto/openembedded/openembedd=
ed-core</a>&#39;<br>fatal: remote error: access denied or repository not ex=
ported: /openembedded-core<br><br>Gerrit version:<br>Powered by Gerrit Code=
 Review (2.14.2)<pre class=3D"gmail-console-output" style=3D"box-sizing:bor=
der-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bot=
tom:0px;color:rgb(51,51,51);font-size:15px"></pre></div>

--001a113f27e6ffef8b05599f8043--
