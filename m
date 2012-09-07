Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TA5js-0003iO-Rm
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 23:05:20 +0200
Received: by eaad12 with SMTP id d12so5549eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=h045ZjiX377pL3Nhqz6HerAQm3YBwgspnVsIP0ha5cw=;
	b=P5yOY8fRpiZxUqNBMhKQU+rpZJ9MwMm2ny96uE9HUdsHq+/HFSara2GYYKPkPM9t4b
	U83rTMr85yMn6XOfj1JVaXD0ST/TZ855whMRnp2qpXNBYuRdmmpNNYDBjwTSyA3yBhX9
	jPdRCxOqQeO87+kHL8zQRaEiMvzEHLD1WURGhywEVI5rhUtZQOOGgq2uFLVCUfDX3MBK
	hArQ6+7eVqIP1hVdY56Bj9YgdxgD7cHEt1dNyzAiHpomCfnKZhDZIp7lhL84OKafhWDm
	1lHC0jFt/JMGsT8AZGiX7/UxRC4jzYNeDxS3gI7QAgLCnqwceOxZtNEBdp0FAEg0UhcN
	7n8A==
Received: by 10.14.202.66 with SMTP id c42mr9899205eeo.35.1347051174743; Fri,
	07 Sep 2012 13:52:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 13:52:24 -0700 (PDT)
In-Reply-To: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 13:52:24 -0700
Message-ID: <CAMKF1sq3OboaitVyZYqNSaedp2UFZ0m6QJ8Bznw0uFgQR8kG-A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Marc Ferland <marc.ferland@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
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
X-List-Received-Date: Fri, 07 Sep 2012 21:05:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 7, 2012 at 11:17 AM, Saul Wold <sgw@linux.intel.com> wrote:
> +       for i in ${IMAGE_FEATURES};
> +       do
> +               if [ ${i} = "debug-tweaks" ]; then
> +                       sed -i -e "s/^#PermitRootLogin/PermitRootLogin/" ${D}${sysconfdir}/ssh/sshd_config
> +                       sed -i -e "s/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/" ${D}${sysconfdir}/ssh/sshd_config
> +               fi
> +       done

instead of looping could you apply same logic as in dropbear to do this thing ?


