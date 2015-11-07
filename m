Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2D675770E3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 07:09:35 +0000 (UTC)
Received: by iody8 with SMTP id y8so143239382iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 23:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=X49tXJyzm9+s488dWc316Tuu9ogNhofeFUZv+vQOji0=;
	b=EeSU/0q5knbUY4q8gidZR1JtsKFY3L67/ZWKor6qS5gQWMA90ocdpZWCtlNZRHtUmY
	CdtUCpah58d7W6aBuRJnE+XDS8ixA5ZwamDguVcbZ+kcs+lZzwfiwToMWXTl8riFPWnq
	wdmPc2P+BTry42JjoNSfZRLDfkxdUD1RULZJuUTKgTstYbZGrZk9OlhBNMqdnCQIVTmK
	cFrzbFG4a8VytgbHJmgCef0ILlbNJUzP+Txgs9Cdt9AcLY9Bq8dS4cbqlvIuEU/GTmQY
	oKmrIPBHf6EdoETJHKTXDNjKhtWxbOlQnztSozlG9a7v1B/WbNByE0Wju37Jl8ILJQuM
	0V3g==
X-Received: by 10.107.3.77 with SMTP id 74mr17585261iod.49.1446880175717; Fri,
	06 Nov 2015 23:09:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 6 Nov 2015 23:09:06 -0800 (PST)
In-Reply-To: <563DA31B.5080404@windriver.com>
References: <1446703751-58313-1-git-send-email-wenzong.fan@windriver.com>
	<11B9075E-35C1-4101-8072-D44DCDF9A210@gmail.com>
	<563DA31B.5080404@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Nov 2015 23:09:06 -0800
Message-ID: <CAMKF1spYkB4xA94TuVUkaX3g-U3+TmPnhDQMN+EzTgX1pMKZdQ@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix mips64 configure support
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
X-List-Received-Date: Sat, 07 Nov 2015 07:09:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 6, 2015 at 11:07 PM, wenzong fan <wenzong.fan@windriver.com> wrote:
> If target name is linux-mips64, set it as linux-mips to get it build with
> mips(32) userspace.

is it really building for mips32 ?

