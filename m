Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4x59-0008QE-Q6
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:50:03 +0200
Received: by eaad12 with SMTP id d12so508927eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J0m72vtYRAew7D8LlGOvipXgpIHJLnKUnF+TVtL6LDM=;
	b=g2JMXL9X1Xol3D8XUatDQeN3lZPbhN0M0TxvGUFZNyTsQbaCRYf8hY8S3UZOYX/GgG
	LzdrGwY9lZ2q0P+9hbFlN6T+KRSrM3LzZNrKaboF/PG50uSF4Ghrf1dEh0JYHJxQShfj
	ajJUHH+PmuGIqvID/DQ3BDQED9IkA4cxSMCBCdPRpfTQ8Ti/vZcyBvKyzoSF1OIYzRhC
	bhUyLORsfQ2IJB0kfuQCLozzp4W2kGF9lDLy6ciZ6Siiim2XiFIeZzJFNyXjsCCpv2yJ
	1tpueU1f8cYyDfMhS7mpc8rWz7Kz0nHxJkVLwBifl7+6cjCEDQRFMtzH40Ur/uWHJ+VI
	5JGA==
Received: by 10.14.204.72 with SMTP id g48mr8252098eeo.45.1345826276109; Fri,
	24 Aug 2012 09:37:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 09:37:25 -0700 (PDT)
In-Reply-To: <5037ABF0.1030908@windriver.com>
References: <1345817543.14369.70.camel@ted> <5037A36C.8020401@windriver.com>
	<1345825168.14369.85.camel@ted> <5037ABF0.1030908@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 09:37:25 -0700
Message-ID: <CAMKF1sobO15GxzbwfYQPg3PJdKfXTA8TTpogpShMCEza0vnbZQ@mail.gmail.com>
To: Andy Ross <andy.ross@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Add fix for libtool rpath problems
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
X-List-Received-Date: Fri, 24 Aug 2012 16:50:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 24, 2012 at 9:29 AM, Andy Ross <andy.ross@windriver.com> wrote:
>
> It's libtool which has special requirements here, becuase it's trying
> to set rpaths based on those funny strings and has to have them
> normalized.  So I'd argue that it's in libtool where this magic has to
> happen.
>

yes I tend to agree

> Before I realized you already fixed the gcc-runtime issue, I was
> looking at finding a place farther up the stack where this could be
> done.  That is, sanitize all inbound paths at the spot where they're
> parsed at the command line.  The current cases we know we need to hit
> are -lib and -rpath, though I'm no libtool expert and am surely
> missing some...


