Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 930F5788FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:35:10 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id i21so8534899uak.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=MkzS4ki/dcgfi1SMXd+Od9KGjrZLoEel4te7CjbOywU=;
	b=cM9WojIzwdxuExkrPp7+X/72q+qhQi0iwLXoIlybZU0Uwx5EG/WvCQ6Cp/pMd0FfLF
	95pp4/ITSr1iQ/cDGbW4JQGSf8vEnycoFXkNzCpAe+RoLMcPy/3h0ld2W5w/4LTeZFKx
	ZcPD70qzAw7ECDjJA4PYIEmRzLDkNmqQbPHrAh6+n6VpIUHz9cRvFIK2Wrc25F0cjTLZ
	6be/cbNvhRLOIlIpUlsesYr3eZ2tc/LegsNRQWdMbHos6JtJdQAN/GVLMdNFNaj0sMrO
	59tdO2+chV3gmR2OKhI/LOUI70/y/lqB3Ss1cxBHR9jKxL5AQnqSBmGl/VQG2JGe8VSi
	rFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=MkzS4ki/dcgfi1SMXd+Od9KGjrZLoEel4te7CjbOywU=;
	b=qnfuKlDvd5k8I0Ol37+ROc1m5Ia90sI6Ly4J4iRr1oTjYms+nhuhGejGTLHZdyYCwz
	4k1wlW7/sCjpS0lP3XZBHbFq8sNlAibdlZH+AOXeJBQLortcQWQxSAZXRQdDsx4YmY+T
	j3bBeXDqMDc0GY4WGzaMCPd4FQbnc2dqldxrQz4PipRtRzh6gXwZnf3xo0aA+kQLjayA
	uYsIW9Mv/N0YnmIoIPyLPQsidjStF2XaBp6EYaUT+K5pHodF/RwKjgaazyyaK8Z/nXio
	Ue+r7aeEgn+xWErFkC3R31fga5nc/00iUbsuq3axbS/y537n5auCCf97J+9fZ4hy0FVN
	5HUg==
X-Gm-Message-State: AElRT7FUUzkyqZAP+jUSIBxJzCER2Kre9WQtrA4jOGIrKSL1XixENJJo
	J8hI5RqQiZrNHwHKD3RKMkpjspDX35YXJKj5AR4PXw==
X-Google-Smtp-Source: AG47ELvQuI7VrBQUKPe1OK1cygTqYS9zVNycidU4OVm6mtKD7oOCgBDrnMeyrmeVni27T4W01OGBZUGRgXjI9qlm+x4=
X-Received: by 10.176.78.212 with SMTP id x20mr9106618uah.194.1521491711305;
	Mon, 19 Mar 2018 13:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Mon, 19 Mar 2018 13:35:10 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Tue, 20 Mar 2018 02:05:10 +0530
Message-ID: <CAPGMVzHgUcWV3TFaTeV40+P=SO2zV-4cjw2oWnB2KsBrozk9Sw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: system lock down in middle of build
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
X-List-Received-Date: Mon, 19 Mar 2018 20:35:10 -0000
Content-Type: multipart/alternative; boundary="f403045ee484fb2bf60567c9e415"

--f403045ee484fb2bf60567c9e415
Content-Type: text/plain; charset="UTF-8"

Hi,

so i am workin gon yocto development on my PC as well as on my laptop.
I have also worked on it on others systems, but the strange thing is only
on my PC & laptop the systems gets logged out automatically in the midst of
target build.
Is this a bug?

PS: both my PC & laptop are of high-end configurations

Thanks

--f403045ee484fb2bf60567c9e415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi,<br><br></div>so i am workin g=
on yocto development on my PC as well as on my laptop.<br></div>I have also=
 worked on it on others systems, but the strange thing is only on my PC &am=
p; laptop the systems gets logged out automatically in the midst of target =
build.<br>Is this a bug?<br><br></div>PS: both my PC &amp; laptop are of hi=
gh-end configurations<br></div><br></div>Thanks<br clear=3D"all"><div><div>=
<div><div><div><div><div><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><br></div></div></div>
</div></div></div></div></div></div></div>

--f403045ee484fb2bf60567c9e415--
