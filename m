Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sy5Yt-0002lB-3H
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 20:28:23 +0200
Received: by pbcwy7 with SMTP id wy7so420927pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=IIhdkpauB1lcoZ9sGEeYIzkbBEu2c8/3dhCbyTqpyAU=;
	b=X1063nm7hYPDRA+ZMuAwtZx5g6ujnTinA5nDsZg+jvJK/hLHUYe90XGKqFdhY/xNcO
	raobgDoSkwbmS9Yk/tZfAjy3op73+FPmbFi9m8l1YwA9FwyMQk4HCsmmZEJb7hFtL61X
	2D0tz4t+TYiSmbiZMRGMBZOQi2kDl8b1761JZSwIIOpBGSdmYSwFuuyijaIWeSAulJa9
	NYuB9Ila1t3K7rhuGpsbQr5AxkMpT7oI+Z8AtEMiHj5rF4jsGs46u0+Ai4/NbhJYsvle
	8w5Bb5OZn6YCK4FQAEhwRfWs2IV4wlEGnRcAt+2EyPhOScmkbXgpYq7eoL0DbcyVhqTg
	0bGw==
MIME-Version: 1.0
Received: by 10.68.225.42 with SMTP id rh10mr13463407pbc.116.1344190598351;
	Sun, 05 Aug 2012 11:16:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.30.200 with HTTP; Sun, 5 Aug 2012 11:16:38 -0700 (PDT)
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
Date: Sun, 5 Aug 2012 15:16:38 -0300
X-Google-Sender-Auth: TvJAJ8JUt-4x_9eUn1Og0Q-5c_Q
Message-ID: <CAP9ODKqyQ5HGMxWpzuDGE2XEdpm4pp0AuNM3Ld35u_N+3mPJLw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/30] cleanup: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 18:28:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 5, 2012 at 12:53 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Also, I didn't increment the PR on the recipes since the modifications
> don't introduce a semantic change on them.

This is wrong; if the distro changes the variable value then it does
change semantic. Please change PR on them.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


