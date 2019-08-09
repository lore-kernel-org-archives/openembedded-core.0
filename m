Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id C92727F336
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 16:36:25 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id g11so11121324uak.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aYdjbLbr7pwe+K81WJt7AkToVBpoGz4ST52tj7s2bAw=;
	b=YBHUcEgMq4hgos+eJM2WYmIWlq2V3IOk5SNKgtoEKRJiTUh1tlckXKcxU54o01ZN/G
	veuULgNpQRD/PHU56BlHUAc6cbNCLDiTz9mjLtE8I+jQYp62K6PBlJwq0jYSu5VSLIN4
	uyimQZ/8q1uL5fgYt4Afon094LGBebffhv3gl4FO5tVbgJefYttAWUqYj/xuRNjzpLWG
	ZKWk1XO6aureGLgBgksXP/nUzm/l2eC+kq/vX/BG1qDdlnKVY9juFa4HepScczeLhBW2
	lk3DGCBUgVgHoHQu51p25CJTUaTNhX4mIeNzB2u5elToa71qAqhsD36KLMWQ7N4w+Hqn
	c24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aYdjbLbr7pwe+K81WJt7AkToVBpoGz4ST52tj7s2bAw=;
	b=IlnbRRHlWa2vxZvNl+vQnq3gWPQqwXxUQr4NtVJ9Eb8Phjq6K5U1n8/IIABUItiJEW
	ZkdBn6/oW6+k1VYQgyRrYflzS47lg7kIy5KJmDcasy1CarsNE1GO1u9h49NMgfbjB5GR
	oFQPd4RsMo83vo9Dkq/VUWNRmN+Jgg3ABhG22yD1Zx5r256qlsDu+NRceBtfLkqRgXKA
	2XKVwTjMffSEsgro7MeoWu3o4fZNXnOb4W19tMyOpwBgad9uvhuIvi5vG/LiaXSM6qZU
	Ulm57W8t30CAbKcFC5Gyl2KcAs2QElnA6wxKO9npMg7l/99bKg2a43NRjkQfIlMzKCHu
	bcVA==
X-Gm-Message-State: APjAAAXOE46OYu4AVnKI75WlVMoktn/xVssCP97BvAfmHR6ILsiTH2Qu
	mxIuGfMBYQTy6Rw6oLZq3fOmL7mtFYm9DQ8W6FY=
X-Google-Smtp-Source: APXvYqyHx59LpCSB/ABuhCUgBhlViIydQC+mcXxrz3GhwN+RXR77G9WWoeeTzR23YtD4I07GWjAplvSXbvb8cNzXThw=
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr4371306ual.100.1565368586561; 
	Fri, 09 Aug 2019 09:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
	<CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
	<CAMKF1soHd3dx9FVXiTwaDeBQz55hdFTCdmLRZjKDfAsduqWQ4Q@mail.gmail.com>
In-Reply-To: <CAMKF1soHd3dx9FVXiTwaDeBQz55hdFTCdmLRZjKDfAsduqWQ4Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 18:36:15 +0200
Message-ID: <CANNYZj_o1CxczJGcUeJzoyp9saqYpL4CwZdmbpt6oPW3EZm91Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Fri, 09 Aug 2019 16:36:26 -0000
Content-Type: multipart/alternative; boundary="0000000000008b6d83058fb1c6fa"

--0000000000008b6d83058fb1c6fa
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 17:19, Khem Raj <raj.khem@gmail.com> wrote:

> a running musl world build did not show this issue but that was
> rebased tree without this fix. I will have to do a new build for glibc
> and see if it was my build system injected behavior. For this patch, I
> would suggest it's tested across multiple layers before it's installed
> to oe-core.
>

We should certainly at least fix the meta-oe issues, if you can produce a
list of affected recipes I would  appreciate :)
(don't really want to start a build of entire meta-oe set here)

Alex

--0000000000008b6d83058fb1c6fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 9 Aug 2019 at 17:19, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">a running musl world build did not show this issue but that was<=
br>
rebased tree without this fix. I will have to do a new build for glibc<br>
and see if it was my build system injected behavior. For this patch, I<br>
would suggest it&#39;s tested across multiple layers before it&#39;s instal=
led<br>
to oe-core.<br>
</blockquote><div><br></div><div>We should certainly at least fix the meta-=
oe issues, if you can produce a list of affected recipes I would=C2=A0 appr=
eciate :)</div><div>(don&#39;t really want to start a build of entire meta-=
oe set here)</div><div><br></div><div>Alex<br></div></div></div>

--0000000000008b6d83058fb1c6fa--
