Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SvtRR-0001jt-8j
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 19:07:37 +0200
Received: by lags15 with SMTP id s15so3030365lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=ZWncjade8WlNYof/xXVIz4CsW6mdPJwPPpdsfO/Ovfg=;
	b=UPQbAx8IwvsVYPOl8sTeMb0XEprgWFfatQ/ACEqbvgXj0Cw8uUU58iwQjIAJU/WNT6
	P1wz3jf3vmYVOTHV9voySnFtZ2tDsuo2lfwORIs6q59pjDFzLzNO5XwVBp3T3yUUg3lO
	/NeCe/dblg/od5sm+qEV5Z78QAy38QUwotjLVpGNP+DDoNuXJ00WQoj4BvThxWnq8l2r
	+vjebR6FsQCPs/EruCAQDQbflTaqSblgkXZSIkabUi3lTUm/2FQcW8RH84OIxULJU0xI
	UOXqiytwBVHDbTKi/aClPyx0waSjLrndTLYIA8gZogknfEAxFgkNXZAO85qifnnKGVwj
	G5lg==
Received: by 10.112.30.41 with SMTP id p9mr5681861lbh.26.1343667361232; Mon,
	30 Jul 2012 09:56:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Mon, 30 Jul 2012 09:55:41 -0700 (PDT)
In-Reply-To: <1343639326-29842-1-git-send-email-rongqing.li@windriver.com>
References: <1343639326-29842-1-git-send-email-rongqing.li@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 30 Jul 2012 09:55:41 -0700
X-Google-Sender-Auth: LnOixArM5HyFhxxYjLBOXNmfzOs
Message-ID: <CABcZANnA4U61b+3ZyWJMmHzLCBT6Q1q73-N8ChkEbhbz_cQttQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] slang: change char type to signed char in macros
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
X-List-Received-Date: Mon, 30 Jul 2012 17:07:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 30, 2012 at 2:08 AM,  <rongqing.li@windriver.com> wrote:
> -SRC_URI_append_arm = " file://change-char-type-to-signed-char-in-macros.patch"
> +SRC_URI_append = " file://change-char-type-to-signed-char-in-macros.patch"

Just move this into the main SRC_URI. There's no point retaining the
separate assignment.
-- 
Christopher Larson


