Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 05AA97CEBA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:29:06 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id f186so3853744ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 05:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=qd2IRKp57cOLm4vU1u9LtQKdv3bATL30+pj2JaSQuzE=;
	b=oqOPSbKivBsHYhEp7SBkQA8aI436sQFV2yTVkiRgQ/+40cIb9U/eQXhEy27EB8wC1k
	zMr5sIbKrI/SG8ALgVUyVjWnJJEEz9LoJL4Ax1fN1W8gvQdHBqEXp5o3eHAHDXXJTcSL
	4JGzLMcx8zjws/RAvb0gktyXzpVkJymcfegSopnkS1iatcsZWYV9iMCUEtBQ/gaWVn68
	nZpnAe2fpK6npmN1U3hFpoTrM7faCB6QobhvWjSH6xk8YxUbDN57aK0Ii6T8pqOVVC4I
	kbKTJMXyob3VWqW7rC8YAlXXjQ8rC+Lb0YG/OBwhqObAfWQZMj4UPrad8uedEnwiKoMr
	r9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=qd2IRKp57cOLm4vU1u9LtQKdv3bATL30+pj2JaSQuzE=;
	b=W4HO7/paLFsaP+0IRdEO638/iEXo5CVeDyznC0mNYg4R2yV5KZmCWu/O1dRH6ygRDn
	VlneATQ4orgedM8mgF04yoEntA9rnoTpc5RXRG7tgovUZ8OO8BNfUztjQqDl728BVp2Q
	u80mvSXCCciOk4hWJHNG7x/7U6FFkd2itbpax3hWVf7luMsUwmos5W7k/jtJoAcnvUgy
	VH2+io44+yj9G9vt2/ZVWtOTnGBXAsYne0MBInK1fv7qVYg7KB9YeLfyd+wFHIu6r+rR
	aT1DQtAnpGLxrTKbXT/L5GPzNAVEIVgZILLWuVfdiaiCskF+BbXlThmdTqlBtJ99ULe5
	HcIQ==
X-Gm-Message-State: APjAAAUQqX5rg5cRNOD1oElkaV3Ts33s5lUEp0puAucs9BWZl0RIc/Wv
	q0CU/kOH3gcszhmGZ1knCHZMqIvPApcOojGE5I4VSw==
X-Google-Smtp-Source: APXvYqwkEX56NRMcSKJ2THX7h2m6Xc+bnu9S+J34vxU1rqQ4O73qQh9hWJ9oOEuYfmMprzmXkPm87ev5Sf6SNElFBPs=
X-Received: by 2002:a05:6638:348:: with SMTP id
	x8mr7625793jap.79.1551965347160; 
	Thu, 07 Mar 2019 05:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20190307131832.27205-1-max+openembedded@blarg.de>
	<CAJTo0LYAOqVjJhGwKqNz0j48QP1LEazdCzj432=pw-i+qpe=Ew@mail.gmail.com>
	<20190307132737.4gdibq65rzqwdjcy@swift.blarg.de>
In-Reply-To: <20190307132737.4gdibq65rzqwdjcy@swift.blarg.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 13:28:55 +0000
Message-ID: <CAJTo0Lbp7ndunvarBp2WerJDUh2+esPTs0eFnvehcc+2-yDCpw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsndfile1: make sqlite and FLAC/Vorbis optional
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
X-List-Received-Date: Thu, 07 Mar 2019 13:29:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2019 at 13:27, Max Kellermann <max+openembedded@blarg.de> wrote:
> > How about renaming the option to regtest and disabling by default?
>
> What do you think about disabling it unconditionally?

I wouldn't object.

Ross

