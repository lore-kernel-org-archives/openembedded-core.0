Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2F42360703
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 12:47:49 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so960994wes.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 05:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=u16pEJiEPdnHVXKZv0ENM6uwHugrQ26B9vy6m+/VOIs=;
	b=ibcXrIckMpDW46BrsNKXG8WSUvCo2FddVo1AumCzRRXLQ+0o8m6yEkvSLMTMAHleM+
	z572HLQ6CAfjb3hw3mh1YPfBkQuKExLL4IvVVkHDE0u1DQeDQ1UxHMYMPdnDP0rZZvUi
	DbevLJosxkb9eKz1N+IQMCRPAtAL58LfAdFOIzdEBvrwgZSc6gdyvfUxvcGvavoRMdSk
	LhsGW2U/B2vFkpOLKO18PMBwF5KJ4xgqctEMRGFfGdbAqhItoFoWOPI3cUSDJcE3W6tM
	Qq18F8Om3HwDa2YnyeEB6Iw4u9wEPwQlZySowZTpJfXBJY4lx4KFOfv/6zyseu+h8xHe
	dVWA==
X-Gm-Message-State: ALoCoQn7/kjLWxmZsb3PpqENf3uQxnmb5cD7xKvxC7LiuW6fL0XktYdcS50dtmQSHZ0hSo7kjMjV
X-Received: by 10.180.20.14 with SMTP id j14mr6473244wie.48.1407242869173;
	Tue, 05 Aug 2014 05:47:49 -0700 (PDT)
Received: from ?IPv6:2001:610:612::907d:ff77:307:40e8?
	([2001:610:612:0:907d:ff77:307:40e8])
	by mx.google.com with ESMTPSA id di7sm4002922wjb.34.2014.08.05.05.47.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Aug 2014 05:47:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
Date: Tue, 5 Aug 2014 14:47:46 +0200
Message-Id: <4B4C3C6C-7C4A-4037-A03A-5F20E06CD918@dominion.thruhere.net>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
To: Sujith H <sujith.h@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Tue, 05 Aug 2014 12:47:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 aug. 2014, om 15:57 heeft Sujith H <sujith.h@gmail.com> het =
volgende geschreven:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>=20
> If hostname is not added to /etc/hosts file then rpcinfo
> command fails when hostname is passed as argument. This was
> observed when rpcinfo command was tested on freescale target.
> Below was the output observed without this change.

Isn't this what nssmyhostname is for?=

