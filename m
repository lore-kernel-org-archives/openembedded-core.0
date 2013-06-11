Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id CA0666A5FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:32:40 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id f4so14334109iea.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/LtRIgz0L7zSLYQrcI7Bi1BuZNwVEPNtxLNFdrMUez4=;
	b=ZPH6D+PkbhyJoGHBBUokvHfnfZcv7xS+xtIdtL7aFNiAnebirlKZlbxFF+/t+ER/te
	qn+l832KEkhoYkO/DhBpK4kpCc9cqjVMHETl+ZaA2waCiZYlregnXfX8Txq55B4b7iQD
	KGYmKbRfV0SGUW7Q6TRXE8RH3yZmz5sY940LR2MMV15sqdsymB7N8YL639VGXYogcFbI
	i7B3chuXjg0NJ40AEfrTMIgFzAXe3AdCvqL2fgmct0/NZo1DSWV1dbWQ8jeKiZamWosA
	CjjhXEgu6vKgDOUTfFyofqDI4J1B16Hs8LPIjl1LuXXn7gi5v9MA4jREwP+uptCvOyoH
	QUuA==
X-Received: by 10.42.11.211 with SMTP id v19mr3431717icv.29.1370939562079;
	Tue, 11 Jun 2013 01:32:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 01:32:11 -0700 (PDT)
In-Reply-To: <51B05874.8000404@windriver.com>
References: <51B05874.8000404@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 01:32:11 -0700
Message-ID: <CAMKF1spB4w3PQrXaxUZi98hT+bv44-BGdz0knMvGe1xBWg=zpA@mail.gmail.com>
To: zhangxiao <xiao.zhang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions on nfs-utils package: Client and Server RPMs.
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
X-List-Received-Date: Tue, 11 Jun 2013 08:32:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 6, 2013 at 2:37 AM, zhangxiao <xiao.zhang@windriver.com> wrote:
> Hi Experts,
>
> Currently, YOCTO's nfs-utls is separated into two main packages(RPMs) client
> and server.
> They are not depend on each other. Client has only a mount.nfs user space
> App. With both
> client and server RPMs installed, all works fine. But if we just install
> client RPM without
> server one, we can only mount nfs server with "-o nolock" for lack of
> rpcstatd.
>
> While in Debian system, it separate nfs-utils with a different way: one
> "common" and the
> other called server. Common contains mount.nfs and many other Apps including
> rpcstatd.
> This way the client side(without server RPM install) can mount remote NFS
> server in
> normal mode. But the side effect is the server RPM depends on the client
> one(Debian
> calls it as "common").

it seems a sane approach. Patches to restructure the packaging is appreciated.

>
> On this topic, any opinions on both styles? YOCTO Vs Debian. And, any plan
> to modify
> YOCTO to align Debian?
>
> Thanks
> Xiao
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

