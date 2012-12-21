Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Tm2Uc-00054e-5x
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:18:26 +0100
Received: by mail-la0-f43.google.com with SMTP id z14so4943576lag.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=y22xK5OYozf4WzjQ+4bMext6wx4fyZP8B1mFZzQUN8s=;
	b=nJIKq2cJfh1l+pFoGKOxvucuRvykboNpVQEGrQbRRnpKvRSt4PvnrYOe29JYEtGRCf
	HxIZwGc2Dv+b/P/p5FIET59DJXOPgP9Dvi3cELKuGXXCLqcBMzRVw0zCmsUwwi/uN4m6
	3zhza430VgG6CRWfMSQ/IPhsC5uaXOOLriNf86ZBTxK+dCtAY9gcF6XVSR0ssDqTrgXS
	bOV8SNIru8bxj+W8q8xSzPoz74xLD185QPhUlDNFgaHcd+mYsMeKqM0zzf73inuAIhKU
	vMRlBay1eRG9NhsqBnRZvbGKdWSLY7Y79J1Uh7m/fUoQKT9G3nz7A3Xz19UBdn4l9bOV
	vG/w==
MIME-Version: 1.0
Received: by 10.112.101.232 with SMTP id fj8mr4932187lbb.83.1356095020286;
	Fri, 21 Dec 2012 05:03:40 -0800 (PST)
Received: by 10.112.101.135 with HTTP; Fri, 21 Dec 2012 05:03:40 -0800 (PST)
In-Reply-To: <1356094822-21647-1-git-send-email-twoerner@gmail.com>
References: <1356094822-21647-1-git-send-email-twoerner@gmail.com>
Date: Fri, 21 Dec 2012 08:03:40 -0500
Message-ID: <CAHUNapRjGACLVh4+oGr-CfA+ewSPQSYCo+Oxq2Bs87YZaR_XEw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: change terminal's INTR key in 'serial' mode
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
X-List-Received-Date: Fri, 21 Dec 2012 13:18:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 21, 2012 at 8:00 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> +if [ "x$SERIALSTDIO" = "x1" ]; then
> +        echo "Escape character is '^]'"
> +        stty intr ^]
> +fi


Hold on. This should be "Interrupt charater".


