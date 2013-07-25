Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id C2BBF6028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 13:42:50 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id id13so139607vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 06:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ijpCpgQJ3c/Pk16T2SFCgnwVqGLsa2eYuqfjQhf8va4=;
	b=buuX8H2nY4usmlSI4QZkx1kxDwN8K7e5rCF9pAFtQ4QVkl/fO/sdyPvS42xxvAJwuv
	wa4H6bDNe8Fh1koTQKmhmEPN1lAZ+Nn++95U28xdQlJA83L14LaeSuein3h4bHGHi0Nv
	qjyjl8VB/ct5RC8J8uV6oVx2+fuy6o8Qe+9iMlMVS46+ZqTq8xhuoJOd1o+BoueVncwX
	j4Ubijoq+Ro0+CJh4b341puMb7Vzh5M7SwbGkqgzEXip9qWKdfGvOrZMQxPPATwoHsDN
	X3Xg8nmHo8DmLr3obzhsbrsiQIgJ25VujiU7G5Jkr/dz8xYPZ5rKYJQzLQrI+vcUfmSv
	JdJw==
X-Received: by 10.220.124.1 with SMTP id s1mr586319vcr.93.1374759771111; Thu,
	25 Jul 2013 06:42:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Thu, 25 Jul 2013 06:42:31 -0700 (PDT)
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
	<2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jul 2013 14:42:31 +0100
Message-ID: <CAJTo0LYFgyEW0dVqAEid3JN_5AvZjhGZFHQj8o0sMeN6hwBOZQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQm5+HT2kIUYOtGtS9stfVuW1t/qqIr5uhstuFtnLfgD2Huq1TcyzYIbM1QkhRKPHvcYiyzC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/18] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Thu, 25 Jul 2013 13:42:51 -0000
Content-Type: text/plain; charset=UTF-8

This whole series looks great, thanks Martin for donating vast amounts
of CPU time to this!

Ross

