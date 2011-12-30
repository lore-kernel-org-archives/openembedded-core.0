Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RgZ80-00017P-WB
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 10:51:57 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Fri, 30 Dec 2011 17:44:25 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Fri, 30 Dec 2011
	17:44:13 +0800
Message-ID: <1325238178.4637.61.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: "Zhang, Jessica" <jessica.zhang@intel.com>
Date: Fri, 30 Dec 2011 17:42:58 +0800
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C2401E62B@ORSMSX102.amr.corp.intel.com>
References: <1324892695.4637.10.camel@localhost.localdomain>
	<C6510F6D410BB64A8C15398EDC6B847C2401E62B@ORSMSX102.amr.corp.intel.com>
Organization: Insigma
X-Mailer: Evolution 3.2.2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: can't install eclipse plugin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 30 Dec 2011 09:51:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

no luck:(

my lttng is 0.3.1, where is the 0.4.0?
the error is :

Cannot complete the install because one or more required items could not
be found.
  Software being installed: Yocto Plugin for Eclipse 1.1.0.201112291418
(org.yocto.sdk.feature.group 1.1.0.201112291418)
  Missing requirement: Yocto Project Plugin Remote Tools
1.1.0.201112291418 (org.yocto.sdk.remotetools 1.1.0.201112291418)
requires 'bundle org.eclipse.linuxtools.tmf.core 0.4.0' but it could not
be found
  Cannot satisfy dependency:
    From: Yocto Plugin for Eclipse 1.1.0.201112291418
(org.yocto.sdk.feature.group 1.1.0.201112291418)
    To: org.yocto.sdk.remotetools 0.0.0


On Wed, 2011-12-28 at 03:22 +0800, Zhang, Jessica wrote:
> Hi Qingliang,
> 
> How did you install the LinuxTools?  For the latest Eclipse plug-in, it uses the built-in Lttng-viewer so the dependency is introduced.  You just need to go under Help->install new software Select the Indigo update site: http://download.eclipse.org/releases.indigo, and select its Linux Tracing Toolkit Integration, that should bring in all the dependency.
> 
> Also, you need to install the Lttng parser library and start eclipse with LD_LIBRARY_PATH by following the direction from the Lttng wiki http://wiki.eclipse.org/Linux_Tools_Project/LTTng.
> 
> - Jessica
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ni Qingliang
> Sent: Monday, December 26, 2011 1:45 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] can't install eclipse plugin
> 
> hello, all:
> I have update yocto plugin to 20111224 current version, but can't
> install it correctly.
> 
> I don't know where to find linuxtools.tmf.core, I have installed
> linuxtools totaly, but can't work.
> 
> who can help me? thanks!
> 
> 
> 
> Cannot complete the install because one or more required items could not
> be found.
>   Software being installed: Yocto Plugin for Eclipse 1.1.0.201112240640
> (org.yocto.sdk.feature.group 1.1.0.201112240640)
>   Missing requirement: Yocto Project Plugin Remote Tools
> 1.1.0.201112240640 (org.yocto.sdk.remotetools 1.1.0.201112240640)
> requires 'bundle org.eclipse.linuxtools.tmf.core 0.4.0' but it could not
> be found
>   Cannot satisfy dependency:
>     From: Yocto Plugin for Eclipse 1.1.0.201112240640
> (org.yocto.sdk.feature.group 1.1.0.201112240640)
>     To: org.yocto.sdk.remotetools 0.0.0
> 
> 
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



