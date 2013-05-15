Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UckJK-00005A-Qh
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 00:36:42 +0200
Received: by mail-oa0-f43.google.com with SMTP id o6so2898199oag.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 15:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type:x-gm-message-state;
	bh=XRKnuFP7rglQo7eaCLmfD7wyIoBLAPfCFqFzcMrFeCY=;
	b=grJzwE/VSKgiXFZvArpa5LKfU2sIXRAPcMKRF38FUp5NnDG2xCplmodz+0VF2iwlJa
	C6T1LxM4y1nNJFrZIOsjW6c9sMwmxu6Z0zvWgyb1RBWvBKMwqNn//VoY3Radyry2Ei9Z
	IimwucZmxYFbQ6V7ny6SCuxYBce+YOCMjI4se4SAe5eVX6RZLX+xiifFr+hrO/msrEGW
	U3oNwT0qbknrH0lZZnfAos10d4orKhrI66QuyfpS+T72ttMd4C0lDatHCqZ53kAbfEu8
	ATyUrX21PeJ40j35xT0HhRobxpGRSt+32sO/ejz9LfovJnHB7WIjOx6ie6a8gqsS18wx
	bBjg==
X-Received: by 10.182.97.168 with SMTP id eb8mr18522356obb.89.1368656305068;
	Wed, 15 May 2013 15:18:25 -0700 (PDT)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id eq4sm4964007obb.5.2013.05.15.15.18.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 15:18:24 -0700 (PDT)
From: Felipe Ferreri Tonello <eu@felipetonello.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 15 May 2013 15:18:22 -0700
Message-ID: <1844830.bmNtCV2qGo@localhost.localdomain>
User-Agent: KMail/4.10.2 (Linux/3.8.9-200.fc18.x86_64; KDE/4.10.2; x86_64; ; )
In-Reply-To: <1711232.dboPgR0GxB@helios>
References: <1368123358-10995-1-git-send-email-eu@felipetonello.com>
	<CAP9ODKrkH4dKFLFNUA_RusUk=27N7n-Dzu3DNaFLbPNK6FtDVQ@mail.gmail.com>
	<1711232.dboPgR0GxB@helios>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQl7c90kvhMuNns6eVMx17NN5iRncivz6OUSLEzx74TwQsOL/j6uz6yJgGTxMinVw5bLPlXQ
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt: updated qmake2 class to export qconfig.pri mkspec
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
X-List-Received-Date: Wed, 15 May 2013 22:36:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

On Wednesday, May 15, 2013 05:39:38 PM Paul Eggleton wrote:
> On Wednesday 15 May 2013 13:31:41 Otavio Salvador wrote:
> > On Thu, May 9, 2013 at 3:15 PM,  <eu@felipetonello.com> wrote:
> > > From: "Felipe F. Tonello" <eu@felipetonello.com>
> > > 
> > > This is necessary when Qt applicatins want to know variables such as
> > > QT_MAJOR_VERSION, QT_VERSION, QT_MINOR_VERSION, gcc version etc.
> > > 
> > > OBS: This change made the build system crazy. When I changed it and run
> > > bitbake my-qt-app-recipe, qmake was consuming 100% cpu usage for long
> > > time. I had to stop it. So I recommend rebuild the entire Qt stack when
> > > changing this.
> > > 
> > > Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > > ---
> > > 
> > >  meta/classes/qmake2.bbclass | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
> > > index 5eebd8e..8b9861c 100644
> > > --- a/meta/classes/qmake2.bbclass
> > > +++ b/meta/classes/qmake2.bbclass
> > > @@ -6,6 +6,7 @@ inherit qmake_base
> > > 
> > >  DEPENDS_prepend = "qt4-tools-native "
> > >  
> > >  export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
> > > 
> > > +export OE_QMAKE_QT_CONFIG =
> > > "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
> > > 
> > >  export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
> > >  export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
> > >  export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
> > 
> > The patch makes a lot of sense for me, Paul?
> 
> I'm not sure I know enough about this to say either way; the comment about
> qmake going crazy doesn't exactly inspire confidence though...

About that I'm not sure why it happened. But after cleaning all Qt related 
builds it worked as expected.

> 
> I guess one question I would have is why have we not needed this before?

This is been used in the Qt based SDK. It's necessary to build Qt applications 
or libraries that makes use of those cited variables in their Qt project file.

-- 
Felipe Ferreri Tonello


