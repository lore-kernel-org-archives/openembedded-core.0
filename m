Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2H4L-0004Wk-3T
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 09:34:09 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 00:22:09 -0700
Received: by obceq6 with SMTP id eq6so4254613obc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 00:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=bw5TTBq2DINWwLM5PwOsB+YeXY6VuFFzj/0JEWDZwBs=;
	b=WAg11eiQmqgeSrrOdqjpOWAYfHvfPwcKOXkH8Ueip5uKYXjOk0XMdjwMPU/m95Watj
	MWbEMZpSR2g1bVjs30KLbDQ2emSnaxBvmfa2z5SAXOAUhp3Gm6EeKK7buuAWYtpTA6Y3
	AUV24RuxCZnD8ckW7dbhsIzsLzaocZWw09Vl5yoUq6oodLRV33Du42Drgtp18bSlF3Ue
	DPWVi/qDd1wglmXZDqqFs2OwlzkaT64QiS975vLocCtpU37Rhajhs/vTuC82vKTbIyNe
	3eWQHlBiHhuDjOgd0+JXDDJKh/7ISjg+3Z5K2I6eFd3ZO2YwdZUZUuzfSZ86mV5M9+EB
	CzSA==
Received: by 10.182.145.8 with SMTP id sq8mr3221772obb.50.1345188128857; Fri,
	17 Aug 2012 00:22:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Fri, 17 Aug 2012 00:21:48 -0700 (PDT)
In-Reply-To: <502DA2D4.7030302@windriver.com>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
	<20120816143559.GD32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
	<20120816220251.GC3625@jama.jama.net> <502DA2D4.7030302@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Aug 2012 08:21:48 +0100
Message-ID: <CAJTo0LYrwzMNkdZ6RsS-ku5Q001jCUNB5rie8=+g5-rNh9ARbQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQldO0OBYpVtZBYauGkFqz+xY83EncmxS6EihtWwFI1/AxAOX3K3ibu+1dMXw5Cg4TprGiwC
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>, "Zhao,
	Zhenfeng" <Zhenfeng.Zhao@windriver.com>
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Fri, 17 Aug 2012 07:34:09 -0000
Content-Type: text/plain; charset=UTF-8

On 17 August 2012 02:48, jhuang0 <jackie.huang@windriver.com> wrote:
> Yeah, it would be better for the postinstall script, but for
> xcursor-transparent-theme without index.theme file, is it still a problem?

Running gtk-update-icon-cache doesn't make sense on themes without an
index.theme, because without an index.theme there are not any icons to
cache (xcursor themes are different).  From the man page:

"It expects to be given the path to a icon theme directory containing
an index.theme, e.g.  /usr/share/icons/hicolor, and writes a
icon-theme.cache containing cached information about the icons in the
directory tree below the given directory."

Use -t to gtk-update-icon-cache, or filter the list of directories to
only include ones with index.theme files.  Either is appropriate.

Ross


