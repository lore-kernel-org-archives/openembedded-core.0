Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7spm-0005AN-0t for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 19:49:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHod3R020350; Sun, 25 Sep 2011 18:50:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 98CwpgFfQ5t4; Sun, 25 Sep 2011 18:50:39 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHoY1A020345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 25 Sep 2011 18:50:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 18:44:11 +0100
In-Reply-To: <CAP9ODKquVa1GNpKfchhExqswpYSY+qYFAmqQQcx4HHmP4LUupA@mail.gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<1316807201-22623-4-git-send-email-dbaryshkov@gmail.com>
	<CAP9ODKqYbuwZ8a0gJrAY3gYKwGPioH9Nj69+nLWamUGLnEFLsQ@mail.gmail.com>
	<1316971251.8185.31.camel@ted>
	<CAP9ODKquVa1GNpKfchhExqswpYSY+qYFAmqQQcx4HHmP4LUupA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316972658.8185.37.camel@ted>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 04/10] dbus-glib: include bash-completion stuff
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
X-List-Received-Date: Sun, 25 Sep 2011 17:49:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-25 at 14:34 -0300, Otavio Salvador wrote:
> On Sun, Sep 25, 2011 at 14:20, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2011-09-23 at 17:09 -0300, Otavio Salvador wrote:
> >> On Fri, Sep 23, 2011 at 16:46, Dmitry Eremin-Solenikov
> >> <dbaryshkov@gmail.com> wrote:
> >> ...
> >> > +FILES_${PN} = "${libdir}/lib*.so.* \
> >> > +               ${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
> >> > +              ${libexecdir}/dbus-bash-completion-helper"
> >> ...
> >>
> >> I'd prefer to have this in another package.
> >
> > Me too, I think this should be packaged separately (with a RRECOMMENDS
> > on bash-completion for good measure).
> 
> I don't think RRECOMMENDS are good in this case; people were using it
> without this for long time and noone has noticed yet so it seems not
> that required.

I mean having dbus-glib-bash-completion RRECOMMENDS bash-completion.

Cheers,

Richard




