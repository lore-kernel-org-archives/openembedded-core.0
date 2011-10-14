Received: from ocean.emcraft.com ([213.221.7.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dima_ch@emcraft.com>) id 1REjiD-0000HH-R7
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:30:18 +0200
Received: from vladimir.emcraft.com ([172.17.0.253])
	by ocean.emcraft.com with esmtp (Exim 4.76)
	(envelope-from <dima_ch@emcraft.com>)
	id 1REjce-0002QW-HM; Fri, 14 Oct 2011 19:24:32 +0400
From: Dmitry Cherukhin <dima_ch@emcraft.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <201109281521.07861.paul.eggleton@linux.intel.com>
References: <c477d260c34472a416ccb6eec9af0300a40d576f>
	<1317202559-17845-1-git-send-email-dima_ch@emcraft.com>
	<201109281521.07861.paul.eggleton@linux.intel.com>
Organization: Emcraft Systems
Date: Fri, 14 Oct 2011 19:24:32 +0400
Message-ID: <1318605872.23340.587.camel@vladimir.emcraft.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: dima_ch@emcraft.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 14 Oct 2011 15:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 15:21 +0100, Paul Eggleton wrote:
> On Wednesday 28 September 2011 10:35:59 Dmitry Cherukhin wrote:
> > The QtMobility is a Qt add-on which allows to include standard mobile
> > functionality to Qt applications. For details, see
> >    http://qt.nokia.com/products/qt-addons/mobility/
> > The patch is intended to add support for the QtMobility 1.2 package to OE.
> 
> So apart from adding Qt Mobility this attempts to work around two issues by 
> removing the checks rather than fixing the underlying cause of the checks 
> failing. These checks look fine to me, so why are they not working?
> 

These checks was not working because the file .../mkspecs/qconfig.pri
was not included to the main QtMobility project file. I include it
manually. Also I removed all .patch files because they deal with the
configuration, not with the code. You can find new version of the patch
here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/8708

Thanks,
Dima




