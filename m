Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAhqR-0003Gy-80
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:18:56 +0100
Received: by mail-ve0-f180.google.com with SMTP id jx10so582513veb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=aeIiHYvUDwXAdGFNllL1uLacclMccSxgn+ChwlPQdX0=;
	b=bGJjDpKU1NM38DBPpYVkNZTHYOb9nGg6qvetfmT7C1mS5xE+c7jtqye6QD0oQFpKLX
	+MgukFBJ3W3s/4+hz9L3KpbeYPtO5cUHDFkQKC9DaSRUe+ktf4kpDN9ukGc+lg1Zu1RK
	dwTt5tR0fBG7kutrur0OOS1uiVM+Xm7Z6PAbDEGf3MjopiIwViHx+ND/On0+DmbEvy77
	qbrceY/bPh2smNE4Ys1L3jb9hnvLHvVmU0R02sTVIZdc5E7boBCY1FKfixKUl8QE0hpH
	w8s7oM93RBON8s7D/F0JjhcPmsTY+Mxtx30xm99/JoEAjtDEudHwFNhqzhzdoiC+AKSq
	GHmQ==
X-Received: by 10.52.91.39 with SMTP id cb7mr788302vdb.71.1361973754328; Wed,
	27 Feb 2013 06:02:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 06:02:14 -0800 (PST)
In-Reply-To: <1361908840.1685.5.camel@rrMBP>
References: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
	<1361908840.1685.5.camel@rrMBP>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 14:02:14 +0000
Message-ID: <CAJTo0LZ+8R0WMkV4ibx9a4RzOqcPsnfRrwhnyuCMtc4qvAUbUw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnvDyMvUdXqy+40D5ThaOkQlSXUP280xH07JKEF0P6kBpNHdKfJ9caLLUWBpVQepDt4ie+f
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] systemd: set the location of the kill binary
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
X-List-Received-Date: Wed, 27 Feb 2013 14:19:07 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 20:00, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Like V1 this hardcodes ${base_bindir} to /bin, this breaks when your
> DISTRO sets $base_prefix to /usr. So please change that to:
>
>         ac_cv_path+KILL=${base_bindir}/kill

Yeah, not sure why I did that.  :/ V2 coming shortly.

Ross


