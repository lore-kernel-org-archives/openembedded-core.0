Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3n37-00076Y-Si
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:27:31 +0100
Received: by mail-vb0-f48.google.com with SMTP id fc21so2226123vbb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=20r5lIWoJhS9dOZE/456vlHsJYW16y2tJfWeu3VwtzY=;
	b=Q8aHY4G13jLF+kVFMYFTyvMcZAvPkF4/aD+I1E8N7XpAgYiCpOJ9p/EM2HHbYmv2H3
	ypR0507Ujljpm14+ZiG/bxyyzEe2+JcMAGN7leNxslBI0tbO+wk5EHKMPlzTfUGEjmBs
	3CVWr72pq1wknDlxbNCo5QBJ3ZJCsRjK6/eJyHtZ2LX6Zs1rc2yeBaJE2pBq82DmnF1n
	otsnLvS5Mstjjqv3quwPNwKgbdXvYTobnSAW4aP0p5DCsxDkCdmLly18JaI8vlD0IKvL
	boVWK/7N5/L4c2I0Ii2dibPtp7RmEPxKhSoo0T3gHNwiGTBgSnDN4J1COQ5WcymkJsC+
	ygXA==
X-Received: by 10.58.50.7 with SMTP id y7mr6395558ven.24.1360325491668; Fri,
	08 Feb 2013 04:11:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 04:11:11 -0800 (PST)
In-Reply-To: <5114E8E5.70203@r-finger.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
	<CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
	<5114E8E5.70203@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 12:11:11 +0000
Message-ID: <CAJTo0LZ+r3WAun0nQsKd1R4CRQNv_Jh-DoGVV2hWuYgpkToUag@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQlqkRsbQmTrEtD6ib11qbb1fEWQFxp2gNEgUvE3bz8to5N+WJCtU/u+J5GlnyS9YyfW5zgQ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 12:27:40 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 12:00, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> /etc/localtime is a real file so that /etc is not containing a link to a
> file in /usr; this has historically been the case unless I am not
> mistaken. systemd should grow up and read the contents :).

But the contents don't identify the name of the timezone.

Ross


