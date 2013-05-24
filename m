Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5189D61F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:30:20 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id 11so2886199vbe.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=BDWa0S+q3sJhNSSu5ascuNO5ZZQLdFa2I7d38AU/W0k=;
	b=cTe1DhNtnYT995/SIUF9Ja7mLC5WF1qclqjW+3N9FLX05T33NzTReUaYxVM4wBtCmb
	4BTu2XQL4OmGXSoBCz2iAsjDoIq0fYh0g5TF1JPuPx4FQAxvlcBQvfga4xSYtjrndSfc
	H+0x+s2H1sDlTPxRLdAZd+/A77v1VOsG112YG/WmgzWGuUT+ww0v9N1V0cuJdH+28bjG
	krKb6nJfl0nKjDIMDA77bsR4XXCM2mDusqTCKxEDj3cFUh11UySil+sCMJRY4/NxLviO
	ELaVLEVR6lv9I5Me69FDa0u57RF2of3eo+mWHjHfhQVxlltoJx2RvaNgfcMCMcRXvzqD
	XB5Q==
X-Received: by 10.52.165.99 with SMTP id yx3mr6630470vdb.34.1369387821260;
	Fri, 24 May 2013 02:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Fri, 24 May 2013 02:30:00 -0700 (PDT)
In-Reply-To: <f0b5620742216d1c7edaf721b5be599fb8c1a044.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<f0b5620742216d1c7edaf721b5be599fb8c1a044.1369386157.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 May 2013 10:30:00 +0100
Message-ID: <CAJTo0La4fnedhZLWVTGruWSbP_MhOLa5WFW1_6-0KJrCMp_4_Q@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQkFlFpi6xtPwLHWolf/bNkktmfJNV7Fv+NGpyMnzT5md9mBlHJAAkgzN9SC7+VW8tHfjt28
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.43.1
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
X-List-Received-Date: Fri, 24 May 2013 09:30:20 -0000
Content-Type: text/plain; charset=UTF-8

NACK.  libsoup is GNOMEy, so odd minor versions indicate development
releases.  Stick with 2.42.x until 2.44.x appears.

Ross

