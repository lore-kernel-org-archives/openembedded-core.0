Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4828C7D3CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 09:03:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so33461171ior.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c0AnbzC0iHyjhpXpyymEHZIUfHTN6ghos0/CIdDnSCo=;
	b=udSdi2jnrFoW2pN5Mblsew6otbjn3rt6Pso/cpNjhjpgqRvVWK5y7/7KkkdexBSZh4
	rm+XjabEFOpFtnmdLiHzhM4y6V3dK8GFd3VDBf028/xZdzXRMXZpYOJVN3o7CQj+kTW1
	APIf/pIdWdmVT5o9zca5CzS7tTHxpJHgY/tLZfub2Tn2LytgPkS+EiWRcwB/sSxhU6At
	i5TAwlMxXnKDwt/RGnyXDW08u+HzaPPuPuUDQQ5FhwdLnFkew10zOf+yXoSUV1iH2UhE
	Pg79ZAqV8Raj32JYjcG80ZpGmqg0rIygWYQFO/PHbtbYGCzTQd3hAnI7y0cUfVNxUPk+
	VGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c0AnbzC0iHyjhpXpyymEHZIUfHTN6ghos0/CIdDnSCo=;
	b=AI7xfmdTvLZQZZm50Olr7LafwyfBZf2WYPTFCUc27Q3sWKTvNaImCI4G+WAH6W6FiA
	VVdjr0FO4BKN2BFaUQhlmHLKNerXoSpFiqRbb4kDDuJ8IwDdZXP1FAOXu+8PM4FJb9Da
	uzF6qEXbr1dr59oUkxeChGphy7Eyz+m4+GiIZw+loq/7RFxNF9iXgox4JPdVsOTSK9Nr
	SyvsXiHhz55IU75aTmYLC1XHO7EU37sTXlAszGu3iiAmsWf24t62PCn9b8n7hLGChYKb
	l1CAooPLpj1QHgAw4kZBDJju7PMvqShlGAiPwj4AbBoJla5PLYtG3w3IL3Xap5Z5rBUU
	YLWw==
X-Gm-Message-State: APjAAAWjob1cDZ0yar8RDeVCykTvS+78quE/e2uKgrnM9uviWgQ+O4Xf
	vfIQQgUve9PCZ5K6KhCoK8W+aCU0FoJQRFZa1aPZXQ==
X-Google-Smtp-Source: APXvYqytOzku5g+GAGJNx5qjVHNSXl9emNFbTUdzytw09K3cyCCf7pgmDyhzStE8v8S44yMrMXHM7/ssiDEF+5uR1po=
X-Received: by 2002:a6b:e608:: with SMTP id g8mr4597864ioh.88.1562576625253;
	Mon, 08 Jul 2019 02:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190708081423.8849-1-lemagoup@gmail.com>
	<d6dc1c53-9866-16b0-0393-d5fc508e3738@windriver.com>
In-Reply-To: <d6dc1c53-9866-16b0-0393-d5fc508e3738@windriver.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Mon, 8 Jul 2019 11:03:33 +0200
Message-ID: <CAEz4NHo2b-Dtm+qDBFhuO8bszVDvZZpo=9ABUZt2zGRHxCPBpA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cve-update-db: Skip recipe when cve-check class is not loaded.
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
X-List-Received-Date: Mon, 08 Jul 2019 09:03:44 -0000
Content-Type: text/plain; charset="UTF-8"

>
> Great, the "bitbake universe --runall=fetch" works now.
>

I just forgot to rebase this patch on the previous ones that are in
master-next, I sent a rebased v2.

Pierre

