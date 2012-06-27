Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sjm6M-0003rD-70
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:51:46 +0200
Received: from mail-qc0-f170.google.com ([209.85.216.170])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Jun 2012 23:40:51 -0700
Received: by qcmt36 with SMTP id t36so381887qcm.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=aaD/CiYCB1ka8SOg3yFtO7GPqJzMnhIDc+Gj3EJAJtg=;
	b=JquAeyUlYcEreJmWir8StZgRGiXxBGCo6OUgQIdu3Ik8kzceLO4Zo1cuLvNKKJAK1g
	cpsA5AFnBKXCrzdKv3dRhdoIPEYf5+qdl8rmYwvDxIc7MM3Xf0ZD8x4nEb7yHJdRM0Dr
	g7QGIOxZP9ZhpUWMR62WPpCCKzTyouvMLJGAX9z85qKYK6glT+CuoZKkSGy08SXy76Wa
	E+N7Cp1dwCCsT59JfD6vmw+E+ZB/zKqGAAjJ/aMOM73CiBjM5cp0OtDe6ISqoEFucmAi
	aK2Iyh7UR3T4oz5qZUsjby/p2SVUmGxNz+7FZ826pK0QddseJMjxTl/Weo4qK6iZiwTA
	mTyw==
Received: by 10.229.106.36 with SMTP id v36mr8267931qco.92.1340779250567; Tue,
	26 Jun 2012 23:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.16.207 with HTTP; Tue, 26 Jun 2012 23:40:30 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jun 2012 07:40:30 +0100
Message-ID: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk6fw62mT4yHX8TmOjVykAjdXiZHQiM/uQhTKgc/V3v6LAvFwVFX/XhNLcUqQ718Ty/WsCY
Subject: [RFC] webkit-gtk upgrade
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
X-List-Received-Date: Wed, 27 Jun 2012 06:51:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

In the git branch poky-contrib/ross/webkit I've upgraded webkit-gtk
from a 1.7.1-ish git snapshot to the 1.8.1 tarball.  I've tested that
web builds and Midori (from meta-oe) works, although obviously more
testing is needed -- both users of the library and architectures.

I'm going away for a week now so if interested parties could test this
it would be much appreciated!

Ross


