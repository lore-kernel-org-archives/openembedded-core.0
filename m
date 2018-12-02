Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 94BC36C571
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 22:22:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB2MMnDf009529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 2 Dec 2018 22:22:50 GMT
Message-ID: <42f7604d9ffbd8b1347c6dd09839b349d297fc41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 02 Dec 2018 22:22:48 +0000
In-Reply-To: <CAMKF1srRWqu-BwcvPNSvrQD5sRkXBF57Jxm1_Dg=ZBn1icUM0A@mail.gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
	<CANNYZj9ug7+q0v-kVVio7_a61BRo1JEBNxFmJ33XgB=CQGd7ow@mail.gmail.com>
	<CAMKF1srRWqu-BwcvPNSvrQD5sRkXBF57Jxm1_Dg=ZBn1icUM0A@mail.gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Sun, 02 Dec 2018 22:22:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-12-02 at 10:50 -0800, Khem Raj wrote:
> On Sat, Dec 1, 2018 at 2:28 PM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > On Tue, 27 Nov 2018 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
> > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > Also, change default meson option to building introspection
> > > > > > files
> > > > > > (previously they were not built by default).
> > > > > > 
> > > > > 
> > > > > I wonder if this is causing
> > > > > 
> > > > > http://errors.yoctoproject.org/Errors/Details/202291/
> > > > > http://errors.yoctoproject.org/Errors/Details/202280/
> > > > 
> > > > "Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or
> > > > use --includedir"
> > > > 
> > > > This file is coming from libgee - it has the necessary file,
> > > > but does
> > > > not install it for some reason.
> > > 
> > > I repeated this qemumips build on a different host ( running
> > > archlinux
> > > ) and it worked there. The host
> > > where it fails are centos7 and ubuntu 14.04
> > 
> > I just sent a patch for this to oe-core list - thanks for
> > reporting.
> > 
> 
> thanks I can confirm this is fixed with this patch which is in
> master-next
> 
> > libdazzle crash is a separate issue, I will look into it.

Oddly enough, master-next resulted in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/48/steps/7/logs/step1b
https://autobuilder.yoctoproject.org/typhoon/#/builders/68/builds/33/steps/7/logs/step1b

so I've removed the gobject-introspection patch which I'd included to
try and isolate the cause...

Cheers,

Richard



