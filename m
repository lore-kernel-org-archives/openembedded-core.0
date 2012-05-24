Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SXSyj-00055j-BA
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 10:01:01 +0200
Received: by eekd49 with SMTP id d49so2789815eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=m4IUnsAGqNJPaxdjSqq6erfBw8+9wTyCEA90zyawO4g=;
	b=FUwwWeABDjZpwxH3V8I6PBse/4ljq4SHmv8mwlpDWDg0q3g/kCzld0GMv+499R2ICy
	oIRD5j05tXwnTQ9JYYRTpHml2Tij6GQyMwmvPxvBeCi9YcTDkuJqDbcaFu1GxkK7nLDp
	1px10qKbLSuOjZX4YixnwSZ9dtG56KS7rtV9jVxNuh5DBedtG9Xhuu4GWLdrs0XdWuU4
	dS2lr8bRsUhf0mt3aF+sjF7PQ76stvfpRSjPQe6mMPKph8sOxnfmLf8wOMAyPu4JGaOn
	L2zJqJd11qDuNe5uNNTDtyU3wCI+qfU018FU8gn54AatKY8GUzxhqVNSZN5lWZ0kvx40
	x13g==
Received: by 10.14.48.8 with SMTP id u8mr6453724eeb.128.1337845850622; Thu, 24
	May 2012 00:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 24 May 2012 00:50:19 -0700 (PDT)
In-Reply-To: <4FBCF03F.6030305@linux.intel.com>
References: <1337761207-14688-1-git-send-email-radu.moisan@intel.com>
	<4FBCF03F.6030305@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 May 2012 00:50:19 -0700
Message-ID: <CAMKF1srPvMNBKf4ETKLoUm3QEjzX6yZOs1eOLpSdBuktBGNMrg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Update to version 7.25.0
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
X-List-Received-Date: Thu, 24 May 2012 08:01:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2012 at 7:12 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> You should explain why you are removing a patch, I see from the Curl
> archives they picked up a similar patch. =C2=A0I also note that this patc=
h slips
> in the following:
> -+AC_SUBST(GNUTLS_REQUIRED)
>
> Not sure if you missed that, it might still be needed.

I think that hunk is unneeded in this patch. I dont see any connection
of this hunk to what this patch was doing
it defines GNUTLS_REQUIRED but does not use it. Its safe to delete it.


