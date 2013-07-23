Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 018DF6AFFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 10:46:54 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6NAkrEO030357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 23 Jul 2013 12:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1374576414;
	bh=dc6JUUXe0k9p4sj1FoZb1nTafIB/d0tT8ah7OQ6KPjo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=K+3EaW94D6xBHOOoXDSlRmjQjrVPZRwKJtfi5UPhL2N8OjdEN7HLpBpN6KVEYy2+b
	ukMkccCkD5jtmPRAeTgVjVkyu5RDRD2K2DGQcP9b0zGrlpTaXIBotP1jsdsqUWJ5Px
	v4CnufysRU/JJQqV2cIB6lXwgnbaUjyQVyVwD93I=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6NAknqC003778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 23 Jul 2013 12:46:50 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1V1a7F-0003Lo-7l; Tue, 23 Jul 2013 12:46:49 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 23 Jul 2013 12:46:49 +0200
In-Reply-To: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
	(Muhammad Shakeel's message of "Tue, 23 Jul 2013 15:03:43 +0500")
Message-ID: <ly4nblpn8m.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.5
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: "Shakeel,
	Muhammad" <muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Tue, 23 Jul 2013 10:46:55 -0000
Content-Type: text/plain

"Shakeel, Muhammad"
<muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:

> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
> systemd_unitdir contains a service file(s) then no need to keep init.d scripts
> for sysvinit compatibility.
> ...
> +            for filename in os.listdir(systemd_unitdir):
> +                if filename.endswith(".service"):

why only .service?  Other systemd files (.socket, .mount, .path, ...)
can also replace initscripts.


Enrico

