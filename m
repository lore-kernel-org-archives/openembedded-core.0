Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UVfVs-0002gY-KH
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:04:22 +0200
Received: by mail-ea0-f177.google.com with SMTP id q10so670901eaj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 02:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=O2db+QgAE1JU9ilPwO+ej8j7a4DJWhfMNktCsfr50lQ=;
	b=F1jHqJO1fcQCSVlkDSsx+4zgMekEcKXq6K97fzjBOjlKBszAz+3CESYmhmrO4dH9+y
	xRty+Cq/k3Tq0CSNV3CwgvepkdvckgZGvJTbF4/+LdWY/O6FubYD82D1xGtshZ6xz0Ao
	IvJJ02MtFzPdTIr+ZpbUMH0ICHJk7YPhvgEfItQz9Tki3GafaDKQv4lIuWp13/6n4HwT
	U4iIvSwTKH/ZeLSbpdVF2Kg5jLadXny7WK7XskY5zKy+FOmN3dQXAD4ynzuacGKRSkql
	4pBnYModr6G2UeVJJhmYPwIrMgD9hUezH6NDie5GY0FO1iFmnGxxlzSvpbPvHC3eIr6P
	Za7A==
X-Received: by 10.15.22.76 with SMTP id e52mr86387091eeu.7.1366969595952;
	Fri, 26 Apr 2013 02:46:35 -0700 (PDT)
Received: from ?IPv6:2001:610:612::28b6:bc4f:a329:c51d?
	([2001:610:612:0:28b6:bc4f:a329:c51d])
	by mx.google.com with ESMTPSA id
	n48sm14988947eeg.12.2013.04.26.02.46.34 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 02:46:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZEd0ZDONxj5-_h6e13VYtDbQPTC+ipcj-=wzDavNUCHw@mail.gmail.com>
Date: Fri, 26 Apr 2013 11:46:35 +0200
Message-Id: <93E5E91C-DB0D-4057-82AE-4F3B97B7367F@dominion.thruhere.net>
References: <1366963623-13626-1-git-send-email-B40290@freescale.com>
	<517A49FE.5020702@communistcode.co.uk>
	<CAJTo0LZEd0ZDONxj5-_h6e13VYtDbQPTC+ipcj-=wzDavNUCHw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkM7rmOyXtIVc58MiPUmOyvyP1qp3iCkWdXoThQ29TpUehF0oYiNWDjOSGxHkSOpmUlO4A/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 10:04:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 apr. 2013, om 11:36 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 26 April 2013 10:33, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> I think if anyone needs it, shout up; otherwise we should go with the
>> default and disable it.
>=20
> Agreed - we can PACKAGECONFIG it and the machines that need it can =
enable it.

Making connman machine specific which means PRSERV will go insane.=


