Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QpGex-0008Fl-3r
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 11:25:39 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QpGai-0005Fu-63
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 11:21:17 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Aug 2011 10:21:15 +0100
In-Reply-To: <c9f3ca9552ecf8d0c3bd1128ee7a915bfb7776f6.1312523858.git.jiajun.xu@intel.com>
References: <cover.1312523858.git.jiajun.xu@intel.com>
	<c9f3ca9552ecf8d0c3bd1128ee7a915bfb7776f6.1312523858.git.jiajun.xu@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312536076.6733.8.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libsdl: Add libSDL.so into Sato image
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
X-List-Received-Date: Fri, 05 Aug 2011 09:25:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 14:11 +0800, Jiajun Xu wrote:
> -                --disable-video-opengl --enable-input-events --enable-pthreads \
> +                --enable-input-events --enable-pthreads \

If you're enabling OpenGL, doesn't it need to DEPEND on the GL/GLES
libraries?  Also, if this is going to break for folks who don't
have/want GL then it probably needs to be a DISTRO_FEATURE or something.

p.




