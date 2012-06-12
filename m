Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeSWJ-0001BY-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:56:35 +0200
Received: by eekd49 with SMTP id d49so2423704eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=b/Ih1DxEDEwG/Km84NUBiQemBlhNrOoSXeuG9qgAOhM=;
	b=RC961jo998HSBKzfTIPTW3sK8FptmnuTLeMhpN3lVnJp0Y/SHuIWIzTWuqCW48To0Q
	y7/filsJo+EQ9yOck1w0JRG1EfCj81OR4epYTCGnAZ5T4sYlzog8xTjtxzvAS2uRuuBR
	OSDe8sB2/2KUReoVJLWPFWvkHrjGqrJqipFzfg9aBo3Cb9lJsHJ7wuJ11wfKFzyJD43i
	BKbbqEgTcgvz6pQj36CiM7ZQuEudfVLumVNR0TYBNWK4bWpbiPx1mKFn/RqL3MZtdAxt
	rn51h72mQag8SU/BhilNL5m1qVIFIcM2aGSdKgUB0S1AocRucE4Pb5n/wqAAH80VHgtj
	SSpg==
Received: by 10.14.94.201 with SMTP id n49mr6929150eef.158.1339512360400; Tue,
	12 Jun 2012 07:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 12 Jun 2012 07:45:30 -0700 (PDT)
In-Reply-To: <4FD68502.8090107@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
	<1339419838.30460.28.camel@ted>
	<4FD5FA7B.9080406@gmail.com> <4FD68502.8090107@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2012 07:45:30 -0700
Message-ID: <CAMKF1sqXWp=o1H2xG7iFQAbKmyBuiLXT7KBXDqDfYdLAfs8_vw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16 V2] Prelink/ld bug and rpm compilation on uclibc
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
X-List-Received-Date: Tue, 12 Jun 2012 14:56:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 11, 2012 at 4:53 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I have redone this patch as said and updated the pull tree. Additionally
> I have added a patch to cache guint32/guint64 on x86_64/uclibc otherwise
> glib-2.32.x wont build on uclibc for x86_64

Richard

I have now rebased the patches in pull tree on top of rpm upgrade.

-Khem


