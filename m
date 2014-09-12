Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8C28171368
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 10:29:25 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id k15so458962qaq.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 03:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BrtHVBF90W4N9jWWhNA1NL5JII/Jra9n6OeaMW2jTuU=;
	b=GguSJzDKyr8eRIQ/fY/t0gdxb7yMfj19n8PVkcL4rZixwFPJzJj075sHbV5XFV39RH
	InD5+FJZZakJ1KiJudg6L1xIn+323RXTCg2QugpERwSrUdfSawcSVRSumrtnwRgkxrGs
	7r2c26xI+btNN8H/XljhLZ3hylphCnmoNka/edv1zr/X5wF3/JPOo0af/OMcp5SuWje3
	8EAFSFVVBnNiItP9DFTG3XYYwYY3w6dNSSrDFm+vHSfYzBQmWwYoc/BsWu47O6hadwAH
	59mNTJORaJi1qYa/zDXg9zG141RKw+VI5ISwt5jkGx0aJ/l3NYBRLwhEiRVy9E+UNtlE
	upZg==
X-Gm-Message-State: ALoCoQkkXXCAkIX/aVZ/j+gahyYNrXy56I9HLNzTd9qwUc5jUkM9tuPWClfrS6FHxwMBOFMDm1VH
X-Received: by 10.224.79.139 with SMTP id p11mr9917597qak.93.1410517767027;
	Fri, 12 Sep 2014 03:29:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 12 Sep 2014 03:29:05 -0700 (PDT)
In-Reply-To: <5412CA29.1090001@windriver.com>
References: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
	<CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
	<5412CA29.1090001@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Sep 2014 11:29:05 +0100
Message-ID: <CAJTo0LbogmM5pnT8Y9ZhyS5-Vq63pHU71c2P02yy3v_jbGciRw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add machine qemuarm64
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
X-List-Received-Date: Fri, 12 Sep 2014 10:29:28 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2014 11:25, Kang Kai <Kai.Kang@windriver.com> wrote:
> Thanks for try. I just thought to send the patch of gcc  to upstream  first
> then fill the Upstream-Status. I'll send it now.

Ah, that would be the problem. :)

Ross

