Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSaAZ-000185-My
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 22:41:03 +0200
Received: by eekd49 with SMTP id d49so514648eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=IHqGwnWrWVRZRPHGHxo6Xs06+Lb0/UlvMgLvzPqmQMQ=;
	b=EDTtIfOHUIqIyDgMNCwWAFrkHhO7iUFNeKT+6iCSvkjGZOgsarukK3nT6mgI4Ec27y
	9D96FPQGGUOVHWg8rXQziPr0Eh7ACy3NnyIfhWK+tOPF6MtvhIoPzPuYSZaF2NXcnsUn
	JtRxeVhYDm9qNyVbRPKp4nfHnIP54Zm/VMjyyDf2y+ZhWoO7V3P4PuI4HwgVtkJmTtzY
	aHGBY6PSGn7OH4O3J8+T/l2DqU6ZfGwhmDQsTgvUZba9Y1kh7PUkszf7kv9z9cxGZ4Mv
	6r7C3RRp+h6gmtRhZrBo8vmtAe4UG1EL+rAlxhHgKUxO5ADSBiKDeoDWRtf8bzrxcdEb
	4pkQ==
Received: by 10.14.47.136 with SMTP id t8mr1194886eeb.84.1336681869143; Thu,
	10 May 2012 13:31:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 13:30:38 -0700 (PDT)
In-Reply-To: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 13:30:38 -0700
Message-ID: <CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: fix packaging error for libext2fs
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
X-List-Received-Date: Thu, 10 May 2012 20:41:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 10, 2012 at 1:03 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
>
> -FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
> +FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"

its probably not a good idea to mix files from libdir and base_libdir
in a single
package. Since lately we have been accommodating /usr to be mounted
independently.


