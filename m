Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UTFOv-0001fU-AR
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 19:47:15 +0200
Received: by mail-vc0-f169.google.com with SMTP id hx10so4063606vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 10:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=COPUmmXbCxRJ90QTBDhY9LyehqKG1vnREFUSGJolWjA=;
	b=gcXs1vMRice3TBqNY5/g4j0o5Ep/nO3nh3ell5fFjoVEOb1m66nrNop6fjG1G3Ci3G
	lPiKi7bJLdRBWAhJiVnN3iMG8CwBC2drbUei6Wj6yO1/AvuYphQSnYDC7Kj8tpRKP5Xs
	VSR3wwW8qp71oTEC48WbvamPnLnQR+5tbC41xKZS6aYwPR4Gbm8HEwCdCkngZZj/RJDK
	NYYNqjsOfwoWErWq4aNnXtXNZFFRqNdBxnQeGAX7VjTz/+DbM0QHxOB0mxGiELLWNAr0
	4Yuwxy3yrtbt2twH6NE8xEnruXwr4y/7GregbxdeYiif+ViufF69Qcnf5KhyNrj7XuSW
	4yvA==
X-Received: by 10.220.155.8 with SMTP id q8mr6409461vcw.42.1366392572347; Fri,
	19 Apr 2013 10:29:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 19 Apr 2013 10:29:12 -0700 (PDT)
In-Reply-To: <CALbNGRS1LGXNVHxiR6OB5apqKn9UDHtapQqJriRS0Xt8mhoAaA@mail.gmail.com>
References: <1366377176-27277-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<CALbNGRS1LGXNVHxiR6OB5apqKn9UDHtapQqJriRS0Xt8mhoAaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Apr 2013 18:29:12 +0100
Message-ID: <CAJTo0LbA4fFzNiGyNKr2cYP1WN7WLvvDD8LqQe1Ycer7tgP3Tg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQn+4IpdlldRYMiDZm30i7x2qMWdj8A8aZzssKCPgkq9pmNo4R5nB09wxglr+7ODQLfDgfnG
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-gnome: Replace broken png files
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
X-List-Received-Date: Fri, 19 Apr 2013 17:47:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 19 April 2013 17:49, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> I thought there are efforts for libpng fix ongoing. If not: let me
> know because meta-gnome's network-manager-applet needs same (seems
> they use same icons).

From the discussion I saw upstream (that I've lost, but it was easy to
google) libpng's maintainers consider themselves right, as the files
are definitely broken (the breakage occurs due to libpng asking for
strict decompression).

connman-gnome stole the icons from NM, so you'll certainly want to
copy them back into nm-applet.

Ross


