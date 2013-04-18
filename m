Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UStdZ-0007jG-8U
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 20:32:49 +0200
Received: by mail-vc0-f177.google.com with SMTP id hr11so2863662vcb.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 11:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=zhOJPE01Zw6oS09y7byUcgw6F2Nw6L0/xyQetAkkmkc=;
	b=GpRN/zjQLayVPDnBb42PPW1Br7CtdsLXqfwUDNMPDb1yk77Q8/GdmAOVnkTXyzkNJW
	61ONf+mUoa8aJbAUEMrZE9JCtk7KvRhSy1ui2km7fWzP/Z0M9WBitUJlbDnQ6vsINOUF
	GEwv6m2S23ZBvIci0m0vu+WHV3YZX6D4AKTn6cqz0p7qwgYHShTIgjw5zwHRm/fgMwIS
	k/c+MWzur29hlKt8UM7ksXopknFCN5jceWGlI/CNF/utxHwPJA3FaToi6ZVdyHZmsU/5
	w3eRWWQGLUZT4n7lUmizdzmsks6weu35RZpw/Phu+XXujVK1Q9QAslxVRxGZv4vsaoEw
	idCg==
X-Received: by 10.220.155.8 with SMTP id q8mr3237636vcw.42.1366308915378; Thu,
	18 Apr 2013 11:15:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 18 Apr 2013 11:14:55 -0700 (PDT)
In-Reply-To: <1366308596-21123-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1366308596-21123-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Apr 2013 19:14:55 +0100
Message-ID: <CAJTo0LYtVBuGXGsx=YZ+TqpoLWJo2oHtq4611UPdUKhWs0tXNQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQmibEwEg1S4rqIhNF5JMI9hkA15oQfqyK/ukNUNo3A6zK4hftT2K7xO0yMdpvmRMoStfTnS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: depend on libgcrypt
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
X-List-Received-Date: Thu, 18 Apr 2013 18:33:01 -0000
Content-Type: text/plain; charset=UTF-8

On 18 April 2013 19:09, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Although libgcrypt support is optional, its development files are
> are always required to expand AM_PATH_LIBGCRYPT.  Build might fails else
> with

This is less than obvious, so please can you add a small comment
inline explaining this before someone "fixes" the libgcrypt dependency
not being in the packageconfig statement.

Ross


