Return-Path: <alan.kozlay@ves.solutions>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id C360171E4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 19:11:40 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id s3-v6so949141pga.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ves-solutions-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=2jaFrhEjZqdwSoMoiJlX8CiEdegFVaZ6HbUtBq2zCdU=;
	b=0Ji/+NU0asEa+n5Mn91k7/tst03ZxNyJGtae76OZsObvzRBZmSJJZHh7LN1qZKtAru
	jQ0UPtPfpT73JqFUFbWaAog7CGGznu77wDKmd3jdtI/IAvvG+NS6pJsIfFgwzOoEn38a
	5ACrasguu8n3LhE+w8nwkRNTYcBJzl1PrV6pJD4u8cdMo9y2MGzR4lGvTqrInRkLvCBJ
	ucGE/nyhkLjfzv++D7ym/goTZMVI1Vgwt629QBPgCNON/YxyLOZgIhhv/Kt+5qoPvO/u
	S8/w7NdS5AeiPusWoaWagVXzjaFAMABst2fWHZTs3WZkZOJstzRG09CMeCLDzraBePFW
	qsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2jaFrhEjZqdwSoMoiJlX8CiEdegFVaZ6HbUtBq2zCdU=;
	b=GVbwmY+RAlepgzfoXDx6LiFT18oJXe0kEadxGrCKa0oCusKxF/HN4SBb/vJPhFFFa1
	V/j5i1LegF2+ieDByyu+vazdNZ1BEAWJYJMH6Keu6C/qVpuSz5kuedwHcTkhlym8vKOm
	p7BdSTMiGM/EjrAXd5NL2X7GNv9THpXR9TrI5vjhePegYs8oROiURjbOdj2nupYQnQ7O
	kIASIl1dYNqeLWzEvJn5aSJc+9Dr5UVmwwNr7mP9sTrm7MSo6zIAOO2BGPWBSJAQOxhq
	XdES8El4JKh26yGLts4Vzdk//sUYzlsJTY05259kHaoBMsxjqV/IIV7I1TiviDBCUgTV
	uipQ==
X-Gm-Message-State: AGRZ1gJkt4Sa1oOeW6u6Nv6ZvoStbKagM3ww1IIS6H+iAGjUZhLR0eG+
	+a0bjVqDMTNgqJWXQSXJsfD5pdFKFVvlMHpN8pJZPR3FNnA=
X-Google-Smtp-Source: AJdET5cGhusIPSO75SYGCrllllmaBT7XtznObXfWvPNn3fcv6sk+KJpVlexXoUZgjEtWHMrf57BQ/hIYcqYIvk4CDS0=
X-Received: by 2002:a63:81c7:: with SMTP id t190mr4667526pgd.393.1540581101556;
	Fri, 26 Oct 2018 12:11:41 -0700 (PDT)
MIME-Version: 1.0
From: Alan Kozlay <alan.kozlay@ves-solutions.com>
Date: Fri, 26 Oct 2018 15:11:05 -0400
Message-ID: <CAJE9sGmRD4VtDKfcrBzpLNC5LZF7O1z3sOzvaHXo3PKzXTed9w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: disabling the whitelist
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
X-List-Received-Date: Fri, 26 Oct 2018 19:11:40 -0000
Content-Type: multipart/alternative; boundary="0000000000004e97690579267d81"

--0000000000004e97690579267d81
Content-Type: text/plain; charset="UTF-8"

Community,

We have a whitelist for packages in place and whitelist.bbclass works as
expected.  But is there a simple mechanism that can be employed in
local.conf to disable it, when needed?

To be clear, we don't want it disabled all of the time, but it would help
to have a simple line in local.conf disabled it, during development.

Any ideas?

-Alan

-- 
Alan Kozlay
VES Solutions, LLC
Alan Kozlay <alan.kozlay@ves.solutions>
DESK 443-595-7734
CELL 443-752-0323

--0000000000004e97690579267d81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Community,<br clear=3D"all"><div><br></div><div>We have a =
whitelist for packages in place and whitelist.bbclass works as expected.=C2=
=A0 But is there a simple mechanism that can be employed in local.conf to d=
isable it, when needed?</div><div><br></div><div>To be clear, we don&#39;t =
want it disabled all of the time, but it would help to have a simple line i=
n local.conf disabled it, during development.</div><div><br></div><div>Any =
ideas?</div><div><br></div><div>-Alan</div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><span><div><div dir=3D"ltr"><div><div>Ala=
n Kozlay<br></div><div dir=3D"ltr">VES Solutions, LLC<br><span>Alan Kozlay =
&lt;alan.kozlay@ves.solutions&gt;</span><div>DESK 443-595-7734<br></div><di=
v>CELL 443-752-0323</div></div></div></div></div></span></div></div></div><=
/div><input name=3D"virtru-metadata" type=3D"hidden" value=3D"{&quot;email-=
policy&quot;:{&quot;state&quot;:&quot;closed&quot;,&quot;expirationUnit&quo=
t;:&quot;days&quot;,&quot;disableCopyPaste&quot;:false,&quot;disablePrint&q=
uot;:false,&quot;disableForwarding&quot;:false,&quot;enableNoauth&quot;:fal=
se,&quot;expires&quot;:false,&quot;isManaged&quot;:false},&quot;attachments=
&quot;:{},&quot;compose-id&quot;:&quot;3&quot;,&quot;compose-window&quot;:{=
&quot;secure&quot;:false}}"></div>

--0000000000004e97690579267d81--
