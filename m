Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 57DB26B91F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 07:15:04 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so1410386pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vsdgmJl9xEmxvYzgeblPw2h+cn5Jw9bWX+r5ShQ2T2w=;
	b=TnN9JOCZMjiLGE5QUYw4gmVgNzElKqiI6WXy0OoF9FXRBJuLjCutX50d7/lIGbSqSI
	rnOiPNo4LUG7MC3V1jEL16WmqWa1TC1gT74UdXevx/xeYZeR0O+G5VoD8yxiscnERnQg
	Vb8ElcYc2PzdOHj5QLkm6v6/oDC/77NxGgSO7lFRUvL9SYDqtkEQYlkB2ivOmqVshu3r
	rLlPjWFFnHR2O247aKPwXB+AZFDoi37Nz1cgK3OZlOkLPPxjLCmzZ1nrbDUaXr+fkKT+
	m8ufhk4cHkyKEtP/q0Vd5UVR6+V8PFdJC0Tb79reIL87cld+T/jK4sJOVtYoo2PNOgn4
	PtJg==
X-Received: by 10.69.0.129 with SMTP id ay1mr11951153pbd.12.1377155704302;
	Thu, 22 Aug 2013 00:15:04 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	pq1sm12964927pbb.26.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 00:15:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5215B4A7.8070604@windriver.com>
Date: Thu, 22 Aug 2013 00:15:01 -0700
Message-Id: <9A96060F-4FEA-4785-A90F-B71A615976D3@gmail.com>
References: <cover.1376965065.git.kai.kang@windriver.com>
	<5a0310813a9df4c60eaf5ba31e2de12bf3d08ccf.1376965065.git.kai.kang@windriver.com>
	<760CDDA0-416D-4E16-8FC2-6205ED265506@gmail.com>
	<5215B4A7.8070604@windriver.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 1/1] bc: fix segmentation fault
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
X-List-Received-Date: Thu, 22 Aug 2013 07:15:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Kai

On Aug 21, 2013, at 11:50 PM, Kang Kai <Kai.Kang@windriver.com> wrote:

>> what does adding this include file fix ?
>=20
> To be honest, I am not sure why add this include. After build it is =
harmless, so I didn't want to modify it because I think LFS is =
trustable.
>=20

Its matter of understanding the change and may be explaining a bit =
better what it fixes and make the patch better for upstream too so try =
to build it without this include added and see if you get some =
warnings/errors that it fixes and then add that information to patch =
header.

> Regards,
> Kai


