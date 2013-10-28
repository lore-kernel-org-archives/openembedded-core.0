Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 95A9B6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:59:11 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wn1so3811994obc.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=cjc2sdz+prKOSI+Q8NyrLrBeiNDqwc190UrpKtapy7s=;
	b=A0VLg3te7/5XZt1Ov1ddWjJMFmXWsesA/aLLEbhiQqgQKEk+ZPPeWHbhK3QkRtk3Sx
	QFrehMdmy9zRCtr7iWBJzrusnOwv3PdwIw9Fzd78YuRVLYU8xaeCAnrFs+LVDoghDgaG
	qAKKkrpKoXy1OfeAwIWP74s1tTSeQW5x9psGmq/PIhK/PCZSw94sDPNpZZov71xJvoyf
	veIDfdjm/c+LiKJcyyFiFAlxDDOAzKPR4tVVjH+KHiVrBrLSouYsngy+v9x7NTZWM0Uz
	HdfIh1N5k2xkJloAbMpjuVWD7aixtctQWZlmH/dd1HVn0hn0zcxLqe5/tWmdvvPJVGjY
	QTUQ==
MIME-Version: 1.0
X-Received: by 10.182.113.195 with SMTP id ja3mr2449605obb.46.1382975953253;
	Mon, 28 Oct 2013 08:59:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 08:59:13 -0700 (PDT)
In-Reply-To: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
Date: Mon, 28 Oct 2013 13:59:13 -0200
X-Google-Sender-Auth: jf6oN_nCKz3ywd1RID8vhxH4j4M
Message-ID: <CAP9ODKogpWd7aU2U5qpQ1mztUPwHtQjOQF0krwiLi5wm921pRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gnome: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 15:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 12:33 PM, Ross Burton <ross.burton@intel.com> wrote:
> This class passes --disable-introspection to everything that inherits it but not
> all GNOME modules support introspection, so add that option to the
> unknown-configure-options sanity test whitelist.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

I understand the change but it does not match with the commit log.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

