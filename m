Return-Path: <walters@verbum.org>
X-Greylist: delayed 532 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Sep 2014 21:07:55 UTC
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4706FDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 21:07:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by gateway2.nyi.internal (Postfix) with ESMTP id C32522087D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 16:59:03 -0400 (EDT)
Received: from web2 ([10.202.2.212])
	by compute5.internal (MEProxy); Mon, 29 Sep 2014 16:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:x-sasl-enc:from:to
	:mime-version:content-transfer-encoding:content-type:subject
	:date:in-reply-to:references; s=smtpout; bh=fyCZcjsEGFSXUEL1zDt8
	ogTIPBU=; b=lLheo9QbF/032Il4GjsdsrGUaB/YKfQglq7HleBPqPsqcW5CSIzz
	ckzFGFsKuk7JSjd/CKLv2Tge1AuNe2rXWtP87WBci8YdEvVwTyWF4G7hg7sFTHjr
	4YBa4tCx9c/osObfT+XCGvWLaQyzDXuDPooPsYyJdX47m5iC4NeF+nY=
Received: by web2.nyi.internal (Postfix, from userid 99)
	id A74CB54033C; Mon, 29 Sep 2014 16:59:03 -0400 (EDT)
Message-Id: <1412024343.2853314.173154429.5067015A@webmail.messagingengine.com>
X-Sasl-Enc: l8t6pMKf8zC1HX5vRVqCiePVcvqNHaGnQ6sDmTO0Tmo0 1412024343
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-cad53418
Date: Mon, 29 Sep 2014 16:59:03 -0400
In-Reply-To: <1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
References: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
	<1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] systemd 216: add system user factory files to CONFFILES
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
X-List-Received-Date: Mon, 29 Sep 2014 21:08:00 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain



On Sat, Sep 27, 2014, at 03:22 AM, Koen Kooi wrote:

> +                ${libdir}/sysusers.d/systemd.conf \
> +                ${libdir}/sysusers.d/basic.conf \

Admins aren't expected to edit these - instead you override in /etc.  Or
change /etc/passwd after the user has been created, and your changes
will be respected.

