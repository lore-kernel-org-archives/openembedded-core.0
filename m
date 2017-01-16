Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 72F8D71BA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:47:23 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id k15so109703835qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 08:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DfM58UqWMUOmpRpAoBqNJ0Jn63AkBPoH6d3Fokd2TeA=;
	b=fjIAOugQTNy2tYL41gfRsoWpAuB03Zn9LMg9A+Sb2zrM+GU8Lg5wax5CMDGyXsu/Bo
	TEHNr7LI5osiBC5UEZdGsaZxFbjzXwiznNVAPkNI3fBqdGC/6Bq02L8VAlXjUh3OExbG
	kJ5tMHvKMr8HWhenM4PeoOXJ9DpwwPgwfS2+rrHRmiZWZxY+Ik0k5fVVnwKhnfLxs4QL
	SgXgF9mXL34cjrkAEL0byUouDTXjqqnKST5PWPsPsq9iWPaWVkPivi/mLkIKXDvE3RHY
	/OcxOmSdKkD3htK15Md7bkEG9RTe6FYjwenz2FrfT0YyV2ITdag6uOSrdvYIvOym5EDM
	HoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DfM58UqWMUOmpRpAoBqNJ0Jn63AkBPoH6d3Fokd2TeA=;
	b=GTNqcWutNkYoNQFKCEBRnc1lTYL/jl7rVpSq7B552vSLRFIMbVbfWkbLSGlqcG7oIg
	0oEkXqnHjPhfw2ZUSJfXGGcjG/s1So4BEywspmVmDfFAwxkztDSB/7XpSeBb4tyZinyx
	iywKru6qk1p94CmQbuasKFVkrqJe3spFaCoN1T1gaWzCHzbnyFIJ8qOqP7LXkurdhK33
	uCI3KBXCu4OTuLfW/PDzoMr5wXifBnmX4Ij9FcJ5Ho3i9GhXFagxl1rZpXITKR0z0c5v
	fvh4ASKUYR1ry6kfmGoeli7r8upetr+7dk1k1wFsIalzIgIBaaau8Ospq0pcQlWfnZN6
	RE6Q==
X-Gm-Message-State: AIkVDXLYUdXFZS/uVUV2j/Qb7+iNA1WA9ScPBECLJaxQa8rpE6LjOoFZ6ll0oILeERnumGUwgnu0spC2B0QsbrTP
X-Received: by 10.55.16.11 with SMTP id a11mr35374324qkh.3.1484585244209; Mon,
	16 Jan 2017 08:47:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 16 Jan 2017 08:47:03 -0800 (PST)
In-Reply-To: <587CF82F.9090207@linux.intel.com>
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
	<587CF82F.9090207@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jan 2017 16:47:03 +0000
Message-ID: <CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Mon, 16 Jan 2017 16:47:26 -0000
Content-Type: multipart/alternative; boundary=001a11475cbc1ec7c9054638f08f

--001a11475cbc1ec7c9054638f08f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 January 2017 at 16:43, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> It's weird, i'll review it, but i don't imagine what is failing
> gobject-introspection because a qemu upgrade.
>

The g-i build runs largely inside a qemu-user instance (the crash is inside
qemu).

Ross

--001a11475cbc1ec7c9054638f08f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 January 2017 at 16:43, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<=
a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.lim=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":4yp" class=3D"a3s aXjCH m159a8270190999b2">It&#39;s weird, i&#3=
9;ll review it, but i don&#39;t imagine what is failing<br>
gobject-introspection because a qemu upgrade.<br></div></blockquote></div><=
br>The g-i build runs largely inside a qemu-user instance (the crash is ins=
ide qemu).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11475cbc1ec7c9054638f08f--
