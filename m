Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tynfk-0002OK-0q
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:06:40 +0100
Received: from mail-ye0-f199.google.com ([209.85.213.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 09:51:04 -0800
Received: by mail-ye0-f199.google.com with SMTP id l12so770817yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 09:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=DywCac/zm4sF059Ab5/O2ogtwpYe5+vi11mp4W//Qwc=;
	b=H26F4bxb6gj67FSOkHxm8LfWeVhGD3LX2mUOlY0XxxA1MIlPdkuG9lpjjShIE+1KlD
	JZUyjJo7jzNAfaZEvkYHNLhdB78Zuhy/oJrbo/RUyfVwkEvSIuwa2hivem5U+iLkA+TA
	OZrxvqSgtsBl77hqA6Nwd3ojO1nJPnlnGLLTnogVB7hVGrPkGOhj/WZJFsELUot41RlK
	ZWuM4oL27YJkrLsjBEVESB8vZDmO27CWU8H8yu1KSWjTwDUCJVVK1qenkBesn2/74WBu
	av91bAi+BY6Jf8SEc5z6jXEKf0WdYwnlWoU4/ARwMCeNJ8C5dUeB8KtB7Ju0+Fp/dO3V
	luVA==
X-Received: by 10.52.72.137 with SMTP id d9mr6001578vdv.105.1359136263370;
	Fri, 25 Jan 2013 09:51:03 -0800 (PST)
X-Received: by 10.52.72.137 with SMTP id d9mr6001573vdv.105.1359136263311;
	Fri, 25 Jan 2013 09:51:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 09:50:43 -0800 (PST)
In-Reply-To: <20130125151241.GJ3200@jama>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 17:50:43 +0000
Message-ID: <CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQlaa+tzwaT7k/dMH1qchVSX4WQDFyWGAeRFUH23FtnhfvdnsTuq9jU/ci6buCyPCYe2sEfHB8KB8FibrumVD4kNulR90BADeaVTA147PoegskzoyD7vnyXBYoGmhrFbmW6y4coGXjYZmqmuCBR/CBxWneeHm04dlZjaNRLCyA/0RGX9NX+quwXCS9cup16TaxIs0LuW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 18:06:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Been chatting to Richard.  How about systemd ships a symlink to
multi-user, and the X11 init script packages change the symlink to
graphical in their postinst.

(we must remember to put this in the release notes for anyone who has
a custom X init script)

Ross


