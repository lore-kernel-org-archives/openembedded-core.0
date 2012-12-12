Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TicCK-0001ur-VR
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 03:37:25 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so124798pad.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 18:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=6rgj4DkoJcYtTEWkDHdw/VP/91MzzTOxU4gWNraospo=;
	b=ttN04jjfISY+tfhNZuxNjqnhT8BSXJkzn0hF6kyunP2qEJflDd/ZG/qdJymBy6GhFR
	CEwCNn1fLk5sw4tUJt4HgqD1hsTuWBVeBC8vTxhITSJ4HxMFkPaF7t4jsCe9KXzn32lw
	HzpoUNNfHKlDx3TpO19hLWZqo2fcW1/RVxRdTjSkvof+GtSxYJQdCwMVj4H7Qp6PNo8O
	ih5EdgYhCZROf9mhy97vFznbHMY5wWzJ4DwRxTerDomog9d7dAdfrN058As9CfACNSUd
	4Sieo6i+Syey1+YY/fe9cRP9+Q/Jg3kSGf0/3D3RE/QlIGayV5d17hLldx4dyj9olilz
	Xjww==
Received: by 10.66.89.9 with SMTP id bk9mr925036pab.67.1355278971348;
	Tue, 11 Dec 2012 18:22:51 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.163.48])
	by mx.google.com with ESMTPS id nf9sm14731965pbc.17.2012.12.11.18.22.48
	(version=SSLv3 cipher=OTHER); Tue, 11 Dec 2012 18:22:50 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 10:21:28 +0000
Message-ID: <1528827.n0924lCJgi@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
In-Reply-To: <50C705C4.8010501@linaro.org>
References: <1725092.zIXSmU5oUM@yiqingliang-pc> <50C705C4.8010501@linaro.org>
MIME-Version: 1.0
Subject: Re: how to change the resolution of qemux86 machine to 320x240?
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
X-List-Received-Date: Wed, 12 Dec 2012 02:37:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, December 11, 2012 11:07:00 AM Marcin Juszkiewicz wrote:
> W dniu 11.12.2012 17:54, Yi Qingliang pisze:
> > Hi!
> > 
> > I have a s3c2442 system with 320x240 touch screen, and I want use qemux86
> > to simulate it on pc.
> > 
> > I googled, got "vga=xxx" in kernel arguments, but no success.
> > use "vga=ask" can select resolution, but no "320x240".
> > what's the right way?
> 
> IIRC one option is to patch vgabios which qemu uses and add new VESA
> mode with this resolution.
> 
> We did such thing long time ago for one customer but I do not remember
> details.

Thanks! maybe I can got some clue about the patch?:) If not, use 640x480 
insteadly.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


