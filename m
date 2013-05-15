Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1UcX8G-0000m8-0o
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 10:32:20 +0200
Received: by mail-pa0-f53.google.com with SMTP id kq12so1270927pab.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=Y8GzqFe/lMe02DhVDO+pLhO8JjC3BxkELzgRQu7NT+I=;
	b=heMVnfWxi/DwHIT8jIOD5Akkt+EV9G7uY2Q8UXDF5z5SKcvrkhrDEOJ9qJdPWZBcXk
	VHP9WIdLjp0385JqJ9zckbGNNllmox3XdJ5z1z3odXPYYBnKaqAagSXpOypg67cXdHHn
	PkAJoOnCYv+QC3G+GZtOCJw29A5UhLCYumc3zHvaer8ZEl6IvDLPGoZQsoJqlsOixsFi
	k80Af5QygcnTNJp5Hquc3Tuf6xgYXsIAMv1Z1ZUCU27HHZpfGAqJyJJ2BEmGxhOjZ6vT
	18YG8iw3rKgg6g+M72vK9b+KSDAxkIpFeRTBRx11A3PRAdH/ajxuKZrFdKajw5RmdHCx
	cVjA==
X-Received: by 10.68.219.42 with SMTP id pl10mr38030529pbc.24.1368605646953;
	Wed, 15 May 2013 01:14:06 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.237.163.165])
	by mx.google.com with ESMTPSA id ra4sm2396185pab.9.2013.05.15.01.14.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 01:14:06 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 16:10:30 +0800
Message-ID: <1875466.EG2CYrV9ea@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.11-1-ARCH; KDE/4.10.2; x86_64; ; )
In-Reply-To: <519341D9.6080104@topic.nl>
References: <3388285.jCfN1Lj2u9@yiqingliang-pc> <519341D9.6080104@topic.nl>
MIME-Version: 1.0
Subject: Re: qt keyboard problem
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
X-List-Received-Date: Wed, 15 May 2013 08:32:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, May 15, 2013 10:05:45 AM Mike Looijmans wrote:
> On 05/15/2013 08:19 AM, Yi Qingliang wrote:
> > I'm running qt application on yocto's qt image. cpu is s3c2442, like
> > mini2440.
> > 
> > the problem is:
> > 
> > key event issued by pressing gpio-key eat by 'getty' (from busybox),
> > my application can't receive input event,
> > if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.
> 
> I solved it by no longer starting the console login. Set the following
> in one of your .conf files (distro or local.conf):
> 
> USE_VT = "0"
> SYSVINIT_ENABLED_GETTYS = ""
> 
> You may need to rebuild initscripts for this to have effect.

thanks! I'll try.
after that, I'll transit to systemd, I don't know if it has same problem.

in the yocto manual, only replaced sysvinit by systemd, but no other notes for 
'initscripts', on my Arch Linux, after transit to systemd, there is no need 
for 'initscripts'.


> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


