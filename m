Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0BFA749D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:16:53 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id d11-v6so18194069iof.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTbwoQA6qJjdZBa/azhLZ8Jb/chkYY/yPNlv/J0aV0w=;
	b=kt9tz9Vsk7Z9lYf1Mcpk0rAIypg2NpRTfdqPXMWfvOeOwDAOqXJ/4Hb5/sysjyp1EC
	RRM+WS0S5jpI26zreYidGQ+nR5P9CP00mrF9uyQ1+e34Cq3eFZIxvTvmLbomG35lgkj4
	blj2pgR+fQMLE/0IfHQQnjmRfsXsVOBOOXXoAk45V3jysTMPPSi+NqddTf1Ew0LxsMDG
	s740NzLWwy9/Zom0i8KVAtoJNUPymHByYBflsXZ19ItG34pOW/lXI1qNpF2Q0oxw3MWh
	TWrvfOfaqnzG8Skio09rjhoz24ddt4vEn3vOYnriN4gIIAItUw0wH4VEeHlwf1ZPKmJn
	MmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTbwoQA6qJjdZBa/azhLZ8Jb/chkYY/yPNlv/J0aV0w=;
	b=c0EILENdgLmRsH9BrqlAd/EDpnc4BYO1VKIPFlcQvu7Q6hkAD3i6jo6svGeNYfbkDB
	Xwo5/l+bGUGGw4y1R+Zd/yWc2IilSU6rB1KphZ+wc6uI2c48ujpnRlKhVbb4xFAAhac5
	8AlIHxdigGvJhyV/KpTiEqia9EJOPDQDW00YMnaL61ybWEEM0hWWn+lGbFG7iaTdc2JW
	AaRWYqodxMDlMycZ3zkKiMmeQa+a6BHEyBzmm/xkAYVdXRFSsJeI7Bhk0lra49x1shwV
	8n0tQxG8RA+cuXEYVKwYYHyRhT076pziXfPxYCynxahqQbSaWB9Ue4sFCav1fWZqGIgE
	I4Ew==
X-Gm-Message-State: ALKqPwfJoZ0CQEcRVN/Sp7xdtRXTYbH1ecAPllK1SITgPPe/RqSQ05Dy
	/n5/pa9W5rX4rbOlJYtEK4/tiIi3e1qUd5m5rIcNag==
X-Google-Smtp-Source: AB8JxZrffHX434Tw1kZhVISX3qyt2kWmdN5vgFI94b+pKhCaXbxPrU1GpPjq86avy6213/bBTvjJrRNXeImwPOtNxEU=
X-Received: by 2002:a6b:208a:: with SMTP id
	g132-v6mr1148149iog.216.1526991414620; 
	Tue, 22 May 2018 05:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 22 May 2018 05:16:34 -0700 (PDT)
In-Reply-To: <CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
	<CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 May 2018 13:16:34 +0100
Message-ID: <CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 3/4] mtd-utils: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Tue, 22 May 2018 12:16:53 -0000
Content-Type: text/plain; charset="UTF-8"

On 22 May 2018 at 08:49, Andrea Adami <andrea.adami@gmail.com> wrote:
> I am just wondering about this patch:we carry it since 2009  [1] and
> is still marked as pending.
> Why was it necessary to ignore part of the filesystem? Can you remember?

Make that at least 2004.  This commit in oe-classic touches it:

commit c70605ebdca81412a93b4d867de7931543193f26
Author: Chris Larson <clarson@kergoth.com>
Date:   Thu Dec 23 21:24:57 2004 +0000

    Update mtd to a current snapshot, change the mkfs.jffs2 -i cmdline option to
    -I, and rename mtd and mtd-native to mtd-utils and mtd-utils-native,
    respectively.

Prior history is lost to the git/bk migration unless anyone has a
BitKeeper clone to mine...

Ross

