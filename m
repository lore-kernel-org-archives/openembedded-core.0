Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdkSD-00062X-2g
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:25:41 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 08:10:42 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so65519958oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 08:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=JZkS2+ue/Nc1Aqa+ZFfuLEBdWH9MvTBvpwNNjjrYZaA=;
	b=DFw1/SJX16pLBbUCl9ADFeYLlKfyVtYyPKYi5WmAz/Z3uWZCSoaMJMgj+KwesV3OMh
	mVUIbw9prVFgZIJjP9H0clnfrdwIJ13hIEQQK7WhqhBgTbYU+3DzuIfJ+302v+s/OsF2
	Jv4BQiSxWkEJopOWWPG0+/ftMNzMELGSj09RMjyEI8bOj5Cbuf5eytoy3ZkKmfaEpM3v
	+TMWBYz6ZnOuYqsWrGTMpVV0Nxp0Mo58Ei8zSXmmg/bRxavo8cPzx7U2Y7+MOvrN8zT9
	bgEjlA99v7xJ/gH4VtdBgInMGk7d1E0VhiM9i/p5/jDXEL7VIbOxYdiR0SrCUaRj/C25
	lQCg==
Received: by 10.182.64.101 with SMTP id n5mr4148198obs.11.1354119084426;
	Wed, 28 Nov 2012 08:11:24 -0800 (PST)
Received: by 10.182.64.101 with SMTP id n5mr4148185obs.11.1354119084359; Wed,
	28 Nov 2012 08:11:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 28 Nov 2012 08:11:04 -0800 (PST)
In-Reply-To: <CAP9ODKqBNJ7QpJq7M_-0=G=rq3EZiCeBeWpBHGiGju53o9a2ZA@mail.gmail.com>
References: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKo4+FnG=c1m88HeG-MxbzQD-+MyLo85G47Qh_uNcxKJEw@mail.gmail.com>
	<CAJTo0LZXgDtv_EsxnCvLv5nyHpf5FBtFYRYtXyCj+7D=uKpWDA@mail.gmail.com>
	<CAP9ODKqBNJ7QpJq7M_-0=G=rq3EZiCeBeWpBHGiGju53o9a2ZA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Nov 2012 16:11:04 +0000
Message-ID: <CAJTo0LbDv-c2cyAfvWzfo7wiH2_F9+pCx-CC4QFyzM_e1havEw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQk3cfMSPEu2Mo3OZvap5Ci6OsBBulinjJ8TZSSFoWqgel46lSH6rA3h6LgUQ6KpaklHq/jLxBpPwPp2Rf1c24qV5kX+qVE/Z7HwIBgMI29H8/JnlmCtXm+zSTIsM7L6rtdLkoVa39D0GtwmOa0nYmP1kg2JvYw/hDHtwo0aPFKWbbtJrcy3yMH1dmRoldvkgKsuRxib
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
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
X-List-Received-Date: Wed, 28 Nov 2012 16:25:41 -0000
Content-Type: text/plain; charset=UTF-8

On 28 November 2012 16:02, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Well but in this case we would be better to have 1.9 in oe-core, in this case.

meta-intel alone contains 1.9.3 (for EMGD) and 1.7.99.2 (for emenlow).
 I don't think it's reasonable to collect every xserver version that
binary drivers have built against into oe-core, nor is it reasonable
to force them to do all of the packaging themselves (at least whilst
the fix to make the same inc build for old and new is to add a few
package definitions).

Ross


