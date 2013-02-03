Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U27Si-0007Ln-Me
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Feb 2013 22:50:56 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 61D3FD22E9; Sun,  3 Feb 2013 22:35:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6586DD22CD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Feb 2013 22:33:58 +0100 (CET)
Message-ID: <510ED7B6.1010201@linaro.org>
Date: Sun, 03 Feb 2013 22:33:42 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
	<50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
Subject: Re: OpenGL as a DISTRO_FEATURE
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
X-List-Received-Date: Sun, 03 Feb 2013 21:50:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 03.02.2013 20:45, Ian Geiser pisze:

> The case I have is 3 platforms: 1) Atom N450 2) WM 8950 3) VIA VX900
> 
> The Atom has the normal mesa-dri drivers and can use the OpenGL
> implementation from that.  The WM has only OpenGLES drivers and no
> OpenGL implementation.  So in that case I want to use only GLES
> support in the various packages that conditionally support it (in my
> case Qt4).  The last platform the VIA has its own OpenGL
> implementation that can completely replace mesa for packages that
> support OpenGL. In the case of my distro I support Qt4 but it can use
> OpenGLES or OpenGL.  The problem comes in when I start setting
> preferred providers in the machine conf files.  In the case of my WM,
> I have only gles and since the distro supports opengl, it needs a
> virtual/libgl and finds it with mesa.  Now I can remove opengl from
> my distro, but the Atom and VIA support opengl, and will not have it
> available to Qt because it turns off.

As they are different architectures you can try this:

DISTRO_FEATURES_wm8950 = "here copy your default DISTRO_FEATURES but
skip opengl"

Replace wm8950 with MACHINE name. Ugly solution but should work.



