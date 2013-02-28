Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UB8BJ-0000MS-LD
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 19:26:18 +0100
Received: by mail-wi0-f180.google.com with SMTP id hi8so2467063wib.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 10:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=SxAwD1MszvJOgRitHfAB9gzXZRDy/hgW33spr1EiAAU=;
	b=TNl7u6wF7wdVmE3XiNYSE84nWKUxspRaPgB+hofQ2AwM1QyUvd7KsZiv+Nh0DDgdk3
	UDWjNepppr1jvGRdrohP2+yuL4lsxGSv+Z0n2JB5TU9dZt4dDoOvSOrmpcI+1dDIAJo9
	pbgy8phHLdGhq1PxEgt1cXnwCyRdLPlE+ScE7u62EB7xT6NjU9JNULj/B6E9RDMlB12f
	RidemYl0HZRV62R/rtobFb2RIDqfaZfALaXJQdb9zItWPK3Od4tk+1IxeIe5a+d/Qe+h
	vAJAgiXHaM0UIKag9onpjb72TItvI2pxqq0vxBFJ/sKv+nUnM7HtHbcBcQhkyJBtP+Pu
	c/MQ==
MIME-Version: 1.0
X-Received: by 10.180.75.177 with SMTP id d17mr12478777wiw.16.1362074991415;
	Thu, 28 Feb 2013 10:09:51 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Thu, 28 Feb 2013 10:09:51 -0800 (PST)
In-Reply-To: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
References: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 28 Feb 2013 13:09:51 -0500
Message-ID: <CAHUNapSbpFDttimPKO9czY3NiV4x7kTZ8ysDgq2TuifnosH0Xw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Fix build with texinfo 5.0+
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
X-List-Received-Date: Thu, 28 Feb 2013 18:26:26 -0000
X-List-Received-Date: Thu, 28 Feb 2013 18:26:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Maybe we should wait until the person who reported this issue has had
the time to test this fix and confirms it works before submitting it
for inclusion?


