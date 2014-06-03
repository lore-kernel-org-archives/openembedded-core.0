Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF786FAB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 09:52:35 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id x12so4461133qac.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 02:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UEDL6LYW8Uo6fSEJprKFmhQFglapiiNg4BhPTCDrRsU=;
	b=m4+wQr7O/HEyljKhzIsbBO0W5GnBc/4F9xlLZgbZUncKN/JughBqMEL3uzaomuFtW+
	p/aVdbzMe8VURtY0gHVHWSlaG2qREDDfvGeXA6NfNOzIEKuSP8vf/WBF9spYEdc3195W
	fKUyVI05POkflBuZrMwOmRiO/4EZorqZzgO0U8y5SKNj2DWQmvdmE7CNPpD2PQ9E62do
	AXPLm0OwLPzgd7Ry9+EvSqtPaOhjfkWRZsy20hbzJlEnNx6T4SaaS0KtzwT6X72y3KMs
	siKisbnVCSEx08sp7SAeMfiT+9mZN1Y6hh2j5xTo/6gGs3Ym/sCNcRcf0/XAwpGe9YWA
	0xMQ==
X-Gm-Message-State: ALoCoQl318rZzos8Je1q+HTtRu625PVdBgPzggwigIh4A9IpBQ1a4cAb61HpP1Zd7qDJrH0MHzx7
X-Received: by 10.140.28.3 with SMTP id 3mr55297375qgy.71.1401789156770; Tue,
	03 Jun 2014 02:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 3 Jun 2014 02:52:16 -0700 (PDT)
In-Reply-To: <324a9842b540fda121d095b0e2f899969cd8fdb5.1401419076.git.Qi.Chen@windriver.com>
References: <cover.1401419076.git.Qi.Chen@windriver.com>
	<324a9842b540fda121d095b0e2f899969cd8fdb5.1401419076.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Jun 2014 10:52:16 +0100
Message-ID: <CAJTo0LYqV6JqUbJNvZ4C_ceO8iQza4GQsn0KR-1TAv=wBGzGMA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gawk: upgrade from 4.0.2 to 4.1.1
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
X-List-Received-Date: Tue, 03 Jun 2014 09:52:39 -0000
Content-Type: text/plain; charset=UTF-8

On 3 June 2014 02:41, Chen Qi <Qi.Chen@windriver.com> wrote:
> +FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libexecdir}/*.so ${libexecdir}/*.la"

.la files should *never* be installed in a non-dev package (and in
general they can be ignored anyway).  Are the .so files symlinks, or
runtime loadable modules?  I'm currently working on a patch to move
libexecdir so can you check with the makefile to see if they're being
installed into libexecdir, or libdir/gawk/

Ross

