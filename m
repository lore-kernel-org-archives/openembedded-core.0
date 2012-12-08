Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ThCsU-0005IH-1d
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 06:23:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Dec 2012 21:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,242,1355126400"; d="scan'208";a="230622805"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.161])
	by orsmga001.jf.intel.com with ESMTP; 07 Dec 2012 21:08:33 -0800
Message-ID: <50C2CB51.7030308@linux.intel.com>
Date: Fri, 07 Dec 2012 21:08:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1354920751-21102-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1354920751-21102-1-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libpng update to 1.5.13 V2
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
X-List-Received-Date: Sat, 08 Dec 2012 05:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2012 02:52 PM, Marko Lindqvist wrote:
>
> In openembedded-core itself, libmatchbox does not compile
> against libpng15. Patch for that sent already.
>
> In meta-openembedded, libsdl-image is known not to compile
> against libpng15. Patch for that too sent already.
>
> I have not been systematically testing build of all the
> possible components. Above two problems are just the ones
> I've encountered as part of my typical builds.
>
Did you at least try to build all the recipes that are in OE-Core that 
depend on libpng, not just typical builds?  A quick grep in OE-Core 
shows that the following depend on libpng:

transfig-native
cups
gdk-pixbuf
gthumb
gtk+
cairo
directfb
libmatchbox
pixman
gst-plugins-good
qt4

So I would strongly recommend building and doing somekind of basic 
validation of these to ensure there are not any more API issues.

Thanks
	Sau!

>
>   - ML
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


