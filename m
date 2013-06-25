Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0DC6AE0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 17:58:16 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so13794966oag.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=maVgokfCA6Hhr5XXwx+DGbjzcUA9vVM7l6p2QMln/ko=;
	b=FacKl4s0gAP3A0fb1YwIuQddTGlUB0iXUQCVUZS1ncaQScbWKwcaSJzuOGxDN1naIz
	NKyLRJC5auhoKtZS7v6rs2viF+UnIGTpF+lamaFY2nN5bNgOxglOCER0mdt1BJYm2+LO
	7TNfYtq6Ag1/fqXS8SnwbNzmsxeOBLlMgq9zSfGFIJLfIE6HIsgtASeowze8SzKsuSus
	dtSko7dhV4vFA58y1WyBdy7CggjciuYy9Be4zr+nlNRXxqAXH9IViFwv2k+JUHEl1Fer
	DtFO7YM1iU5LIuKV24x6Dzr+FVbdxJukOLT8XdLQGg3GIfH5+ZrK354cdPPkH8OumUqY
	jonQ==
MIME-Version: 1.0
X-Received: by 10.60.40.42 with SMTP id u10mr126861oek.2.1372183097220; Tue,
	25 Jun 2013 10:58:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Tue, 25 Jun 2013 10:58:17 -0700 (PDT)
In-Reply-To: <1372182987-27781-1-git-send-email-otavio@ossystems.com.br>
References: <1372182987-27781-1-git-send-email-otavio@ossystems.com.br>
Date: Tue, 25 Jun 2013 14:58:17 -0300
X-Google-Sender-Auth: F9gpT9KX-h0JM9cArJM_zrnhFnE
Message-ID: <CAP9ODKq+sGqXHSjfDwX=t2-z8Vza2UAQBBDPYmmNBrwSS+zAwQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	"Eggleton, Paul" <paul.eggleton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] alsa-tools: Pass ACLOCAL_FLAGS so aclocal uses the right params
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
X-List-Received-Date: Tue, 25 Jun 2013 17:58:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 25, 2013 at 2:56 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The compile step ends regenerating the configure scripts included in
> the source subdirs, for it to properly work we need to pass the
> ACLOCAL_FLAGS or the .m4 files won't be found.
>
> ,----[ Build error ]
> | ./ac3dec
> | aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
> | configure.in:18: warning: macro 'AM_PATH_ALSA' not found in library
> | automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
> | configure.in:9: warning: AM_INIT_AUTOMAKE: two- and three-arguments forms are deprecated.  For more info, see:
> | configure.in:9: http://www.gnu.org/software/automake/manual/automake.html#Modernize-AM_INIT_AUTOMAKE-invocation
> | automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
> | test/Makefile.am:1: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
> | configure.in:18: error: possibly undefined macro: AM_PATH_ALSA
> |       If this token and others are legitimate, please use m4_pattern_allow.
> |       See the Autoconf documentation.
> | make: *** [all] Error 1
> | ERROR: oe_runmake failed
> `----
>
> Reported-by: Rogerio Nunes <rogerio.nunes@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Paul,

Can you please consider it for dylan? I am using it in master and
dylan for some time without issues and it does address the build
failure for me.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

