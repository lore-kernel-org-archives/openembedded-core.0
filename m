Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SjmjJ-0004fE-Rd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 09:32:01 +0200
Received: by eekd49 with SMTP id d49so214878eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 00:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eR/0sLfb+tsUznvVt+khIdFANCYLmAEBELMV0PVhE+8=;
	b=f3R3QlViTMmUC0CDzL0MijD2lq6BN+/2Vze8139dDcEwSbLEZXQcSy3XP9658EQQKH
	KNttN/FBV+bYZxAi0uCuPkk/TSXTpD8evpeIwZUl3/7Rf7e/WlYbch2Hs4hdtjHe4ey7
	VFVLD0WLA2I6vUnxIr/HvEbwJ2A/jCC+sV3VVXarQj0dVjQQ84ZiwmLa7C4BzKM6DlMO
	dfgaDg7peTXOja2lsaQtk05QzvEojtjN4QSHDJvlXkmbr2V9Uld6IUR0Hh6+ROcEuplg
	PIJ09MdKgsg/chYVLHkIRJCX4ve3sbhTM0ng+3FWqpGgEiY6m4/TZ3ytGv5GzaDKOOXx
	5vSA==
Received: by 10.14.29.78 with SMTP id h54mr3734796eea.132.1340781668858;
	Wed, 27 Jun 2012 00:21:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c6sm3861243eeb.2.2012.06.27.00.21.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 00:21:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
Date: Wed, 27 Jun 2012 09:21:05 +0200
Message-Id: <B881EA27-5FFA-434C-BF87-9C6A0DA5A47D@dominion.thruhere.net>
References: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlcuiwzP9K/vNdRA5VoelFkOKqMPvius/3SBSB0HNXovumGwePS4XjCf2DtnQX1lB0WzMDV
Subject: Re: [RFC] webkit-gtk upgrade
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
X-List-Received-Date: Wed, 27 Jun 2012 07:32:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 27 jun. 2012, om 08:40 heeft Burton, Ross het volgende geschreven:

> Hi,
> 
> In the git branch poky-contrib/ross/webkit I've upgraded webkit-gtk
> from a 1.7.1-ish git snapshot to the 1.8.1 tarball.  I've tested that
> web builds and Midori (from meta-oe) works, although obviously more
> testing is needed -- both users of the library and architectures.
> 
> I'm going away for a week now so if interested parties could test this
> it would be much appreciated!

Is that branch against oe-core or poky?


