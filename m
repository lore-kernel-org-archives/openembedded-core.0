Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UX6t5-0005qj-Jg
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:30:26 +0200
Received: by mail-wi0-f176.google.com with SMTP id hi8so1414901wib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=jl5Gql4Z3fh6t5+3RCQI7JtgQG/0Inyf067/KyfvqmI=;
	b=Px03yZ0iSyzAieaPDP+el5+2SpTwa8OrWtLaw6/Kt2b0/GmvTtfCPKcytruwQMyhNc
	xbtQR5PFZxznbYjdsAQNrAt5OngkrxvOIJZkUxq/m+XnlZuv6qmIUKcPE02E4aMEa95y
	jRYdy1J7y1793zBqvIkLYhh/H3zXet/H65/wPTHVRxrQgCS/FTS/EtdQjsJQnRq0PeM9
	0Ct/j0xWOz0ksNxvfXMc/k/udIjGkk19ClN+Zho5chYmrTYypQHbnwAzFPbbHnf0n4oH
	wNxDC/XK/aLddO0YjdJEhv6z1wUoZrg4YZd0vVZOAlrX+N+457uWzJCZ1pDBireQGkCw
	AKEw==
X-Received: by 10.194.176.195 with SMTP id ck3mr80390988wjc.5.1367313143472;
	Tue, 30 Apr 2013 02:12:23 -0700 (PDT)
Received: from [172.20.0.3] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id bu18sm1079220wib.1.2013.04.30.02.12.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 02:12:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 30 Apr 2013 11:12:21 +0200
Message-Id: <93648336-DD85-4DDB-B404-D6A03A48C312@dominion.thruhere.net>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkPB60a9Px2pvFgZRZCAZM8P88TE1R8T4cXc89xoyc+OBny7lJ2lLcjWWarP93l3AWmM94t
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 09:30:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 apr. 2013, om 09:31 heeft Andreas M=FCller =
<schnitzeltony@googlemail.com> het volgende geschreven:

> * adding this extra functionality is an image- or distro-decision
> * at least automount-rule/script breaks other automount solutions =
causing
>  misleading kernel messages as 'VFS: could not find a valid V7 on sda'
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Looks a lot like http://patches.openembedded.org/patch/48139/ :)=


