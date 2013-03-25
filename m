Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UKAEB-0004hf-Q4
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:26:35 +0100
Received: by mail-ee0-f51.google.com with SMTP id c4so211958eek.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 09:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=szl5KXYkYNLQWJ9iO6gBAGXFi0gL3cU5++q0L1CR+QM=;
	b=k08K/jUqXCNwUEadq2dWlPsUFlVuJGnvncKHfaqjv+u8gOjXAPPqgo4BvOXck/A5L8
	OG+eZPPK+47PvyymhkDIIZ7Cgg1yqU5TLzrMrf2gGeiEKVhPlIjpKenQ6mBkiKGZd1Cx
	JxZ2NjiVCQV7y7Mjbc3zsJivG5O4oQG1d2i3aXcJk9TRa5IUuI0NN93JtJJC3xJQ8cr9
	MN7NPtG/dtL1bd84ej9CTqjUTJh63dG4bjRqGaSb0W/awuh6322W+MEj8i35alv7XPqP
	gLpCDkh1TvibLjocIyfPxHTPyBdvs6DfrbQBXCy7r09iRCwQmg36edz0XpCo/q85wRTY
	gQ1g==
X-Received: by 10.14.216.2 with SMTP id f2mr35368708eep.44.1364227773610;
	Mon, 25 Mar 2013 09:09:33 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id q42sm19944877eem.14.2013.03.25.09.09.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 09:09:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
Date: Mon, 25 Mar 2013 17:09:31 +0100
Message-Id: <C39A6084-A254-4AE2-A9DD-49B88EDCB164@dominion.thruhere.net>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQm9mcKx0dSAdun8/66UeEJUH8SGpHqrQiD582FK6zeF9ExTcxRrgXHnuPILpgsYJE4WuUq7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Mon, 25 Mar 2013 16:26:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mrt. 2013, om 14:07 heeft Cristian Iorga =
<cristian.iorga@intel.com> het volgende geschreven:

> - BlueZ 5 v5.3 experimental new package;
> - bluez5 package does not replace bluez4 package,
>  as a lot of components that interact with bluez
>  are not prepared to work correctly with bluez5;
> - bluez5 is not an upgrade path from bluez4.

So you say it's not an upgrade path, but...

> - bluez5 conflicts with/replaces bluez4.

...  here you add RREPLACES. Why is that?=20=


