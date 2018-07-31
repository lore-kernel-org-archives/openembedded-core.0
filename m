Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 906C378DB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 12:12:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6VCCQmk030156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 31 Jul 2018 13:12:27 +0100
Message-ID: <05364d3e846c658144c944bce82d7b3ec252356e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 31 Jul 2018 13:12:26 +0100
In-Reply-To: <CAJTo0LbkAc9NgGyE2HCvFLt6ggcO-iMpYp-XMDB9oy=RAV7TEQ@mail.gmail.com>
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
	<CAJTo0LajamOMF5TsuMZo+sBRLr=AqWYJUJPnifZUME=rKrO48g@mail.gmail.com>
	<CAJ86T=VQ_Qk0TOhHRiZ0SThgZ8-HZOTz6L5JXD4K2ut+7tbWFA@mail.gmail.com>
	<CAJTo0LbkAc9NgGyE2HCvFLt6ggcO-iMpYp-XMDB9oy=RAV7TEQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Tue, 31 Jul 2018 12:12:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-07-27 at 12:05 +0100, Burton, Ross wrote:
> On 27 July 2018 at 00:58, Andre McCurdy <armccurdy@gmail.com> wrote:
> > On Thu, Jul 26, 2018 at 4:34 PM, Burton, Ross <ross.burton@intel.co
> > m> wrote:
> > > On 26 July 2018 at 14:58, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > wrote:
> > > > Because the util-linux_2.32.bb recipe explicitely disables
> > > > fallocate
> > > > for nativesdk triggering build warnings:
> > > 
> > > Does anyone know why util-linux disables fallocate for nativesdk
> > > and
> > > native builds?
> > 
> > Seems to date back to this commit:
> > 
> >   http://git.openembedded.org/openembedded-core/commit/?id=17f3c548
> > caf4adec37c3bbb139aa6b3900419794
> > 
> >   +# fallocate is glibc 2.10, fallocate64 is glibc 2.11
> >   +# we need to disable it for older versions
> >   +EXTRA_OECONF += "ac_cv_func_fallocate=no"
> >   +EXTRA_OECONF_virtclass-native += "--disable-fallocate
> > --disable-use-tty-group"
> 
> Well done, it was late and I got bored following the git-blame
> log.  :)
> 
> Sounds like historical reasons to me, does anyone object to dropping
> this?

No, I think this predates uninative...

Cheers,

Richard



