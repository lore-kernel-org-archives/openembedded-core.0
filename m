Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id E58F175791
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:59:54 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so85958822pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=He+26wBaAnEUY4ues/CV45b239gcLQPzGrVEjL9T/54=;
	b=SaJnbP7Im+xsZkzUJchD+FB1AUFEAeqBYoalSmHVSUE8SGzVzXa2ahyLZXQJmLQ/9a
	s4xEbd9n7O44v9h+bdkTL6JrdhWjoTOd2ZJn2O+cClcIEcGHpsm5+nGbfYLyj1Y6Mxn/
	L4eaM3GOkJcu3+iMQZmF/ng78XT941k3CDklihzjU8Kvmnpv5F8/tZxVmfd9JIXeiWTg
	kID4JNzRb05sjcHbfjp9aTE6CEeH/IjWb2ooz8bjcG5CwDmW0kG3odZQCS6H/HdB9bV/
	MbdKWCEvhBpZKLLyr4HPxR+TPNKPp2Eiig6EAAHPqkIW8vFDYQpIuBwN6lCaOXRYwNI4
	sEpw==
X-Gm-Message-State: ALoCoQmq8Gm9HOyITKZMBRp8oUH8WrFwQlbVIB0Nj+DBmeNdgLDZPbR4BjPlAIalFlugIkYMi+vu
X-Received: by 10.66.158.65 with SMTP id ws1mr18478465pab.18.1437656394537;
	Thu, 23 Jul 2015 05:59:54 -0700 (PDT)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45])
	by smtp.gmail.com with ESMTPSA id k5sm723403pdo.48.2015.07.23.05.59.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 05:59:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so156828692pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:59:52 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.138.40 with SMTP id qn8mr18397993pab.19.1437656392193;
	Thu, 23 Jul 2015 05:59:52 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 23 Jul 2015 05:59:52 -0700 (PDT)
In-Reply-To: <1437658192-8322-3-git-send-email-b54851@freescale.com>
References: <1437658192-8322-1-git-send-email-b54851@freescale.com>
	<1437658192-8322-3-git-send-email-b54851@freescale.com>
Date: Thu, 23 Jul 2015 09:59:52 -0300
Message-ID: <CAP9ODKri0A5Afup4Bvk-GNuWn6EnpDvVj=VjPMGbLfy7wSVBmw@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 2/3] gstreamer1.0-plugins-good: Add patch support aacparse
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
X-List-Received-Date: Thu, 23 Jul 2015 12:59:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 10:29 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> There is no need to check channel configure in adts header.
> The channel could be output of decoder.
> No need to return fatal error here.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

The Upstream-Status is wrong, as the other patches.

The bug reference needs to be update as it points to the duplicated bug[1]

1. https://bugzilla.gnome.org/show_bug.cgi?id=721697

Commit log is misleading. Please include a proper commit message.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

