Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1E5x-0006Sx-2I
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:43:50 +0100
Received: from mail-ve0-f198.google.com ([209.85.128.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 02:27:59 -0800
Received: by mail-ve0-f198.google.com with SMTP id 14so4348816vea.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 02:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=ZAs1cYsne/lQ/ooBqr4lAVwvjXUyBUkj0JHs30DQKSw=;
	b=Fl9OlLFmlE/bInMpMuI23xSTY0psfztjakbF3bTFyXqifgusLWDfkCht53wtzKOsut
	Hjz67hTKYLMeK+NKrz22pZofO9EETEJyqK7Ybv750jxVG/Ib/FVddH3I9Ph8+ven+che
	+bQCkJCvd9FEvPEy/uzzo74r/8VJMbGecp2jC1j6+lXKT0Jkd9PRG6VAHtwzJNmEPEUY
	oREsos/CSzfigYFMgZn33VJsOQnJjjJQkJNhOb5yIjOCa+DEKDCiQksJxGKqrLO+tM9i
	tnN2VSUa9kRmPAQlc3RRijGmXz6bXIWDQDX2yubfTXVvtz5jzrEKMt0pQkQU9O4/MxyF
	7Jew==
X-Received: by 10.220.116.5 with SMTP id k5mr10858041vcq.55.1359714478644;
	Fri, 01 Feb 2013 02:27:58 -0800 (PST)
X-Received: by 10.220.116.5 with SMTP id k5mr10858030vcq.55.1359714478377;
	Fri, 01 Feb 2013 02:27:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 02:27:38 -0800 (PST)
In-Reply-To: <510B9749.6040801@intel.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LZ3tvB6t13utWrzXhqE7mx58ypkFosUdtwj=XuMbPXRNw@mail.gmail.com>
	<510B9749.6040801@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 10:27:38 +0000
Message-ID: <CAJTo0LZCJuRomHysD9b6CfYfsHJpQBBXsZNWVUEo5_en_ju2KA@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQkaRyilgMvlUGNKmEabc76Fd2lRNb9diipP5CdaWcSEZw6qB+6LECcI+jeJfi8U/g9CwYyBw8FEyxFEEeUQ3QWZk+nCNpZGhj3kMC6nrGdqed4TwpbaLX6FdzrWqK5CfZPG0G0buFcu2/yWu9mhFti5A5x2Sz7GiWnrXFxVGPcXOL+XA1fQLBefHvulwdoQTwkC5YgV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 10:43:52 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 10:22, Radu Moisan <radu.moisan@intel.com> wrote:
> I did change that manually because I assumed it was a typo. However it make
> sense to add consolekit as a runtime dependency, but the documentation
> specifically says PACKAGECONFIG will add to DEPENDS. How is it different in
> this patch? The PACKAGECONFIG[systemd] is clearly specifying a build time
> dependency, why the PACKAGECONFIG[consolekit] is specifying a runtime
> dependency? How can I discriminate in this context?

I spoke to Radu online already, but I'll repeat again here in case
anyone else is confused by PACKAGECONFIG.

The latest documentation is here:
http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-P

The key point is that the 3rd argument is DEPENDS, and the fourth is
RDEPENDS.  Many instances of PACKAGECONFIG will leave out the fourth,
but in this case the third is empty (note the extra commas) so
consolekit is added as a runtime dependency.

Ross


