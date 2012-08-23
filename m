Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4fqM-00051Z-HT
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 00:25:38 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Aug 2012 15:13:29 -0700
Received: by obceq6 with SMTP id eq6so2573056obc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 15:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=nrzLWORzCPlYX5Q6YCOiHesf233SWpBzj2eYepnfZQ4=;
	b=eOlWnboDuHeQcWmEvlJlWDtZmg7gSQLlabx444BLu9NW2bI0qWplq4VdPG1MeTWeLn
	YP/h1ZZ4AzSNgolt7Nx6+DY/dCEz2v4rDGy94Vk+GalFvZFdwHz3wx0RMFzUrJoVXtzp
	uVAGEOM4R+8ZNPtD9DPal08+S6CpE1XC3GY2/A624KYlWIfLi4RqeG/woDA21idlXsPZ
	ZXRoP9pl2QGW6B4Vvtg98Uap6RwQgSDnv0cGFN+b2EeRDVCq9pkE5nj9gWUHpB+e7kUI
	/78ydoPAjoS2btv5ubk+rEf0To2SW8dcA/50d/+2WRW2E5/z1D4Y0lcdJGF/CRXeAALG
	Whvw==
Received: by 10.60.28.162 with SMTP id c2mr2440048oeh.3.1345760008928; Thu, 23
	Aug 2012 15:13:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Thu, 23 Aug 2012 15:13:08 -0700 (PDT)
In-Reply-To: <1345747597-18078-1-git-send-email-msm@freescale.com>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Aug 2012 23:13:08 +0100
Message-ID: <CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
X-Gm-Message-State: ALoCoQm5/6m2wLGMwj3uJX2r7OnNQWcE9gX4eYeNvWP7DImaY2twLHboLuFIh9CS5836OHMG/+bL
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils-common-base.bbclass: Pick up additional .debug folders:
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
X-List-Received-Date: Thu, 23 Aug 2012 22:25:38 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
>    ${PYTHON_SITEPACKAGES_DIR}/.debug \
>    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
>    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
> +  ${libdir}/${PYTHON_DIR}/.debug \
> +  ${libdir}/${PYTHON_DIR}/*/.debug \
> +  ${libdir}/${PYTHON_DIR}/*/*/.debug \

I thought packages that used distutils generally put their files under
sitepackages, and not the python base directory...  Are some packages
doing it wrong?

Ross


