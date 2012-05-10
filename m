Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSbaa-0003xD-Pt
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 00:12:00 +0200
Received: by ggcy3 with SMTP id y3so1383369ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 15:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pqWwV0GopQ2CXwwFwwEUJNkNGFoevoaB3ONufWz18+A=;
	b=rn6jc5iT+y4RPMBXaCKuWqsi/bVIXTm7CKbLomzCqzqvXPZPFoqFQ3M9qg1aD1JBf3
	UUmasmt3Avt7lfQ7dXNoMQyo1U8GeSvXsvGPfa6KCKRYvQ7sDgFQ+2vplwm7bp2PfRWQ
	NueNx+L1VKg5x89RhCeukO/QuHpSpJKDGDvYignTkRCWKxCeyXsEnGu4aHu9jsj7jnyl
	xt4EsPUPjoolunH+ZnzK8SQVuylMPDwQ1Ap16Vcnfg27eDm7Ikldn7MJSgjDv5hKharX
	gZD6BOHn5D9VgTHHKk0W7DDmFBHehGc3sEoOXajV7Y3blr0IQvzZMmxIdrQ4G7vfUpge
	FHHA==
MIME-Version: 1.0
Received: by 10.50.217.137 with SMTP id oy9mr373454igc.31.1336687325793; Thu,
	10 May 2012 15:02:05 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Thu, 10 May 2012 15:02:05 -0700 (PDT)
In-Reply-To: <4FAC36DA.8080201@opendreambox.org>
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
	<CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
	<4FAC36DA.8080201@opendreambox.org>
Date: Fri, 11 May 2012 01:02:05 +0300
Message-ID: <CAF6bG8ezbCV_KE3TWWTrarOK+-Qjq6_kmk8mckLbth5rjWvBHw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
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
X-List-Received-Date: Thu, 10 May 2012 22:12:01 -0000
Content-Type: text/plain; charset=UTF-8

On 11 May 2012 00:44, Andreas Oberritter <obi@opendreambox.org> wrote:
>
> I have no idea what e2initrd_helper does, but this can still be
> addressed in a later patch.

 AFAIK it's needed in initrd images only, before even rootfs has been
mounted (it's used to query some information from not-yet-mounted
rootfs)


 - ML


