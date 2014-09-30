Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id B292771697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 07:39:11 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id n3so920732wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 00:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=AAeZfJ1sjM6f2o+RJXSdBKocwJRlBl70a1+pMY1dj9Q=;
	b=h6n7sgz8CgdqdwsUkqHO5KIsov22qZh9Da4GGTihxOnl0vwXM4xlbFhUe02ugBmH/B
	1KpWsoVQ1IlMuFf0PnuD6jqjxhJKfpiEUysyq4UcLLfKQx9FMx+zmz1EtJ/PpLKAM6qP
	tI7kYTEb1ihXs4zCsGmeryvVVzErQKEzOqgeZolmbCT3ePso2Bs5Rt6ZTSzjtqadZIVS
	28U8Fht9ExDQN/4oDGS+xdMSKD7ks4+CESpSVCSWcii+XmadcL7ykSETFtmZm2MYnP4e
	lu85pkPrxQ2eubIseAjoT0cgUX1jj/LTJKSKyZ2oD1D/f9PZop0YF5RbvpDt6WjrYt9U
	8imw==
X-Gm-Message-State: ALoCoQkNs3HUtfs6BWVCJLOxCzWL/3bWuaNYOX/vgbCEWprOiqrNHFJaBb2lxkOUaTkkLoxGJbQ0
X-Received: by 10.180.75.170 with SMTP id d10mr3545951wiw.31.1412062752549;
	Tue, 30 Sep 2014 00:39:12 -0700 (PDT)
Received: from ?IPv6:2001:610:612::b9c5:7ce:b413:e5ba?
	([2001:610:612:0:b9c5:7ce:b413:e5ba])
	by mx.google.com with ESMTPSA id
	ny6sm14168395wic.22.2014.09.30.00.39.11 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Sep 2014 00:39:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1412024343.2853314.173154429.5067015A@webmail.messagingengine.com>
Date: Tue, 30 Sep 2014 09:39:10 +0200
Message-Id: <18401A03-E69C-43BB-9956-13955179B13A@dominion.thruhere.net>
References: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
	<1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
	<1412024343.2853314.173154429.5067015A@webmail.messagingengine.com>
To: Colin Walters <walters@verbum.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 30 Sep 2014 07:39:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 sep. 2014, om 22:59 heeft Colin Walters <walters@verbum.org> het =
volgende geschreven:

>=20
>=20
> On Sat, Sep 27, 2014, at 03:22 AM, Koen Kooi wrote:
>=20
>> +                ${libdir}/sysusers.d/systemd.conf \
>> +                ${libdir}/sysusers.d/basic.conf \
>=20
> Admins aren't expected to edit these - instead you override in /etc.  =
Or
> change /etc/passwd after the user has been created, and your changes
> will be respected.

The real question is: do we want to keep changes to these files on =
package upgrade or wipe them out?=

