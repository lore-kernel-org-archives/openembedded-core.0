Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SVPYq-0004a0-8X
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 17:57:49 +0200
Received: by eekd49 with SMTP id d49so847469eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=NKwWoNc0kvXZ0Gf99+6+Bg4x7RgIY7F4lWjUlD5C44g=;
	b=MdHfiBFy1VXBp71TVE9pa+ygmL8wprkBL9sARAGhyiIF6eOpJK/MomMoLQeDzuFfd3
	2K7MGqZQE3MvmO2ZSDEl+b308kVA4p+xMasDHcx3cgSLSQW4uiQ84adOK9RoMDuKcCy5
	/fOIZzTkhEtq16aeJDChVHkzvjvNd4+PO0OyQ5iZl5Vs8BlXZEmJi3vHEdR2ZMjq3xYP
	jUXYxTRJ8aSVyTK7KqGcMw18GCA6pMb1Lb+BeTEP6ADzsTYDDDP8EwOahBZW4/Ih++tA
	rNHnsVZOPmfU4eJksEOU0c/lacwH0BvhxFxWLWuIy33TQlw2pFArciJFddJLy8L0ElTL
	7VFQ==
Received: by 10.14.97.137 with SMTP id t9mr2265935eef.73.1337356064539; Fri,
	18 May 2012 08:47:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Fri, 18 May 2012 08:47:14 -0700 (PDT)
In-Reply-To: <4FB5FD66.2010409@linux.intel.com>
References: <cover.1337295951.git.nitin.a.kamble@intel.com>
	<bce112d0eb42badfca77109b40cf2c86ca3efa48.1337295951.git.nitin.a.kamble@intel.com>
	<4FB5FD66.2010409@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2012 08:47:14 -0700
Message-ID: <CAMKF1sq64=eq3C9QS15uN5Ryi301wOfx7swSTTV=_MNubmhw1Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc: package mtrace separately
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
X-List-Received-Date: Fri, 18 May 2012 15:57:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 18, 2012 at 12:42 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> A better way to do this is all in the task bb file using an override
> MTRACE = ""
> MTRACE_libc-eglibc = "eglibc-mtrace"

this would be needed if other libc (uclibc) was not providing it but
Nitin's patch already changed uclibc to provide dummy mtrace but thinking
of it using the above might be a better thing to do instead of adding
a dummy provide in uclibc


