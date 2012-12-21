Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm1Ix-00081i-TQ
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:02:20 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 03:47:32 -0800
Received: by mail-vc0-f197.google.com with SMTP id m8so6490906vcd.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 03:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qx+ZJc8sbbt7JWutm27/Q4YHrNscE/ukiSh6g9TvnzQ=;
	b=HVqrjYq1yh94uUoOADYoBdP9P2tBGT1/4kLoWg6HJVQjs+XT5iTC2cb9BhrT9vOn2g
	M6QBfia63MO1M7HPQwbWEqSGxJMiWYj09gObxn5RdJ4h9DfAwdy0weevD2L2agq21JkP
	vWuU7JHmyaZBoYs5V815k5YbRTYE9sGRkkoDBSrbIO5i/ZJaqneSQwq/U/DzKpzkwwMB
	lMqqLtEgswytT3lwVc0uhL++KEI0I1kR8Sj8HIVfMf5gv1qJ8lxGeUoktgXRDbKg/RzA
	GSTTbNVdbr51EOctl4k41661SEvY+9qU0Or8WlXiWbX2yh3HeKhupoqiQs2bUoHD2Tbu
	cjBw==
X-Received: by 10.58.221.130 with SMTP id qe2mr20253048vec.14.1356090451398;
	Fri, 21 Dec 2012 03:47:31 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr20253038vec.14.1356090451336;
	Fri, 21 Dec 2012 03:47:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 03:47:11 -0800 (PST)
In-Reply-To: <cover.1356021837.git.alexandru.damian@intel.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 11:47:11 +0000
Message-ID: <CAJTo0LbiAedLWj7YNHEjXyS9XhUPpOWcHuB+RUuXhMBkWFSAiQ@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQktH0P4p9Cs4fU/gOpT3e7P8/lcuUoOuiu/K4OPGFQZCa4f3Jtc8H3nmNH6dscMwvE6jaNNnpvcBLmJxH/RbS/mRcE9l9kpWt/s+y1LkFc7RiJ23wISFNfCC8F+2MWGECP353/zE2hsKvdvaXnHHePJMVYsIoGhD28sDTf7hpT/7T149yo58YSEOrXO0ezP3JB9rFDf
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Initial wayland integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 12:02:20 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 16:48, Alex DAMIAN <alexandru.damian@intel.com> wrote:
>   Wayland userspace library initial 1.0.3
>   Initial commit for wayland/weston 1.0.3
>   Prepare mesa-dri for weston compatibility

Ordering seems wrong - shouldn't it be wayland, mesa-dri, weston?

Ross


