Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rwp1J-0002AN-C8
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 07:04:14 +0100
Received: by lbol12 with SMTP id l12so2313483lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2012 21:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2k6ji1KHmaC32PYwJ+qBcyEd2jYV/A3wCbPWWRCUarM=;
	b=HLgvOi9hA9yUsfQiA1WH+REU2oicSQ+Nqhw4YuRcWWEja8D5q/MsTo8bg+Gegvb26R
	b8AnFygmfFK5Vq09W1k65mZY11tet6CdRbxRkxggye7oMTxmRf5YL6ucJhnCwL5j9x2N
	MTTRJ/A5bpYaKGjKwJQEmUYBqXIDikoeBqg3Q=
Received: by 10.112.32.1 with SMTP id e1mr5294790lbi.3.1329112564242; Sun, 12
	Feb 2012 21:56:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sun, 12 Feb 2012 21:55:34 -0800 (PST)
In-Reply-To: <20120212185610.GH10322@jama.jama.net>
References: <1328888467-31364-1-git-send-email-Martin.Jansa@gmail.com>
	<20120211020527.GD2095@sakrah.homelinux.org>
	<20120212185610.GH10322@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2012 21:55:34 -0800
Message-ID: <CAMKF1srF1=LLi-_KsgXXVmJNVUaD7PhOa_pTDH1V2658HsLqEg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] zlib: export LDCONFIG = true to disable runnig host's ldconfig
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
X-List-Received-Date: Mon, 13 Feb 2012 06:04:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 12, 2012 at 10:56 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> So should I just send patch which removes ldconfig call from install-libs?

i think that would be better


