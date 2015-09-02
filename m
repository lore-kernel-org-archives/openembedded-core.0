Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1BB7704C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:24:57 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so28840748igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=wGXpgayMhvTQOoYA8bhCcRPKaak8hitfQxsJpr8yLec=;
	b=H1DDap+vpWSlbyIOeVW8r44SrnyteYFI/09+e3Qf0GmVPdkua793gyVURDgWKDj/Dz
	Vac0OFs4L19RxV3m7o8QwrRlFMDdxK+Pih3SluztDOxIR5DdlS24E9Sn6Ha9dldLTF0o
	UJqItQ+rTscFlWuIuxm4q2ldMYUax4F7gh+wNlOZp2AtByYxvjPM9IB33K60I3WD/82c
	qjnCTfMpIJib34JBOovlYgoZGnVs+soUp0dR0W33nEKs6I9X42WUvZnAoIz1t1/oHTpy
	CqfclMfIa/hgSLj/BzXNYQGHnNYpoJ7C79BaNQ9VfFyYIfGMwbVqLJtKUZMyjeVT1tVO
	q5rw==
X-Gm-Message-State: ALoCoQmwjoLssxr8AmHq32kyNDgwjAh1En3YxP6znmZn7B4xq/YsUhJM/GqV/nT8d4Oukwhbfybq
X-Received: by 10.50.50.134 with SMTP id c6mr3887975igo.33.1441211098117;
	Wed, 02 Sep 2015 09:24:58 -0700 (PDT)
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com.
	[209.85.213.182]) by smtp.gmail.com with ESMTPSA id
	g85sm19549179iod.32.2015.09.02.09.24.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:24:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so28840134igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:24:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.72.19 with SMTP id z19mr3854044igu.19.1441211096615; Wed,
	02 Sep 2015 09:24:56 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 09:24:56 -0700 (PDT)
In-Reply-To: <CAP9ODKpmtON87ZkXHP=gecSznBK_GXFAa=gAkicU2p2WV8qavg@mail.gmail.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<784e52fcd898a07a12236058026fd48d0e01c8b7.1441207840.git.patrick.ohly@intel.com>
	<CAP9ODKpmtON87ZkXHP=gecSznBK_GXFAa=gAkicU2p2WV8qavg@mail.gmail.com>
Date: Wed, 2 Sep 2015 13:24:56 -0300
Message-ID: <CAP9ODKqiej_Nm_4Rrb1J-BWFwSG8hWzLZ3So_BUSKQ-gKWzCjQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] initramfs-framework: support mounting rootfs in modules
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
X-List-Received-Date: Wed, 02 Sep 2015 16:25:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 1:19 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> If there is any limitation please share the use case so we can
> understand the need for it.

I found the live module and understood why you want to do this.
Instead you could use:

- live as 99-live
- move finish for 99-rootfs-mount and split as a package
- put RCONFLICTS and RPROVIDES initramfs-module-rootfs-mount.

We can than do the choice in the image and avoid both to exist in same
initramfs.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

