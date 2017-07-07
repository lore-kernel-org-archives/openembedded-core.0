Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 300F777F6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 19:51:04 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p21so35948078qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f++SKigi6bwMF7A7WL8rOYhQMBDr7qz2GFo+G5sUi6I=;
	b=wQ9hwOYpkJ9MuqLxjEoIQDx4vbQsAca+iQWjGJROyTOYGG1AVNKg09r2KDlcqRQSiL
	5wun0s5+IAXeNdZjsJTVRfLiuvLmYEIByZqpwpu21RrGFxJrwQ6K9PoALtAAfuSXUbVa
	NHvrADDiRqvzc1CfgfNFIYiggx/Uy2kbyw89EU0zWU0osIZO79lYemP/MauxdBq8VUbj
	gdHzOH6td/0KSBCPCYEl27Enoj1AIye1BmCNb4qZ7YIObjmE7PQaHk0eN8NxtilL9G2k
	VstEgnvh8M3O/gosglUcvRq/qcGepVzM4T9xoL/u6J12JfEnCzhDcaoQKpc4Ip60k26/
	0Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f++SKigi6bwMF7A7WL8rOYhQMBDr7qz2GFo+G5sUi6I=;
	b=QGkVP7rxtIgcgWeEXpC6Y2vlLqkLjS+AvDrW0WWmx2Bhbhr/3Koz/TzsdYl5UWHcqM
	AITLM4z8imuhr66TKDqz6gJ9Ya8WQNYxQQseA/DHU1IEf+517LIoXWmnuYxwMXxVtaPD
	hUdMHmgQax9ruHiLdoLn2s6qS84Dh3pdO+19KauVo/G9USAW6JNLwA6n0uwC/krjOPsD
	pXntb55frpacRaeOIKZEJILCuEeO4b/ypfO3dav8VNUi06ZSNFr2Y3UGnQy3wj+Ol6lw
	/ySJffJ+DhEzd9kp7nGPBj7Xwen652JO6gwj52Wy8MJcHbHElZR3i+e2Shu0XALXkc1c
	T9qg==
X-Gm-Message-State: AKS2vOwDxnQt/0/64+B5Dzf4Gagrpskv9mIC79SDBvAddf21rJTE/X4J
	YQlzrjc0QfzViCT1o5UsChTnVingf7gG
X-Received: by 10.55.102.84 with SMTP id a81mr66029807qkc.154.1499457066196;
	Fri, 07 Jul 2017 12:51:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Fri, 7 Jul 2017 12:50:45 -0700 (PDT)
In-Reply-To: <87y3s0xc6m.fsf@mentor.com>
References: <20170616213952.35679-1-nathan_lynch@mentor.com>
	<20170616213952.35679-3-nathan_lynch@mentor.com>
	<CAJTo0La9rcpY8oxxuaWspjLM6NjJNugVopmdVEvps=sH2fMkcA@mail.gmail.com>
	<87y3s0xc6m.fsf@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jul 2017 20:50:45 +0100
Message-ID: <CAJTo0LbYJrEmwtwDup3j-SMM21HKuiLn4oFuM7HR2vhvgi+jig@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] lttng-tools: update to 2.9.5
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
X-List-Received-Date: Fri, 07 Jul 2017 19:51:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c05760ec974550553bf8d6a"

--94eb2c05760ec974550553bf8d6a
Content-Type: text/plain; charset="UTF-8"

On 7 July 2017 at 20:46, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Where can I find the libtool-wrapper QA check?  It doesn't appear to be
> in oe-core or poky.
>

It's one of my personal secret ones ;)

(github:rossburton/meta-ross)

Easily verifiable without using the QA test though.

Ross

--94eb2c05760ec974550553bf8d6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2017 at 20:46, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"mail=
to:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zd" class=
=3D"a3s aXjCH m15d1e96efeea4da3">Where can I find the libtool-wrapper QA ch=
eck?=C2=A0 It doesn&#39;t appear to be<br>
in oe-core or poky.</div></blockquote></div><br>It&#39;s one of my personal=
 secret ones ;)</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">(github:rossburton/meta-ross)</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Easily verifiable without using the QA te=
st though.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--94eb2c05760ec974550553bf8d6a--
