Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B32A67723D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12ElVRK007460; Tue, 2 Feb 2016 14:47:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TO5ckVKdYazK; Tue,  2 Feb 2016 14:47:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12ElkBo007708
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 2 Feb 2016 14:47:47 GMT
Message-ID: <1454424466.27087.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Feb 2016 14:47:46 +0000
In-Reply-To: <56B0AE88.3090103@siemens.com>
References: <56B0AE88.3090103@siemens.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Tue, 02 Feb 2016 14:47:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 14:26 +0100, Pascal Bach wrote:
> Hi everybody
> 
> I noticed an inconsistency in oe-core regarding the variable:
> FULL_OPTIMIZATION
> 
> In bitbake.conf the variable is defined as follows:
> 
>     FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> 
> But if I look into the documentation.conf it tells me the following:
> 
>     FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and
> CFLAGS when compiling an optimized system. This variable defaults to
> '-fexpensive-optimizations -fomit-frame-pointer -frename-registers 
> -O2'."
> 
> I'm not sure if the documentation is wrong or if the default set in
> bitbake.conf is incorrect.
> Maybe somebody can shed some light on this.

I think bitbake.conf is correct and we should update the documentation.
A patch would be most welcome.

Cheers,

Richard

