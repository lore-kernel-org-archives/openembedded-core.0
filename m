Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RE7Ok-0007uJ-EQ for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 00:35:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CMaQBU026563; Wed, 12 Oct 2011 23:36:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PqI2Z3jKAkN8; Wed, 12 Oct 2011 23:36:26 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CMaM0a026558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 12 Oct 2011 23:36:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <saul.wold@intel.com>
Date: Wed, 12 Oct 2011 23:29:40 +0100
In-Reply-To: <4E96082C.3040803@intel.com>
References: <1318426805.23801.164.camel@ted> <4E96082C.3040803@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318458589.23801.195.camel@ted>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eds: Update to work with glib-2.0
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
X-List-Received-Date: Wed, 12 Oct 2011 22:35:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-12 at 14:35 -0700, Saul Wold wrote:
> On 10/12/2011 06:39 AM, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch b/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch
> > new file mode 100644
> > index 0000000..0785a93
> > --- a/dev/null
> > +++ b/meta/recipes-sato/eds/eds-dbus/depbuildfix.patch
> > @@ -0,0 +1,78 @@
> > +G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
> > +build failures. Also resolve other deprecation issues.
> > +
> > +RP 2011/10/12
>
> Shouldn't this really be a "Signed-off-by" line?

The original intent with patches was to understand who wrote them. That
is extremely useful information in X years time and was missing in many
cases. The sign-off doesn't mean much in this context. The above does
identify who wrote it (and when) so I'm not convinced there is a problem
there. Admittedly I have not put my full name or email address so its
not as clear as it could be but I've been doing this for a while now and
I'm the only one signing patches with those initials...

Cheers,

Richard



