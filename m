Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCA6E60119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NEf0CD025125; Fri, 23 Sep 2016 15:41:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bgUnLcs8bksz; Fri, 23 Sep 2016 15:41:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NEeweI025122
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Sep 2016 15:40:59 +0100
Message-ID: <1474641658.7207.371.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Alejandro Hernandez
	<alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:40:58 +0100
In-Reply-To: <a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
References: <1474492215-39510-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: akuster@mvista.com
Subject: Re: [PATCH] [krogoth] Fixes several python3 dependencies
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
X-List-Received-Date: Fri, 23 Sep 2016 14:41:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-09-22 at 08:33 -0700, akuster808 wrote:
> Alejandro,
> 
> 
> On 09/21/2016 02:10 PM, Alejandro Hernandez wrote:
> > 
> > This patch adds the packages python3-signal, python3-enum and
> > python3-selectors,
> > while it also fixes python3-subprocess, this fixes the installation
> > of python3-modules
> I can not get this to apply to my krogoth-next nor krogoth in Poky.
> Can 
> you double check and let me know if I am doing something wrong or
> need 
> any dependency changes?
> 
> error pw is showing is:
> fatal: patch fragment without header at line 29: @@ -89,6 +89,10 @@ 
> SUMMARY_${PN}-email="Python email support"

I've pulled this onto the branch since we have it as a high for krogoth
(and merged the other queued krogoth patches, thanks!).

Cheers,

Richard



