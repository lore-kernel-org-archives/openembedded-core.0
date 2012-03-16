Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8aos-0002ZL-D9 for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 18:20:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GHB9pM005763;
	Fri, 16 Mar 2012 17:11:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04815-10; Fri, 16 Mar 2012 17:11:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GHB1xs005756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Mar 2012 17:11:02 GMT
Message-ID: <1331917862.18586.210.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Fri, 16 Mar 2012 17:11:02 +0000
In-Reply-To: <4F636A2E.2090404@linux.intel.com>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
	<4F635D37.2020406@linux.intel.com> <4F636283.7040800@linux.intel.com>
	<1331915160.18586.202.camel@ted> <4F636A2E.2090404@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rt-tests: Add src/backfire to FILES_${PN}
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
X-List-Received-Date: Fri, 16 Mar 2012 17:20:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 09:28 -0700, Darren Hart wrote:
> 
> On 03/16/2012 09:26 AM, Richard Purdie wrote:
> > On Fri, 2012-03-16 at 08:55 -0700, Darren Hart wrote:
> >> On 03/16/2012 08:33 AM, Darren Hart wrote:
> >>> Hrm, this silences the warnings, but the backfire sources are not
> >>> installed on the rootfs....
> >>>
> >>> Anyone see what is wrong with the below? Is there some magic that purges
> >>> /usr/src in a minimal build?
> >>
> >> I was adding "/usr/src/backfire" to FILES_${PN}. It seems one should add
> >> "/usr/src/backfire/*" to actually get the files.
> >>
> >> However, I am surprised that the warnings went away and the files were
> >> still not packaged when I used "/usr/src/backfire". Is this expected
> >> behavior?
> >>
> >> I have pushed the new version to the same branch using
> >> "/usr/src/backfire/*". Built,booted,and verified on qemux86 using
> >> core-image-rt.
> > 
> > FWIW with your original patch I'm seeing things being correctly packaged
> > in the main package (rt-tests) which is consistent with the warning
> > message being fixed.
> 
> I see them appear in the rt-tests "package" dir, but not in the rootfs
> unless I append the "/*".

If I view the contents of the rt-tests*.rpm in deploy/rpm/xxx/, I can
see the files listed. This is with current master.

Please check what you tested ;-)

Cheers,

Richard



