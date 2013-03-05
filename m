Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UCx0y-0008Qo-V2
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 19:55:29 +0100
Received: by mail-oa0-f48.google.com with SMTP id j1so11300506oag.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 10:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=F2Y8cnbk+jrRlV18t2EqDhz/sIdA/7EVZv9yf57qBAo=;
	b=CcEqp/ZwtlnGtVdmGUD8oaLnoZ7pVdKuSEGedzfTwok+l0IjJRCYPvCDaHVmUreF81
	eQ3vs3pC38+1R5WzutJLbD6fOGiw/4l+EZGXf9VhO+/g4uiUx+ELxe8cK9ZsCHZhFjz9
	ag2TskLsJnnwZur35TTLi/yKA4ycYAwStTLtNUwoCnz7kM13B466wX+E87dPfAWZeo6h
	yHSmmavci9S++mTr8BFlh+YYZcbyFxmVY3+69rAe6qaC1Nb0AGPWC313XK5WIra18/NO
	dQ5XqqiCZ4NglQYTwIaAqtQD8/M0wYhIQ6lloIPgBexAZi4tVH7eeP7F/gTAoxhTxsNO
	H/RQ==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr20667201oea.4.1362508714921; Tue,
	05 Mar 2013 10:38:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 5 Mar 2013 10:38:34 -0800 (PST)
In-Reply-To: <1362505542-25853-1-git-send-email-obi@opendreambox.org>
References: <1362505542-25853-1-git-send-email-obi@opendreambox.org>
Date: Tue, 5 Mar 2013 15:38:34 -0300
X-Google-Sender-Auth: s62BvTnG8FPCYAqCtoEDXcQ_OyU
Message-ID: <CAP9ODKp_6BXh2ifKQ=sC4gXBzxdRf0ZyfijC0Nn1tdcv7PDR6Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4.inc: package keyboard drivers
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
X-List-Received-Date: Tue, 05 Mar 2013 18:55:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 5, 2013 at 2:45 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
> * Fixes the following packaging error, if compiled with
>   -plugin-kbd-linuxinput:
>
> | WARNING: For recipe qt4-embedded, the following files/directories were installed but not shipped in any package:
> | WARNING:   /usr/lib/qtopia/plugins/kbddrivers/.debug
> | WARNING:   /usr/lib/qtopia/plugins/kbddrivers/.debug/libqlinuxinputkbddriver.so
>
> * No PR bump, because -plugin-kbd-linuxinput is not enabled
>   by default.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


