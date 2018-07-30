Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 134B578D72;
	Mon, 30 Jul 2018 14:10:42 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id c135-v6so4396291ywa.0;
	Mon, 30 Jul 2018 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8LpxwTBRv8Kxd6+j91srYhpM+h3cOKozWlvKYuvawwU=;
	b=VeizvjQT+DcWW6tvDwX/NPv4uIVV4r0XoiLqaJgfNWDoSE6L8KmlGrftOaZN1yO5Px
	RsNahuyOsdl/e635Rn10oq6yT+oK8oy3z7HclbixT2M16ih+lRSJC3xUVV8nYVkxpJ0x
	kYI7mERG4Oo9yp6zK9Yv7cClDqTAYgkffcfMYDniEVJlUvpewPRtTH7fHq/tbbogB2oj
	GtoZX1OpPGN5vAVUx7uFKNWMBsgwov/xViRqMCduW2Tcu6Gc5jtWG63wk8fagJSuEMNo
	abFzwjHSG9nzbkAp4FVasQ5UfPBlvEIoIFVOc5zUvt6t6qPjW0SsjDTVsnE1PeE7o8vc
	rYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8LpxwTBRv8Kxd6+j91srYhpM+h3cOKozWlvKYuvawwU=;
	b=twKZ+GS+uuJBM8sXGzoGRGep8LD/ZGxwpLoMewORqoVjv7sZ1MAOwmkpNW6bkMBT8H
	uVEoYuc73UO0wLmimRemFTQW/jhd7+HLpAddE/P4+XePdKYdYwEVBYt+U41SaUsCimsM
	TsN+VJNVf6DwYE+/Ha4UMwHFrDKVQGwPGCsdMFZH4E0BAigr3aG+cPMW/pl7MZ7zD8yX
	+dzAp8srCfpiH1+AkRUKlDFURQTWjfC1ZdBbUDgGuBOVbbWW8xh0LGQzVhyWreAd0fVR
	hSArKkD4NyrSdfdOTJTRDnfgCEGfCJgCFhzW50KmHWOZ0jq6O1RMGfdeiSVQMrDoA8rc
	8Exw==
X-Gm-Message-State: AOUpUlFdBckRbRdCMA3a1sZjDLA84exdggr6XvX3ezLhF/hwnjPiSfWH
	Pt2ZLKonSKhRPtb8HLpNo8H+Vmvc6Lx6aDwmxR4=
X-Google-Smtp-Source: AAOMgpeGZYT7jRDYU3sjx24ZJrdyNZqz0MeGEqzqRgO4rRR6xBrtQdHvmBjUArI4xdf74ua8IEHA5AbXwrpAHWF+lK8=
X-Received: by 2002:a81:a692:: with SMTP id
	d140-v6mr8740327ywh.50.1532959843650; 
	Mon, 30 Jul 2018 07:10:43 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 30 Jul 2018 10:10:32 -0400
Message-ID: <CAFeBWL4qPSzB=o8BicxhpW-xwi4BQhBFQPuajx5A0GA=X=znYg@mail.gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: devtool add recipe with no srctree / fetchuri?
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
X-List-Received-Date: Mon, 30 Jul 2018 14:10:43 -0000
Content-Type: multipart/alternative; boundary="000000000000ef94580572380677"

--000000000000ef94580572380677
Content-Type: text/plain; charset="UTF-8"

Is it possible to run 'devtool add [recipe-name]' without 'srctree' or
'fetchuri'?
I just want to add a simple recipe with a few files to be installed on the
target file system.
I can directly add a file in my meta-layer, but devtool is probably the
more correct approach.

Adam

--000000000000ef94580572380677
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it possible to run &#39;devtool add [recipe-name]&#39; =
without &#39;srctree&#39; or &#39;fetchuri&#39;?<div>I just want to add a s=
imple recipe with a few files to be installed on the target file system.</d=
iv><div>I can directly add a file in my meta-layer, but devtool is probably=
 the more correct approach.</div><div><br></div><div>Adam</div></div>

--000000000000ef94580572380677--
