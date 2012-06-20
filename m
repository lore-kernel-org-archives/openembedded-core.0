Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sh96a-0001sW-C8
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 02:49:08 +0200
Received: by eaal1 with SMTP id l1so2243871eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 17:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6EPZ+lMyJ0Nze4B6E7RQl7He+offE7RsnDUL6uYFeO4=;
	b=ibNqgV1nzxfpCjlke8B+QKQg+E4TC24jLvIigiZD5Pm/MjLUm7G11Yf1pN9KO1WHr1
	J4ts8ophyNoRw0cicavHLwjRBaA/zjRmbN31/FZOJYiwNYGeZF2yXQAdGax8taqQV5z3
	KuTzgbJn0TT/Q2btHBpKc5GbqhP46WOx3TEHHkdaVmr8LHHt8WwrXApybFSFk8dlVOd6
	kUg9OCrDFQOm57GIaSFeitg7R1NiLqoZp9qHuZzWG2q+5FI/GXwwZ3iDx2s6wBt791Ov
	Khy8tLWYCPjeaFfGsrmAWuQ/OgC7f1vsb1/m+PO4aA7ESAQhOc0Taxuf4DHMmINWiWVY
	Vg+A==
Received: by 10.14.97.16 with SMTP id s16mr4416156eef.117.1340152704370; Tue,
	19 Jun 2012 17:38:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Tue, 19 Jun 2012 17:37:54 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1206191652560.3440@oneiric>
References: <alpine.DEB.2.02.1206191652560.3440@oneiric>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2012 17:37:54 -0700
Message-ID: <CAMKF1sqtH_Va4w8ayxm+Qi0pH_2xmeFnMcHLHUB57uQAZp=5bw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Simplify "SRC_URI_append +=" to "SRC_URI_append ="
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 00:49:08 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for doing this

On Tue, Jun 19, 2012 at 1:54 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> +SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "

while you are at it can you remove apply=yes from there ?
since thats the default anyway for files ending in .patch


