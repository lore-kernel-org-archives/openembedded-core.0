Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUdkl-0000YJ-8J
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 15:59:43 +0200
Received: by mail-vc0-f169.google.com with SMTP id gd11so606127vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 06:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ttnKAebSF6pBX7ivZNzNWilzZAATrvc2xFyCN4jtqW8=;
	b=JjeiHlpHod2xcjX3pyzEeNtYVo2bcP256YHYIOgsWZCS4u9pMolZPlQzCGJx+vzrUW
	A4ptDjcED0kXx+V0K+nnBoGA2chWGAtyYmE3dyjsTh97+ZGZql4l0YVUXT+0hA0qLrl9
	mUVU7mkHixpJQD2qA4ozX63cCGlicknxCOUaf88H1wuPpEqQ+aEa1bEoiTXonJNy1CaZ
	XUhoZOikFLpqfWYDtWv99eoNBtskZ2kdCZl7Yc3A1ppjiv0CGoRC6AvZLOe5mliM/EOF
	CgCFwskCfO7jUzIjBcPoXw8UKk0OC8EzAoS2vyNFPP8HUWrIxQdoUjjLZDL+XZIZvnoJ
	tqlw==
X-Received: by 10.58.90.66 with SMTP id bu2mr22412690veb.29.1366724496723;
	Tue, 23 Apr 2013 06:41:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 06:41:16 -0700 (PDT)
In-Reply-To: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 14:41:16 +0100
Message-ID: <CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Gm-Message-State: ALoCoQnSe+Zpm1+I5bD009ZshdRzvuAl1tVxB7DwxLwcbYna8rHx+tesNnbDo5WaTpzQnRqroDSs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 13:59:47 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2013 10:13, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives pythonnative python-dir

Does this really need pythonnative?  That's adding a python-native
dependency to build systemd.

Ross


