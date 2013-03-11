Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFAhy-00015j-8C
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 22:56:40 +0100
Received: by mail-ve0-f181.google.com with SMTP id d10so3023460vea.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=yVsHpr8q52bjxGw6WI4Ie/dQYmqNDfDQitb3q5UekVA=;
	b=Zw9mhJDWuFECobGa4bRxhzQdlGMDvx7/f3dxaA4W7SVVZeU1FLk9+rPWA9q3drx0mI
	O8Rhd7MITYt8XeMccn5V2kd7GEQPzGct4AzsW8IUOPTafjOWcS+lczoS/3ZMyXJfHvAq
	N8YOXihwehqdaFXt+ee27xx/FEjx7u3DZLFrdkAqHuxEnpF2cCW4h/Ek08mIz4pMLbRb
	oC3yeSlUxgUe8dwjH35ZdrkaTJz7uh5n3owfkFSkz0jRLwzq8jcodqgnoqC8ezasNRc/
	B7b5gSzCRm8sYjEtAWdj3A29CUhDgNWyfTKswHG9hY1ulMExaZA97l0TcDBmnJe1+EDj
	2cSg==
X-Received: by 10.52.65.147 with SMTP id x19mr4900028vds.27.1363037999528;
	Mon, 11 Mar 2013 14:39:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Mon, 11 Mar 2013 14:39:38 -0700 (PDT)
In-Reply-To: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
References: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 14:39:38 -0700
Message-ID: <CAJTo0LaRQebt9te-wiHYRS1c=EWJmwBNV6Y0L47=Zg8-P2zHEg@mail.gmail.com>
To: eu@felipetonello.com
X-Gm-Message-State: ALoCoQlTQ57j5IWzgKjWPAgob4lJcdRqTxckgsme4WloRE1Y4TXTLo/R1QSXVQh5HtL2Np0aSPXo
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] qt-mobility: improved recipe
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
X-List-Received-Date: Mon, 11 Mar 2013 21:56:45 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2013 14:23,  <eu@felipetonello.com> wrote:
 OBS: We might also want to remove pulseaudio dependency. But check against
> which DISTRO_FEATURE?

There's a "pulseaudio" distro feature.

Ross


