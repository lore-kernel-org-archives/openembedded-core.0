Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 025D87D7AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 21:40:33 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id w15so7621103itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tTz951tpvbT6bhMy2IVFY+M6LM58CyFwu5FeUPFLde4=;
	b=nyYVm9LWJmX4RD7LrEYVq0ZPjiQNZmjOyZZ676Lrp7HvthREJsGfW9Nqj5nOvu1v4m
	3kDOuKpT+eAvZ/UTiT27Wrf9pUK61ipMx7k2d6MTsdAPJbgr+yZv8JK0qP8GAV19SzkE
	IvfbnQEbFPI7VHRG3esBWmE5cwQYKAnshKnS4W1vZjcXtpPvlicrbwVIo7vEBL/0IWwf
	7Z1vYGZqs3yjFbDV4rwmY5Xj+uyj4ckfXLWtrrD5WeCtsm4uh5lcIYcwSOc16Kk7OpDl
	4rH95lVJRWj2PBcZWcO1HEjvdgVTVXN5TUn/7CgFEpSWo8y/GOe6Dp27bFkGQfDErYHO
	FAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tTz951tpvbT6bhMy2IVFY+M6LM58CyFwu5FeUPFLde4=;
	b=bFO7dhkYg57H4XawNXwZWXqdpd6VdKiz1WGV9842GsJtPCKLC1hJPHC0vZDXkFfs5/
	+EuFKJMkkICeixP2mqYz7px4ZXDTlTA5dizgQmDIB+BiF7H4LZKuuQCK1YLK0Ucf4VFf
	O/SBaG2iGQxrLJIQ/XWTY7MEIbXsd7tMsPPn3iigUL30Fe6G0/gdZ/R+jILiBjqySxNr
	EHt7uR6gGhobt9v6UF4Dk3bW2wEPDJuyQyyuN7verkR8DXsu/vRJi1JsXOmGWXXnXmnk
	Ohl0I8sWDC9PuQidlP9WJ4fi53YMnUL6VijxwLQBQUgYqJcE8SLrQ51QWVkvxtVaQLGv
	8Q+Q==
X-Gm-Message-State: APjAAAWp1ji3HAK0gyZz21FdE0/648qDwOqgYr4+kQ+rs8z7mElM8NdT
	oMLFdT/OQfm6JMpTDKMSRPVmwjgNNeM1JKVd3So=
X-Google-Smtp-Source: APXvYqxxe9bH1AjzpnVezePU4SSE2NOsMPQ0I1uq/oV6fcT+VS14hXgPTMMYU8GinVMInYougC7S2fRC+slHN1KT9sw=
X-Received: by 2002:a24:fc06:: with SMTP id b6mr445860ith.130.1554846034977;
	Tue, 09 Apr 2019 14:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRT1ng9=Gfd8m9g=L4BnyvsF6qE_rL79DxdDNZ8yKaEtDA@mail.gmail.com>
	<CAJTo0LaSMUzctZU-hXvA4DpuqubBY3GNPGrFJM6Etd-96NxZ5A@mail.gmail.com>
In-Reply-To: <CAJTo0LaSMUzctZU-hXvA4DpuqubBY3GNPGrFJM6Etd-96NxZ5A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 9 Apr 2019 23:40:23 +0200
Message-ID: <CALbNGRSeHpT2xFrJkPUEey-BbXZnBnNZC96cZ_9joUN2UWeTkA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build broken with current master
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
X-List-Received-Date: Tue, 09 Apr 2019 21:40:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 9, 2019 at 9:52 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Hm, annoying.
>
> The recipe that depends on docbook-xml-dtd4-native also needs to
> depend on libxml2-native.
>
> Ross
>
Do I have to go through recipes failing - or is there a chance for a
common solution?

Andreas

