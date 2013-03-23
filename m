Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UJEvv-0005sE-Lc
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 04:15:52 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so2478333dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 19:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=xmNBS91Uqy0hctVH1pwfL/VFYGLCeyIDNr0+P/nvL84=;
	b=ZtpDHUat9SstZACYi8Fz4sGMzFFXRMCmA+jbU2BL754uNfxmjDq2cmU9obRuTiOYcX
	U8noKmBqYe+7xyQZtUiEyl8qiiIWC180x4ZZTzcJq2U8GT0fTLD+HMZ/h3i6sv+t+zN8
	rpxZ+B+gIY3/u+kdKzL2UxUHRtd5k9xSHQrXPYwSKeTgFxopYNZt/sLPIIMhhbXRS03x
	gV1eP46plL+ldco+gg91SLeX8YxPcbbyEoX2EOh3KabFBfJo78ckvVxNAF83nXp9BSIO
	xaZ65yiZ6375/8cxVYiSgXoTcOqngqy/DfoYhiEQtFl2a/XwQU/IPjdhXwjquf5N20RL
	TE1w==
X-Received: by 10.66.122.8 with SMTP id lo8mr6503096pab.163.1364007536124;
	Fri, 22 Mar 2013 19:58:56 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id gn2sm4450601pbb.22.2013.03.22.19.58.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 19:58:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lbo8zRjtsX1xYBgz6b00k2Up0wXscA5b2uycDHXF09PKQ@mail.gmail.com>
Date: Fri, 22 Mar 2013 19:58:55 -0700
Message-Id: <C0277860-16B4-43E3-B8F7-3ABA51405BA5@gmail.com>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0Lbo8zRjtsX1xYBgz6b00k2Up0wXscA5b2uycDHXF09PKQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/16] libuser: Fix case where ${B} != ${S}
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
X-List-Received-Date: Sat, 23 Mar 2013 03:15:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Mar 21, 2013, at 9:30 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

> On 21 March 2013 15:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Fix out of tree builds and a parallel make race, see the patch header
>> for details.
> 
> As there's no cover letter, I'll reply to this.  From a reading of the
> patches (no build testing) it looks good, so Acked-by: Ross Burton
> <ross.burton@intel.com>.


on the contrary it broke my -j 20 build

| LinuxdocTools::process_file: Cannot find ./sgml/libuser.sgml. Aborting ...
| LinuxdocTools::process_file: Cannot find ./sgml/libuser.sgml. Aborting ...
| Processing file ./sgml/libuser.sgml
| Processing file ./sgml/libuser.sgml
| make[2]: *** [sgml/libuser.txt] Error 2
| make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [sgml/libuser.html] Error 2


> 
> Ross
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



