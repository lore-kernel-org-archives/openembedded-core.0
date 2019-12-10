Return-Path: <yamane07ynct@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE17A7FCB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 13:59:46 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z23so18808863iog.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rQtXeMRSSwJ9zJH6EU/+NYPdgO83DfLKaElvl+1xIiI=;
	b=N6QUjnkUGedFjueCTMNyeZDYie6sWzESLNKFT8UHgkWQofHlZNblQBpL1gDsAPxum7
	ILF7LgJrOfawA3f2+sKLlhBlgjDx3kIldQv/2GCF4b/Yc2SbVM/02E9Ft4GIUyodJUc9
	DuiexeHygrna+eIEP2kZLU+1WY+f6hOIzvu43BgHTSA1AEok/eGMOTq4uRifkfvoPX9W
	7mYHsOXcJVPpU05ctEEusf5tT3+9CKTQZ/zFFg8j5/226EXKdVxowuvZidiqp0cIcSgJ
	lbbjO6MDe16JOCSchwLwAfk/Dh6YajRkdpObxYhIeRR+7KkZQ0e2QEPGxb9EqbkdVTbP
	19gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rQtXeMRSSwJ9zJH6EU/+NYPdgO83DfLKaElvl+1xIiI=;
	b=UkV4mQYNxHybufGzNxLSXS/3f5DP+71km/HKn+YRnqkZ8Vns7EYEP+Y+QYLu4oBtNN
	cr7JZm/iKMZB771XughjfmGJo+Iv7mCnw6yVGtQ94d9bZsrUJzoZfi9LkZzfwVuMWi+s
	0Kr7q07ay32ClZdcoMpdq1zNYpsnBvr4abOENI1y5wyBPiuGrg0z3zfeqmQr73qowM7O
	kxuinDcLTnl9fSNu2eFcLPkH8Wzh4RVOGa/KMd4Yn8UBire3RyNRnV/MuNBb8xtLAaXP
	BhhRgop3D57kojyntXGxCim9xibl468I4R9gNVZbik6/miohTpppievfh3ft1JgcWfUI
	f2Bg==
X-Gm-Message-State: APjAAAVMmCbgxHVVkgkitG6eDeuwgu+5WK7i8bvX4E6XDjhZwCiZd1YO
	UMEqdqLhy6yk1878053yU7PFwNo1z6vehs+rjg4=
X-Google-Smtp-Source: APXvYqwF2usYBkF+BQ7s/9SBMH0I7lmx1GEHwJtVqVfnpemji9zoPRa/6zUPw+Cv56xEmmlF/3G6QQKkMFiwdQs+ZXQ=
X-Received: by 2002:a02:c611:: with SMTP id i17mr33452888jan.28.1575986387794; 
	Tue, 10 Dec 2019 05:59:47 -0800 (PST)
MIME-Version: 1.0
References: <1575627191-12947-1-git-send-email-yamane07ynct@gmail.com>
	<cf16a85c-f7e7-57e8-c6c2-9ffec81e8af7@intel.com>
	<CAHZ3=rpH=C1FXieMV2n-7oDveSoHdfprH8YSwxstN2YscWEPVw@mail.gmail.com>
	<1a341964-16a0-e6b7-123e-51f06e2657c2@intel.com>
In-Reply-To: <1a341964-16a0-e6b7-123e-51f06e2657c2@intel.com>
From: Daisuke Yamane <yamane07ynct@gmail.com>
Date: Tue, 10 Dec 2019 22:59:11 +0900
Message-ID: <CAHZ3=rpt+G0YxdDyEfaycJTNstrtN1Z+kHkCkk44LyxoNAK-cw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot-fw-utils: Add capability of building from out-of-tree
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
X-List-Received-Date: Tue, 10 Dec 2019 13:59:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2019=E5=B9=B412=E6=9C=8810=E6=97=A5(=E7=81=AB) 19:39 Ross Burton <ross.burt=
on@intel.com>:
>
> On 10/12/2019 06:09, =E5=B1=B1=E6=A0=B9=E5=A4=A7=E5=85=B8 wrote:
> > 2019=E5=B9=B412=E6=9C=889=E6=97=A5(=E6=9C=88) 19:43 Ross Burton <ross.b=
urton@intel.com>:
> >>
> >> On 06/12/2019 10:13, Daisuke Yamane wrote:
> >>> This patch also helps to build with EXTERNALSRC.
> >>
> >> As this doesn't actually set B, will you be sending a follow-up patch =
to
> >> set B so out-of-tree builds actually work?
> > As there is EXTERNALSRC_BUILD in externalsrc.bbclass, I don't think
> > the follow-up patch is necessary.
>
> I mean in the general case, not specifically externalsrc.
>
> Out-of-tree builds are fundamentally better than in-tree.
I got it what you mean!
OK, I'll send the patch.

Thank you for pointing it out.

