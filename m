Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPaCw-0006wH-TF
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:11:58 +0200
Received: by mail-vb0-f47.google.com with SMTP id x13so4722677vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jA+iWqwtAz4iAtxBHsSLLK2K6D26tNntAyP38cWZ5Vk=;
	b=QU3rlqEMc1UM0HcgNaEKv+yK2ir0MjeUfiUFS8mwXfPB3Fd9IuBYCbwv0hLaHj2Ap5
	caC9GUC6DwRMYNl5oJwtqeQTJqQQUwmrj64bwE8elBSgk2MMkDgtxb+doNUSgTqWC62j
	sl9VMI/+//XBQyadlmG6sauFmGH8E6yXvVc9WzMIo9cvrl0BpC9KUzrHTBIKBQm2ZdEd
	AvT3dDl9hVdRbpqbfdapC1WeLfecMQo+An8mPVOi+jPJ913vwXlcErmG4xtJXPv7bn7V
	ZL4bfN3plWBZRKY1Y5nq1UCGKTvsSgFSexRtRTo95ppABJHTuxTcXzJjg/cRVTi69ajG
	VYKw==
X-Received: by 10.58.188.48 with SMTP id fx16mr19499847vec.22.1365519258430;
	Tue, 09 Apr 2013 07:54:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 07:53:58 -0700 (PDT)
In-Reply-To: <1365516144-5157-2-git-send-email-radu.moisan@intel.com>
References: <1365516144-5157-1-git-send-email-radu.moisan@intel.com>
	<1365516144-5157-2-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 15:53:58 +0100
Message-ID: <CAJTo0Lb3xU54Ne_LN_Lg9my5Pixc-Snk4tkm4=7w3c44rZKKzA@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQkuTZULwvx/v/5pF/YIpoFNj7LpC7g+hNta0C2RnbVjMJrm7ySunxEmeX98TPq22X8HbAV4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: use update-alternatives.bbclass
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
X-List-Received-Date: Tue, 09 Apr 2013 15:11:59 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 15:02, Radu Moisan <radu.moisan@intel.com> wrote:
> switch from using plain update-alternatives command to
> update-alternatives.bbclass style
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>

Acked-By: Ross Burton <ross.burton@intel.com>

Ross


