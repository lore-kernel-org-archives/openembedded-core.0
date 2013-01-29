Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0E3I-0007uS-H5
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:28:52 +0100
Received: from mail-yh0-f72.google.com ([209.85.213.72])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 08:13:11 -0800
Received: by mail-yh0-f72.google.com with SMTP id z6so782404yhz.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 08:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=/O5MTKqioc8TY1YLoXCXfDqYKXYl5BXFaP8VSO9qPAA=;
	b=WNyh+8VNn3/zeuvzEJwb5ew9jI8WWZTnqTwNgqAOfG+bbHC9VijWgu9mZKdIdmcyk1
	BV/3/tmgZswnIlzWJSAyIJxDN2zSzv6+UXoC12gosnr5aXimj9sghOaWeCVO3OSH65g2
	nw1M2SPXI214nOnvvnVR8IK8eBTJL42ojIpPrujtutCxUWQ1wW8xxeTumBnRDjS8DvCb
	l6nm4irdO7vFFq+fHeDLZXsyQA4TRdjFz+Kf8BjZ5mH9D1PrzgB9Jk741ZH9g5qsJBuX
	wtSD7UOLEu9C3Q2c26bep4kGhKFjTrIxZ8jA2yNUdIT4piA2wHZVqpkdM8Vr0JmtovPV
	e0AQ==
X-Received: by 10.220.218.197 with SMTP id hr5mr1589535vcb.8.1359475990347;
	Tue, 29 Jan 2013 08:13:10 -0800 (PST)
X-Received: by 10.220.218.197 with SMTP id hr5mr1589532vcb.8.1359475990270;
	Tue, 29 Jan 2013 08:13:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Tue, 29 Jan 2013 08:12:50 -0800 (PST)
In-Reply-To: <20130129155615.GP16904@jama.palm1.palmone.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<20130129155615.GP16904@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Jan 2013 16:12:50 +0000
Message-ID: <CAJTo0LYSwOTCUJ4kF1LtEDuZyKf7LSs+=51WAWv6Q4rDPN9wCw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmEh4FAt4GE5kixveuPckljXtFqM2acJoY7uBcVUtvpggyHaKCen2Jn/V7psimVMaG0B8wgoHlZh6BNXIgXe6t9PsvvzgjoRHitZ/AJy7+8SUNL3Yd754iSpIOMEhst5iy1s2Oqht3aWBSLpSMWUWmAX+I2pTa16d+dkTQ+803RymYAgCuQJYHMWkb98X+yzhH/2qVq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 16:28:53 -0000
Content-Type: text/plain; charset=UTF-8

On 29 January 2013 15:56, Martin Jansa <martin.jansa@gmail.com> wrote:
> No upgrade path for both.

Do we really need to add an upgrade path for packages that have only
exists in git master for a week?  I can understand the desire, but
we're not talking about a release-release upgrade path but an upgrade
that will only hit people who are using oe-core's systemd support
right now.  I suspect that's a fairly small number outside of the
developers.

Ross


