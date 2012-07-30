Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SvuaI-0006AJ-BD
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 20:20:52 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 11:09:08 -0700
Received: by yhpp61 with SMTP id p61so4523569yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 11:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=eMkRqQCKUnTGuG1mcWGACOlBFfrH3L8jfgixn3Nq9M0=;
	b=fmJoBZZ+7qw2bB9kDZYgJS5UTLaBL4rKEYWdZkxknIg5m+3p9ZiO3uWopQLNNSWgA1
	aXTCtSOHGZ+t7qfQKtqSu/CNPnHRVxX5nPlZtm5UnEp82WDbTp8fOYSIFTCCY4bxeC0q
	xWOOMISyGBqGWBdCgzaS6YLJLR9XfqGGEfNAALzoEV2GkcUk53D2AdJhh/7fjx8RWu7U
	K3MMVB9rJQRODv4yovrTgqZWHMopbo5b9x2RwC2pt3dWUyaL1HKGLkz4N6OU50KqOFRX
	nWlOZ/Hh+eK7G4XIVX4hkjHOEsbr0CcaTziSNELn0S18I9QJZHWJwB9Hssj+am1C+wqq
	ZybA==
Received: by 10.60.21.103 with SMTP id u7mr18604233oee.49.1343671746731; Mon,
	30 Jul 2012 11:09:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Mon, 30 Jul 2012 11:08:46 -0700 (PDT)
In-Reply-To: <0CC5630B-DD3D-4AB2-834C-DE3B87743D52@dominion.thruhere.net>
References: <CAJTo0La9DXgEH-Yr-31=iCnegQhgHGxTdpnizEpG=OEHNk_veg@mail.gmail.com>
	<0CC5630B-DD3D-4AB2-834C-DE3B87743D52@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2012 19:08:46 +0100
Message-ID: <CAJTo0LaWXwxJb3OAOHy16rP4hrokL5H5+pk_reQ2sop5dH4kBw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmg5jOKKq36A3PtPxAZDTmXsz9XrBtOxcizgXIALc15EJ/oAbg9qqhIxQ3sOyjoqUXE8+Ju
Subject: Re: mesa-dri vs mesa-xlib
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
X-List-Received-Date: Mon, 30 Jul 2012 18:20:52 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2012 18:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
> They produce 2 differently named shared libraries and currently some images need both. If that's a bug or not, I don't know :)

The only difference I can see is that -xlib generates the osmesa
library whereas -dri doesn't - this being the "off screen" library.
What images need both, as it certainly sounds suspicious to me.

Ross


