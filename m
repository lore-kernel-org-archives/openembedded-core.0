Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Sf9Zs-0004aM-96
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 14:55:08 +0200
Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 14 Jun 2012 05:43:21 -0700
Received: by vbzb23 with SMTP id b23so962291vbz.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 05:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=k7CYdZBZblQKbmyBapU6Y/NN4N0RPZ22c8JBDOeaKiY=;
	b=aTa/CfM8ztYW9gsmzSe6NpzSOx9ywWYbffm+VgeHMV0O9RF9TKxolmfF7WTnXI2WD0
	hIkcvP1krUJ5o58PSjKNjgDMbnpBGEExAhHyimIcXNRC5crFvV5tzYxS1xCS4ZSDI6sN
	2XilHRUWeORhDekcBNmuLZwFDRxANO99V+rya27WlJu9EmyGAPdykKBQPPvN6SfAIpuI
	Qpb1+aoE6/unTqMP2yr12HSaBUPlzJaUS24clz3z1oj/xOfiLCh5HF0xDPhqvH27LFYX
	XY+aqv5laIlbgrLLV9TixaKDGxzGDS/08EXF+4zg4QChP3TLBByaPikCwIxGr2sWZnnJ
	b2mA==
Received: by 10.220.157.14 with SMTP id z14mr921178vcw.73.1339677798075; Thu,
	14 Jun 2012 05:43:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Thu, 14 Jun 2012 05:42:56 -0700 (PDT)
In-Reply-To: <CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 14 Jun 2012 15:42:56 +0300
Message-ID: <CAMZjud22RrKU8cEAPwu+K4Ze2hPVHo-5z17uu3Zj1cJvk6pNnQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmIQZtssSksTbY/BdshrX+SQYR2MNYIj07s8quuMxNiQeEEz0QWjOl1t0iHOIz9del6dtcm
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Thu, 14 Jun 2012 12:55:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 12, 2012 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 12, 2012 at 12:59 AM, Bogdan Marinescu
> <bogdan.a.marinescu@intel.com> wrote:
>> new version doesn't seem to use sigmask anymore.
>
> You have to build it on uclibc to see if you can drop this patch or not.

I was able to build strace 4.7 with uclibc succesfully, but I'm unable
to build an uclibc image (even core-image-minimal) to do an actual
test due to various compilation errors. Should I keep on trying to
compile an Yocto image to test strace+uclibc or is the succesful
compilation step enough?

Thanks,
Bogdan

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


