Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E61676A9BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 22:42:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5BMgjCT016727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2013 15:42:45 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Jun 2013 15:42:44 -0700
Date: Tue, 11 Jun 2013 17:42:36 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130611174236.758b403c@e6410-2>
In-Reply-To: <2CF72E14-1BCC-4CCC-8F98-8818788D95DA@gmail.com>
References: <1370015746-22465-1-git-send-email-mark.hatle@windriver.com>
	<7FC71AE1-8B85-4A2C-8E5D-A8A29DF05193@gmail.com>
	<51B74CAA.9060203@windriver.com>
	<2CF72E14-1BCC-4CCC-8F98-8818788D95DA@gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gcc: add build directory to include directories
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
X-List-Received-Date: Tue, 11 Jun 2013 22:42:46 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 11 Jun 2013 10:11:46 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On Jun 11, 2013, at 9:13 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> 
> >> what happens if you use --disable-libunwind-exceptions  
> > 
> > As far as I know we have not tried that.  Doesn't this change some of the processing though for systems that use unwind as the only way to generate proper back traces?  
> 
> we already disable it for gcc-runtime and libgcc recipes where it would matter too.

For what it's worth, --disable-libunwind-exceptions doesn't seem to prevent
the failure.

In file included from /home/seebs/tct/t00/bitbake_build/tmp/work-shared/gcc-4.8.
0-r0/gcc-4.8.0/libstdc++-v3/libsupc++/eh_arm.cc:26:0:
/home/seebs/tct/t00/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/libstdc
++-v3/libsupc++/unwind-cxx.h:92:3: error: '_Unwind_Ptr' does not name a type
[... and many, many, more]

This appears to be identical to what we get without
--disable-libunwind-exceptions. It may be that that isn't fully implemented
for libsupc++.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

