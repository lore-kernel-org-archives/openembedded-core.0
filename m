Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (unknown [209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 68FD460167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 11:43:28 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 63so13660557qgz.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 04:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j/H7iN41z5qqYIrQiqaUmFs809br7sODfSwcTZAMgYs=;
	b=BP19eSusmxN1KTSFN/Bjx4qWo/mUersAvVQe6DNPQDNQdjuKaMFnKcDe8qr5SvI3p9
	zJ9146kCUZ/puAOaiLLDvJ36QuItJGNn40htJlofGVLFoJ1+iOCQJ2dPS0wtHYIuYSg5
	pDL849bISKZWmX7XcGxstdSTUNRdhk5qyRZbD25W9UgufzVBI3QOzyPwf+5WSiiOIcyn
	aUpq7AnsJJh+1rzjeiizdFVoRfsbMak2pMwJ/yFFYZqN32IpBK0U4WxJKHgrIilPTEB5
	Q7dQBz47XDQnepIzqPDztu5NFMynTPV5KBZCMWZ3/Q+nmLRL3Pouxp5UbtbaruG3CFVo
	Ywng==
X-Gm-Message-State: ALoCoQm9lHQ3yIuM1Q41nKjesef2T1NZPubTNsyrFeRKyI9IGLT3kKVakJjcYmN0NAKC/7h1lCvL
X-Received: by 10.224.166.73 with SMTP id l9mr41148192qay.34.1401191009742;
	Tue, 27 May 2014 04:43:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 27 May 2014 04:43:09 -0700 (PDT)
In-Reply-To: <63ab824a613874b93978ebf17afe2f6d69a58faf.1401155797.git.hongxu.jia@windriver.com>
References: <cover.1401155797.git.hongxu.jia@windriver.com>
	<63ab824a613874b93978ebf17afe2f6d69a58faf.1401155797.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 May 2014 12:43:09 +0100
Message-ID: <CAJTo0LZhh6WNn4vyNyzQ_yo9mKqikizb-UkkbUZGsPyN=UzxrQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] socat: fix linux/errqueue.h not found
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
X-List-Received-Date: Tue, 27 May 2014 11:43:32 -0000
Content-Type: text/plain; charset=UTF-8

On 27 May 2014 02:59, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +-AC_CHECK_HEADERS(linux/types.h)
> +-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
> ++AC_CHECK_HEADERS(linux/types.h linux/errqueue.h)

Have you checked the config.log and config.h to verify this is actually working?

It looks like you're simply removing the AC_DEFINE of
HAVE_LINUX_ERRQUEUE_H which is used as a guard around
<linux/errqueue.h> in sysincludes.h.

Ross

