Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RLmKH-0006yh-UI
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 02:42:42 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 3 Nov 2011 09:36:22 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 3 Nov 2011
	09:36:21 +0800
Message-ID: <1320284129.1504.11.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 3 Nov 2011 09:35:29 +0800
In-Reply-To: <CAP9ODKooneOYO_b8Teg=VhukHQW27acQePiO5abKX_RV3TupEw@mail.gmail.com>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
	<1320021891.10032.56.camel@localhost.localdomain>
	<CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
	<4EB196D0.5010005@windriver.com>
	<1320281261.1504.10.camel@localhost.localdomain>
	<CAP9ODKooneOYO_b8Teg=VhukHQW27acQePiO5abKX_RV3TupEw@mail.gmail.com>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to set time zone
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
X-List-Received-Date: Thu, 03 Nov 2011 01:42:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

what is "IMO"?

On Thu, 2011-11-03 at 09:19 +0800, Otavio Salvador wrote:
> On Wed, Nov 2, 2011 at 22:47, Ni Qingliang <niqingliang@insigma.com.cn> wrote:
> > maybe we can do the link in system booting, use the variable "TZ" to
> > create the symlink /etc/localtime, just like archlinux.
> > e.g. providing one script in /etc/rcS.d/ to create the symlink.
> 
> This ought to be done by image IMO; so a kind of post rootfs
> generation hook might be use allowing it to be set per-image.
> 
> I personally have this exactly use-case here at work.
> 
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



