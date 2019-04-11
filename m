Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2A45E7D8FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 15:32:49 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id s3so10344102itk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1NMrtEmN2kjq3x4FnKRey+LTviIxLcV/UFdXp2TNEks=;
	b=I/DRZdhmOXID5hqSPGKH16TkbAGDzPaMsvRk7sgk66O3brcBFAMMEIxu+zFu/BET7U
	mRQn4O4NmXKORul+5djnjY1BZycdJXeL0c2p/Gi08SjNRldSV4a3YnEkknP99jy15T6i
	1s8Qya16HAytewwj7rViTEAPh57dC5ij0VtGTVLtoWM5Nlip8OdHMLM5tQHc5QfajdC+
	b+TsNOOztD0U+qpz3T4ZqpM7aXne9kkmxe40z60hCkQrROXvtLPiiYWr/24z/9eqZEcg
	YL+vncSdAT/BqA6xU6jI0eLSCQDF9aJhlbiLJBnxPPjHsei6viH6EID4lz5RlkD0Ac7d
	zuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1NMrtEmN2kjq3x4FnKRey+LTviIxLcV/UFdXp2TNEks=;
	b=fK3tTsRvUX4uqTske4bg5cmRhHOTdl0hPwy0iBMWBzCcg5YnMgDA9dpqetGYXWr1x7
	iCELh/RPjahctbQeAS07RbeoYhYEjze9sxEvnJ87TphWJTIP7ecUoPhvZLZbveRuYXcc
	sewyymyatdNqjg0H3jQsAjy9XvL+8VbagseGpdKdTa1g+mi06cnnHrEQUEsTY5Xa3YTR
	3dlA5DfR6moRsRt+WypWoR/QlcvabBWpMj4/AaZlxRSnOGRjuN12pQlG4s4c+SvAu/oI
	4oJXjeIY6H161VRP/GDA9dy3o/vJbPBW7B+jQLsMjlOY+U/nvKlZjCB38xgaQoC66yeC
	tudw==
X-Gm-Message-State: APjAAAXP7oqNNdh6DNCvNoODTO+VrbHfIzZwTuz0njzSv4TjNAFyrEzb
	Bn4k4g63u4UdWT2Kwqw9DcnwJkHOT/NnFbxTMUAyWSWX
X-Google-Smtp-Source: APXvYqysc+xm8Bg84HgNrQzyzaNnEgWvWb+AOWkkKgP+ip4q+bstUr34yTnx41GLFFgYtnGvRTkCqlZ9nMwuXQWjRGY=
X-Received: by 2002:a24:4682:: with SMTP id j124mr9403767itb.90.1554996769837; 
	Thu, 11 Apr 2019 08:32:49 -0700 (PDT)
MIME-Version: 1.0
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 11 Apr 2019 17:32:38 +0200
Message-ID: <CAB2nKc-cPBiMhye=56XmN4wXXL-DCAUVtfa2wtjBSskw1ccYvA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: volatile-binds: VOLATILE_LIB_DIR
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
X-List-Received-Date: Thu, 11 Apr 2019 15:32:49 -0000
Content-Type: multipart/alternative; boundary="00000000000017d4ca058642e61c"

--00000000000017d4ca058642e61c
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm wondering if it makes sense to add a VOLATILE_LIB_DIR option same way
as VOLATILE_LOG_DIR but for /var/lib folder?

I'm asking because I can't append VOLATILE_BINDS with folders inside
/var/lib as it fails on ConditionPathIsReadWrite (/var/lib is writable
after bindmounting to /var/volatile/lib) and also goes into trouble with
inner overlays.

One way to fix it in my case is to redefines entirely VOLATILE_BINDS
variable, so maybe it's not worth the effort?

Regards,
Vincent

--00000000000017d4ca058642e61c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 all, <br></div><div><br></div><div>I&#39;m wondering if it makes sense to =
add a VOLATILE_LIB_DIR option same way as=20
VOLATILE_LOG_DIR but for /var/lib folder?</div><div><br></div><div>I&#39;m =
asking because I can&#39;t append VOLATILE_BINDS with folders inside /var/l=
ib as it fails on ConditionPathIsReadWrite (/var/lib is writable after bind=
mounting to /var/volatile/lib) and also goes into trouble with inner overla=
ys.</div><div><br></div><div>One way to fix it in my case is to redefines e=
ntirely=20
VOLATILE_BINDS variable, so maybe it&#39;s not worth the effort?</div><div>=
<br></div><div>Regards,</div><div>Vincent<br></div></div></div></div></div>

--00000000000017d4ca058642e61c--
