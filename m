Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF1E7807B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:32:38 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id k192so12047334ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PXE5es/5XTyCJDnOSwmPKgB0NShyrUBGtwM22+HJgCQ=;
	b=vkA2XO/Ou80y+5EVexCX6NOG+4EygF7YGdE+jAgXSUAXiQqQ92vMsdEKibDD01XiLr
	gLxKUs4bCZpTMTQJDmGYNgyBdwjK1J+WGenQOMmxaAtTY7AOxEQwzslmAWkWO87NeEkZ
	lLqRDT3irOTrW9L6CRn5ZIr+kJp1Ou1I84basIcs+CR7t53vfoPwdxwPQmsefKly5+iC
	by0eQVG2+OMBRMq/CPksvFZ3JQWZ7c1HDrI+ZbR6QX0vciwpxB45LNxT4waryk1TLtky
	3WouzJHlk8pltmgwDUXtAeRTtnJ1X9akVSkHU8b+jTo96rri1OZEOOyM3eZeBIMkplIH
	BqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PXE5es/5XTyCJDnOSwmPKgB0NShyrUBGtwM22+HJgCQ=;
	b=sobusf6O/3d21kybdRzqF/NKUorpH3ugihJaFKc/LMhrKVsJsn4QhNSQdr1ZFwJfP9
	bgtTiQFCyimJK+WMhjiZorVczBTG2bLmVsGx+vMgwLVrHqSQUsJOnSHjQ2oFiujsKW6K
	Mca3XyTLe2axgKWPF+e+350MD3QVSd9neZxqtpG8OTwMgPubrh5osyTkxKYaRGdIV95D
	CtnZd+saasLiy7iIl4/O55sIy7PVK944ms0DbNDtBmmIU9/h2M2OomdRrE6SwgdOb3SZ
	BAb/OVFVIG5T7ryYc5C91bNs+2TlBU/6vP8trll07rlh5o8w4qcLq87D6A1PJzxudtgl
	DojQ==
X-Gm-Message-State: AIVw111VtGgZ8hhUI95LYjfQqVBHejCkfHjveEE3UibU19cO+vM9H+0r
	Q6AAN3uPUu51qhDV/7zfixaRp9M5wYRe
X-Received: by 10.36.120.67 with SMTP id p64mr7992686itc.23.1499862759766;
	Wed, 12 Jul 2017 05:32:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 05:32:19 -0700 (PDT)
In-Reply-To: <3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 13:32:19 +0100
Message-ID: <CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Wed, 12 Jul 2017 12:32:39 -0000
Content-Type: multipart/alternative; boundary="001a114a9ebe02125505541e03dd"

--001a114a9ebe02125505541e03dd
Content-Type: text/plain; charset="UTF-8"

ERROR: cryptodev-module-1.9-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-tmp/master/work/intel_corei7_64-poky-linux/cryptodev-module/1.9-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch
patching file zc.c
Hunk #1 FAILED at 67.
1 out of 1 hunk FAILED -- rejects in file zc.c
Patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch does not apply
(enforce with -f)

Ross

--001a114a9ebe02125505541e03dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ERROR: cryptodev-module-1.9-r0 do_patch: Command Erro=
r: &#39;quilt --quiltrc /data/poky-tmp/master/work/intel_corei7_64-poky-lin=
ux/cryptodev-module/1.9-r0/recipe-sysroot-native/etc/quiltrc push&#39; exit=
ed with 0 =C2=A0Output:</div><div>Applying patch 0001-zc-Force-4.10-get_use=
r_pages_remote-API.patch</div><div>patching file zc.c</div><div>Hunk #1 FAI=
LED at 67.</div><div>1 out of 1 hunk FAILED -- rejects in file zc.c</div><d=
iv>Patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch does not apply =
(enforce with -f)</div><div><br></div><div>Ross</div></div>

--001a114a9ebe02125505541e03dd--
