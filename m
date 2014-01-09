Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0211E6D13C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 06:32:58 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so5603080wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 22:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=wuNlo+vucY2y4YoCpU8aX0AS6rM6T+zVrk7QuDnZDM8=;
	b=PNPKEolI7Q0pftSKGEusWCaEXAe4lcfHW6vHWjgm1JhXRbFEmKUjgcYtUHHUVuwMPN
	6SWuuc2VzldiiDsok1xcfGQhMa950ky3GtIr6ePHW+qDwT8tDIePf1sgUaC13+wI5ISZ
	M/VSWeY32WFr6q4IZ1VjJbYGdG838Bq1ttazYKM53emhrtcV25y0/kCBPGo2hMjRcy7X
	e/IAODhyKqK6AJmIlMn2kAPK8JWoxhpwF8GXj2UPRshw0QMhv1wZ0kf4MY2hhru8HK9a
	brhu8fxfTXC7zVc6d9hERFpnXK3K7Vf3rOIHI6FaLw6+SgQdvh4lzHy2IV5hhSZh5Lay
	EhRg==
X-Gm-Message-State: ALoCoQk14cCFd8cbyc1+mGDQH9Mj3g1TnJX2qnI2FGNFAp1xnHQNwlGX+t4z407jVj60rad0QGpw
X-Received: by 10.180.206.104 with SMTP id ln8mr1523078wic.13.1389249179394;
	Wed, 08 Jan 2014 22:32:59 -0800 (PST)
Received: from ?IPv6:2001:610:612::a0ec:a622:a82a:3a79?
	([2001:610:612:0:a0ec:a622:a82a:3a79])
	by mx.google.com with ESMTPSA id pl7sm668531wjc.16.2014.01.08.22.32.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Jan 2014 22:32:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LaMobezC+B7eNbXc-2NLnS2fxLid=xNvE_7hzMR5ntQnQ@mail.gmail.com>
Date: Thu, 9 Jan 2014 07:33:00 +0100
Message-Id: <8DE9C4FF-2468-4BE0-9FF3-8DC428F5A762@dominion.thruhere.net>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
	<5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
	<CAJTo0LY2hTEcqZyqrDsoBGEbWYwovCSu7+gZdo4av+9=0w_J5g@mail.gmail.com>
	<52CBFBB5.8030009@windriver.com>
	<CAJTo0LaMobezC+B7eNbXc-2NLnS2fxLid=xNvE_7hzMR5ntQnQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gconf.bbclass: remove --disable-schemas-install
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
X-List-Received-Date: Thu, 09 Jan 2014 06:32:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 jan. 2014, om 17:12 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> On 7 January 2014 13:05, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>>> *Some* packages have migrated away from gconf to gsettings.  Not all
>>> packages have done this, so anything still using gconf is now =
broken.
>>> Note that almost nothing in oe-core uses gsettings as we're still
>>> using the GTK+ 2 stack generally.
>>=20
>> Hi Ross, which recipe is failed, please ?
>=20
> A better question would be what package did you get this warning from?
>=20
> As I said, any recipe that did inherit gnome and still used GConf
> would be affected by your change.

Which is over half of the meta-gnome recipes :(=

