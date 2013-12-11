Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id D671E6DD9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 08:17:24 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id u14so169539bkz.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 00:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=I9zMfmlD5tvEN2GPfmVVk9/tiJbGuk6SHPkvGzsSIg4=;
	b=VyW3dM0yR351QJ68DYGIQpFVEsjos1nmBaRL1MwI8qtvglD9WordfQlHQK91nPH6c7
	xjca7PQen3eOnBtDSFErXkJXgn1KlegIcUsjHspTfFd6nxAydeBrUipv5vqM+46qhUm1
	AzZ1Ggek0QLv3txs9eMkAfo1paliKjG//fQ9kNwDRGGALg9v8mMCuhHOOoarfUJ3bwd/
	abd10nsl6FeZ4V1hK1tehQ0oCrk3oKmJxQRzQyUk3l7dSwcQFKSdL9Dz8BMaRIPM1swo
	lyaFQ1c92cue0gqbmJFV+1/I6p/+Bc4HzuZtIU/L7XfldL+0miG0NYQu36qB+oNn1ho1
	TbgQ==
X-Gm-Message-State: ALoCoQn6HTT5Ous3WN1Yigipbsvap5iOji0DGFiOnahIvcYs7y6TQ1ETjbxwewdQb71/2NSXX6QD
X-Received: by 10.204.200.201 with SMTP id ex9mr18653bkb.75.1386749843656;
	Wed, 11 Dec 2013 00:17:23 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id o5sm13940795bkz.4.2013.12.11.00.17.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Dec 2013 00:17:22 -0800 (PST)
Message-ID: <52A81F91.8020105@dresearch-fe.de>
Date: Wed, 11 Dec 2013 09:17:21 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1385647771-24485-1-git-send-email-sledz@dresearch-fe.de>
	<52A5D813.8020803@dresearch-fe.de> <52A6DBB9.50700@windriver.com>
In-Reply-To: <52A6DBB9.50700@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH][for-dora] gdb-7.6: fix cygwin check in configure script
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
X-List-Received-Date: Wed, 11 Dec 2013 08:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2013 10:15, Robert Yang wrote:
> Thanks, applied to dora-next.

Great. Thanx.

Just for my understanding. May be i somehow overlooked relevant announcements.

* Where is the dora-next branch available (not at git://git.openembedded.org/openembedded-core if i'm looking right)?
* And what is the policy about dora-next and dora?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

