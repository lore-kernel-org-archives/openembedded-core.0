Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UeQi1-0003RM-H4
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 16:05:06 +0200
Received: by mail-pd0-f181.google.com with SMTP id p11so5414748pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 06:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=zF6dXnFzbHpNYcZ3gE4qCNkL8GXXdsdKJnVbK3HReDc=;
	b=bKtRtwT+TXF+xjIji6kwsrq7rHH7Z+/6sKiYS6cJBrnAHCVQ/9SusP+9JxuAxJXeec
	yKSBMrNJ/ClsslKhJxR5CqaJSPoOQAKw59NKq0FOPm1XU2Eub5rSq/v3hF8jkUBlrzNm
	tYOXk0Bq/KRty8Ai6rmMS4EeR023IaOM+xZOg/I4z6mxyo9rGLIkthlnuEl+mTGKvhY3
	iMErMuj+wgZWkrNLfqYck8nFRdwoE2ig5mu80vyuGOjBjy6ypexxMN7AnzZU50xwsEpq
	XOYac2qh5UcbDK4aOGMfcsWncIMiDQDqIONj4BgEID6I39+ot9OL1lcWo0IrmKx2LQxy
	6tfA==
X-Received: by 10.66.197.136 with SMTP id iu8mr62234622pac.0.1369057604515;
	Mon, 20 May 2013 06:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.100.104 with HTTP; Mon, 20 May 2013 06:46:24 -0700 (PDT)
In-Reply-To: <1369054950-4271-1-git-send-email-riku.voipio@linaro.org>
References: <1369054950-4271-1-git-send-email-riku.voipio@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 May 2013 14:46:24 +0100
Message-ID: <CAJTo0LYtDvcsq93YqieYRh=qJJe-WzMpLEv_haC8NS9nAe-Hhg@mail.gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
X-Gm-Message-State: ALoCoQkYTbNn0zdMUvfnj8S3kYyVBKWIC4jwSyb9cAYW6OUtzHGharWrbvqsNKuV8r9VxUDfGp/o
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: enable xvfb
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
X-List-Received-Date: Mon, 20 May 2013 14:05:07 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2013 14:02, Riku Voipio <riku.voipio@linaro.org> wrote:
> Currently Xvfb has been enabled in openembedded-core. Xvfb is needed
> for example in Mauve testsuite.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


