Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6d74-0002lU-A5 for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:50:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M6pISQ024753 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:51:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dF4trSup00eH
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:51:18 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M6p8Fe024736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:51:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 07:44:48 +0100
In-Reply-To: <cover.1316670879.git.dongxiao.xu@intel.com>
References: <cover.1316670879.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316673901.2029.0.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1][PULL] usbutils: inherit gettext
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
X-List-Received-Date: Thu, 22 Sep 2011 06:50:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 13:59 +0800, Dongxiao Xu wrote:
> Hi Richard and Saul,
> 
> This pull request is to fix the do_configure error in usbutils error, reporting errors like:
> 
> cp: cannot stat `/distro/dongxiao/build-ml9/tmp/sysroots/qemux86-64/usr/share/aclocal/codeset.m4': No such file or directory.
> cp: cannot stat `/distro/dongxiao/build-ml9/tmp/sysroots/qemux86-64/usr/share/aclocal/fcntl-o.m4': No such file or directory.

I'm confused. I had a look at usbutils and I can't see any reference to
it needing gettext and it builds fine here. Do you have any other
information about how to reproduce this?

Cheers,

Richard



