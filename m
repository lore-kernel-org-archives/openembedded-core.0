Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id 52F4071AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 12:52:04 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id f21-v6so3756594oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D0xOFISWiRXEKLS6yWUInfKgnm9f96fBxjM4qWvIVcI=;
	b=1VRv/VvFsiVGNV7uei7zj3Pxlfp9Mm/D77qlQ2iDMOR7jzFT6JtIj/ZthWuT7EzGFO
	erphkqAleD6MMEFXCQektqiEm3OtPdwnenkGqKvJ6TTB0yjXz1qzS+pPtc/m6L0zaj0j
	CTNt9Tc4qICyz4irvVfdzF/yI9vsMkxWDhT2b3FpWuyt6jNbfPqjNFGXLuMsIciOA8bZ
	CYcCvTPAN8z0MDWS1KEDf9H+5yhmio8yEBSJo2jsYqeP/QgLeX+7PO3IUsDlsI7b7zrP
	AIjJqJalcWEqdxeaenp7LGrfVlOUU+LDPyCCgu1OdmducXzh7Q4xeE70P03JsEnGmbNJ
	KMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D0xOFISWiRXEKLS6yWUInfKgnm9f96fBxjM4qWvIVcI=;
	b=gPfhEri4Kbna7o3G20ufPtNjyeap0eGEPssPFWqnFz/7Ttk9k0MjJzBK+5IyWfup4y
	d4PqBFMMgCKAGOsgkZ8M2zYyR5/Ov12wLentJwr5UoUH0KCmU8hq7VQ9eanqq8hi/bLt
	qHmfnh857+4SzB2xYO3Lb6vWR4lF2P9ERuqxw4bUnAjc9qAOzGxqcIyjTW9qwVPvxBNc
	0D5w0WHw8lOTvLgYJ0ud9u3UWvkr9pHYdKUA8M7dQ7Fd5p4Zx49Uub5rZpLhIfMJdD0T
	wQ8dD0mmKc//XMw60oUAWOn+OULCfr5rBd8bpsy6FZ/wmvIxTdAYq8j+rrrMpYaB4PXe
	2KVQ==
X-Gm-Message-State: AGRZ1gJj4wbse7JL3dzPAo0I/72fpzUXNIeYxOWSHPuK/wVnqrgmJ0BF
	plQ3DT/KXiCmZNQ7+UEF7KTOkUK5o8iN7myqmGrdbQ==
X-Google-Smtp-Source: AJdET5egQ9jkIWv/eFYIHL6q8+ozsUIo6sODs0aKEGWiYir0z3aL8DmUogwk2ZisAA/6q/LjjoKNrnvzsxt1nvJ/6Ds=
X-Received: by 2002:aca:ed82:: with SMTP id
	l124-v6mr8115748oih.188.1540817525175; 
	Mon, 29 Oct 2018 05:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2018 12:51:53 +0000
Message-ID: <CAJTo0LYq4aJAp8cUFbmGDer3t9cswKoeVZ3FYgWjUxC19LKA2Q@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] python: add tk support
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
X-List-Received-Date: Mon, 29 Oct 2018 12:52:04 -0000
Content-Type: text/plain; charset="UTF-8"

Terrified to ask, but why?
On Thu, 25 Oct 2018 at 09:39, <mingli.yu@windriver.com> wrote:
>
> 1, move tk recipe from meta-oe
> 2, enable tk to add tk support
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

