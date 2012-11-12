Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TXwr2-0008C2-TX
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 17:27:21 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 12 Nov 2012 08:13:26 -0800
Received: by mail-ob0-f197.google.com with SMTP id tb18so19977030obb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 08:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=b4ytA4/FEojGLrbjgLC7r0WPGgfzE+mtmDVnglyTT2k=;
	b=PTYWNOJNombTmMELlbIyHt1aOElk09PXwBucgFcoxBBSYxFUWRA6T4odUne7Eg1OKw
	FnLruBQM/+zxFpHoe4ITAARqFsGo7eDXv+LIhGXfN6yYMtqB3Nnxjp7xQdovbr0dX3gp
	NEG+5qwVje4jdG8fwt2038myDBvFZtgPr4ot7TLEwxawOl7Tf0HjGTn7iuj3jEw9FZPV
	2ximjD1g7ki9TsSbq4UQs1+GXXMG34hxYBDZj3SMJd7sAOabliGeRHr8f68g4KzM38D7
	YlK1AX1siZq3sUcBa5u2bRDV7kANiPyoYu5qEcrlfI+a5B0LJGE68s4KBAhuQX3Gc30k
	HeOg==
Received: by 10.182.157.44 with SMTP id wj12mr15473923obb.41.1352736805150;
	Mon, 12 Nov 2012 08:13:25 -0800 (PST)
Received: by 10.182.157.44 with SMTP id wj12mr15473917obb.41.1352736805005;
	Mon, 12 Nov 2012 08:13:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Mon, 12 Nov 2012 08:13:03 -0800 (PST)
In-Reply-To: <CAP9ODKrtmGBg2gHx2=SqjRBVH3AwQtBkGFe-jsuTLQb+RmT=4g@mail.gmail.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
	<1351798319.6502.19.camel@ted>
	<CAJ2CSBsLk0HC8Lx0ptTzBPY1EVKan5o+wb9AbHcGy4vORcu6JA@mail.gmail.com>
	<CAJ2CSBvFvXXk93A8or4M6vmGo==h0F+VOR8-FVAFP9jYs8FS1w@mail.gmail.com>
	<CAJ2CSBuAx4AuUFCKVHsCjDvFuhGkQyOi-jAkuhCD9e4mgMm47w@mail.gmail.com>
	<CAP9ODKrtmGBg2gHx2=SqjRBVH3AwQtBkGFe-jsuTLQb+RmT=4g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Nov 2012 16:13:03 +0000
Message-ID: <CAJTo0LZrxU2mparU6upANr_O9SkFJoE+YVNtOy8i7EuLnaCv2A@mail.gmail.com>
To: Alexandru Damian <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQlrX6ASAtGST6xeVlupx6xwU0IjVZwynZVpSm24mZJE6eatSsf+BZZSTZCevw5HggKdJ4x8dEFKoOYpjf5SuMgs9vCQjr/WOUg5bpyQEMWcsm29fphDNNrFUqfhLdAFUYbY0l9Z8r5M7mKyfuF2UgXXqrn0E0wIBmDxhOX6JixOcBnEQn5WOv1gzVzmQ1mNulhYP4K5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initrdscripts: fix udevd path
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
X-List-Received-Date: Mon, 12 Nov 2012 16:27:21 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2012 00:01, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Please split the patch in two: one fixing udevd and another with new
> features; please tag it properly  as v3 so it is easy to spoit it.

Alex - ping?

Ross


