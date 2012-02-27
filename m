Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1S1yYq-0006il-Vg
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 12:16:09 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Mon, 27 Feb 2012 19:07:38 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Mon, 27 Feb 2012
	19:07:35 +0800
Message-ID: <1330340722.1086.122.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 19:05:22 +0800
In-Reply-To: <4F4B5DDA.6010206@communistcode.co.uk>
References: <17057774.C0TjevbrGC@kgy> <1330181716.13788.33.camel@ted>
	<41586593.1CLnZEXO8J@linux-oxe9> <4F4B5DDA.6010206@communistcode.co.uk>
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: Re: empty dirs in glib-2.0
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
X-List-Received-Date: Mon, 27 Feb 2012 11:16:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Same problem!!!

On Mon, 2012-02-27 at 18:41 +0800, Jack Mitchell wrote:
> On 27/02/12 10:30, Gyorgy Kovesdi wrote:
> >> rmdir was used specifically so we'd know if the directory wasn't empty.
> >> What files are in there?
> > ...../usr/lib/gio/modules:
> >
> > total 32K
> > drwxr-xr-x 2 kgy users 4.0K Feb 27 11:26 .
> > drwxr-xr-x 3 kgy users 4.0K Feb 27 11:26 ..
> > -rwxr-xr-x 1 kgy users 2.0K Feb 27 11:26 libgiofam.la
> > -rwxr-xr-x 1 kgy users  20K Feb 27 11:26 libgiofam.so
> >
> > It is reproducible now, even in a brand new checkout.
> >
> > Regards
> > Gyorgy Kovesdi
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> I can confirm I also just ran into this issue on an Angstrom Master
> checkout.
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



