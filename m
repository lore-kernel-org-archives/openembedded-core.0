Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPblL-0001VP-Gn
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:51:15 +0200
Received: by mail-ob0-f172.google.com with SMTP id eh20so3764594obb.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3K9pc2rLV3TQ0T9EIPF9mi1X2O7Tu9F2nEgBJrD0a+Q=;
	b=UnP1/7B8vrxtdDxkKwhGROdtnNSIo7d9SknIE9zx/8mixrNInctl+2kXku8PDYbb53
	XjLHDy1O/R7st0dpIpwds8RqXjai/sLeyybo0Jdc5OxTZJsVsA5bBJLDnIymv/slaWQT
	SbWqOB1iC+u4l1xBkv/WgekPY0XhFo09GTMLp3ZtyDBibuJvcX0QxkybKZd3tL0D4evf
	KYOoyWMPOumAGgEdF8q2eopLUM0e2Ccy8ulqRdtrNCvMhOLW7JceZMKmGljieYIbm9uU
	BMH3AEiIXs4dNUxGpXmFg+YOe6Q6wEll4PjfLTQ6sjzfqMVWVoXkY+IMFdZSLDKD2ef2
	y8nA==
MIME-Version: 1.0
X-Received: by 10.60.63.73 with SMTP id e9mr18740081oes.87.1365525234700; Tue,
	09 Apr 2013 09:33:54 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 09:33:54 -0700 (PDT)
In-Reply-To: <1365523730-15141-1-git-send-email-sgw@linux.intel.com>
References: <1365523730-15141-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 9 Apr 2013 13:33:54 -0300
X-Google-Sender-Auth: FeVbc--6Jg_pwrKmCNBB6oh6GjA
Message-ID: <CAP9ODKpdu79HJPSA7a9-q_XXP1YffeXNq6g9c=ts4ktvMJfJhA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix init script for the location of udevd
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
X-List-Received-Date: Tue, 09 Apr 2013 16:51:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 1:08 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Ensure we can update the script base don the location of the udevd installation
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This does not work as we have systemd-udevd as possible binary.
Besides, there's a type in the commit log "don the location" ;-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


