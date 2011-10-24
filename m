Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RIAQa-0004WV-9V
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 04:38:16 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Mon, 24 Oct 2011 10:32:18 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Mon, 24 Oct 2011
	10:32:16 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 10:31:21 +0800
In-Reply-To: <1319421032.10032.22.camel@localhost.localdomain>
References: <1319421032.10032.22.camel@localhost.localdomain>
Organization: Insigma
X-Mailer: Evolution 3.0.3 
Message-ID: <1319423481.10032.24.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: where is the binary file
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
X-List-Received-Date: Mon, 24 Oct 2011 02:38:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have found out it!

the PN is tinbox, and I have installed the binary to '/usr/lib/tin/'

the bitbake will process '/lib/${PN}/' and '/usr/lib/${PN}', skipped my
own directory.
after change to /usr/lib/${PN}, it works!

On Mon, 2011-10-24 at 09:50 +0800, Ni Qingliang wrote:
> Hello All:
> 
> I have installed some binary file into the /lib/xxx directory (used for
> FPGA), and can find them in the 'package' dir of the package. but can't
> find any in the 'packages-split' dir of it (and also not in the final
> image).
> 
> 
> Does anyone can tell me what happened?
> 
> 
> 
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> http://niqingliang2003.wordpress.com
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
http://niqingliang2003.wordpress.com




